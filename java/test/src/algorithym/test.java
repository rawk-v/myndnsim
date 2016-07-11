package algorithym;


public class test{
    public static void main(String[] args){
        stack<String> demo=new stack<String>(10);



        for(int i=1;i<=100;i++){
            demo.push(Integer.toString(i));
        }


        demo.print();
    }
}
