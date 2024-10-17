import java.io.*;
import java.net.*;

public class ClientUDP{
    public static void main(String[] args){
        try{
            InetAddress addr =InetAddress.getLocalHost();
            System.out.println("adresse=" + addr.getHostName());
            String s = "Tu vois plus mes yeux";
            byte [ ] data = s.getBytes();
            DatagramPacket packet = new DatagramPacket (data,data.length,addr,1234);
            DatagramSocket sock = new DatagramSocket();
            sock.send(packet);
        }catch(Exception ex){System.out.println("ALARME!!!");}
    }
}