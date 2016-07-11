package interfaces;

import utils.utils;

class waveform{



    private double frequency=100;



}


abstract class filter{


    public String getName(){
        return getClass().getSimpleName();
    }

    public  abstract String filtering(waveform wf);
}

class lpf extends filter{


    public String filtering(waveform wf){
    return "this is lpf!";

    }}

class hpf extends filter{


    public String filtering(waveform wf){

        return "this is hpf";
    }
}



