package gnnt.MEBS.delivery.command.settleBehavior.filter;

import gnnt.MEBS.delivery.command.model.SettleObject;
import gnnt.MEBS.delivery.command.settleBehavior.Filtering;
import gnnt.MEBS.delivery.model.settle.SettleMatch;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CheckIsSettleTransferForFinish
  implements Filtering
{
  private final transient Log logger = LogFactory.getLog(CheckIsSettleTransferForFinish.class);
  
  public int checkFilter(SettleObject paramSettleObject)
  {
    int i = 1;
    SettleMatch localSettleMatch = paramSettleObject.getSettleMatch();
    int j = localSettleMatch.getIsChangeOwner();
    if (j == 0) {
      i = -4;
    }
    return i;
  }
}
