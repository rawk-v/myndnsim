package interfaces;

import utils.utils;

public class adaptertest{


    public static void main(String args[]){

        waveform testwf=new waveform();

        Apply.apply(new filteradapter(new lpf()),testwf);
        Apply.apply(new filteradapter(new hpf()),testwf);
    }
}
