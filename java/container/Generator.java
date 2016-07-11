package container;



import static utils.utils.print;
public interface Generator<T>

{
    public T next();
}

class Test implements Generator<String>
{
    public String next(){return "hello";}
    static{
        print("yes");
    }
}