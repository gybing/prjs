<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<html>
	<head>
		<title>强行转让</title>
	</head>
	<frameset rows="*,0" border="0">    
	  	<frame name="ListFrame" src="<c:url value="/timebargain/authorize/chkLogin.action?mkName=forceClose"/>"  application="yes">
	  	<frame name="HiddFrame"  application="yes">
	</frameset>
	<noframes>
		<body>
			对不起，您的浏览器不支持框架集！ 
		</body>
	</noframes>
</html>