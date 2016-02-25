<%@ include file="util.jsp" %>
<%@ include file="/timebargain/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=GBK"%> 

<%
   	Date sysdate = new Date();
	SimpleDateFormat df =new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(sysdate);
	System.out.println("date:"+date);
%>

<html xmlns:MEBS>
<head>
<%@ include file="/timebargain/widgets/calendar/calendar.jsp" %>
<IMPORT namespace="MEBS" implementation="<c:url value="/timebargain/scripts/calendar2.htc"/>">

<script language="JavaScript" src="<c:url value="/timebargain/scripts/global.js"/>"></script>
<script language="javascript">
function window_onload(){
	highlightFormElements();
	document.forms[0].zDate.value = '<%=date%>';
}
</script>
<script language="javascript" for="document" event="onkeydown">
<!--
  if(event.keyCode==13)
     query();
-->
</script>

</head>

<body  onload="return window_onload()">
<FORM METHOD=POST ACTION="" name="frm">
<table border="0" height="40%" width="60%" align="center">
			<tr>
				<td>
<fieldset class="pickList" >
	<legend class="common">
		<b>每日收市行情表</b>
	</legend>
	<table border="0" align="center" cellpadding="5" cellspacing="5" class="common">
      <tr>
        <td align="right">查询日期：</td>
        <td >
			<MEBS:calendar eltID="zDate" eltName="zDate" eltCSS="date" eltStyle="width:88px" eltImgPath="<%=skinPath%>/images/"  />
			<span class="req">*</span>
      </tr>

	
    </table>
    
	<table border="0" align="center" cellpadding="5" cellspacing="5" class="common">
		<tr>
				<td>
				<input name="Submit22" type="button" class="button" value="查看" onclick="return query('pdf')">
	     		</td>
	     		<td>
				<input name="Submit22" type="button" class="button" value="保存为excel" onclick="return query('excel')">
	     		</td>
		</tr>
	</table>
	</fieldset>
	</td>
	</tr>
</table>
</FORM>
</body>

</html>

<SCRIPT LANGUAGE="JavaScript">
<!--

function query(exportTo)
{

	var zDate=document.forms[0].zDate.value;
	
	if (zDate == "") {
		alert("查询日期不能为空！");
		return false;
	}
	if(!isDateFomat(zDate))
    {
        alert("查询日期格式不正确！\n如：" + '<%=date%>');
        document.forms[0].zDate.value = "";
        return false;
    }
	
	if(exportTo=="excel")
		window.open("reportContainerExcel.jsp?sign=dayHQ&cleardate=" + zDate + "&title=每日收市行情表");
		else 
	window.showModalDialog("reportContainer.jsp?sign=dayHQ" + "&cleardate=" + zDate + "&title=每日收市行情表","", "dialogWidth=900px; dialogHeight=650px; status=no;scroll=yes;help=no;resizable=yes");

}

//-->
</SCRIPT>