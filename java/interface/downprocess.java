



package interfaces;


import utils.utils;

abstract class processorBase implements processor{
    public String getName(){


        return getClass().getSimpleName();

    }


    abstract public String process(Object str);






}




class downclass extends processorBase{


    public String process(Object str){


        return ((String)str).toUpperCase();
    }





}

class upclass extends processorBase{


    public String process(Object str)

    {
        return ((String )str).toLowerCase();
    }


}





class Apply{


    public static void apply(processor p,Object obj){

  utils.print(p.getName());
  utils.print(p.process(obj));


    }
}
