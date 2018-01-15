package com.connect;

import java.sql.Connection;
import java.sql.DriverManager;
public class dbConnect
{
public static Connection getConnect()
{
  try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db","root","admin");
        return con;
    }catch(Exception e)
    {
        return null;
    }
    
}
}
