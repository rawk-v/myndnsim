package multithread;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;

public class MatchCounter implements Callable<Integer>{
	
	
	private File directory;
	private String keyword;
	private int count;
	private ExecutorService pool;
	
	public MatchCounter(File directory,String keyword,ExecutorService pool)
	{
	   this.directory=directory;
	   this.keyword=keyword;
	   this.pool=pool;
	}
	
	public Integer call()
	{
		count=0;
		try
		{
//			ArrayList<File> files=(ArrayList<File>) Arrays.asList(directory.listFiles());
			File [] files=directory.listFiles();
			List<Future<Integer>> results=new ArrayList<>();
			for (File file:files)
				if(file.isDirectory())
			{  
				MatchCounter counter=new MatchCounter(file,keyword,pool);
				Future<Integer> result=pool.submit(counter);
//				FutureTask<Integer> task=new FutureTask<Integer>(counter);
				results.add(result);
//				Thread t=new Thread(task);
//				t.start();
			}
				else 
				{
					if(search(file))count++;
				}
			
			for(Future<Integer> result:results)
			{
				count+=result.get();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;
		
	}

	private boolean search(File file) {
		// TODO Auto-generated method stub
		
		
		try
		{
			try(Scanner in=new Scanner(file))
			{
				boolean found=false;
				while(!found&&in.hasNextLine())
				{
					String line=in.nextLine();
					if(line.contains(keyword)) 
						{found=true;
						   System.out.println(file.getName());
						}
				}
				return found;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

}

