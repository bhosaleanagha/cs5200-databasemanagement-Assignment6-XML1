package xml2html;

import java.io.File;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class transformer {

  public static void main(String args[]){
    String XSLFILE="/Users/anaghabhosale/Documents/Database/cs5200_spring2020_bhosale_anagha_xml/cs5200_spring2020_bhosale_anagha_xml/src/main/java/xml/websiteXml2Html.xsl";
    String INPUTFILE="/Users/anaghabhosale/Documents/Database/cs5200_spring2020_bhosale_anagha_xml/cs5200_spring2020_bhosale_anagha_xml/src/main/java/xml/site.xml";
    String OUTPUTFILE="/Users/anaghabhosale/Documents/Database/cs5200_spring2020_bhosale_anagha_xml/cs5200_spring2020_bhosale_anagha_xml/src/main/java/xml/website.html";

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
