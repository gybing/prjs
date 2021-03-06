package gnnt.MEBS.test.action;

import gnnt.MEBS.packaging.action.BaseAction;
import gnnt.MEBS.packaging.service.InService;
import gnnt.MEBS.test.service.StuTestService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("request")
public class StuTestAction
  extends BaseAction
{
  private final transient Log logger = LogFactory.getLog(StuTestAction.class);
  @Autowired
  @Qualifier("stuTestService")
  protected StuTestService stuTestService;
  
  public InService getService()
  {
    return this.stuTestService;
  }
}
