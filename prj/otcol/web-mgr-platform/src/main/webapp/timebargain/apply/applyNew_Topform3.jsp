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
	if (confirm("��ȷ��Ҫ�ύ��")) {
		if (applyForm.commodityID.value == "") {
			alert("��Ʒ���벻��Ϊ�գ�");
			applyForm.commodityID.focus();
			return false;
		}
		
		if (applyForm.billID.value == "") {
			alert("�ֵ��Ų���Ϊ�գ�");
			applyForm.billID.focus();
			return false;
		}
		if (applyForm.quantity.value == "") {
			alert("�ֵ���������Ϊ�գ�");
			applyForm.quantity.focus();
			return false;
		}
		if (applyForm.quantity.value < 0) {
			alert("�ֵ���������Ϊ������");
			applyForm.quantity.focus();
			return false;
		}
		<%
			String applyType2 = (String)request.getAttribute("applyType");
			if ("4".equals(applyType2)) {
		%>
				if (applyForm.firmID_S.value == "") {
					alert("�������̴��벻��Ϊ�գ�");
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
					alert("��ǰ���ռ۸���Ϊ�գ�");
					applyForm.price.focus();
					return false;
				}
				if (applyForm.customerID_B.value == "") {
					alert("�򷽶������벻��Ϊ�գ�");
					applyForm.customerID_B.focus();
					return false;
				}
				if (applyForm.customerID_S.value == "") {
					alert("�����������벻��Ϊ�գ�");
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
					alert("�����������벻��Ϊ�գ�");
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
								  �ֶ�
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common">
								<tr>
									<td align="right">
											�ֵ��ţ�
									</td>
									<td >
										<html:text property="billID" maxlength="15"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									<td align="right">
											��Ʒ���룺
									</td>
									<td>
										<html:text property="commodityID" maxlength="10"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
								</tr>
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>								
										
								<tr>
									<td align="right">
											�ֵ�������
									</td>
									<td>
										<html:text property="quantity" maxlength="15"  style="ime-mode:disabled" onkeypress="return suffixNamePress()"/>
										<span class="req">*</span>
									</td>
									
									<td align="right">
											�����������룺
									</td>
									<td>
										<html:text property="customerID_S" maxlength="15"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
								</tr>
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>	
								
								<tr>
									<td align="right" >
											��ע��
									</td>
									<td colspan="3">
										<html:textarea property="remark1" rows="3" cols="55"  style="width:450" styleClass="text" />
										
									</td>
								</tr>																																					
								<tr >
									<td colspan="4" align="center">
										<html:button property="save" styleClass="button"
											onclick="javascript:return save_onclick();">
											�ύ
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
								  �ȴ�����
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common">
								<tr>
									<td align="right">
											�ֵ��ţ�
									</td>
									<td>
										<html:text property="billID" maxlength="15"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									<td align="right">
											��Ʒ���룺
									</td>
									<td>
										<html:text property="commodityID" maxlength="10"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
								</tr>		
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								
								<tr>
								<td align="right">
											�ֵ�������
									</td>
									<td>
										<html:text property="quantity" maxlength="15"  style="ime-mode:disabled" onkeypress="return suffixNamePress()"/>
										<span class="req">*</span>
									</td>
									<td align="right">
											���������̴��룺
									</td>
									<td>
										<html:text property="firmID_S" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									
								</tr>								
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								
								<tr>
									<td align="right">
											��ע��
									</td>
									<td colspan="3">
										<html:textarea property="remark1" rows="3" cols="55"  style="width:430" styleClass="text" />
										
									</td>
								</tr>																																					
								<tr>
									<td colspan="4" align="center">
										<html:button property="save" styleClass="button"
											onclick="javascript:return save_onclick();">
											�ύ
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
								  ��ǰ����
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common">
								<tr>
									<td align="right">
											�ֵ��ţ�
									</td>
									<td>
										<html:text property="billID" maxlength="15"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									<td align="right">
											��Ʒ���룺
									</td>
									<td>
										<html:text property="commodityID" maxlength="10"  style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
								</tr>
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								
								<tr>
									<td align="right">
											��ǰ���ռ۸�
									</td>
									<td>
										<html:text property="price" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									<td align="right">
											�ֵ�������
									</td>
									<td>
										<html:text property="quantity" maxlength="15"  style="ime-mode:disabled" onkeypress="return suffixNamePress()"/>
										<span class="req">*</span>
									</td>
									
									
								</tr>	
								
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
									
								<tr>
									<td align="right">
											�򷽶������룺
									</td>
									<td>
										<html:text property="customerID_B" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									<td align="right">
											�����������룺
									</td>
									<td>
										<html:text property="customerID_S" maxlength="15" style="ime-mode:disabled" />
										<span class="req">*</span>
									</td>
									
									
								</tr>	
															
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								
								<tr>
									<td align="right" >
											��ע��
									</td>
									<td colspan="3">
										<html:textarea property="remark1" rows="3" cols="55"  style="width:450" styleClass="text" />
										
									</td>
								</tr>																																					
								<tr>
									<td colspan="4" align="center">
										<html:button property="save" styleClass="button"
											onclick="javascript:return save_onclick();">
											�ύ
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