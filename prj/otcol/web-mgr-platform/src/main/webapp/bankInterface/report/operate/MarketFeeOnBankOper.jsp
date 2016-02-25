<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收益划转</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath %>/common/skinstyle/default/common/commoncss/style.css" type="text/css"/>
	<link rel="stylesheet" href="<%=basePath %>/common/skinstyle/default/common/commoncss/main.css" type="text/css"/>
	<link rel="stylesheet" href="<%=basePath %>/common/skinstyle/default/common/commoncss/button.css" type="text/css"/>
	<link rel="stylesheet" href="<%=basePath %>/common/skinstyle/default/common/commoncss/print.css" type="text/css"/>
	<link rel="stylesheet" href="<%=basePath %>/common/skinstyle/default/common/commoncss/report.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" media="all" href="<%=basePath %>/mgr/common/skinstyle/default/common/commoncss/xtree.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/mgr/common/skinstyle/default/common/commoncss/common1.css"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {text-align: center;padding-top:4px;}
		td {padding-left:3px;height:35px;}
		.textarea {overflow: auto;}
		.left {text-align: right;padding-right: 4px;width: 100px;}
		.right {width: 300px;}
		.center {text-align: center;padding-bottom: 3px;}
		.mainDiv {margin-top:70px;padding-bottom: 70px;}
	</style>
  </head>
  
  <body>
    <form id="frm" action="" method="post" target="parent.mainFrame">
    <fieldset width="95%">
    	<legend>收益划转</legend>
    	<div class="mainDiv">
    	<table cellpadding="0" cellspacing="0" border="0">
    	<tr>
    	<td class="left"><label for="bankCode">银行: </label>
    	<!-- 隐藏获取结算时间 -->
    	<input id="B_Date" bane="B_Date" type="hidden" value="<%=request.getParameter("B_Date") %>"/></td>
    	<td class="right">
    	<%=request.getParameter("bankName") %>
    	<input class="text" id="bankCode" name="bankCode" type="hidden" value="<%=request.getParameter("bankCode") %>" size="22"/>
    	</td></tr>
    	<tr>
    	<td class="left"><label for="Amount">划转金额: </label></td>
    	<td class="right"><input class="text" id="Amount" name="Amount" size="22" value="0.00" onkeypress="return regInput(this,/^\d*\.?\d{0,2}$/,String.fromCharCode(event.keyCode));"/><br/></td>
    	</tr>
    	<tr>
    	<td class="left"><label for="Remark">备注: </label></td>
    	<td class="right"><textarea class="text" rows="5" cols="20" id="Remark" name="Remark" class="textarea" onkeypress="_onlyRead(this)"></textarea><span></span></td>
    	</tr>
    	<tr><td colspan="2" align="center" style="padding-right:20px;" height="45px" valign="middle">
    	<input type="button" class="smlbtn" value="提交" onclick="_submit()"/>&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="button" class="smlbtn"  value="关闭" onclick="_closeWin()"/></td></tr>
    	</table>
    </div>
    </fieldset>
    </form>
  </body>
  <script type="text/javascript">
  	function _submit()
  	{
  		var bankCode = document.getElementById("bankCode");
		var Amount = document.getElementById("Amount");
		var B_Date = document.getElementById("B_Date");
		//windwo.alert(Amount.value);
		//return ;
		if(Amount.value<=0)
		{
			window.alert("划转金额填写有问题，请检查，需要大于0.00");
			return ;
		}
		var Remark = document.getElementById("Remark");
		var rv = "bankCode="+bankCode.value+"&B_Date="+B_Date.value;
		if(Amount.value!=null&&Amount.value!="")
		{
			rv += "&Amount="+Amount.value;
		}
		if(Remark.value!=null&&Remark.value!="")
		{
			rv += "&Remark="+Remark.value;
		}
				
  		window.returnValue = rv;
  		_closeWin();
    }

    function _closeWin()
    {
		window.close();
    }

    function regInput(obj, reg, inputStr){
    	var docSel = document.selection.createRange();
    	if (docSel.parentElement().tagName != "INPUT") {
    		return false;
    	}
    	oSel = docSel.duplicate();
    	oSel.text = "";
    	var srcRange = obj.createTextRange();
    	oSel.setEndPoint("StartToStart", srcRange);
    	var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length);
    	return reg.test(str)
    }

    function _onlyRead(obj)
    {
		if(obj.value.length > 127)
		{
			obj.nextSibling.innerHTML = "<font color='red'>"+obj.value.length+"/128</font>";
			obj.value = obj.value.substring(0,128);
			obj.blur();
		}else
		{
			obj.nextSibling.innerHTML = "<font color='green'>"+obj.value.length+"/128</font>";
		}
		
    }
    
  </script>
</html>
