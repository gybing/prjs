<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="common/util.jsp" %>
<html>
<head>
<style media=print>
    .Noprint{display:none;}<!--用本样式在打印时隐藏非打印项目-->
</style>
<title>金网安泰 - 订货统计表 </title>
</head>
<body>
	<table align="center" width="600px" border="0">
		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<table align="right" width="10%" border="0">
					<tr>
					<td align="right">
						<div align="right" id="butDivModUp" name="butDivModUp" class="Noprint">
		     		<input type="submit" onclick="javascript:window.print();" class="button" value="打印">
		     		 
						</div>
					</td>
					</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
				<table align="center" width="600px">
					<tr>
						<td>
					  </td>
					 </tr>
				</table>
			</td>
			</tr>
		<tr>
			<td>
				<div id = ediv>
				<table align="center" height="400px" width="800px" border="0" id ="tableList">
					<tr>
						<td valign="top">
 <%
	String startCommodityID = request.getParameter("startCommodityID");
	String endCommodityID = request.getParameter("endCommodityID");
	String cleardate = request.getParameter("cleardate");
	String brokerId = request.getParameter("brokerageId");
	String breed = request.getParameter("breed");
	User user=(User)request.getSession().getAttribute("CurrentUser");
	String brokerFilter = "  and t.firmid in ("+ user.getSql() +") ";
	if(user.getType().equals("0")&&chcekNull(brokerId)&&!"".equals(brokerId)){
		//会员添加居间条件
		brokerFilter+=" and firmid in (select t.firmId from BR_BrokerAgeAndFirm t where t.brokerageid='"+brokerId+"')";
	}
	String filter = " 1=1 ";
	if(chcekNull(startCommodityID)){
		filter += " and t.commodityid>='"+startCommodityID +"'";
	}
	if(chcekNull(endCommodityID)){
		filter += " and t.commodityid<='"+endCommodityID +"'";
	}
	if(chcekNull(cleardate)){
		filter += " and t.cleardate=to_date('"+cleardate +"','yyyy-MM-dd')";
	}
	if(chcekNull(breed)){
		filter += " and t.commodityid in ( select c.commodityid from t_commodity c where c.breedid = '"+breed+"' )";
	}
	//query data
	String sql = "select commodityid from ( select distinct(t.commodityid) commodityid from t_h_firmholdsum t where "+filter+" and t.bs_flag=1 "+
				" union select distinct(t.commodityid) from t_h_firmholdsum t where "+filter+" and t.bs_flag=2 ) order by commodityid";
						
	DaoHelper dao = (DaoHelper)SysData.getBean("daoHelper");
    List list=dao.queryBySQL(sql);
    if(list.size() == 0){
    %>
    	<div align="center"><b><font size="3px">无符合条件信息。</font></b></div>
    <%
    }
    for(int a = 0 ; a < list.size() ; a ++){
    	Map listMap = (Map)list.get(a);    	
    	String commodityid = turnToStr(listMap.get("commodityid"));   
    %>    
    <br><center class="reportHead">订货统计表</center>
	<table align="center" width="600px" border="0">
	<tr>
		<td class="reportLeft">商品代码:&nbsp;<%=commodityid %></td>
		<td class="reportRight">日期:&nbsp;<%=cleardate %></td>
	</tr>
	</table>
	<%
		String innerBSql = "select firmId,HoldQty,EvenPrice from t_h_firmholdsum t where "+filter+"and t.commodityid='"+commodityid+"' and t.bs_flag=1 "+brokerFilter+" order by firmId";
		String innerSSql = "select firmId,(HoldQty+GageQty) HoldQty,EvenPrice from t_h_firmholdsum t where "+filter+"and t.commodityid='"+commodityid+"' and t.bs_flag=2 "+brokerFilter+" order by firmId";
		List Blist=dao.queryBySQL(innerBSql);
		List Slist=dao.queryBySQL(innerSSql);
	%>
	<span>
	<table align="center" class="reportTemp" width="600px">
		<tr>
		<td class="td_reportRd" valign="top">
			<span>
			<table align="center" class="reportTemp" width="300px">
				<tr>
					<td colspan="3" class="td_reportRdHead">买方</td>
				</tr>
				<tr>
					<td class="td_reportMdHead">交易商代码</td>
					<td class="td_reportMdHead">数量</td>
					<td class="td_reportRdHead">平均价</td>
				</tr>
				<%
					BigDecimal sumB = new BigDecimal(0);
				for(int b = 0 ; b < Blist.size() ; b ++){
					Map innerBMap = (Map)Blist.get(b);
					sumB = sumB.add(turnToNum(innerBMap.get("HoldQty")));
				%>
				<tr>
					<td class="td_reportMd">&nbsp;<%=turnToStr(innerBMap.get("firmId")) %></td>
					<td class="td_reportMd1">&nbsp;<%=turnToNum(innerBMap.get("HoldQty")) %></td>
					<td class="td_reportRd1">&nbsp;<%=turnToNum2(innerBMap.get("EvenPrice")) %></td>
				</tr>
				<%					
				}
				if(Blist.size()>0){
				%>
				<tr>
					<td class="td_reportMd"><b>合计</b></td>
					<td class="td_reportMd1"><b>&nbsp;<%=sumB %></b></td>
					<td class="td_reportRd1">&nbsp;</td>
				</tr>
			<%}else{%>
				<tr>
					<td class="td_reportRd" colspan="3">
						无符合条件信息。
					</td>
				</tr>
				<%}%>
			</table>
			</span>
		</td>
		<td class="td_reportRd" valign="top">
			<span>
			<table align="center" class="reportTemp" width="300px">
				<tr>
					<td colspan="3" class="td_reportRdHead">卖方</td>
				</tr>
				<tr>
					<td class="td_reportMdHead">交易商代码</td>
					<td class="td_reportMdHead">数量</td>
					<td class="td_reportRdHead">平均价</td>
				</tr>
				<%
					BigDecimal sumS = new BigDecimal(0);
				for(int b = 0 ; b < Slist.size() ; b ++){
					Map innerBMap = (Map)Slist.get(b);
					sumS = sumS.add(turnToNum(innerBMap.get("HoldQty")));
				%>
				<tr>
					<td class="td_reportMd">&nbsp;<%=turnToStr(innerBMap.get("firmId")) %></td>
					<td class="td_reportMd1">&nbsp;<%=turnToNum(innerBMap.get("HoldQty")) %></td>
					<td class="td_reportRd1">&nbsp;<%=turnToNum2(innerBMap.get("EvenPrice")) %></td>
				</tr>
				<%					
				}
				if(Slist.size()>0){
				%>
				<tr>
					<td class="td_reportMd"><b>合计</b></td>
					<td class="td_reportMd1"><b>&nbsp;<%=sumS %></b></td>
					<td class="td_reportRd1">&nbsp;</td>
				</tr>
			<%}else{%>
				<tr>
					<td class="td_reportRd" colspan="3">
						无符合条件信息。
					</td>
				</tr>
				<%}%>
			</table>
			</span>
		</td>
		</tr>
	</table>
</span>
<br><br><br><br><br>
	<%
	 }
	%>
	
					  </td>
					 </tr>
					 <tr><td></td></tr>
				</table>
				</div>
		<tr>
			<td>
				<table align="right" width="10%" border="0">
						<tr>
						<td align="right">
						<div align="right" id="butDivModDown" name="butDivModDown" class="Noprint">
						     <input type="submit" onclick="javascript:window.print();" class="button" value="打印"> 
						</div>
						</td>
						</tr>
				</table>
			</td>	
		</tr>
	</table>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
 
</SCRIPT>