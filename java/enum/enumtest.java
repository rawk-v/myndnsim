
package Enum;

import static utils.utils.print;

enum Shrubbery{
    GROUND,CRAWLING,HANGING
}

enum Person{
    MIKE("Mike"),
    KITTY("Kitty");

    private String name;
    private Person(String n){this.name=n;}

   // public static Person getPerson(String name){return new Person(name);}
}

interface fly{
    void fly();
}
enum insets implements fly{
    FLY,
    MOSQUITO;
    public void fly(){
        print(this+" are flying");
    }
    
}


public class enumtest{

    public static void test(fly flyable){
        flyable.fly();
    }
    public static void main(String[] args){
        for(insets i:insets.values())
        test(i);
    
        
    //     Shrubbery[] shrubberyValues=Shrubbery.values();
    //     for(Shrubbery s:shrubberyValues){
    //         print(s);
    //         print(s.getDeclaringClass());
    //         print(s);
    //     }


    //     print("ok1");

    //     Enum e=Person.MIKE;
    //     for(Enum en:e.getClass().getEnumConstants())
    //         print(en);
    // }
}}