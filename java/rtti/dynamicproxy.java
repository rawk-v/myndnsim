
package rtti.dynamicproxy;
import java.util.*;
import java.lang.reflect.*;
import utils.*;

interface Subject{
    void request();
}

class RealSubject implements Subject{
    public void request(){System.out.println("this is request from realsubject");}


}

class ProxyHandler implements InvocationHandler{
    private Subject proxied;
    public ProxyHandler(Subject s){this.proxied=s;}

    public Object invoke(Object proxy,Method method,Object[] args) 
        throws Throwable{

            Object p=proxy;
            utils.print("into invoke");
            utils.print(p.getClass().getSimpleName());
            System.out.println("===before===");
            Object result=method.invoke(proxied,args);
            System.out.println("==after===");
            return result;       
    
        }
}



public class dynamicproxy{
    public static void main(String[] args){
        RealSubject real=new RealSubject();
        ProxyHandler handler=new ProxyHandler(real);

        Subject proxySubject=(Subject)Proxy.newProxyInstance(RealSubject.class.getClassLoader(),RealSubject.class.getInterfaces(),handler);
       

        Subject proxySubject2=(Subject)Proxy.newProxyInstance(RealSubject.class.getClassLoader(),
                                                            RealSubject.class.getInterfaces(),
                                                            handler);
        utils.print("proxy instance1 working");
        proxySubject.request();
        utils.print("proxy instance2 working");
        proxySubject2.request();
        System.out.println("get invocationhandler");
        InvocationHandler invoactionHandler=Proxy.getInvocationHandler(proxySubject);
        Class<?> proxyClass=Proxy.getProxyClass(
            RealSubject.class.getClassLoader(),
            RealSubject.class.getInterfaces()
        );
    }
}