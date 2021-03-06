
<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<%@page import="java.util.*"%>
<html xmlns:MEBS>
	<head>
		<title>特别会员成交明细查询</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
		<IMPORT namespace="MEBS"
			implementation="${basePath}/common/jslib/calendar.htc">
	</head>
	<body onload="init('${queryType}')">
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
							<form name="frm"
								action="${basePath}/query/querySpecialMemberOrderSearch/list.action?sortName=primary.tradeNo&sortOrder=true"
								method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td class="table2_td_widthmid">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0" style="table-layout: fixed">
													<tr>
														<td class="table3_td_1tjcx" align="left">
															查询范围:&nbsp;
															<label>
																<select name="queryType" size="1" id="queryType"
																	style="width: 100" onchange="changeOn()">
																	<option value="D">
																		当前
																	</option>
																	<option value="H">
																		历史
																	</option>
																</select>
															</label>
														</td>
														<td class="table3_td_1tjcx" align="left">
															商品名称:&nbsp;
															<span class="right_03zi"><select id="commodityId"
																	name="${GNNT_}primary.commodityId[=][String]"
																	class="input_textmin" style="width: 120">
																	<option value="">
																		请选择
																	</option>
																	<c:forEach items="${commodityList}" var="commodit">
																		<option value="${commodit.id}">
																			${commodit.name }
																		</option>
																	</c:forEach>
																</select> </span>
															<script type="text/javascript">
																frm.commodityId.value = '${oldParams["primary.commodityId[=][String]"] }';
															</script>
														</td>
														<td class="table3_td_1tjcx" align="left">
															成交单号:&nbsp;
															<label>
																<input type="text" name="${GNNT_}primary.tradeNo[=][int]"
																	id="memberName" value="${oldParams['primary.tradeNo[=][int]'] }"
																	class="input_textmin" />
															</label>
														</td>
													</tr>
													<tr>
														<td class="table3_td_1tjcx" align="left">
															开始日期:&nbsp;
															<label>
																<input type="text" style="width: 100px" id="beginDate"
																	class="wdate" maxlength="10"
																	name="${GNNT_}clearDate[>=][date]"
																	value='${oldParams["clearDate[>=][date]"]}'
																	onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
															</label>
														</td>
														<td class="table3_td_1tjcx" align="left">
															结束日期:&nbsp;
															<label>
																<input type="text" style="width: 120px" id="endDate"
																	class="wdate" maxlength="10"
																	name="${GNNT_}clearDate[<=][date]"
																	value='${oldParams["clearDate[<=][date]"]}'
																	onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
															</label>
														</td>
														
														<td class="table3_td_anniutjcx" align="left">
															<button class="btn_sec" onClick="search1()">
																查询
															</button>
															&nbsp;&nbsp;
															<button class="btn_cz" onClick="myReset()">
																重置
															</button>
														</td>
													</tr>
													
												</table>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="div_list">
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
										<ec:table items="resultList"
											autoIncludeParameters="${empty param.autoInc}"
											var="speicalMemberTransaction"
											action="${basePath}/query/querySpecialMemberOrderSearch/list.action?sortName=primary.tradeNo&sortOrder=true"
											title="" minHeight="325" listWidth="170%"
											retrieveRowsCallback="limit" sortRowsCallback="limit"
											filterRowsCallback="limit" csvFileName="导出列表.csv"
											style="table-layout:fixed">
											<ec:row ondblclick="">
												<ec:column width="2%" property="_0" title="序号"
													value="${GLOBALROWCOUNT}" sortable="false"
													filterable="false" />
												<c:if test="${queryType=='H'}">
												<ec:column property="clearDate[=][date]" title="结算日期"
													width="4%" style="text-align:left; "
													 ellipsis="true">
													<fmt:formatDate value="${speicalMemberTransaction.clearDate}" pattern="yyyy-MM-dd"/>
												</ec:column>
												</c:if>
												<ec:column property="s_signNo[like]" title="交易账号" width="6%"
													style="text-align:left; "
													value="${speicalMemberTransaction.s_signNo}" ellipsis="true" />
												<ec:column property="oc_flag[=][String]" title="建/平仓"
													width="3%" style="text-align:left; "
													editTemplate="ec_modMap"
													value="${firstMap[speicalMemberTransaction.oc_flag]}"
													ellipsis="true" />
												<ec:column property="tradeNo[=][int]" title="成交单号"
													width="4%" style="text-align:left; "
													value="${speicalMemberTransaction.tradeNo}" ellipsis="true" />
												<ec:column property="holdNo[=][int]" title="持仓单号"
													width="4%" style="text-align:left; "
													value="${speicalMemberTransaction.holdNo}" ellipsis="true" />
												<ec:column property="tradeTime[=][date]" title="成交时间"
													width="7%" style="text-align:left; "
													value="${datefn:formatdate(speicalMemberTransaction.tradeTime)}"
													ellipsis="true" />


												<ec:column property="commodityName[like]" title="商品"
													width="5%" style="text-align:left; "
													value="${speicalMemberTransaction.commodityName}"
													ellipsis="true" />

												<ec:column property="quantity[=][int]" title="成交量"
													width="3%" style="text-align:right; " 
													format="#,##0">
													<fmt:formatNumber
														value="${speicalMemberTransaction.quantity}"
														pattern="#,##0" />
												</ec:column>
												<ec:column property="tradefunds[=][double]" title="成交金额"
													width="7%" style="text-align:right; ">
													<fmt:formatNumber
														value="${speicalMemberTransaction.tradefunds}"
														pattern="#,##0.00" />
												</ec:column>
												<ec:column property="bs_flag[=][String]" title="买卖方向"
													width="4%" style="text-align:left; "
													editTemplate="esc_bsFlag" ellipsis="true">
													<c:set var="typeKey">
														<c:out value="${speicalMemberTransaction.bs_flag}"></c:out>
													</c:set>
		  											${secondMap[typeKey]}
												</ec:column>
												<ec:column property="openprice[=][double]" title="建仓价"
													width="5%" style="text-align:right; " >
													<fmt:formatNumber
														value="${speicalMemberTransaction.openprice}"
														pattern="#,##0.00" />
												</ec:column>
												<ec:column property="closeprice[=][double]" title="平仓价"
													width="5%" style="text-align:right; " >
													<fmt:formatNumber
														value="${speicalMemberTransaction.closeprice}"
														pattern="#,##0.00" />
												</ec:column>
												<ec:column property="holdprice[=][double]" title="持仓价"
													width="5%" style="text-align:right; " >
													<fmt:formatNumber
														value="${speicalMemberTransaction.holdprice}"
														pattern="#,##0.00" />
												</ec:column>
												<ec:column property="close_pl[=][double]" title="平仓盈亏"
													width="6%" style="text-align:right; " 
													format="#,##0.00">
													<fmt:formatNumber
														value="${speicalMemberTransaction.close_pl}"
														pattern="#,##0.00" />
												</ec:column>
												<ec:column property="actualpl[=][double]" title="实际盈亏"
													width="6%" style="text-align:right; " 
													format="#,##0.00">
													<fmt:formatNumber
														value="${speicalMemberTransaction.actualpl}"
														pattern="#,##0.00" />
												</ec:column>
												<ec:column property="traderId[like]" title="操作人"
													value="${speicalMemberTransaction.traderId}" width="4%"
													style="text-align:right; " ellipsis="true">
												</ec:column>
												<ec:column property="memberNo[like]" title="综合会员编号" width="5%"
													style="text-align:left; "
													value="${speicalMemberTransaction.memberNo}"
													ellipsis="true" />
												<ec:column property="memberName[like]" title="综合会员名称"
													width="5%" style="text-align:left; "
													value="${speicalMemberTransaction.memberName}"
													ellipsis="true" />
												<ec:column property="tradetype[=][String]" title="成交类型"
													width="4%" style="text-align:left; "
													editTemplate="ec_holdType" ellipsis="true">
												${thirdMap[speicalMemberTransaction.tradetype]}
												</ec:column>
												<ec:column property="operatetype[=][String]" title="操作类型"
													width="4%" style="text-align:left; "
													editTemplate="ec_operateType" ellipsis="true">
												${fourthMap[speicalMemberTransaction.operatetype]}
												</ec:column>
											</ec:row>
											<c:if test="${ifHas eq 1}">		
												<ec:extendrow>
													<td>
													          合计:
													</td>
													<c:if test="${queryType=='H'}">
														<td>&nbsp;</td>
													</c:if>
													<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
													<td align="right" style="font-weight:bold">${quantityAll }</td>
													<td align="right" style="font-weight:bold">${tradefundsAll }</td>													
													<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
													<td align="right" style="font-weight:bold">${close_plAll }</td>													
													<td align="right" style="font-weight:bold">${actualplAll }</td>
													<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
												</ec:extendrow>
											</c:if>
										</ec:table>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- 编辑和过滤所使用的 通用的文本框模板 -->
		<textarea id="ecs_t_input" rows="" cols="" style="display: none">
			<input type="text" class="inputtext" value=""
				onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="" />
		</textarea>
		<!-- 编辑和过滤所使用的操作模板 -->
		<textarea id="ec_modMap" rows="" cols="" style="display: none">
		<select onBlur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="os_flag[like]">
			<ec:options items="firstMap" />
		</select>
	    </textarea>
		<!-- 编辑和过滤所使用的买卖标志模板 -->
		<textarea id="esc_bsFlag" rows="" cols="" style="display: none">
		<select onBlur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="bs_Flag[like]">
			<ec:options items="secondMap" />
		</select>
	    </textarea>
		<!-- 编辑和过滤所使用的持仓状态模板 -->
		<textarea id="ec_holdType" rows="" cols="" style="display: none">
		<select onBlur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="status[like]">
			<ec:options items="thirdMap" />
		</select>
	    </textarea>
	    <!-- 编辑和过滤所使用的持仓状态模板 -->
		<textarea id="ec_operateType" rows="" cols="" style="display: none">
		<select onBlur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="operateType[like]">
			<ec:options items="fourthMap" />
		</select>
	    </textarea>
	</body>
