<%@ tag body-content="empty" dynamic-attributes="columnAttr" %>
<%@ include file="../init.tagf" %>
<%//��Ʒ����Ϣ%>
<%@ attribute name="id" required="true" %>
<%@ attribute name="code" required="true" %>
<%@ attribute name="firsttime" required="true" %>
<%@ attribute name="createtime" required="true" %>
<%@ attribute name="status" required="true" %>
<%@ attribute name="splitid" required="true" %>
<%@ attribute name="category" required="true" %>
<%@ attribute name="beginprice" required="true" %>
<%@ attribute name="stepprice" required="true" %>
<%@ attribute name="amount" required="true" %>
<%@ attribute name="tradeunit" required="true" %>
<%@ attribute name="alertprice" required="true" %>
<%@ attribute name="b_security" required="true" %>
<%@ attribute name="b_fee" required="true" %>
<%@ attribute name="s_security" required="true" %>
<%@ attribute name="s_fee" required="true" %>

<%@ attribute name="minamount" required="true" %>
<%@ attribute name="userid" required="true" %>
<%@ attribute name="trademode" required="true" %>

<%//��Ʒ��չ����Ϣ%>
<%@ attribute name="commid" required="true" %>
<%@ attribute name="str1" required="false" %>
<%@ attribute name="str2" required="false" %>
<%@ attribute name="str3" required="false" %>
<%@ attribute name="str4" required="false" %>
<%@ attribute name="str5" required="false" %>
<%@ attribute name="str6" required="false" %>
<%@ attribute name="str7" required="false" %>
<%@ attribute name="str8" required="false" %>
<%@ attribute name="str9" required="false" %>
<%@ attribute name="str10" required="false" %>
<%@ attribute name="str11" required="false" %>
<%@ attribute name="str12" required="false" %>
<%@ attribute name="str13" required="false" %>
<%@ attribute name="str14" required="false" %>
<%@ attribute name="str15" required="false" %>
<%@ attribute name="str16" required="false" %>
<%@ attribute name="str17" required="false" %>
<%@ attribute name="str18" required="false" %>
<%@ attribute name="str19" required="false" %>
<%@ attribute name="num1" required="false" %>

<c_db:set var="modParam" value="code='${code}',firsttime=to_date('${firsttime}','yyyy-mm-dd'),createtime=to_date('${createtime}','yyyy-mm-dd'),status=${status},splitid='${splitid}',category=${category},beginprice=${beginprice},stepprice=${stepprice},amount=${amount},tradeunit=${tradeunit},alertprice=${alertprice},b_security=${b_security},b_fee=${b_fee},s_security=${s_security},s_fee=${s_fee},minamount=${minamount},userid='${userid}',trademode=${trademode}"/>

