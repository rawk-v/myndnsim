
package designpattern;

import java.util.*;

interface TimeStamped{
    long getTimeStamp();

}

class TimeStampedImp implements TimeStamped{
    private final long timeStamp;
    public long getTimeStamp(){
        return timeStamp;
    }
    public TimeStampedImp(){
        timeStamp=new Date().getTime();
    }
}


interface SerialNumbered{
    public int getSerialNumber();
}

class SerialNumberImp implements SerialNumbered{
    private static int counter=1;

    private int serialNumber=counter++;
    public int getSerialNumber(){
        return serialNumber;
    }
}


interface Basic {
    public String getString();
    void setString(String str);
}

class BasicImp implements Basic{
    private String value;
    public void setString(String str)
    {
        value=str;
    }
    public String getString(){return value;}
    
}

class Mixins extends BasicImp implements SerialNumbered,TimeStamped{

    private SerialNumberImp serialField=new SerialNumberImp();
    private TimeStampedImp timeStampField=new TimeStampedImp();

    public int getSerialNumber(){return serialField.getSerialNumber(); }
    public long getTimeStamp(){return timeStampField.getTimeStamp();}
}


public class Mixin{
    public static void main(String[] args){
        Mixins m1=new Mixins();
        m1.setString("hello");

        System.out.println(m1.getSerialNumber());
        Mixins m2=new Mixins();
        m2.setString("hello");
        System.out.println(m2.getSerialNumber());
        System.out.println(m2.getTimeStamp());
    }
}