package rtti.toys;


interface HasBatteries{}
interface WaterProof{}
interface Shoots{}

class Toy implements HasBatteries,WaterProof,Shoots{

    public Toy(){}
    public Toy(int i){}
}

class FancyToy extends Toy{
    public FancyToy(int i){super(i);}
    public FancyToy(){}
}


public class toy{
  

 static void  printClassinfo(Class cc)
    {
        System.out.println(cc.getName());
        System.out.println(cc.getSimpleName());
        System.out.println(cc.isInterface());
        System.out.println(cc.getCanonicalName());
    }
      public static void main(String[] args){
        FancyToy f1=new FancyToy();
        Class <FancyToy>f1_class=FancyToy.class;
        try{
            FancyToy f2=f1_class.newInstance();
        }
        catch (Exception e){ e.printStackTrace();}
       
        // printClassinfo(f1_class);
        // System.out.println("f1 class done");
        // for(Class c:f1_class.getInterfaces())
        //     printClassinfo(c); 
        Toy t1=new Toy();
        // for(Class c:t1.getClass().getInterfaces())
        //     printClassinfo(c);
        // System.out.println("done");

        Class t1_class=t1.getClass();
        Class f1_up_class=f1_class.getSuperclass();
        Object t1_instantiation=null;
        try{
            t1_instantiation=t1_class.newInstance();
        }
        catch(InstantiationException e){
            e.printStackTrace();
        }
        catch (IllegalAccessException e){
            e.printStackTrace();
        }

        System.out.println("f1_upper_class is t1? "+(t1_class==f1_up_class));


    }
}