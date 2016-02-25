package gnnt.MEBS.delivery.command.testing;

import gnnt.MEBS.base.util.Arith;
import gnnt.MEBS.delivery.command.Information;
import gnnt.MEBS.delivery.command.PolicySuperior;
import gnnt.MEBS.delivery.command.model.SettleObject;
import gnnt.MEBS.delivery.model.settle.SettleMatch;
import gnnt.MEBS.delivery.model.workflow.RegStock;
import gnnt.MEBS.delivery.services.MoneyDoService;
import gnnt.MEBS.delivery.services.SettleMatchService;
import java.util.Map;

public class IncomeTest
  extends AbstractTest
{
  public void testPayout1()
  {
    String str1 = "liwei";
    String str2 = "fanzh";
    String str3 = "3";
    RegStock localRegStock = getRegStock(str2, 0);
    long l = addSettleMatch(10000.0D, 1000.0D, str1, str2, str3, 100.0D, 1, localRegStock.getRegStockId(), null);
    SettleMatch localSettleMatch = getSettleMatch(l);
    double d1 = 100.0D;
    SettleObject localSettleObject = getSettleObject(localSettleMatch.getMatchId(), localRegStock.getRegStockId(), 0, d1, true);
    double d2 = localSettleMatch.getSellIncome_Ref();
    double d3 = localSettleMatch.getBuyPayout_Ref();
    double d4 = d2 - d3;
    double d5 = localSettleMatch.getBuyPayout();
    localSettleMatch.setBuyPayout(d5 + d1 - d4 - 100.0D);
    this.settleMatchService.updateSettleMatch(localSettleMatch);
    Information localInformation = new Information();
    localInformation.setObject(localSettleObject);
    localInformation.setCommandName("settleCommand");
    localInformation.setReceiveName("income");
    Map localMap = this.policySuperior.policyExecuteCommand(localInformation);
    int i = ((Integer)localMap.get("result")).intValue();
    assertEquals(-3, i);
  }
  
  public void testPayout2()
  {
    String str1 = "liwei";
    String str2 = "fanzh";
    String str3 = "3";
    RegStock localRegStock = getRegStock(str2, 0);
    long l = addSettleMatch(10000.0D, 1000.0D, str1, str2, str3, 100.0D, 1, localRegStock.getRegStockId(), null);
    SettleMatch localSettleMatch1 = getSettleMatch(l);
    double d1 = 100.0D;
    SettleObject localSettleObject = getSettleObject(localSettleMatch1.getMatchId(), localRegStock.getRegStockId(), 0, d1, true);
    double d2 = this.moneyDoService.getFirmFunds(str2);
    double d3 = localSettleObject.getAmount();
    double d4 = localSettleMatch1.getSellIncome_Ref();
    double d5 = localSettleMatch1.getBuyPayout_Ref();
    double d6 = d4 - d5;
    double d7 = localSettleMatch1.getBuyPayout();
    double d8 = localSettleMatch1.getSellIncome();
    localSettleMatch1.setBuyPayout(d7 + d1 - d6);
    this.settleMatchService.updateSettleMatch(localSettleMatch1);
    Information localInformation = new Information();
    localInformation.setObject(localSettleObject);
    localInformation.setCommandName("settleCommand");
    localInformation.setReceiveName("income");
    Map localMap = this.policySuperior.policyExecuteCommand(localInformation);
    int i = ((Integer)localMap.get("result")).intValue();
    assertEquals(1, i);
    double d9 = d8 + d3;
    SettleMatch localSettleMatch2 = this.settleMatchService.getSettleMatchById(localSettleObject.getMatchId());
    double d10 = localSettleMatch2.getSellIncome();
    assertEquals(Double.valueOf(d9), Double.valueOf(d10));
    double d11 = this.moneyDoService.getFirmFunds(str2);
    assertTrue(Arith.compareTo(d11, Arith.add(d2, d3)) == 0);
  }
}
