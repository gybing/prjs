<%@ include file="../../../public/session.jsp"%>
<%@ page language="java" pageEncoding="GBK"%>
<base target="_self">
<html>
  <head>
    <title>���򷽱�֤��</title>
<c:if test="${ not empty resultMsg }">
	<script type="text/javascript">
		window.returnValue="-1";
		window.close();
	</script>
</c:if>
  </head> 
  <body>
	<form name="frm" method="post">
		<input type="hidden" name="matchId" value="${settleMatch.matchId }">	
		<br>
		<fieldset>
			<legend class="common"><b>���򷽱�֤��</b></legend>
			<span>
			<table class="common" align="center" width="100%" height="100%" border="0">
				
				<tr class="common"><td align="center" width="100%" colspan="2">&nbsp;</td></tr>
				<tr class="common">
					<td align="right" width="50%">��Ա�ţ�</td>
					<td align="left" width="50%">${settleMatch.matchId }</td>
				</tr>
				<tr class="common">
					<td align="right" width="50%">��ƷƷ�ִ��룺</td>
					<td align="left" width="50%">${settleMatch.breedId }</td>
				</tr>
				<tr class="common">	
					<td align="right" width="50%">����������</td>
					<td align="left" width="50%">${settleMatch.weight }</td>
				</tr>
				<tr class="common">
					<td align="right" width="50%">�򷽽����̴��룺</td>
					<td align="left" width="50%">${settleMatch.firmID_B }</td>
				</tr>
				<tr class="common">
					<td align="right" width="50%">�����򷽱�֤��</td>
					<td align="left" width="50%">${settleMatch.buyMargin }</td>
				</tr>
				<tr class="common">	
					<td align="right" width="50%">���򷽱�֤���</td>
					<td align="left" width="50%">
						<input type="text" name="thisPayMent" style="width: 100px">
						<font color="red">*</font>
					</td>
				</tr>
				
				<tr class="common"><td align="center" width="100%" colspan="2">&nbsp;</td></tr>
				
				<tr class="common">
					<td align="center" width="100%" colspan="2">
						<input type="button" name="subbtn" class="button" value="�ύ" onclick="payToBuyer1();">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="button" value="����" onclick="window.close();">
					</td>
				</tr>
				
				<tr class="common"><td align="center" width="100%" colspan="2">&nbsp;</td></tr>
				
			</table>
			</span>
		</fieldset>
		<input type="hidden" name="opt">
	</form>
</body>
<script type="text/javascript">
	function payToBuyer1()
	{
		var payToBuyer = frm.thisPayMent.value;
		if(payToBuyer.search("^-?\\d+(\\.\\d+)?$")!=0 || parseFloat(payToBuyer) == parseFloat(0)){
	        alert("������һ����0����!");
	        frm.thisPayMent.value="";
	        frm.thisPayMent.focus();
	        return false;
	     }else{
	     	var submark = false;
	     	if(confirm("ȷ�����򷽱�֤����Ϊ��"+payToBuyer+"��")){
	     		submark = true;
	     		frm.opt.value="settleBackBuyer";
	     		frm.subbtn.disabled=true;
	     	}
	     	if(submark){
	     		frm.action="<%=basePath%>servlet/settleMatchController.${POSTFIX}?funcflg=returnMoneyForBuy&dd="+Date();
	     		frm.submit();
	     		}
	     }
	}
</script>
</html>