package java_test;

public class TransferRunnable implements Runnable {

	
	private Bank m_bank;
	private int fromAccount;
	private double maxAmount;
	private int DELAY=10;
	
	
	public TransferRunnable(Bank b,int from,double amount )
	{
		m_bank=b;
		fromAccount=from;
		maxAmount=amount;
	}
	
	public void run()
	{
		try
		{
			while(true)
			{
				int toAccount=(int)(Math.random()*m_bank.getSize());
				//double amount=maxAmount*Math.random();
				double amount=0;
				m_bank.transfer(fromAccount, toAccount, amount);
				Thread.sleep(DELAY);
			}
		}
		catch(InterruptedException e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	
	
	
	
}
