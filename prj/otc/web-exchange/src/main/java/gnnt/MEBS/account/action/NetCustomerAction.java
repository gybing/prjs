package gnnt.MEBS.account.action;

import gnnt.MEBS.account.service.CustomerVOService;
import gnnt.MEBS.account.service.NetCustomerService;
import gnnt.MEBS.packaging.action.BaseAction;
import gnnt.MEBS.packaging.service.InService;
import gnnt.MEBS.settlement.service.FirmService;
import java.io.PrintStream;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("request")
public class NetCustomerAction
  extends BaseAction
{
  private final transient Log logger = LogFactory.getLog(NetCustomerAction.class);
  @Autowired
  @Qualifier("netCustomerService")
  private NetCustomerService netCustomerService;
  @Autowired
  @Qualifier("firmService")
  private FirmService firmService;
  @Autowired
  @Qualifier("customerVOService")
  private CustomerVOService customerVOService;
  @Resource(name="papersTypeMap")
  private Map papersTypeMap;
  @Resource(name="papersTypeUpdateMap")
  private Map papersTypeUpdateMap;
  @Resource(name="firmStatusMap")
  private Map firmStatusMap;
  
  public InService getService()
  {
    return this.netCustomerService;
  }
  
  public Map getPapersTypeMap()
  {
    return this.papersTypeMap;
  }
  
  public Map getPapersTypeUpdateMap()
  {
    return this.papersTypeUpdateMap;
  }
  
  public FirmService getFirmService()
  {
    return this.firmService;
  }
  
  public Map getFirmStatusMap()
  {
    return this.firmStatusMap;
  }
  
  public String toinformation()
  {
    String index = this.request.getParameter("cd");
    String customerName = this.request.getParameter("customerIndex" + index);
    System.out.println("customerName=" + customerName);
    this.request.setAttribute("customerName", customerName);
    return "success";
  }
}
