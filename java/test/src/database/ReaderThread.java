package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.BlockingQueue;

public class ReaderThread implements Runnable {
	
	
	private Connection conn;
    private Statement stmt;
    private ResultSet results;
    private BlockingQueue<String> queue;
    public ReaderThread(Connection conn,BlockingQueue<String> queuetoWrite, BlockingQueue<String> queue)
    {   
    	this.conn=conn;
    	this.queue=queue;
    	try {
			stmt=conn.createStatement();
			results=stmt.executeQuery("select * from stuff");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
	public void run()
	{  
		try {
			while(results.next())
			{
				int id=results.getInt("id");
				String name=results.getString("name");
				double salary=results.getDouble("salary");
//			System.out.println(name+"   "+id +" "+salary);
				String content=name+"   "+id +" "+salary+" \n";
				queue.add(content);
				
}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}
}
