<%@ include file="/timebargain/common/taglibs.jsp"%>
<html>
<head>
<title>
default
</title>
</head>
<frameset rows="91,*,0" border="0">   
  <frame name="TopFrame" src="<c:url value="/timebargain/report/report.do">
                                   <c:param name="funcflg" value="topFeeMonth"/>
                               </c:url>" scrolling="no"  application="yes"> 
  <frame name="ListFrame" src="<c:url value="/timebargain/report/feeMonth_list.jsp"/>"  application="yes">
  <frame name="HiddFrame"  application="yes">
</frameset>
<body bgcolor="#ffffff" >
</body>
</html>
