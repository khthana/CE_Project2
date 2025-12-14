using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using System.Threading;
using System.Net;
using System.Net.Sockets;
using System.Diagnostics;

namespace W
{
    public sealed class Network : INetwork 
    {
        byte semaphor; //use to wait until send and recv th end
        byte count;
        Thread threadSend;
        Thread threadReceive;
        UdpClient udpClient;
        IPEndPoint endPoint;
        bool quit;
        Queue queueSend;
        Queue queueReceive;
        B board;
        ArrayList users;
        
        private void SendThread()
        {
           while (!quit)
           {
               if (this.queueSend.Count > 0)
               {
                   byte[] packet = Assembly((Frame)queueSend.Dequeue(), PTYPE.Normal);
                   if (packet != null)
                   {
                       udpClient.Send(packet, packet.Length, endPoint);
                   }
               }
               else
               {
                   threadSend.Suspend();
               }
           }
           semaphor++;      
        }
        private void ReceiveThread()
        {
            while (!quit)
            {
                IPEndPoint ipep = new IPEndPoint(IPAddress.Any, 0);
                byte[] data = udpClient.Receive(ref ipep);
               
                if (data[0] == (byte)NW.id)
                {
                    PTYPE ptype;
                    Frame frame = (Frame)DeAssembly(data, out ptype);
                 
                    switch (ptype)
                    {
                        case PTYPE.Nothing:
                            {
                            } break;
                        case PTYPE.Normal:
                            {
                                 board.doAction(frame);
                            } break;
                        case PTYPE.Alive:
                            {
                            } break;
                        case PTYPE.Update:
                            {
                                ArrayList Us = new ArrayList();
                                string str = Encoding.ASCII.GetString(frame.data);
                                //System.Windows.Forms.MessageBox.Show(str);
                                string[] ustr = str.Split('#');
                                foreach (string s in ustr)
                                {
                                    //System.Windows.Forms.MessageBox.Show(s);
                                    string[] ss = s.Split('!');
                                    if ((ss[1] != board.Me.IPEndPoint.Address.ToString()) || (ss[0] != board.Me.Name))
                                    {
                                        RemoteUser u = new RemoteUser(ss[0], new IPEndPoint(IPAddress.Parse(ss[1]), board.Settings.IPEP.Port), this.timeParse(ss[2]), true, true);
                                        Us.Add(u);
                                    }
                                }
                            
                                foreach (RemoteUser ru in Us)
                                { 
                                    foreach (RemoteUser u in board.Users)
                                    {
                                        if ((ru.Name == u.Name) && (ru.IPEndPoint == ru.IPEndPoint))
                                        {
                                            ru.Receive = u.Receive;
                                            ru.Send = u.Send;
                                        }
                                    }
                                }
                                board.Users = Us;
                            } break;
                        case PTYPE.Begin:
                            {
                                RemoteUser rmu = new RemoteUser(frame.para[0], new IPEndPoint(IPAddress.Parse(frame.para[1]),board.Settings.IPEP.Port),timeParse(frame.para[2]), true, true);
                                board.Users.Add(rmu);
                                board.Users = board.Users;
                                if(IsUpdateList())
                                {
                                    UpdateList();
                                }
                            } break;
                        case PTYPE.End:
                            {
                                RemoteUser r = null;
                                foreach (RemoteUser rm in board.Users)
                                {
                                    if (rm.IPEndPoint.Address.ToString() == frame.para[0])
                                    {
                                        r = rm;
                                        break;
                                    }
                                }
                                if (r != null)
                                {
                                    board.Users.Remove(r);
                                    board.Users = board.Users;
                                }
                            } break;
                    }
                }
              
            }
            semaphor++;
        }
        public void Initialize(B b)
        {  
            semaphor = 0;
            queueReceive = new Queue();
            queueSend = new Queue();
            board = b;
            users = b.Users;
            count++;
            udpClient = new UdpClient(board.Settings.IPEP);
            udpClient.JoinMulticastGroup(board.Settings.MulticastIP, board.Settings.TTL);
            udpClient.MulticastLoopback = false;
           
            endPoint = new IPEndPoint(board.Settings.MulticastIP, board.Settings.MulticastPort);
            threadReceive = new Thread(new ThreadStart(ReceiveThread));
            //threadReceive.Priority = ThreadPriority.BelowNormal;
            threadReceive.Start();
            threadSend = new Thread(new ThreadStart(SendThread));
            //threadSend.Priority = ThreadPriority.BelowNormal;
            threadSend.Start();
            byte[] username = Encoding.ASCII.GetBytes(board.Me.Name.ToCharArray(), 0, board.Me.Name.Length);
            byte[] data = new byte[39+username.Length];
            data[0] = (byte)NW.id;
            data[1] = (byte)PTYPE.Begin;
            data[5] = (byte)NW.pad;
            data[6] = (byte)NW.pad;
            data[7] = (byte)NW.pad;
            data[8] = (byte)NW.pad;
            data[9] = (byte)NW.pad;
            data[10] = (byte)NW.pad;
            data[11] = (byte)NW.pad;
            data[12] = (byte)NW.pad;
            data[2] = 4;
            data[3] = 0;
            data[4] = (byte)data.Length;
            data[13] = (byte)NW.pad;
            data[14] = (byte)NW.pad;
            data[15] = (byte)NW.end;
            byte[] ip = ipSplit(board.Settings.IPEP.Address.ToString());
            data[16] = ip[0];
            data[17] = ip[1];
            data[18] = ip[2];
            data[19] = ip[3];
            string dstr = DateTime.Now.ToString("G",System.Globalization.DateTimeFormatInfo.InvariantInfo);
            byte[] dbyte = Encoding.ASCII.GetBytes(dstr);
            data[20] = dbyte[0];
            data[21] = dbyte[1];
            data[22] = dbyte[2];
            data[23] = dbyte[3];
            data[24] = dbyte[4];
            data[25] = dbyte[5];
            data[26] = dbyte[6];
            data[27] = dbyte[7];
            data[28] = dbyte[8];
            data[29] = dbyte[9];
            data[30] = dbyte[10];
            data[31] = dbyte[11];
            data[32] = dbyte[12];
            data[33] = dbyte[13];
            data[34] = dbyte[14];
            data[35] = dbyte[15];
            data[36] = dbyte[16];
            data[37] = dbyte[17];
            data[38] = dbyte[18];
            
            for (int i = 0; i < username.Length; i++)
            {
                data[39 + i] = username[i];
            }
            udpClient.Send(data, data.Length, endPoint);
        }

