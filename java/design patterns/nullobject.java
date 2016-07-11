
package designpattern.nullobject;

import java.util.*;

abstract class abstractPerson{
    public abstract void  setName(String name);
    public abstract String getName();
}


class realPerson extends abstractPerson{
    private String name;
    public void setName(String n){this.name=n;}
    public String  getName(){return name;}
}

class nullPerson extends abstractPerson{
    public void setName(String n){}
    public String getName(){return "this is null person with no name";}


}

class PersonFactory{
    public static abstractPerson getPerson(String name){
            realPerson person=new realPerson();
            person.setName(name);
            return person;
        }
    public static abstractPerson getPerson(){
        return new nullPerson();
    }
        
}



public class nullobject{
    public static void main(String[] args)
    {
        abstractPerson person1=PersonFactory.getPerson();
        System.out.println(person1.getName());
        abstractPerson person2=PersonFactory.getPerson("Mike");
        System.out.println(person2.getName());

    }
}