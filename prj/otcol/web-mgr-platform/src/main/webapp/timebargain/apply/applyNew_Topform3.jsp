<%@ include file="/timebargain/common/taglibs.jsp"%>
<%@ page pageEncoding="GBK"%>
<html>
	<head>
		<LINK REL="stylesheet" type="text/css"
			href="<c:url value="/timebargain/styles/common.css"/>" />
		<script language="JavaScript"
			src="<c:url value="/timebargain/scripts/global.js"/>"></script>
			<script language="JavaScript" src="<c:url value="/timebargain/scripts/open.js"/>"></script>
		<title>
		</title>
		<script type="text/javascript"> 
function window_onload()
{
    highlightFormElements();
    
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
		if (applyForm.quantity.value < 0) {
			alert("仓单数量不能为负数！");
			applyForm.quantity.focus();
			return false;
		}
		<%
			String applyType2 = (String)request.getAttribute("applyType");
			if ("4".equals(applyType2)) {
		%>
				if (applyForm.firmID_S.value == "") {
					alert("卖交易商代码不能为空！");
					applyForm.firmID_S.focus();
					return false;
				}
		<%	
			}
		%>
		
		<%
			if ("6".equals(applyType2)) {
		%>
				if (applyForm.price.value == "") {
					alert("提前交收价格不能为空！");
					applyForm.price.focus();
					return false;
				}
				if (applyForm.customerID_B.value == "") {
					alert("买方二级代码不能为空！");
					applyForm.customerID_B.focus();
					return false;
				}
				if (applyForm.customerID_S.value == "") {
					alert("卖方二级代码不能为空！");
					applyForm.customerID_S.focus();
					return false;
				}
		<%	
			}
		%>
		
		<%
			if ("5".equals(applyType2)) {
		%>
				if (applyForm.customerID_S.value == "") {
					alert("卖方二级代码不能为空！");
					applyForm.customerID_S.focus();
					return false;
				}
		<%
			}
		%>
	
		applyForm.submit();
		applyForm.save.disabled = true;
	}
	
  
}

function suffixNamePress(){
	if (event.keyCode>=48 && event.keyCode<=57) {
		event.returnValue=true;
	}else {
		event.returnValue=false;
	}
}

</script>
	</head>

	<body leftmargin="0" topmargin="0" onLoad="return window_onload()"
		onkeypress="keyEnter(event.keyCode);">
		<table border="0" height="300" width="640" align="center">
			<tr>
				<td>
				
				<%
					String applyType = (String)request.getAttribute("applyType");
					if (applyType != null && !"".equals(applyType) && "5".equals(applyType)) {
					System.out.println("-----------------------------applyType:"+applyType);
					
				%>
					<html:form action="/timebargain/apply/apply.do?funcflg=applySave"
						method="POST" styleClass="form" target="HiddFrame">
						<fieldset class="pickList" >
							<legend class="common">
								<b>
								  抵顶
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common">
								<tr>
									<td align="right">
											仓单号：
									</td>
									<td >
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
										<html:text property="quantity" maxlength="15"  style="ime-mode:disabled" onkeypress="return suffixNamePress()"/>
										<span class="req">*</span>
									</td>
									
									<td align="right">
											卖方二级代码：
									</td>
									<td>
										<html:text property="customerID_S" maxlength="15"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
								</tr>
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>	
								
								<tr>
									<td align="right" >
											备注：
									</td>
									<td colspan="3">
										<html:textarea property="remark1" rows="3" cols="55"  style="width:450" styleClass="text" />
										
									</td>
								</tr>																																					
								<tr >
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
					</html:form>
					<%
						}
					%>
					
					<%
						
						if (applyType != null && !"".equals(applyType) && "4".equals(applyType)) {
					%>
					<html:form action="/timebargain/apply/apply.do?funcflg=applySave"
						method="POST" styleClass="form" target="HiddFrame">
						<fieldset class="pickList" >
							<legend class="common">
								<b>
								  等待交收
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
										<html:text property="quantity" maxlength="15"  style="ime-mode:disabled" onkeypress="return suffixNamePress()"/>
										<span class="req">*</span>
									</td>
									<td align="right">
											卖方交易商代码：
									</td>
									<td>
										<html:text property="firmID_S" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									
								</tr>								
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								
								<tr>
									<td align="right">
											备注：
									</td>
									<td colspan="3">
										<html:textarea property="remark1" rows="3" cols="55"  style="width:430" styleClass="text" />
										
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
					</html:form>
					
					<%
						}
					%>
					
					<%
						if (applyType != null && !"".equals(applyType) && "6".equals(applyType)) {
					%>
					<html:form action="/timebargain/apply/apply.do?funcflg=applySave"
						method="POST" styleClass="form" target="HiddFrame">
						<fieldset class="pickList" >
							<legend class="common">
								<b>
								  提前交收
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
											提前交收价格：
									</td>
									<td>
										<html:text property="price" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									<td align="right">
											仓单数量：
									</td>
									<td>
										<html:text property="quantity" maxlength="15"  style="ime-mode:disabled" onkeypress="return suffixNamePress()"/>
										<span class="req">*</span>
									</td>
									
									
								</tr>	
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
									
								<tr>
									<td align="right">
											买方二级代码：
									</td>
									<td>
										<html:text property="customerID_B" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									<td align="right">
											卖方二级代码：
									</td>
									<td>
										<html:text property="customerID_S" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									
								</tr>	
															
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								
								<tr>
									<td align="right" >
											备注：
									</td>
									<td colspan="3">
										<html:textarea property="remark1" rows="3" cols="55"  style="width:450" styleClass="text" />
										
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
					</html:form>
					
					<%
						}
					%>
					
					
				</td>
				
			</tr>
		</table>
		
		<script type="text/javascript"
			src="<html:rewrite page="/timebargain/common/validator.jsp"/>"></script>
		<%@ include file="/timebargain/common/messages.jsp"%>
	</body>
</html>
