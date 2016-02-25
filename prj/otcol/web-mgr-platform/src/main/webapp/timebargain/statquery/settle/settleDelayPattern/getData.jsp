<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="gnnt.MEBS.timebargain.manage.service.SettleManageDelayPattern" %>
<%
	String CommodityID = request.getParameter("CommodityID");
	String dateBegin = request.getParameter("dateBegin");
 	List buyerList = SettleManageDelayPattern.getBuyFirmIds(CommodityID,dateBegin);
  List sellerList = SettleManageDelayPattern.getSellFirmIds(CommodityID,dateBegin);
      
    String buyerStr = ""; 
    String sellerStr = "";
    
    if(buyerList != null && buyerList.size()>0){
    	for(int buy = 0 ; buy < buyerList.size() ; buy ++){
    		Map buyerMap = (Map)buyerList.get(buy);
    		String buyer = (String)buyerMap.get("bFirmId");
    		buyerStr = buyerStr + buyer + ";";
    	}
    }
    if(sellerList != null && sellerList.size()>0){
    	for(int sell = 0 ; sell < sellerList.size() ; sell ++){
    		Map sellerMap = (Map)sellerList.get(sell);
    		String seller = (String)sellerMap.get("sFirmId");
    		sellerStr = sellerStr + seller + ";";
    	}
    }
%>
<%=buyerStr %>[]<%=sellerStr %>