
package multithread;

import java.util.*;
import static utils.utils.print;

public class LiftOff implements Runnable{
    protected int countDown=10;

    public static long counter=1;
    private long id=counter++;
    public LiftOff(int c){countDown=c;}
    public void run(){
        while(countDown-->0){
            print(this);
            Thread.yield();
        }
    }

    public String toString(){
        return ""+id+"th thread running "+(countDown>0? countDown:"Lifted");
    }
}