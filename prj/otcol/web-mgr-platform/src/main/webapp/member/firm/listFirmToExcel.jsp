<%@page contentType="application/vnd.ms-excel;charset=GBK" %>

</head>
 <%@ include file="../public/headInc.jsp" %>
<%
	
    response.setHeader("Content-disposition","inline; filename=listfirm.xls");
    response.setContentType("application/vnd.ms-excel;charset=GBK");
    response.setCharacterEncoding("GBK");
    //以上这行设定传送到前端浏览器时的档名为totalBalance.xls
    //就是靠这一行，让前端浏览器以为接收到一个excel档 
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body>
    <%@ include file="listFirmTable.jsp" %>
</body>