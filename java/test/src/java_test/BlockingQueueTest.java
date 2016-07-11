package java_test;

import java.io.File;
import java.util.Scanner;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class BlockingQueueTest {
	
	
	public static void main(String[] args)
	{
		//Scanner in=new Scanner(System.in);
		
		BlockingQueue<File> queue=new ArrayBlockingQueue<>(10);
		FileEnumerationTask enumerator=new FileEnumerationTask(queue,new File("/data/test/"));
		new Thread(enumerator).start();
	   new Thread(new SearchTask(queue,"why")).start();
		
		
		
		
		
		
		
		
		
		
		
	}

}
