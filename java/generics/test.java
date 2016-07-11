package generics;
import java.util.*;
import utils.utils;
import java.lang.Iterable;
public class test{


    public static void main(String[] args){
    fibogenerator m_fib=new fibogenerator();
    for(int i=0;i<10;i++){
        utils.print(m_fib.next());
    }
    fibadapter fibadp=new fibadapter(new fibogenerator(),10);
   // for(Integer i:new fibadapter(new fibogenerator(),10)){
    //    utils.print(i);
    //}
    //
    Iterator<Integer> ite=fibadp.iterator();
    while(ite.hasNext())
        utils.print(ite.next());

    }
}
