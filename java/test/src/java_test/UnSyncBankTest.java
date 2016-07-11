package java_test;

public class UnSyncBankTest {
	
public static final int NACCOUNTS=100;
public static final double INITIALBALANCE=1000;

public static int count=1;
public static void main (String[] args)
{ 
	Bank b=new Bank(NACCOUNTS,INITIALBALANCE);
	int i;
	for(i=0;i<NACCOUNTS;i++)
	{
		TransferRunnable r=new TransferRunnable(b,i,INITIALBALANCE);
		Thread t=new Thread(r);
		t.start();
	}
}
	
	
	

}
