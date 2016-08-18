
import java.sql.*;
import javax.swing.*;
public class connect {
    
     Connection conn=null;
     public static Connection ConnectDB(){
      
     
         try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn =DriverManager.getConnection("jdbc:mysql://localhost/billingsystem","root","");
        //JOptionPane.showMessageDialog(null, "Connection Established");
         
         return conn;
         }
     catch(Exception e){
     JOptionPane.showMessageDialog(null, e);
     return null;
    
     } 
        
     }    
}
