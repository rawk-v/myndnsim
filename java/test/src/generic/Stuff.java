package generic;

public abstract class Stuff<T> implements Comparable<T> {

	private int m_id;
	private double m_salary;
	protected String m_name;
	
	
	
	public Stuff(){
		m_id=(int)(Math.random()*100);
		m_salary=Math.random()*1000;
		m_name="no name";
		
	}
	
	public Stuff (int id,double salary,String name)
	{
		m_id=id;
		m_name=name;
		m_salary=salary;
	}
	
		
	
	 public String getName()
	 {
		 return m_name;
	 }
	 public double getSalary()
	 {
		 return m_salary;
		 
	 }
	 public int getId()
	 {
		 return m_id;
	 }
	 public String toString()
	 {
		 return "Employee "+m_id+"  name= "+m_name+" salary"+m_salary;
		 
	 }
	public int comparaTo(T other)
	{
		return 0;
	}
	
	
}