<c_db:set var="modParam2" value=""/>
<sql_db:transaction dataSource="${tags_db_dataSource}">
  <sql_db:update>
    update v_commodity set ${modParam} where id=${id}
  </sql_db:update>
  <c_db:choose>
      <c_db:when test="${not empty modParam2}">
         <c_db:if test="${not empty str1}"><c_db:set var="modParam2" value="${modParam2},str1='${str1}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
         <c_db:if test="${not empty str1}"><c_db:set var="modParam2" value="${modParam2}str1='${str1}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
         <c_db:if test="${not empty str2}"><c_db:set var="modParam2" value="${modParam2},str2='${str2}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
         <c_db:if test="${not empty str2}"><c_db:set var="modParam2" value="${modParam2}str2='${str2}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str3}"><c_db:set var="modParam2" value="${modParam2},str3='${str3}'"/></c_db:if>
    </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str3}"><c_db:set var="modParam2" value="${modParam2}str3='${str3}'"/></c_db:if>
    </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str4}"><c_db:set var="modParam2" value="${modParam2},str4='${str4}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str4}"><c_db:set var="modParam2" value="${modParam2}str4='${str4}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str5}"><c_db:set var="modParam2" value="${modParam2},str5='${str5}'"/></c_db:if>
    </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str5}"><c_db:set var="modParam2" value="${modParam2}str5='${str5}'"/></c_db:if>
    </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str6}"><c_db:set var="modParam2" value="${modParam2},str6='${str6}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str6}"><c_db:set var="modParam2" value="${modParam2}str6='${str6}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>

    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str7}"><c_db:set var="modParam2" value="${modParam2},str7='${str7}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str7}"><c_db:set var="modParam2" value="${modParam2}str7='${str7}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>

    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str8}"><c_db:set var="modParam2" value="${modParam2},str8='${str8}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str8}"><c_db:set var="modParam2" value="${modParam2}str8='${str8}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str9}"><c_db:set var="modParam2" value="${modParam2},str9='${str9}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str9}"><c_db:set var="modParam2" value="${modParam2}str9='${str9}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str10}"><c_db:set var="modParam2" value="${modParam2},str10='${str10}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str10}"><c_db:set var="modParam2" value="${modParam2}str10='${str10}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>  
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty str11}"><c_db:set var="modParam2" value="${modParam2},str11='${str11}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str11}"><c_db:set var="modParam2" value="${modParam2}str11='${str11}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>   
     
    <c_db:choose>
      <c_db:when test="${not empty modParam2}"> 
        <c_db:if test="${not empty str12}"><c_db:set var="modParam2" value="${modParam2},str12='${str12}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str12}"><c_db:set var="modParam2" value="${modParam2}str12='${str12}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>  
       
    <c_db:choose>
      <c_db:when test="${not empty modParam2}"> 
        <c_db:if test="${not empty str13}"><c_db:set var="modParam2" value="${modParam2},str13='${str13}'"/></c_db:if>
      </c_db:when>
        <c_db:otherwise>
        <c_db:if test="${not empty str13}"><c_db:set var="modParam2" value="${modParam2}str13='${str13}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}"> 
        <c_db:if test="${not empty str14}"><c_db:set var="modParam2" value="${modParam2},str14='${str14}'"/></c_db:if>
      </c_db:when>
        <c_db:otherwise>
          <c_db:if test="${not empty str14}"><c_db:set var="modParam2" value="${modParam2}str14='${str14}'"/></c_db:if>
        </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">  
        <c_db:if test="${not empty str15}"><c_db:set var="modParam2" value="${modParam2},str15='${str15}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str15}"><c_db:set var="modParam2" value="${modParam2}str15='${str15}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>  
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">  
        <c_db:if test="${not empty str16}"><c_db:set var="modParam2" value="${modParam2},str16='${str16}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str16}"><c_db:set var="modParam2" value="${modParam2}str16='${str16}'"/></c_db:if> 
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">  
        <c_db:if test="${not empty str17}"><c_db:set var="modParam2" value="${modParam2},str17='${str17}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str17}"><c_db:set var="modParam2" value="${modParam2}str17='${str17}'"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>  
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">  
        <c_db:if test="${not empty str18}"><c_db:set var="modParam2" value="${modParam2},str18='${str18}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str18}"><c_db:set var="modParam2" value="${modParam2}str18='${str18}'"/></c_db:if> 
      </c_db:otherwise>
    </c_db:choose>

    <c_db:choose>
      <c_db:when test="${not empty modParam2}">  
        <c_db:if test="${not empty str19}"><c_db:set var="modParam2" value="${modParam2},str19='${str19}'"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty str19}"><c_db:set var="modParam2" value="${modParam2}str19='${str19}'"/></c_db:if> 
      </c_db:otherwise>
    </c_db:choose>
    
    <c_db:choose>
      <c_db:when test="${not empty modParam2}">
        <c_db:if test="${not empty num1}"><c_db:set var="modParam2" value="${modParam2},num1=${num1}"/></c_db:if>
      </c_db:when>
      <c_db:otherwise>
        <c_db:if test="${not empty num1}"><c_db:set var="modParam2" value="${modParam2}num1=${num1}"/></c_db:if>
      </c_db:otherwise>
    </c_db:choose>  
    
  <c_db:if test="${not empty modParam2}">
  <sql_db:update>
     update v_commext set ${modParam2} where commid=${commid}
  </sql_db:update>
  </c_db:if> 
</sql_db:transaction>