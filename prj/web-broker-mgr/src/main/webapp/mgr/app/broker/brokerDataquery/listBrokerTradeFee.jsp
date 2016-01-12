<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<html>
<head>
<title>加盟商手续费汇总查询</title>
<script type="text/javascript">
	
	//执行查询列表
	function dolistquery() {
	//验证信息
	var beginBroker = document.forms[0].beginBroker.value;
	var endBroker = document.forms[0].endBroker.value;
	var beginDate = document.forms[0].beginDate.value;
	var endDate = document.forms[0].endDate.value;
	//alert(beginBroker+","+endBroker+","+beginDate+","+endDate);
	if(beginBroker == "" && endBroker != ""){
		alert("起始加盟商不能为空！！");
		return false;
	}
	if(beginBroker != "" && endBroker == ""){
		alert("结束加盟商不能为空！！");
		return false;
	}
	if(beginDate == "" && endDate != ""){
		alert("起始日期不能为空！！");
		return false;
	}
	if(beginDate != "" && endDate == ""){
		alert("结束日期不能为空！！");
		return false;
	}
	if(beginDate > endDate){
		alert("起始日期不能大于结束日期！！！");
		return false;
	}
		frm.submit();
	}

</script>
</head>
<body>
	<div id="main_body">
	      <div class="div_cx">
					<form action="${basePath}/broker/brokerDataquery/listBrokerTradeFee.action"
						method="POST" styleClass="form" name="statQueryForm" id="frm">
						<fieldset class="pickList" >
							<legend class="common">
								<b>查询条件
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common">

								<tr>		
						            <td>&nbsp;</td>
									<td align="right">
										&nbsp;&nbsp;起始加盟商：<SELECT  name="${GNNT_}primary.beginBroker[=][Long]" id="beginBroker" >
	            						<OPTION value="">全部</OPTION>
							            <c:forEach items="${brokerAscList}" var="result">
								        <option value="${result.BROKERID}">${result.BROKERID}</option>
									    </c:forEach>
          							</SELECT>
										 <script >frm.beginBroker.value = "<c:out value='${oldParams["primary.beginBroker[=][Long]"] }'/>";</script>
									</td>
									
									<td align="left">
										&nbsp;&nbsp;结束加盟商：
									<SELECT name="${GNNT_}primary.endBroker[=][Long]" id="endBroker">
	            						<OPTION value="">全部</OPTION>
							            <c:forEach items="${brokerDescList}" var="result">
								        <option value="${result.BROKERID}">${result.BROKERID}</option>
									    </c:forEach>
          							</SELECT>
									 <script >frm.endBroker.value = "<c:out value='${oldParams["primary.endBroker[=][Long]"] }'/>";</script>
									</td>
						
									<td align="right">
										汇总方式：
										<select name="${GNNT_}primary.sumType[=][Long]" id="sumType">
										<option value="">正常</option>
										<option value="breed" selected="selected">分品种汇总</option>
										<option value="sumByBreed" >品种汇总</option>
										<option value="day" >分结算日汇总</option>
										<option value="sumByDay" >结算日汇总</option>
										</select>
										<script >frm.sumType.value = "<c:out value='${oldParams["primary.sumType[=][Long]"] }'/>";</script>
									</td>
								</tr>
								<tr>
									<td align="right">
									</td>
									<td>
									</td>
									
						            
									<td align="right">
											            &nbsp;&nbsp;开始日期:
											        <input type="text" class="wdate" id="beginDate"  style="width: 106px" 
												       name="${GNNT_}primary.occurDate[>=][date]"			
												       value="${oldParams['primary.occurDate[>=][date]']}"					
												       onfocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})" />			
							                     </td>

									              <td align="right">
											           &nbsp;&nbsp;结束日期:
											         <input type="text" class="wdate" id="endDate"  style="width: 106px" 
												      name="${GNNT_}primary.occurDate[<=][date]"			
												       value="${oldParams['primary.occurDate[<=][date]']}"					
												      onfocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})" />			
							                     </td>		
									<td align="right">
										&nbsp;&nbsp;<input type="button"
											onclick="javascript:return dolistquery();" class="button" value="执行查询"/>
									</td>
																										
								</tr>
							</table>
						</fieldset>
					</form>
			</div>
	    
		<div class="div_list">
		
			<table id="tb" border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td>
						<ec:table items="resultList" var="result" 
			action="${basePath}/broker/brokerDataquery/listBrokerTradeFee.action"	
			xlsFileName="tradeFeeBrokerList.xls" 
			csvFileName="tradeFeeBrokerList.csv"
			showPrint="true" 			
			rowsDisplayed="20"
			listWidth="100%"	
			minHeight="300"  
			filterable="false"
            
	>
		<ec:row>	
			
			<ec:column property="NAME" title="加盟商名称" width="10%" calcTitle= "合计" calc="total" style="text-align:center;"/>
			<ec:column property="BROKERID" title="加盟商编号"  width="10%"  style="text-align:center;"/>
			<ec:column property="BREEDID" title="品种编号"  width="8%"  style="text-align:center;">
			<c:if test="${result.BREEDID==null}">
			※※※
			</c:if>
			<c:if test="${result.BREEDID!=null}">
			${result.BREEDID}
			</c:if>
			</ec:column>
			<ec:column property="_1" title="佣金类型" width="5%" style="text-align:center;" >
				<c:if test="${result.REWARDTYPE==0}">
				         交易
				</c:if>				
				<c:if test="${result.REWARDTYPE==1}">
				    交收
				</c:if>								
			</ec:column>
			<ec:column property="SUMTRADEFEE" title="手续费" cell="currency" format="###,##0.00" calc="total" width="10%" style="text-align:right;"/>
			<ec:column property="SUMSELFGAIN" title="加盟商手续费" cell="currency" format="###,##0.00" calc="total" width="10%" style="text-align:right;"/>
			<ec:column property="SUMMARHETGAIN" title="交易所手续费" cell="currency" format="###,##0.00" calc="total" width="10%" style="text-align:right;"/>
			<ec:column property="SUMBROKEREACHDIVIDE" title="加盟商手续费分成" cell="currency" format="###,##0.00" calc="total" width="10%" style="text-align:right;"/>
			<ec:column property="SUMFINALMARHETGAIN" title="交易所实得手续费" cell="currency" format="###,##0.00" calc="total" width="10%" style="text-align:right;"/>
			<ec:column property="SUMREWARD" title="加盟商实得手续费" cell="currency" format="###,##0.00" calc="total" width="10%" style="text-align:right;"/>
			<ec:column property="CLEARDATE" title="结算日期" width="10%" style="text-align:right;">
			<c:if test="${result.CLEARDATE==null}">
			※※※
			</c:if>
			<c:if test="${result.CLEARDATE!=null}">
			  <fmt:formatDate value="${result.CLEARDATE }" pattern="yyyy-MM-dd" />			
			</c:if>
			</ec:column>
		</ec:row>
	</ec:table>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>
