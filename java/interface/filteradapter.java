package interfaces;

public class filteradapter  implements processor{




    filter m_filter;



    public  filteradapter(filter f){
        m_filter=f;

    }


    public String getName(){
        return m_filter.getName();
    }

    public String process(Object obj){


        return m_filter.filtering((waveform)obj);
    }
}
