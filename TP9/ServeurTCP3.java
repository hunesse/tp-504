import java.io.*;
import java.net.*;

public class ServeurTCP3 {
    public static void main(String[] args){
        try{
            ServerSocket socketserver = new ServerSocket(2016);
            while (true) {
                System.out.println("server en attente");
                Socket socket = socketserver.accept();
                System.out.println("Connection d'un client");
                DataInputStream dIn = new DataInputStream(socket.getInputStream());
                String rev = new StringBuilder(dIn.readUTF()).reverse().toString();
                System.out.println("Message inversé : "+ rev );   
            }
        }catch(Exception ex){System.out.println("ALARME!!!");}
    }
}