</html>

<SCRIPT type="text/javascript">
		function changeOn(){
			var todayHis=document.getElementById("queryType").value;
			change(todayHis);
		}
		function search1(){
			checkTotalQueryDate(frm.beginDate.value,frm.endDate.value,frm.queryType.value);
			changeOn();
		}
		function init(queryType){
			if(frm.beginDate.value=="" && frm.endDate.value==""){
				 frm.beginDate.value='${date}';
				 frm.endDate.value='${date}';
			 }
			 document.getElementById("beginDate").disabled=true;
			document.getElementById("endDate").disabled=true;
			change(queryType);
		}
		function change(value){
			if(value=='D')
			{
			  frm.beginDate.disabled=true;
			  frm.endDate.disabled=true;
			  frm.beginDate.style.backgroundColor="#d0d0d0";
				frm.endDate.style.backgroundColor="#d0d0d0";
			   frm.queryType.value='D';
			 // ec.action="${basePath}/query/queryMemberHoldSearch/list.action?queryType=D";
			 // frm.action="${basePath}/query/queryMemberHoldSearch/list.action?queryType=D";
			}
			else if(value=='H')
			{
			   frm.beginDate.disabled=false;
			   frm.endDate.disabled=false;
			   frm.beginDate.style.backgroundColor="#ffffff";
				frm.endDate.style.backgroundColor="#ffffff";
			   frm.queryType.value='H';
			  //  ec.action="${basePath}/query/queryMemberHoldSearch/list.action?queryType=H";
			  //  frm.action="${basePath}/query/queryMemberHoldSearch/list.action?queryType=H";
			}
		}
		
		</SCRIPT>