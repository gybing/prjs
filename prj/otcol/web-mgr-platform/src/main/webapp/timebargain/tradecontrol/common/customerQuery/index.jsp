<%@ include file="/timebargain/common/taglibs.jsp"%>
<%
request.setCharacterEncoding("GBK");
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
%>
<html>
<head>
<title><fmt:message key="common.customerQuery"/></title>
</head>
<frameset rows="90,*" border="0">
  <frame name="TopFrame" src="<c:url value="/timebargain/common/customerQuery/customerQuery_top.jsp">
                               </c:url>" scrolling="no">
  <frame name="ListFrame" src="<c:url value="/timebargain/common/customerQuery/customerQuery_list.jsp">                                 
                               </c:url>" scrolling="yes">
</frameset>
<body bgcolor="#ffffff">
</body>
</html>
