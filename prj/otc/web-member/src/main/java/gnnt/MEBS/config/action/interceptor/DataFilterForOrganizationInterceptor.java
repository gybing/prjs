package gnnt.MEBS.config.action.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import gnnt.MEBS.config.constant.ActionConstant;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

public class DataFilterForOrganizationInterceptor
  extends AbstractInterceptor
{
  private final transient Log logger = LogFactory.getLog(DataFilterForOrganizationInterceptor.class);
  private String queryParam;
  
  public String getQueryParam()
  {
    return this.queryParam;
  }
  
  public void setQueryParam(String queryParam)
  {
    this.queryParam = queryParam;
  }
  
  public String intercept(ActionInvocation invocation)
    throws Exception
  {
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpSession session = request.getSession();
    this.logger.debug("memberNo:" + session.getAttribute(ActionConstant.REGISTERID));
    String organizationNo = (String)session.getAttribute(ActionConstant.ORGANIZATIONID);
    this.logger.debug("organizationNo:" + organizationNo);
    if ((organizationNo != null) && (!"".equals(organizationNo)))
    {
      String organizationNos = "(";
      organizationNos = organizationNos + "select view.actualOrganizationNo from gnnt.MEBS.common.model.OrganizationRelatedSelf  view where view.organizationNo='" + organizationNo + "')";
      this.logger.debug("organizationNOs:" + organizationNos);
      request.setAttribute(ActionConstant.GNNT_ + this.queryParam, organizationNos);
    }
    String result = invocation.invoke();
    return result;
  }
}
