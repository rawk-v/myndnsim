
package designpattern.nullobject;

import java.util.*;
import utils.*;


interface Null{}

class Person{
    private String first;
    private String last;
    private String address;
    public Person(String f,String l,String a){
        this.first=f;
        this.last=l;
        this.address=a;
    }
    public String toString(){
        return first+" "+last+" "+address;
    }

    public static class NullPerson extends Person implements Null{
        private NullPerson(){super("none","none","none");}
        public String toString(){return "this is none person";}
    }

    public static Person nullPerson=new NullPerson();
}

class Position{
    private String title;
    private Person person;
    public Position(String title,Person employee)
    {
        this.title=title;
        this.person=employee;
        if(this.person==null)
            this.person=Person.nullPerson;
    }

    public Position(String title)
    {
        this.title=title;
        this.person=Person.nullPerson;
    }

    public String getTitle(){return title;}
    public Person getPerson(){return this.person;}

    public void setPerson(Person p){
        this.person=p;
        if(person==null)
            person=Person.nullPerson;
    }

    public String toString()
    {
        return title+" "+this.person;
    }


}

class Staff extends ArrayList<Position>
{
    public void add(String title,Person person){
        super.add(new Position(title,person));
    }
    public void add(String... titles){
        for(String title:titles){
            super.add(new Position(title));
        }
    }

    public Staff(String... titles){add(titles);}

    public boolean IsPositionAvailable(String title){
        for(Position position:this){
            if((position.getPerson()==Person.nullPerson)&&(position.getTitle().equals(title)))
                return true;
        }
        return false;
    }


    public void fillPosition(String title,Person person){
        if(IsPositionAvailable(title))
        for(Position position:this){
            if((position.getTitle().equals(title))&&(position.getPerson()==Person.nullPerson))
                position.setPerson(person);
        }
        else 
          utils.print("no such open title");



    }
}