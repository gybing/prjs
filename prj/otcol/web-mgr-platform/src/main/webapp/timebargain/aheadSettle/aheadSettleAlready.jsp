<%@ include file="/timebargain/common/taglibs.jsp"%>
<html>
<head>
<title>
default
</title>
</head>
<frameset rows="80,*,0" border="0">   
  <frame name="TopFrame1" src="<c:url value="/timebargain/aheadSettle/topAheadSettleAlready.jsp"/>" scrolling="no"  application="yes">
	<frame name="ListFrame1" src="<c:url value="/timebargain/aheadSettle/aheadSettleAlready_list.jsp"/>"  application="yes">
  <frame name="HiddFrame"  application="yes">
  
</frameset>
<body bgcolor="#ffffff" >
</body>
</html>
