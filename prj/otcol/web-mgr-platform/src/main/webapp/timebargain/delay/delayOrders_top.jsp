<%@ include file="/timebargain/common/taglibs.jsp"%>
<%@ page pageEncoding="GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String lastDay = df.format(date);
	pageContext.setAttribute("lastDay",lastDay);
%>
<html>
	<head>
		<LINK REL="stylesheet" type="text/css" href="<c:url value="/timebargain/styles/common.css"/>" />
		<c:import url="/timebargain/statquery/customerID_change.jsp"/>
		<c:import url="/timebargain/common/date.jsp"/>
		<script language="VBScript" src="<c:url value="/timebargain/scripts/vbfunction.vbs"/>"></script>
		<title>
		</title>
		<script type="text/javascript"> 
function window_onload()
{
    highlightFormElements();
    delayForm.isOne.value='true';
    
    query_onclick();
    delayForm.isOne.value='false';
}
//query_onclick
function query_onclick()
{
if(delayForm.isQryHis.checked)
{
  if(delayForm.beginDate.value=="")
  {
    alert("开始日期不能为空！");
    delayForm.beginDate.focus();
    return false;
  }
  if(delayForm.endDate.value=="")
  {
    alert("结束日期不能为空！");
    delayForm.endDate.focus();
    return false;
  }
  if(!isDateFormat(delayForm.beginDate.value))
  {
    alert("开始日期格式不正确！");
    delayForm.beginDate.focus();
    return false;
  }
  if(!isDateFormat(delayForm.endDate.value))
  {
    alert("结束日期格式不正确！");
    delayForm.endDate.focus();
    return false;
  }
}
  wait.style.visibility = "visible";
  delayForm.submit();
  delayForm.query.disabled = true;  
}
//requery_onclick
function requery_onclick()
{
  top.mainFrame.location.href = "<c:url value="/timebargain/statquery/order.jsp"/>";
}

function isQryHis_onclick()
{
  if(delayForm.isQryHis.checked)
  {
    setReadWrite(delayForm.beginDate);
    setReadWrite(delayForm.endDate);
    delayForm.isQryHis.value = true;
  }
  else
  {
    setReadOnly(delayForm.beginDate);
    setReadOnly(delayForm.endDate);
    delayForm.isQryHis.value = false;
  }
  delayForm.isQryHisHidd.value = delayForm.isQryHis.value;
}

function isConsigner_onclick(){
	if (delayForm.isConsigner.checked) {
		delayForm.isConsigner.value = true;
		
	}else {
		delayForm.isConsigner.value = false;
	}
	delayForm.isConsignerHidd.value = delayForm.isConsigner.value;
}

function resetButton(){
	document.getElementById("firmID").value="";
	document.getElementById("commodityID").value="";
	document.getElementById("BS_Flag").value="";
	document.getElementById("status").value="";       
	document.getElementById("isQryHis").checked=false;   
	delayForm.isQryHis.value = false;
//	document.getElementById("beginDate").readOnly=true;    
//	document.getElementById("beginDate").style.backgroundColor = "#C0C0C0";
//	document.getElementById("endDate").readOnly=true;    
//	document.getElementById("endDate").style.backgroundColor = "#C0C0C0";
	setReadOnly(delayForm.beginDate);
    setReadOnly(delayForm.endDate);
    document.getElementById("beginDate").value='${lastDay}';
    document.getElementById("endDate").value='${lastDay}';
    delayForm.isQryHisHidd.value = delayForm.isQryHis.value;
    
}

</script>
	</head>

	<body leftmargin="6" topmargin="0" onLoad="return window_onload()"
		onkeypress="keyEnter(event.keyCode);">
		<c:import url="/timebargain/common/waitbar.jsp" charEncoding="GBK"/>
		<table border="0" height="100%" width="100%" cellpadding="0" cellspacing="0" class="common" align="center">
			<tr>
				<td>
					<html:form action="/timebargain/delay/delay.do?funcflg=listDelayOrders"
						method="POST" styleClass="form" target="ListFrame">
						<fieldset class="pickList" >
							<legend class="common">
								<b>查询条件
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common" width="100%">

								<tr>
									
									<td align="right">
											&nbsp;&nbsp;交易商代码：
									</td>
									<td>
										<input type="text" id="firmID" name="_a.FirmID[=]" style="width:111;ime-mode:disabled" maxlength="16" title=""
											styleClass="text" onkeypress="onlyNumberAndCharInput()"/>
									</td>
			                        <td align="right">
											商品代码：
									</td>
									<td>
										<input type="text" id="commodityID" name="_a.commodityid[=]"  style="width:111;ime-mode:disabled" maxlength="24"
											styleClass="text" onkeypress="onlyNumberAndCharInput()"/>
									</td>
			                        <td align="right"><label>买卖：</label></td>
			                        <td>
				                        <select id="BS_Flag" name="_a.BS_Flag[=]" style="width:111">
				                          <option value="">全部</option>
				                          <option value="1">买</option>
					                      <option value="2">卖</option>
			                            </select>
			                        </td>		
			                        <td align="right">状态：</td>
                                    <td>
                                        <select id="status" name="_a.Status[=]" style="width:111">
				                            <option value="">全部状态</option>
					                        <option value="1">已委托</option>
					                        <option value="2">部分成交</option>
					                        <option value="3">全部成交</option>
					                        <option value="5">全部撤单</option>
					                        <option value="6">部分成交后撤单</option>
			                            </select>			                            
                                    </td>																			
								</tr>
								
								<tr>
								<td>&nbsp;</td>
								<td align="center">
									<input type="checkbox" name="isQryHis" id="isQryHis" onclick="isQryHis_onclick()" value="false" class="NormalInput"/><label for="isQryHis" class="hand">查历史</label>
										<input type="hidden" id="isQryHisHidd" name="_isQryHis[=]" value="false">
										<input type="hidden" id="isOne" name="_isOne[=]" value="false">
								</td>
									<td align="right">
										开始日期：
									</td>
									<td>
										<input type="text" id="beginDate" name="_a.ClearDate[>=][date]" ondblclick="if(!this.readOnly){setRq(this);}" value="<c:out value='${lastDay}'/>" title="双击选择日期" readonly="true" styleId="beginDate" maxlength="10" style="ime-mode:disabled;width:111" onkeypress="return numberPass()" class="ReadOnlyString"/>
									</td>
									<td align="right">
										结束日期：
									</td>
									<td>
										<input type="text" id="endDate" name="_a.ClearDate[<=][datetime]" ondblclick="if(!this.readOnly){setRq(this);}" value="<c:out value='${lastDay}'/>" title="双击选择日期" readonly="true" styleId="endDate" maxlength="10" style="ime-mode:disabled;width:111" onkeypress="return numberPass()" class="ReadOnlyString"/>
									</td>
									<td></td>
									<td align="left">
										<html:button property="query" style="width:60" styleClass="button"
											onclick="javascript:return query_onclick();">
											查询
										</html:button>
										<html:button property="query" style="width:60" styleClass="button"
											onclick="javascript:resetButton();">
											重置
										</html:button>
										
									</td>
									
									
									<td></td>																		
								</tr>
							</table>
						</fieldset>
					</html:form>
				</td>
			</tr>
		</table>

		<%@ include file="/timebargain/common/messages.jsp"%>
	</body>
</html>
