package gnnt.bank.adapter.bankBusiness.message;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class RSP_BODY_F623
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  @XmlElement
  public String busiNum;
  @XmlElement
  public String busiSerialNum;
  @XmlElement
  public String fcsSerialNum;
  @XmlElement
  public String resultCode;
  @XmlElement
  public String filed1;
  @XmlElement
  public String filed2;
  @XmlElement
  public String filed3;
}
