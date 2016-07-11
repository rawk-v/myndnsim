package generic;

public class Employee implements Comparable<Employee> {
	
	private int m_id;
	private double m_salary;
	protected String m_name;
	
	public Employee(){
		m_id=(int)(Math.random()*100);
		m_salary=Math.random()*1000;
		m_name="no name";
		
	}
	public Employee (int id,double salary,String name)
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
	

	@Override
	public int compareTo( Employee other) {
		// TODO Auto-generated method stub
		return this.getName().compareTo(other.getName());
		
	}
}
