package generic;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;

public class EmployeeTest {
	public static void main(String args[])
	{
		ArrayList<Manager> managers=new ArrayList<>();
		for(int i=1;i<=100;i++)
		{
			managers.add(new Manager(i, Math.random()*1000,"null"));
		}
		managers.sort(null);
		System.out.println("done");
		
		
		Iterator<Manager> ite=managers.iterator();
		while(ite.hasNext())
		{
			System.out.println(ite.next().toString());
		}
	}
	
}
