package generic;

import java.util.ArrayList;
import java.util.List;

public class PutGetTest {
	
	
	public static  <T> void  copy(List<? super T > dst,List<? extends T> src)
	{ 
	 for(int i=0;i<src.size();i++)
		{
			dst.set(i, src.get(i));
		}
	}
	public static void main(String[] args)

	{  
//		Integer[] intarray=new Integer[4];
	    
		ArrayList<Integer> ints_src=new ArrayList<Integer>();
		ArrayList<Number> dst=new ArrayList<>();
		for(int i=0;i<5;i++)
		{   
			ints_src.add(i);
			dst.add(i+100);
			
		}
		System.out.print(ints_src.toString());
		
		PutGetTest.copy(dst,ints_src);
	}
}
