<%@ include file="/timebargain/common/taglibs.jsp"%>
<html>
<head>
<title>
default
</title>
</head>
<frameset rows="90,*,0" border="0">    
	<frame name="TopFrame" src="<c:url value="/timebargain/deduct/topDeductDetail.jsp"/>" >
  <frame name="ListFrame" src="<c:url value="/timebargain/deduct/deduct.do?funcflg=deductDetailList"/>" >
  <frame name="HiddFrame" >
</frameset>
<body bgcolor="#ffffff" >
</body>
</html>
