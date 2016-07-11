package algorithym;

public class main {


	
	public String toString(){
		return " ";
	}
	
	public static void main(String[] args)
	{
		StringBuffer buffer=new StringBuffer();
		for(int i=1;i<=100;i++)
		{
			buffer.append(i);
		}
		
		System.out.println(buffer.toString());
	}
}

