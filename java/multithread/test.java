package multithread;

import java.util.*;
import static utils.utils.print;
import java.util.concurrent.*;

public class test{
    public static void main(String[] args){
        // new Thread(new LiftOff(100)).start();
        // new Thread(new LiftOff(10)).start();

        ExecutorService exec=Executors.newCachedThreadPool();

        for(int i=0;i<10;i++)
        exec.execute(new LiftOff(i*10));
        exec.shutdown();

        exec=Executors.newFixedThreadPool(6);

        for(int i=0;i<10;i++)
        exec.execute(new LiftOff(i*10));
        exec.shutdown();
    }
}