


package container;

import java.util.*;
import utils.*;

interface Serialed<T>{
    public long getSerialNumber();
}

class SerialedImp<T> implements Serialed<T>{
    static long counter=1;
    private long SerialNumber=counter++;
    public long getSerialNumber(){return SerialNumber;}
}

class Person
{
    protected String name;
    public Person(String n){this.name=n;}

    public String toString(){return "Person "+name;}
}

class Student extends Person implements Serialed<Student>
{   
    private SerialedImp<Student> serialedImp=new SerialedImp<>();
    public Student(String name){super(name);}
    public long getSerialNumber(){
        return serialedImp.getSerialNumber();
    }

    public String toString(){return "student "+getSerialNumber()+" "+name;}
}

class Teacher extends Person implements Serialed<Teacher>
{
    private SerialedImp<Teacher> serialedImp=new SerialedImp<>();
    public Teacher(String name){super(name);}
    public long getSerialNumber(){
        return serialedImp.getSerialNumber();
    }
    public String toString(){return "teacher "+getSerialNumber()+" "+name;}

}









public class FillTest{
    public static void main(String[] args){
        Person person=null;
        // for(int i=1;i<10;i++)
        // {
        //     person=new Student("Mike");
        //     utils.print(person);
        // }

        // for(int i=1;i<10;i++)
        // {
        //     person=new Teacher("Kitty");
        //     utils.print(person);
        // }

        List<? super Person> persons=new ArrayList<>();
        persons.add(new Person("Mike"));
        persons.add(new Student("Kitty"));

        utils.print(persons.get(0));
       
        try{
            person=(Person)(persons.get(0));
        }catch(Exception e){
            
        }
        utils.print(person);  


        List<Person> persons2=new ArrayList<>();
        persons2.add(new Person("Nick"));
        


        



        
    }
}