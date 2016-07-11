package algorithym;


public class queue<T>
{
    private class Node{
        T item;
        Node next=null;
    }


    private Node first;
     private Node last;
     private int N=0;
     private boolean isEmpty(){
         return first==null;
     }


     public int getSize(){return N;}

     public void AddTail(T item){
         Node oldlast=last;
         last=new Node();
         last.item=item;
         last.next=null;
         if(isEmpty())
             first=last;
         else
         oldlast.next=last;
         N++;

     }
     public void AddHead(T item){
         Node oldfirst=first;
         first=new Node();
         first.item=item;
         first.next=oldfirst;
     }
     public T MinusTail(){


         if (isEmpty())
         {
             return null;
         }
        Node LastButOne=first;
        while(LastButOne.next!=last)
            LastButOne=LastButOne.next;
        T toBeReturned=last.item;
        last=LastButOne;
        last.next=null;

        return toBeReturned;
     }

     public T MinusHead(){
         if(isEmpty()) return null;

           T toBeReturned=first.item;
           first=first.next;
           return toBeReturned;
     }

     public void Show(){
         Node current;
         for(current=first;current!=null;current=current.next)
         {
             System.out.println(current.item);
         }
     }



     public void reverse(){
         Node reverse=null;
         Node current=first;
         while(current!=null){
             Node nextCurrent=current.next;

             current.next=reverse;
             reverse=current;
             current=nextCurrent;

         }

         first=reverse;
     }

     public void reverseAnother(){
         first=doReverseAnother(first);
     }

     public Node doReverseAnother(Node begin){
         if(begin==null) return null;
         if(begin.next==null) return begin;

         Node second=begin.next;
         Node rest=doReverseAnother(second);
         second.next=begin;
         begin.next=null;
         return rest;
     }

}
