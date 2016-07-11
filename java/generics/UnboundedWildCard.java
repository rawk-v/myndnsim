

import java.util.*;
public class  UnboundedWildCard{


    public static void printlist(List<?> list)
    {

        Class<?> m_class=Integer.class;
        for(Object obj:list)
        {
            System.out.println(obj.toString());
        }
    }


    public static void main(String [] args)
    {
        List<Integer>  ints=Arrays.asList(new Integer(10));
        printlist(ints);

    }
}



