<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="gnnt.MEBS.timebargain.manage.service.SettleManagePattern" %>
<base target="_self">
<%
	String matchID = request.getParameter("matchID");
	String userid = gnnt.MEBS.common.security.AclCtrl.getLogonID(request);
 	int checkResult=SettleManagePattern.verifySettle(matchID, userid);
	
	if(checkResult==-5)
	{
		%>
			<script type="text/javascript">
				alert("״̬�Ѿ����ܲ���!");
				window.close();
			</script>
		<%
	}
	else if(checkResult==-6)
	{
		%>
			<script type="text/javascript">
				alert("�����쳣!");
				window.close();
			</script>
		<%
	}
	else if(checkResult>-5 && checkResult<0)
	{
		%>
			<script type="text/javascript">
				alert("���ʧ��!");
				window.close();
			</script>
		<%
	}
	else
	{
	%>
			<script type="text/javascript">
				alert("��˳ɹ�!");
				window.returnValue="-1";
				window.close();
			</script>
		<%	
	}	
%>