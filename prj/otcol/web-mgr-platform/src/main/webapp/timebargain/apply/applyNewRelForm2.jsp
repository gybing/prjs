<%@ include file="/timebargain/common/taglibs.jsp"%>
<%@ page pageEncoding="GBK"%>
<html>
	<head>
		<LINK REL="stylesheet" type="text/css"
			href="<c:url value="/timebargain/styles/common.css"/>" />
		<script language="JavaScript"
			src="<c:url value="/timebargain/scripts/global.js"/>"></script>
		<title>
		</title>
		<script type="text/javascript"> 
function window_onload()
{
    highlightFormElements();
    setReadOnly(applyForm.billID);
    setReadOnly(applyForm.commodityID);
    setReadOnly(applyForm.customerID_S);
    setReadOnly(applyForm.quantity);
    applyForm.type[0].checked = true;
}
//save
function save_onclick()
{
	if (confirm("您确定要提交吗？")) {
		if (applyForm.commodityID.value == "") {
			alert("商品代码不能为空！");
			applyForm.commodityID.focus();
			return false;
		}
		
		if (applyForm.billID.value == "") {
			alert("仓单号不能为空！");
			applyForm.billID.focus();
			return false;
		}
		if (applyForm.quantity.value == "") {
			alert("仓单数量不能为空！");
			applyForm.quantity.focus();
			return false;
		}
		
		if (applyForm.type[0].checked == false && applyForm.type[1].checked == false) {
			alert("单选框不能为空！");
			
			return false;
		}
		var radios = applyForm.type;
		if (radios[0].checked == true) {
			applyForm.applyType.value = "1";
		}else if (radios[1].checked == true) {
			applyForm.applyType.value = "2";
		}
		applyForm.submit();
		applyForm.save.disabled = true;
	}
	
  
}



</script>
	</head>

	<body leftmargin="0" topmargin="0" onLoad="return window_onload()"
		onkeypress="keyEnter(event.keyCode);">
		<table border="0" height="300" width="640" align="center">
			<tr>
				<td>
				
				
					
					
					
					
					<html:form action="/timebargain/apply/apply.do?funcflg=applySaveGiveUp"
						method="POST" styleClass="form" target="HiddFrame">
						<fieldset class="pickList" >
							<legend class="common">
								<b>
								  撤消抵顶
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common">
								<tr>
									<td align="right">
											仓单号：
									</td>
									<td>
										<html:text property="billID" maxlength="15"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									<td align="right">
											商品代码：
									</td>
									<td>
										<html:text property="commodityID" maxlength="10"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
								</tr>	
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
									
								<tr>
									<td align="right">
											仓单数量：
									</td>
									<td>
										<html:text property="quantity" maxlength="15"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									<td align="right">
											卖方二级代码：
									</td>
									<td>
										<html:text property="customerID_S" maxlength="15" style="ime-mode:disabled" />
										<span class="req">&nbsp;</span>
									</td>
									
									
								</tr>	
									
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>							
							
								<tr>
								<td></td>
									<td align="right">
											撤销类型：
									</td>
									<td>
										<html:radio property="type" value="1" style="border:0px;"></html:radio>正常撤销
										<html:radio property="type" value="2" style="border:0px;"></html:radio>强制撤销
										
										<span class="req">*</span>
									</td>
								</tr>
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								
								<tr>
									<td align="right">
											备注：
									</td>
									<td colspan="3">
										<html:textarea property="remark1" rows="3" cols="75"  style="width:470" styleClass="text" />
										
									</td>
								</tr>																																				
								<tr>
									<td colspan="4" align="center">
										<html:button property="save" styleClass="button"
											onclick="javascript:return save_onclick();">
											提交
										</html:button>
									</td>
								</tr>
							</table>
						</fieldset>
						<html:hidden property="crud"/>
						<html:hidden property="applyType"/>
					</html:form>
					
					
					
					
				</td>
				
			</tr>
		</table>
		
		<script type="text/javascript"
			src="<html:rewrite page="/timebargain/common/validator.jsp"/>"></script>
		<%@ include file="/timebargain/common/messages.jsp"%>
<script type="text/javascript">
	<%
  if(request.getAttribute("applyNewRelForm2") != null)
  {
%>
    parent.TopFrame2.applyForm.query.disabled = false;
    parent.TopFrame2.wait.style.visibility = "hidden";
<%
  }
%>

</script>

	</body>
</html>
