package gnnt.MEBS.timebargain.manage.service;

import gnnt.MEBS.timebargain.manage.dao.StatQueryDAO;
import gnnt.MEBS.timebargain.manage.model.Apply;
import gnnt.MEBS.timebargain.manage.model.StatQuery;
import gnnt.MEBS.timebargain.manage.util.QueryConditions;
import gnnt.MEBS.timebargain.server.model.Settle;
import gnnt.MEBS.timebargain.server.model.SystemStatus;
import java.util.List;

public abstract interface StatQueryManager
{
  public abstract void setStatQueryDAO(StatQueryDAO paramStatQueryDAO);
  
  public abstract int getOrderCount(QueryConditions paramQueryConditions);
  
  public abstract List getOrderSum(QueryConditions paramQueryConditions);
  
  public abstract List getOrderSums(QueryConditions paramQueryConditions);
  
  public abstract List getOrders(QueryConditions paramQueryConditions, int paramInt1, int paramInt2);
  
  public abstract int getHoldPositionCount(QueryConditions paramQueryConditions);
  
  public abstract List getHoldPositions(QueryConditions paramQueryConditions, int paramInt1, int paramInt2);
  
  public abstract List getTrades(QueryConditions paramQueryConditions, int paramInt1, int paramInt2);
  
  public abstract List getTradesSums(QueryConditions paramQueryConditions);
  
  public abstract int getTradesCount(QueryConditions paramQueryConditions);
  
  public abstract List getTradesSum(QueryConditions paramQueryConditions);
  
  public abstract List getCustomerFundss(QueryConditions paramQueryConditions, int paramInt1, int paramInt2);
  
  public abstract int getCustomerFundssCount(QueryConditions paramQueryConditions);
  
  public abstract List getCustomerFund(QueryConditions paramQueryConditions, String paramString1, String paramString2);
  
  public abstract List getDailyMoneys(QueryConditions paramQueryConditions);
  
  public abstract int getQuotationCount(QueryConditions paramQueryConditions);
  
  public abstract List getQuotations(QueryConditions paramQueryConditions, int paramInt1, int paramInt2);
  
  public abstract List getFundTransfer(QueryConditions paramQueryConditions);
  
  public abstract void updateFundTransferStatusById(String paramString);
  
  public abstract List getFirmHoldPositions(QueryConditions paramQueryConditions, int paramInt1, int paramInt2);
  
  public abstract List getFirmHoldPositionsSum(QueryConditions paramQueryConditions);
  
  public abstract int getFirmHoldPositionsCount(QueryConditions paramQueryConditions);
  
  public abstract List getHandSettle(QueryConditions paramQueryConditions);
  
  public abstract List getSettle(StatQuery paramStatQuery);
  
  public abstract void updateSettle(StatQuery paramStatQuery);
  
  public abstract List getSettleSum();
  
  public abstract String getConferClose(Settle paramSettle);
  
  public abstract String getConferClose2(Settle paramSettle);
  
  public abstract String getConferClose3(Settle paramSettle);
  
  public abstract List getMarketCode();
  
  public abstract void insertSettle(StatQuery paramStatQuery);
  
  public abstract List getAheadSettleLog();
  
  public abstract List getConferCloseLog();
  
  public abstract List getHoldPositions1(QueryConditions paramQueryConditions);
  
  public abstract List getSettleTogether(String paramString);
  
  public abstract List getApplyWaitCD(Apply paramApply);
  
  public abstract List getApplyAlreadyCD(Apply paramApply);
  
  public abstract Apply getGiveUpDD(String paramString);
  
  public abstract Apply getAlreadySettle(String paramString);
  
  public abstract void insertApplyGiveUpDD(Apply paramApply);
  
  public abstract void insertApplyAlreadySettle(Apply paramApply);
  
  public abstract void insertWaitSettle(Apply paramApply);
  
  public abstract void insertDD(Apply paramApply);
  
  public abstract void insertBeforeSettle(Apply paramApply);
  
  public abstract Apply getApplyBillById(String paramString);
  
  public abstract void updateApplyCheckFail(Apply paramApply);
  
  public abstract Apply getGiveUpWaitSettle(String paramString);
  
  public abstract void inserApplyGiveUpWaitSettle(Apply paramApply);
  
  public abstract List getApplyLiveInfo(Apply paramApply);
  
  public abstract Apply getValidIDByApplyID(String paramString);
  
  public abstract List getQuantity(String paramString1, String paramString2);
  
  public abstract void updateApplyCheckSuccess(Apply paramApply);
  
  public abstract List getHoldQtyDD(Apply paramApply);
  
  public abstract List getHoldQtyAheadSettleB(Apply paramApply);
  
  public abstract List getHoldQtyAheadSettleS(Apply paramApply);
  
  public abstract List getHoldQtyWaitSettle(Apply paramApply);
  
  public abstract List getGageQty(Apply paramApply);
  
  public abstract Apply getValidIDByApplyID2(String paramString);
  
  public abstract List getSettlePairsB(StatQuery paramStatQuery);
  
  public abstract List getSettlePairS(StatQuery paramStatQuery);
  
  public abstract Apply getValidIDByApplyIDGiveup(String paramString);
  
  public abstract String getSysdate();
  
  public abstract String getSysdate1();
  
  public abstract void deleteApplyGiveupDD(Apply paramApply);
  
  public abstract void deleteApplyWaitSettle(Apply paramApply);
  
  public abstract Apply getValidIDByApplyID2LiveinfoBefore(String paramString);
  
  public abstract List getCustomerFundsTable(StatQuery paramStatQuery);
  
  public abstract String validatorCustomer_S(Apply paramApply);
  
  public abstract List getPledgeList(StatQuery paramStatQuery);
  
  public abstract void insertPledge(StatQuery paramStatQuery);
  
  public abstract StatQuery getPledgeById(String paramString);
  
  public abstract void updatePledge(StatQuery paramStatQuery);
  
  public abstract void deletePledgeById(String paramString);
  
  public abstract String getSystemStatus();
  
  public abstract SystemStatus getSystemStatusObject();
  
  public abstract Boolean getHandSettleCnt(String paramString);
  
  public abstract String getQuotationPrice(String paramString);
  
  public abstract void insertDelaySettle(Apply paramApply);
  
  public abstract Apply getGiveUpDelaySettle(String paramString);
  
  public abstract void insertApplyGiveUpDelaySettle(Apply paramApply);
  
  public abstract Apply getValidIDByApplyIDGiveupDelaySettle(String paramString);
  
  public abstract void deleteApplyGiveupDelaySettle(Apply paramApply);
  
  public abstract List getBrokerHoldPositions(QueryConditions paramQueryConditions);
  
  public abstract List getBrokerFunds(QueryConditions paramQueryConditions);
  
  public abstract List getBrokerTrades(QueryConditions paramQueryConditions);
  
  public abstract List getFirmCategory();
}
