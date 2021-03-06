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
 //   delayForm.marketCode.focus();
    query_onclick();
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
function resetButton(){
	document.getElementById("commodityID").value="";
	document.getElementById("isQryHis").checked=false;   
	delayForm.isQryHis.value ="false";
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
					<html:form action="/timebargain/delay/delay.do?funcflg=listDelayQuotation"
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
											商品代码 ：
									</td>
									<td>
										<input type="text" id="commodityID" name="_a.Commodityid[like]" title="可输入模式匹配符查询" style="width:111;ime-mode:disabled" maxlength="24"
											styleClass="text" onkeypress="onlyNumberAndCharInput()"/>
									</td>
									
									<td align="left">
										  
									   <input type="checkbox" name="isQryHis" id="isQryHis" onclick="isQryHis_onclick()" value="false" class="NormalInput"/><label for="isQryHis" class="hand">查历史</label>
										<input type="hidden" id="isQryHisHidd" name="_isQryHis[=]" value="false">       
						            </td> 
						            <td>&nbsp;</td>
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
									<td align="right">
										&nbsp;&nbsp;<html:button property="query" style="width:60" styleClass="button"
											onclick="javascript:return query_onclick();">
											查询
										</html:button>
										<html:button property="query" style="width:60" styleClass="button"
											onclick="javascript:resetButton();">
											重置
										</html:button>
									</td>
																										
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
