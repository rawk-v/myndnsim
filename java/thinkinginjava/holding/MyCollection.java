

import typeinfo.pets.*;
import java.util.*;


public class MyCollection implements Collection<Pet>
{
  private List<Pet> pets;
    public MyCollection(int num){
        Pet[] petsArray=Pets.createArray(num);

        pets=new ArrayList<Pet>(Arrays.asList(petsArray));




    }
   public boolean add(Pet pet){


    return pets.add(pet);

   }
   public boolean addAll(Collection<? extends Pet> otherpets){
        return pets.addAll(otherpets);
   }
   public void clear(){
       pets.clear();
   }
   public boolean contains(Object pet){
       return pets.contains(pet);
   }
   public boolean containsAll(Collection<?> otherpets)
   {
        return pets.containsAll(otherpets);
   }
   public boolean equals(Object o)
   {
       return pets.equals(o);
   }
   public int hashCode(){
       return pets.hashCode();
   }
   public boolean isEmpty(){
       return pets.isEmpty();
   }
   public boolean remove(Object o)
   {
       return pets.remove(o);
   }
   public boolean removeAll(Collection<?> c){
       return pets.removeAll(c);
   }
   public boolean retainAll(Collection<?> c){
       return pets.retainAll(c);
   }
   public int size()
   {
       return pets.size();
   }
   public Object[]toArray(){
       return pets.toArray();
   }
   public <T> T[] toArray(T[] a){
       return pets.toArray(a);

   }

   public Iterator<Pet> iterator(){
        return pets.iterator();
   }
}
