package javaio;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class TwoThread {
	
	
	static final String jdbc_driver="com.mysql.jdbc.Driver";
	static final String db_url="jdbc:mysql://localhost/testdb";
	static final String user_name="why";
	static final String password="why90951213";
	static File file=null;
	static BlockingQueue<String> queueToWrite=null;
    static final String filePath="/home/mrdreamer/Documents/java/test/src/javaio/writer.txt";
	
	private static  Connection getConnection() throws ClassNotFoundException,SQLException
	{  Connection conn=null;
		
			Class.forName(jdbc_driver);
			conn=DriverManager.getConnection(db_url,user_name,password);
		   return conn;
		
		
	}
	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException 
	{
		Connection conn=null;
		Statement stment=null;
		FileWriter fwriter=null;
		queueToWrite=new ArrayBlockingQueue<String>(100);
		// filewriter
		try
		{
		 fwriter=new FileWriter(filePath);
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}

		try
		{
			conn=getConnection();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		
		new Thread(new ReaderThread(conn,queueToWrite)).start();
	new Thread(new WriterThread(filePath,queueToWrite,fwriter)).start();
		
		
		
	}

}
