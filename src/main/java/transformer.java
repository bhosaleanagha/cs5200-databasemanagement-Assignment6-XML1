import java.io.File;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class transformer {

  public static void main(String args[]){
    System.out.println(args[0]);
    String XSLFILE=args[0];
    String INPUTFILE=args[1];
    String OUTPUTFILE=args[2];

    StreamSource xslcode = new StreamSource(new File(XSLFILE));
    StreamSource input= new StreamSource(new File(INPUTFILE));
    StreamResult output= new StreamResult(new File(OUTPUTFILE));

    try{
      TransformerFactory tf = TransformerFactory.newInstance();

      Transformer trans = tf.newTransformer(xslcode);

      trans.transform(input,output);

    }
    catch (Exception e){

    }
  }

}
