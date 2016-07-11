
package rtti;
import java.util.*;
import java.lang.reflect.*;



class Cake{
    static {System.out.println("loaded into jvm");}
}


public class demo{
    public static void main(String[] args){
        Cake c1=new Cake();
        Class c1_class=c1.getClass();
        String cake_name=c1_class.getName();
        System.out.println(cake_name);
        try{
            Class.forName(cake_name);
            System.out.println("after loaded into jvm");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}