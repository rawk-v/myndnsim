package algorithym;

public class stack<T>{
    private String[] array;
    private int top;
    private int size;
    //private Class<T> type;

    public stack(int size)
    { 
        this.size=size;
        array=new String[size];
        top=0;

    }
   public String[] resize(int newsize){
        String[] temp=new String[newsize];

//        temp= (T[]) new Object[newsize];
 //          temp=(T[])Array.newInstance(type,newsize);
        size=newsize;
        for(int i=0;i<top;i++)
        {
            temp[i]=array[i];
        }
        return temp;
    }

   public void  push(String item){
	   System.out.println("push");
        if(top==size) array=resize(top*2);
        array[top++]=item;
    }

     public String pop(){


        if(top==0){
            System.out.println("empty!");
            return null;
        }
    if (top==size/4)
        System.out.println("so few items!");
    array=resize(top*2);
    return array[--top];
    }



    public void print(){
        for(String item:array)
        {
            System.out.println(item);
        }
    }
    }
