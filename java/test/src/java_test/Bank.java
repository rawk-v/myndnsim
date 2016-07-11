package java_test;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Bank {

	private  double[] accounts;
	//private Lock banklock=new ReentrantLock();
	//private Condition sufficientFunds;
	
	
	public Bank(int n,double initialbalance)
	{
		//sufficientFunds=banklock.newCondition();
		
		for(int i=0;i<n;i++)
		{   accounts=new double[n];
			accounts[i]=initialbalance;
		}
	}
	public synchronized void transfer(int from,int to,double amount) throws InterruptedException
	{  
		
	
		
  
			while(accounts[from]<amount)
	 this.wait();
		//for(Thread.State c:Thread.State.values())
		//System.out.println(Thread.currentThread().getState());
		
		
		
		
//			sufficientFunds.await();
			//System.out.println(Thread.currentThread().getState());
//			System.out.println(UnSyncBankTest.count++);

			
		System.out.println(Thread.currentThread());
		
		accounts[from]-=amount;
		System.out.println("from "+from+"to  "+to+"  "+amount);
		
		accounts[to]+=amount;
		System.out.printf("%10.2f",this.getTotalBalance());
	this.notifyAll();
	
		
		
	
		
	}
	
	public synchronized  double getTotalBalance()
	{   
	
		
		
		
		double total=0;
		for (double a:accounts)
			total+=a;
		return total;
	
	  
	}
	
	public int getSize()
	{
		return accounts.length;
	}
	
	
}
