//package server;
import java.io.*;
/*import Queue;
import Player;*/
class PlayerOutput extends Thread{
	private static Player the_player;
	private DataOutputStream out;
	private Queue pkt_queue = new Queue();
	public PlayerOutput (Player p, DataOutputStream o){
		the_player = p;
		out = o;
	}
	public void output(byte p[]){
		pkt_queue.push(p);
	}
	public void run(){
		loop:
			while(true){
				byte p[] = (byte[])pkt_queue.pop();
				if (p != null && p.length >0){
					try{
						out.write(p, 0, p.length);
					}catch (IOException e){
						break loop;
					}
				}
		}
		the_player.stopOnWait();
		the_player.disconnect();
	}
}