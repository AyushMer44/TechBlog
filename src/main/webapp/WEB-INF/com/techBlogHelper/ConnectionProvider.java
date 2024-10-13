package com.techBlogHelper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con == null){
                // Driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create a connection
//                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","@Ayush123");
                con = DriverManager.getConnection("jdbc:mysql://mysql.railway.internal:3306/railway","root","kGIqOSEadhFXFxNoiOZhzbxozGcXEKys");

            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
