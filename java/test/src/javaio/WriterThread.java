package javaio;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.BlockingQueue;

public class WriterThread implements Runnable {

	
	private String filePath;
	private BlockingQueue<String> queueToWrite;
	private FileWriter fileWriter=null;
	private File file=null;
	
	public WriterThread(String filePath,BlockingQueue<String> queueToWrite,FileWriter fileWriter)
	
	
	{
		this.filePath=filePath;
		this.queueToWrite=queueToWrite;
	
		this.file=new File(filePath);
		this.fileWriter=fileWriter;
		
	}
	public void run()
	{
		
		try
		{
			while(true)
				synchronized(file){
		  System.out.println(queueToWrite.take());
				fileWriter.write(queueToWrite.take());
				fileWriter.flush();}
			   
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		catch(InterruptedException e)
		{
			e.printStackTrace();
		}
		
	}
}
