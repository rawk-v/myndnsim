package multithread;

import java.io.File;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class FutureTest {
	
	
	public static void main(String[] args)
	{
		
		 ExecutorService pool=Executors.newCachedThreadPool();
		MatchCounter counter=new MatchCounter(new File("/home/mrdreamer/Documents/java/test/src/multithread/"),"why",pool);
		
		File[] files=new File("/home/mrdreamer/Documents/java/test/src/multithread/").listFiles();
		for(File file:files)
		{
			System.out.println(file.getName());
		}
		Future<Integer> result=pool.submit(counter);
//		FutureTask<Integer> result= new FutureTask<Integer>(counter);
//		Thread t=new Thread(result);
//		t.start();
		
		
		try
		{
			System.out.println(result.get());
		}
		catch(ExecutionException e)
		{
			e.printStackTrace();
		}
		
		catch(InterruptedException e)
		{
			e.printStackTrace();
		}
	}

}
