

package designpattern.proxynullobj;


import java.util.*;
import utils.*;
import java.lang.reflect.*;


interface Null{}

interface Operation{
    String description();
    void command();
}


interface Robot{
    String name();
    String model();

    List<Operation> operations();
    
    class Test{
        public static void test(Robot robot){
            if(robot instanceof Null)
                utils.print("null object");
            
            utils.print(robot.name()+" "+robot.model());
            for(Operation operation:robot.operations()){
                utils.print(operation.description());
                operation.command();
            }
        }
    }
}



 class IronRobot implements Robot{
    private String name;
    private String model="Avengers";

    public IronRobot(String name){this.name=name;}

    public String name(){return name;}
    public String model(){return model;}

    public List<Operation> operations(){
        return Arrays.asList(
            new Operation(){
                public String description(){return "Beat";}
                public void command(){utils.print("I am beating!");}
            },
            new Operation(){
                public String description(){return "Fly";}
                public void command(){utils.print("I am flying");}
            }
        );
    }


}

class NullRobotHandler implements InvocationHandler{
    private String nullName;
    private Robot proxied=new NullRobot();
    public NullRobotHandler(Class<? extends Robot> robottype){
        nullName=robottype.getSimpleName();

    }
    private class NullRobot implements Null,Robot{
        public String name(){return nullName;}
        public String model(){return nullName+" null model";}
        public List<Operation>operations(){
            return Collections.emptyList();
        }


    }


    public Object invoke(Object proxy,Method method,Object[] args) throws Throwable{

        utils.print("Invoke");
        return method.invoke(proxied,args);
    }
}

class RobotFactory{
    public static Robot getIronRobot(){
        return new IronRobot("Tony Stark");
    }

    public static Robot getNullRobot(Class<? extends Robot> nullRobotType){
        return (Robot)Proxy.newProxyInstance(
            RobotFactory.class.getClassLoader(),
            new Class[]{Robot.class,Null.class},
            new NullRobotHandler(nullRobotType)
        );

    }
}




public class proxynullobj{
    public static void main(String[] args){
        Robot IronMan=RobotFactory.getIronRobot();
        utils.print(IronMan.name());
        Robot NullRobot=RobotFactory.getNullRobot(IronRobot.class);
        utils.print(NullRobot.model());
    }
}





