import typeinfo.pets.*;

public class test{
    public static void main(String [] args)
    {
        MyCollection demo=new MyCollection(100);

        for(Pet p:demo)
        {
            System.out.println(p);
        }
    }
}
