import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class Clienthttp {
    public static void main(String[] args) {
    
        try{

            Socket socket = new Socket(args[0],80);
            OutputStreamWriter osw = new OutputStreamWriter(socket.getOutputStream());
            InputStreamReader isw = new InputStreamReader(socket.getInputStream());
            BufferedWriter bufOut = new BufferedWriter(osw); 
            BufferedReader bufIn = new BufferedReader(isw);

            String request = "GET / HTTP/1.0\r\n\r\n"; 
            bufOut.write(request, 0, request.length()); 
            bufOut.flush();
            
            String line = bufIn.readLine();
            while (line != null) { 
                System.out.println(line); 
                line = bufIn.readLine();
            }
            bufIn.close();
            bufOut.close();
            socket.close();

        }catch(Exception ex){System.out.println("ALARME!!!");}

    }

}
