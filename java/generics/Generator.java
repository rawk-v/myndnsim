package generics;
import java.util.*;

class fibogenerator implements Generator<Integer>{

    private int count=0;

    public int fib(int n){

        if(n<2) return 1;
        return fib(n-1)+fib(n-2);
    }

    public Integer next(){

        return fib(count++);
    }


}

public interface Generator<T>{
    public T next();
}

class fibadapter implements Iterator<Integer>
{
    private int contains=0;
    private fibogenerator fib;
//    public boolean hasNext(){return contains>0;}

    public fibadapter(fibogenerator m_fib,int contains){
        this.fib=m_fib;
        this.contains=contains;

    }

    public Integer next(){
        return fib.next();
    }
    public boolean hasNext(){return contains>0;}
    public Iterator<Integer> iterator(){
        return new Iterator<Integer>(){
            public boolean hasNext(){return fibadapter.this.hasNext();}
        public Integer next(){
            contains--;
            return fibadapter.this.next();
        }
        public void remove(){

        }
        };
    }
}
