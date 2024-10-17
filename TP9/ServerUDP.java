import java.io.*;
import java.net.*;

public class ServerUDP {
    public static void main(String[] args){
        try{
            DatagramSocket sock = new DatagramSocket(1234);
            while (true) {
                System.out.println("- waiting for data");
                DatagramPacket packet = new DatagramPacket(new byte[1024], 1024);
                sock.receive(packet);
                String str = new String(packet.getData()); 
                System.out.println("str = " + str);
            }
        }catch(Exception ex){System.out.println("ALARME!!!");}
    }
}
