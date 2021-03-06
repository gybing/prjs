<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="utilForReport.jsp" %>
<%
	//get query condition and handle
	String startBrokerID = request.getParameter("startBrokerID");
    String endBrokerID = request.getParameter("endBrokerID");
    String startFirmID = request.getParameter("startFirmID");
    String endFirmID = request.getParameter("endFirmID");
	String beginDate = request.getParameter("beginDate");
	String endDate = request.getParameter("endDate");
	String firmCategoryid = request.getParameter("firmCategoryID");

	String brokerFilter = "";
	if (!"".equals(startBrokerID)&&!"".equals(endBrokerID)){
		brokerFilter = " and b.brokerid >= '" + startBrokerID  + "' and b.brokerid <= '" + endBrokerID + "' ";
	}

	String firmFilter = "";
	if (!"".equals(startFirmID)&&!"".equals(endFirmID)){
		firmFilter = " and t.firmid >= '" + startFirmID  + "' and t.firmid <= '" + endFirmID + "' ";
	}

	String firmCategorynameFilter = "";
	if (!"".equals(firmCategoryid)){
		firmCategorynameFilter = " and m.firmCategoryid = '" + firmCategoryid + "' ";
	}

	String sql =
"select nvl(b.brokerid,'-') brokerid," +
"       t.firmid firmid," +
"       t.commodityid commodityid," +
"       sum(t.close_pl) close_pl," +
"       sum(t.tradefee) tradefee," +
"       sum(t.quantity) quantity," +
"       m.firmCategoryid firmCategoryid" +
"  from t_h_trade t, m_firm m, m_b_firmandbroker b" +
" where t.firmid = m.firmid" +
"   and t.firmid = b.firmid(+)" +
brokerFilter + firmFilter + firmCategorynameFilter +
"   and t.cleardate >= to_date('" + beginDate + "','YYYY-MM-DD')" +
"   and t.cleardate <= to_date('" + endDate + "','YYYY-MM-DD')" +
" group by nvl(b.brokerid,'-'), t.firmid, t.commodityid, m.firmCategoryid" +
" order by nvl(b.brokerid,'-'), t.firmid, t.commodityid" ;


    System.out.println("sql="+sql);
	DaoHelper dao = (DaoHelper)SysData.getBean("useBackDsDaoHelper");
    List list=dao.queryBySQL(sql);
    List fl =dao.queryBySQL("select id,name from m_firmcategory");
    %>
    <center class="reportHead">交易商历史成交情况汇总</center>
	<table align="center" width="100%">
	<tr><td colspan="7"></td></tr>
	<tr>
		<td colspan="7" class="reportRight">
		<%if (!"".equals(startBrokerID)&&!"".equals(endBrokerID)){ %>
		起始加盟商:<%=startBrokerID %>结束加盟商:<%=endBrokerID %>;<%} %>
		<%if (!"".equals(startFirmID)&&!"".equals(endFirmID)){ %>
		起始交易商:<%=startFirmID %>结束交易商:<%=endFirmID %>;
		<%} %>起始日期:<%=beginDate %>&nbsp;结束日期:<%=endDate %>
		</td>
	</tr>
	</table>
	<table align="center" class="reportTemp" width="1200px">
	<tr>
	  <td class="td_reportMdHead">会员编号</td>
	  <td class="td_reportMdHead">交易商代码</td>
	  <td class="td_reportMdHead">商品代码</td>
	  <td class="td_reportMdHead">转让盈亏</td>
	  <td class="td_reportMdHead">手续费</td>
	  <td class="td_reportMdHead">成交量</td>
	  <td class="td_reportMdHead">交易商类别</td>
	</tr>
    <%
    	for(int i = 0 ; i < list.size() ; i++){
    		Map innerMap = (Map)list.get(i);
	%>
	<tr>
	  <td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("brokerid")) %></td>
	  <td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("firmid")) %></td>
	  <td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("commodityid")) %></td>
	  <td class="td_reportMd1"><fmt:formatNumber value="<%=turnToNum(innerMap.get("close_pl")) %>" pattern="#,##0.00"/></td>
	  <td class="td_reportMd1"><fmt:formatNumber value="<%=turnToNum(innerMap.get("tradefee")) %>" pattern="#,##0.00"/></td>
	  <td class="td_reportMd1"><fmt:formatNumber value="<%=turnToNum(innerMap.get("quantity")) %>" pattern="#,##0"/></td>
	  <%
	  	if(innerMap.get("firmCategoryid") != null){
	  		String fid = innerMap.get("firmCategoryid").toString();
		  	for(int j=0;j<fl.size();j++){
		  		Map map = (Map)fl.get(j);
		  		String id = map.get("id").toString();
		  			if(fid.equals(id)){
		  		%>
		  			<td class="td_reportMd1"><%=map.get("name")%></td>
				<%}
		  	}
	  	}else{%>
	  	<td class="td_reportMd1">未分类</td>
	  </tr>
	 	<%}
    	}
	 %>
</table>