<%@ include file="/timebargain/common/taglibs.jsp"%>
<html>
<head>
<title>
default
</title>
</head>
<frameset rows="91,*,0" border="0">   
  <frame name="TopFrame" src="<c:url value="/timebargain/delay/settleprivilege_top.jsp"/>" scrolling="no"  application="yes"> 
  <frame name="ListFrame" src="<c:url value="/timebargain/delay/delay.do?funcflg=listSettleprivilege"/>" scrolling="yes" application="yes">
  <frame name="HiddFrame" application="yes">
</frameset>
<body bgcolor="#ffffff" >
</body>
</html>