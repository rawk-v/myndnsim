package algorithym;

public class queuetest{
    public static void main(String[] args)
    {
        queue<String>demo =new queue<String>();

        for(int i=1;i<100;i++){
            demo.AddTail(Integer.toString(i));
            System.out.println("size is "+demo.getSize());

        }

        demo.Show();
        System.out.println("size is ");
        System.out.println(demo.getSize());



        //for(int i=1;i<10;i++){
         //   demo.MinusHead();
        //}

        demo.Show();
        //demo.reverse();
        demo.Show();
 System.out.println("this is another one ");
        demo.reverseAnother();
        demo.Show();
        System.out.println("0");
    }
}
