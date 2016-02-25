package gnnt.MEBS.delivery.workflow.outWare.handle.behaviour;

import gnnt.MEBS.delivery.model.workflow.EnterWare;
import gnnt.MEBS.delivery.model.workflow.OutWare;
import gnnt.MEBS.delivery.model.workflow.WorkFlowClone;
import gnnt.MEBS.delivery.services.EnterWareService;
import gnnt.MEBS.delivery.workflow.Behaviour;
import java.math.BigDecimal;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class UpdateAmountBehaviour
  implements Behaviour
{
  private final transient Log logger = LogFactory.getLog(UpdateAmountBehaviour.class);
  @Autowired
  @Qualifier("w_enterWareService")
  private EnterWareService enterWareService;
  
  public void deal(WorkFlowClone paramWorkFlowClone)
  {
    OutWare localOutWare = (OutWare)paramWorkFlowClone;
    EnterWare localEnterWare = this.enterWareService.getEnterWareById(localOutWare.getEnterWareId());
    BigDecimal localBigDecimal = new BigDecimal(localEnterWare.getFrozenAmount()).add(new BigDecimal(localOutWare.getWeight()));
    localEnterWare.setFrozenAmount(localBigDecimal.doubleValue());
    this.enterWareService.updateEnterWare(localEnterWare);
    this.logger.debug("添加仓库申请表addOutWareBehaviour");
  }
}
