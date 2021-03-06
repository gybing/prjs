<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/front/public/includefiles/allIncludeFiles.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>交收信息表页面</title>
		<link href="${skinPath}/css/mgr/memberadmin/module.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="${skinPath }/css/validationEngine.jquery.css" type="text/css" />
		<script type="text/javascript"
			src="${publicPath}/js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript"
			src="${frontPath }/app/timebargain/js/jquery.validationEngine-zh_CN.js"></script>
		<script type="text/javascript"
			src="${publicPath }/js/jquery.validationEngine.js"></script>
		<script type="text/javascript"
			src="${publicPath}/js/calendar/WdatePicker.js"></script>
		<script type="text/javascript" src="${publicPath}/js/tool.js"></script>
		<script>
	jQuery(document).ready(function() {
		//设置表单验证
			$("#frm").validationEngine("attach");
			$("#view").click(function() {
				var tradeDate = jQuery('#tradeDate').val();
				if (tradeDate == '') {
					alert("查询日期不能为空");
					return;
				}
				if ($("#frm").validationEngine('validate')) {
					$("#frm").submit();
				}
			});
		});
</script>
	</head>
	<body>
		<!-------------------------Body Begin------------------------->
		<div class="main">
			<jsp:include page="/front/frame/current.jsp"></jsp:include>
			<div class="warning">
				<div class="title font_orange_14b">
					温馨提示 :
				</div>
				<div class="content">
					在此展示您的交收信息。
				</div>
			</div>
			<div class="main_copy">
				<form id="frm"
					action="${frontPath}/app/timebargain/report/tradeSettleQuery.action"
					method="post">
					<div class="sort">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="30" width="250">
									<label>
										查询日期：
										<input id="d1"
											class="Wdate validate[required,custom[date],past[${today}]] datepicker"
											name="d1" value="<c:out value="${d1 }" />"
											onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})" />
									</label>
								</td>
								<td width="110" height="30" align="center" valign="middle">
									<a href="#" id="view"><img
											src="${skinPath }/image/memberadmin/searchbt1.gif" width="93"
											height="23" border="0" /> </a>
								</td>
							</tr>
						</table>
					</div>
				
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<div class="tb_bg">
										<table width="100%" border="0" cellspacing="0" cellpadding="0" class="content" >

											<tr class="font_b tr_bg">
												<td width="6%" align="center"><div class="ordercol" id="noticeId">商品代码</div></td>
												<td width="8%" align="center"><div class="ordercol" id="noticeId">交收日期</div></td>
												<td width="4%" align="center"><div class="ordercol" id="createTime">买/卖</div></td>
												<td width="6%" align="center"><div class="ordercol" id="noticeId">订立价</div></td>
												<td width="6%" align="center"><div class="ordercol" id="noticeId">交收价</div></td>
												<td width="10%" align="center"><div class="ordercol" id="noticeId">交收手续费</div></td>
												<td width="10%" align="center"><div class="ordercol" id="noticeId">增值税费</div></td>
												<!-- duanbaodi 20150812<td width="10%" align="center"><div class="ordercol" id="noticeId">增值税补扣</div></td>-->
												<td width="10%" align="center"><div class="ordercol" id="noticeId">交收保证金</div></td>
												<td width="10%" align="center"><div class="ordercol" id="noticeId">交收数量</div></td>
												<td width="10%" align="center"><div class="ordercol" id="noticeId">交收货款</div></td>
												<td width="10%" align="center"><div class="ordercol" id="noticeId">交收盈亏</div></td>
											</tr>
											<c:set var="listCount" value="0" />
											<c:set var="settleMarginSum" value="0.00"/>	
											<c:set var="settleQtySum" value="0"/>	
											<c:set var="settlePaypriceSum" value="0.00"/>	
											<c:set var="settleSum" value="0.00"/>	
											<c:forEach items="${tradeSettleList}" var="settle">
											      <c:set var="listCount" value="1" />
										          <tr>
										            <td class="main_tbw02" width="6%"><c:out value="${settle.COMMODITYID}"/></td>
										            <td class="main_tbw01" width="8%"><c:out value="${settle.SETTLEPROCESSDATE}"   /></td>
										            <td class="main_tbw01" width="4%"><c:out value="${settle.BS_FLAG}"/></td>    
										            <td class="main_tbw01" width="6%"><fmt:formatNumber value="${settle.PRICE}" pattern="#,##0.00"/></td>
										            <td class="main_tbw01" width="6%"><fmt:formatNumber value="${settle.SETTLEPRICE}" pattern="#,##0.00"/></td>
										            <td class="main_tbw01" width="10%"><fmt:formatNumber value="${settle.SETTLEFEE}" pattern="#,##0.00"/></td>
										            <!-- duanbaodi 20150812 <td class="main_tbw01" width="10%"><fmt:formatNumber value="${settle.HAPPENMATCHTAX}" pattern="#,##0.00"/></td>-->
										            <td class="main_tbw01" width="10%"><fmt:formatNumber value="${settle.SETTLEADDEDTAX}" pattern="#,##0.00"/></td>
										            <td class="main_tbw01" width="10%">&nbsp;<fmt:formatNumber value="${settle.SETTLEMARGIN}" pattern="#,##0.00"/></td>
										            <td class="main_tbw01" width="10%">&nbsp;<c:out value="${settle.SETTLEQTY}"/></td>
										            <td class="main_tbw01" width="10%"><fmt:formatNumber value="${settle.PAYOUT}" pattern="#,##0.00"/></td>
										           <td class="main_tbw01" width="10%"><fmt:formatNumber value="${settle.SETTLE_PL}" pattern="#,##0.00"/></td>
										          </tr>
										            <c:set var="settleMarginSum" value="${settleMarginSum+settle.SETTLEMARGIN}"/>		
													<c:set var="settleQtySum" value="${settleQtySum+settle.SETTLEQTY}"/>	
													<c:set var="settlePaypriceSum" value="${settlePaypriceSum+settle.PAYOUT}"/>
													<c:set var="settleSum" value="${settleSum+settle.SETTLE_PL}"/>
												</c:forEach>
												<c:if test="${listCount == 1}">
												  <tr>
										            <td class="main_tbw02" width="6%">&nbsp;</td>
										            <td class="main_tbw01" width="8%">合计</td>
										            <td class="main_tbw01" width="4%">&nbsp;</td>
										            <td class="main_tbw01" width="6%">&nbsp;</td>
										            <td class="main_tbw01" width="6%">&nbsp;</td>
										            <td class="main_tbw01" width="10%">&nbsp;</td>
										          <!-- duanbaodi 20150812 <td class="main_tbw01" width="10%">&nbsp;</td>-->
										            <td class="main_tbw01" width="10%">&nbsp;</td>
										            <td class="main_tbw01" width="10%">&nbsp;<fmt:formatNumber value="${settleMarginSum}" pattern="#,##0.00"/></td>
										            <td class="main_tbw01" width="10%">&nbsp;<c:out value="${settleQtySum}"/></td>
										            <td class="main_tbw01" width="10%"><fmt:formatNumber value="${settlePaypriceSum}" pattern="#,##0.00"/></td>
										            <td class="main_tbw01" width="10%"><fmt:formatNumber value="${settleSum}" pattern="#,##0.00"/></td>
										          </tr>
										     </c:if>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td>
								  <c:if test="${pageInfo != null}">
									<jsp:include page="/front/frame/pageinfo.jsp"></jsp:include>
								  </c:if>
								</td>
							</tr>
						</table>
					</div>
		       </form>
			</div>
		</div>
		<!-------------------------Body End------------------------->
	</body>
</html>