        public void UnInitialize()
        {
            count--;
            if (board.menu != null)
            {
                board.menu.Close_();
            }
            if (threadSend.ThreadState == System.Threading.ThreadState.Suspended)
            {
                threadSend.Resume();
            }
            if (count == 0)
            {
                quit = true;
                udpClient.DropMulticastGroup(board.Settings.MulticastIP);
                byte[] data = new byte[16];
                data[0] = (byte)NW.id;
                data[1] = (byte)PTYPE.End;
                byte[] ip = ipSplit(board.Settings.IPEP.Address.ToString());
                data[5] = ip[0];
                data[6] = ip[1];
                data[7] = ip[2];
                data[8] = ip[3];
                data[9] = (byte)NW.pad;
                data[10] = (byte)NW.pad;
                data[11] = (byte)NW.pad;
                data[12] = (byte)NW.pad;
                
                data[3] = 0;
                data[4] = 0;
                data[2] = 4;
                data[13] = (byte)NW.pad;
                data[14] = (byte)NW.pad;
                data[15] = (byte)NW.end;
                udpClient.Send(data, data.Length, endPoint);
                data[1] = (byte)PTYPE.Quit;
                udpClient.Send(data,data.Length,board.Settings.IPEP);
                if (threadSend.IsAlive)
                {
                    threadSend.Priority = ThreadPriority.AboveNormal;
                    if (threadSend.ThreadState == System.Threading.ThreadState.Suspended)
                    {
                        threadSend.Resume();
                    }
                }
                if (threadReceive.IsAlive)
                threadReceive.Priority = ThreadPriority.AboveNormal;
                while (semaphor < 2) ;  
                udpClient.Close();
            }
            semaphor = 0;
        }
       
        public void Send(Frame frame)
        {
            queueSend.Enqueue(frame); 
            if (threadSend.ThreadState == System.Threading.ThreadState.Suspended)
            {
                threadSend.Resume();
            }
                    
        }
       
