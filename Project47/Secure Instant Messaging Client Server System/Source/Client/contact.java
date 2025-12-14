import java.util.List;
import java.util.LinkedList;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Collections;


class contact
{
        public LinkedList list;
        //private profile head;
        public profile current;
        //private profile last;

        public	contact()
        {
                list = new LinkedList();
                current = new profile();
                //current = last = head;

        }

        public void insert(int user_id,String email,String nickname,char status,String ip)
        {
                int position = find(user_id);
                current = new profile(user_id , email , nickname , status , ip);
                if(list.isEmpty())
                {
                        System.out.println("Empty\n");
                        //current = new profile(user_id , email , nickname , status , ip);
                        list.addFirst(current);
                }
                else
                {
                        if (position== 0)
                        {
                                //current = new profile(user_id , email , nickname , status , ip);
                                list.add(current);
                        }
                        else
                        {
                                remove(user_id);
                                //current = new profile(user_id , email , nickname , status , ip);
                                list.add(current);
                        }
                }
        }

        public int find(int user_id)
        {
                int count = 0;
                Iterator i = list.iterator();

                while(i.hasNext())
                {
                        count++;
                        Object x = i.next();
                        profile y = (profile) x;
                        if(y.get_user_id() == user_id)
                                return count;
                }

                return 0;
        }

        public String print()
        {
                String info = "";
                Iterator i = list.iterator();

                while(i.hasNext())
                {
                        Object x = i.next();
                        profile y = (profile) x;
                        info += y.get_user_id()+"\t"+y.get_email()+"\t"+
                                    y.get_nickname()+"\t"+y.get_status()+"\t"+y.get_ip()+"\n";
                }

                return info;

        }

        public void remove(int user_id)
        {
                int position = find(user_id);
                if(position == 0)
                {
                        System.out.println("Not found User ID : "+ user_id);
                }
                else
                {
                        list.remove(position-1);
                }
        }

        public void clear()
        {
                list.clear();
        }
}

class profile extends Object
{
        private int user_id;
        private String email;
        private String nickname;
        private char status;
        private String ip;
        //public profile next;

        public profile()
        {
                user_id = 0;
                email= null;
                nickname=null;
                status='F';
                ip=null;
        }

        public profile( int input_user_id,
                                        String input_email,
                                        String input_nickname,
                                        char input_status,
                                        String input_ip   )
        {
                user_id = input_user_id;
                email= input_email;
                nickname= input_nickname;
                status= input_status;
                ip= input_ip;
        }

        public int get_user_id()
        {
                return user_id;
        }
        public String get_nickname()
        {
                return nickname;
        }
        public String get_email()
        {
                return email;
        }
        public char get_status()
        {
                return status;
        }
        public String get_ip()
        {
                return ip;
        }

}

