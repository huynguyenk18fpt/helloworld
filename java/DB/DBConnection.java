/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author huynguyen
 */
public class DBConnection {
    public static Connection getConnection(){
        Connection conn;
        try{
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://DESKTOP-5ENDA1F:1433;databaseName=lab02;user=sa;password=nguyen12c1;encrypt=true;trustServerCertificate=true";
            conn = DriverManager.getConnection(url);
        }catch(Exception ex){
            conn = null;
        }
        return conn;
    }
}