        private byte[] Assembly(Frame frame,PTYPE ptype)
        {

            ArrayList ru = new ArrayList();
            foreach (RemoteUser rm in board.Users)
            {
                if (rm.Send)
                {
                    ru.Add(rm);
                }
            }
            if (ru.Count != 0)
            {
                int plen;
                byte hlen = 3;
                int flen = 5;
                if (frame.data != null)
                {
                    flen += frame.data.Length;
                }
                flen += frame.paraSize;
             
                plen = flen;
                plen += 12;
                plen += ru.Count * 4;
                hlen += (byte)ru.Count;
                byte[] packet = new byte[plen];
                packet[0] = (byte)NW.id;
                packet[1] = (byte)ptype;
                packet[2] = hlen;
                packet[3] = (byte)(plen >> 8);
                packet[4] = (byte)((plen << 8) >> 8);
    
                byte[] ip = ipSplit(board.Settings.IPEP.Address.ToString());
                packet[5] = ip[0];
                packet[6] = ip[1];
                packet[7] = ip[2];
                packet[8] = ip[3];
                int i = 9;
                foreach (RemoteUser r in ru)
                {
                    byte[] ipa = ipSplit(r.IPEndPoint.Address.ToString());
                    packet[i] = ipa[0];
                    i++;
                    packet[i] = ipa[1];
                    i++;
                    packet[i] = ipa[2];
                    i++;
                    packet[i] = ipa[3];
                    i++;
                }
              
                packet[i] = (byte)NW.pad;
                i++;
                packet[i] = (byte)NW.pad;
                i++;
                packet[i] = (byte)NW.end;
                i++;
                packet[i] = (byte)frame.type;
                i++;
                packet[i] = (byte)frame.cmd;
                i++;
                if (frame.data != null)
                {
                    packet[i] = (byte)(frame.data.Length >> 8);
                    i++;
                    packet[i] = (byte)((frame.data.Length << 8) >> 8);
                    i++;
                    for (int ii = 0; ii < frame.data.Length; ii++)
                    {
                        packet[i] = frame.data[ii];
                        i++;
                    }
                }
                else
                {
                    packet[i] = 0;
                    i++;
                    packet[i] = 0;
                    i++;
                }

                if (frame.para != null)
                {
                    packet[i] = (byte)frame.para.Length;
                    i++;
                    for (int ii = 0; ii < frame.para.Length; ii++)
                    {
                        byte[] b = Encoding.ASCII.GetBytes(frame.para[ii]);
                        packet[i] += (byte)b.Length;
                        i++;
                        for (int iii = 0; iii < frame.para[ii].Length; iii++)
                        {
                            packet[i] = b[iii];
                            i++;
                        }
                    }
                }
                else
                {
                    packet[i] = 0;
                 
                }
                return packet;
            }
            return null;
        }
        private Frame DeAssembly(byte[] packet,out PTYPE ptype)
        {
            Frame frame = new Frame();
         
            ptype = new PTYPE();
           
            switch ((PTYPE)packet[1])
            {
                case PTYPE.Update:
                    {
                        ptype = PTYPE.Update;
                        frame.type = FTYPE.PTYPE;
                        int strl = packet[4] - 16;
                        byte[] tmp = new byte[strl];
                        for (int i = 0; i < strl; i++)
                        {
                            tmp[i] = packet[16 + i]; 
                        }
                        frame.data = tmp;
                    } break;
                case PTYPE.Begin:
                    {
                        ptype = PTYPE.Begin;
                        frame.type = FTYPE.PTYPE;
                        int strl = packet[4]-39;
                        byte[] tmp = new byte[strl];
                        for(int i = 0;i<strl;i++)
                        {
                            tmp[i] = packet[39+i];
                        }
                        frame.para = new string[3];
                        if (tmp.Length == 0)
                        {
                            frame.para[0] = "Remote Host";
                        }
                        else
                        {
                            frame.para[0] = Encoding.ASCII.GetString(tmp);
                        }
                        frame.para[1] = ipMerge(packet[16],packet[17],packet[18],packet[19]);
                        tmp = new byte[19];
                        for (int f = 0; f < 19; f++)
                        {
                            tmp[f] = packet[20 + f];
                        }
                        frame.para[2] = Encoding.ASCII.GetString(tmp);
                    } break;
                case PTYPE.Normal:
                    {
                        if (Fillter(packet))
                        {
                            ptype = PTYPE.Normal;
                            int i = packet[2] * 4;
                            frame.type = (FTYPE)packet[i];
                            i++;
                            frame.cmd = (CMD)packet[i];
                            i++;
                            int ii = packet[i]<<8;
                            i++;
                            ii += packet[i];
                            i++;
                            byte[] temp = new byte[ii];
                            for (int ij = 0; ij < ii; ij++)
                            {
                                temp[ij] = packet[i];
                                i++;
                            }
                            frame.data = temp;
                            ii = packet[i];
                            frame.para = new string[ii];
                            i++;
                            int tm;
                            for (int ji = 0; ji < ii; ji++)
                            {
                                tm = packet[i];
                                i++;
                                temp =  new byte[tm];
                                for (int jjj = 0; jjj < tm; jjj++)
                                {
                                    temp[jjj] = packet[i];
                                    i++;
                                }
                                
                                frame.para[ji] = Encoding.ASCII.GetString(temp);
                            }
                        }
                        else
                        {
                            ptype = PTYPE.Nothing;
                        } 
                    } break;
                case PTYPE.End:
                    {
                        ptype = PTYPE.End;
                        frame.para = new string[1];
                        frame.para[0] = ipMerge(packet[5], packet[6], packet[7], packet[8]);
                    } break;
            }
            return frame;
        }
        private bool Fillter(byte[] p)
        {
            bool b = false;
            foreach (RemoteUser u in board.Users)
            {
                if (u.Receive)
                {
                    if (u.IPEndPoint.Address.ToString() == ipMerge(p[5], p[6], p[7], p[8]))
                    {
                        b = true;
                        break;
                    }
                }
            }
            if (b)
            {
                int num = p[2] - 3;
                int st = 9;
                for (int i = 0; i < num; i++)
                {
                    if (board.Settings.IPEP.Address.ToString() == ipMerge(p[st], p[st + 1], p[st + 2], p[st + 3]))
                    {   
                        return true;
                    }
                    st += 4;
                }
            }
            return false; 
        }
        private bool IsUpdateList()
        {
            bool b = true;
            
            foreach (RemoteUser r in board.Users)
            {
                //System.Windows.Forms.MessageBox.Show(r.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo) + "___" + board.Me.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo));
                if (r.ConnectionTime < board.Me.ConnectionTime)
                {
                    b = false;
                }
            }
            return b;
        }
        private void UpdateList()
        {
            string list = "";
            foreach (RemoteUser u in board.Users)
            {
                list += u.Name;
                list += "!";
                list += u.IPEndPoint.Address.ToString();
                list += "!";
                list += u.ConnectionTime.ToString("G",System.Globalization.DateTimeFormatInfo.InvariantInfo);
                list += "#";
            }
            if (board.Me.Name == "")
            {
                list += "Remote Host";
            }
            else
            {
                list += board.Me.Name;
            }
            list += "!";
            list += board.Me.IPEndPoint.Address.ToString();
            list += "!";
            list += board.Me.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo);
            byte[] ls = Encoding.ASCII.GetBytes(list);
            byte[] data = new byte[16 + ls.Length];
            data[0] = (byte)NW.id;
            data[1] = (byte)PTYPE.Update;
            data[5] = (byte)NW.pad;
            data[6] = (byte)NW.pad;
            data[7] = (byte)NW.pad;
            data[8] = (byte)NW.pad;
            data[9] = (byte)NW.pad;
            data[10] = (byte)NW.pad;
            data[11] = (byte)NW.pad;
            data[12] = (byte)NW.pad;
            data[2] = 4;
            data[3] = 0;
            data[4] = (byte)data.Length;
            data[13] = (byte)NW.pad;
            data[14] = (byte)NW.pad;
            data[15] = (byte)NW.end;
            for (int i = 0; i < ls.Length; i++)
            {
                data[i + 16] = ls[i];
            }
            udpClient.Send(data, data.Length, endPoint);
        }
        private byte[] ipSplit(string ip)
        {
            string[] ss = ip.Split('.');
            byte[] b = new byte[4];
            b[0] = byte.Parse(ss[0]);
            b[1] = byte.Parse(ss[1]);
            b[2] = byte.Parse(ss[2]);
            b[3] = byte.Parse(ss[3]);
            return b;
        } 
        private string ipMerge(byte b0,byte b1,byte b2, byte b3)
        {
            string b = ".";
            string ip;
            ip = b0.ToString();
            ip += b;
            ip += b1.ToString();
            ip += b;
            ip += b2.ToString();
            ip += b;
            ip += b3.ToString();
            return ip;
        }
      
        private DateTime timeParse(string str)
        {
            string[] dt = str.Split(' ');
            string[] d = dt[0].Split('/');
            string[] t = dt[1].Split(':');
            return new DateTime(Int32.Parse(d[2]),Int32.Parse(d[0]),Int32.Parse(d[1]),Int32.Parse(t[0]),Int32.Parse(t[1]),Int32.Parse(t[2]));
        }
        public static Frame FillPluginFrame(string pluginName,byte[] data)
        {
            Frame f = new Frame();
            f.para = new string[1];
            f.data = data;
            f.type = FTYPE.PLUGIN;
            f.cmd = CMD.Others;
            f.para[0] = pluginName;
            f.paraSize = f.para[0].Length + 1;
            return f;
        }
        
    }
}
