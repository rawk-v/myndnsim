package generic;

public class Manager  extends Employee {
	
	
	private double m_bounus;
	public Manager()
	{
		super();
		m_bounus=0;
	}
    public Manager(int id,double salary,String name)
    {
    	super(id,salary,name);
    	m_bounus=1000*Math.random();
    }
    
    public double getBounus()
    {
    	return m_bounus;
    	
    }
    
    public String toString()
    {
    	return super.toString()+"  bounus=  "+m_bounus;
    }
    
    public int compareTo(Employee other)
    {    
    	
    	
      if(other instanceof Manager)
    	return Double.compare(this.getBounus(), ((Manager)other).getBounus());
      else throw new ClassCastException();
      
      
    	



    	
   	
    	
    	
    
    	
    }
}
