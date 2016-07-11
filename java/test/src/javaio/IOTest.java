package javaio;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;










public class IOTest {
	
	static final String jdbc_driver="com.mysql.jdbc.Driver";
	static final String db_url="jdbc:mysql://localhost/testdb";
	static final String user_name="why";
	static final String password="why90951213";
	static File file=null;
	
	
	
	
	@SuppressWarnings("unused")
	private static  Connection getConnection() throws ClassNotFoundException,SQLException
	{  Connection conn=null;
		
			Class.forName(jdbc_driver);
			conn=DriverManager.getConnection(db_url,user_name,password);
		   return conn;
		
		
	}
	
	
	public static void writeToFile(FileWriter fwriter,String content) throws IOException
	{  
		if(file==null)
			file=new File("/home/mrdreamer/Documents/java/test/src/javaio/writer.txt");
		synchronized(file)
		{
			fwriter.write(content);
			fwriter.flush();
		}
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException 
	{
		Connection conn=null;
		Statement stment=null;
		FileWriter fwriter=null;
		try
		{
		 fwriter=new FileWriter("/home/mrdreamer/Documents/java/test/src/javaio/writer.txt");
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
		
		String commmand="select * from stuff";
		if(conn!=null)
		  stment=conn.createStatement();
		
		ResultSet results=stment.executeQuery(commmand);
		
		String content=null;
		while(results.next())
		{
			int id=results.getInt("id");
			String name=results.getString("name");
			double salary=results.getDouble("salary");
			System.out.println(name+"   "+id +" "+salary);
			content=name+"   "+id +" "+salary+" \n";
			try{
			writeToFile(fwriter,content);
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		
			
		}
		
		try
		{
			fwriter.flush();
			fwriter.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
		stment.close();
		results.close();
		try
		{
			conn.close();
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
//		try
//		{ 
//		   
//		 String filename="/home/mrdreamer/Documents/java/test/src/javaio/text.txt";
//		 InputStreamReader reader=new InputStreamReader(new FileInputStream(filename));
//		 BufferedReader bfreader =new BufferedReader(reader);
//		 
//		  String line=null;
//		  line=bfreader.readLine();
//		  while(line!=null)
//		  {
//			   System.out.println(line);
//			   line=bfreader.readLine();
//		  }
//		  
//		}
//		catch (Exception e )
//		{
//			e.printStackTrace();
//		}
//		
//	 
//	    
	}

}




