<%@ page contentType="text/html;charset=GBK" %>
<html xmlns:MEBS>
<%java.sql.Date sqlDate=new java.sql.Date(System.currentTimeMillis());%>
<%@ include file="../../globalDef.jsp"%> 
<%
String orderField = request.getParameter("orderField");
String orderType= request.getParameter("orderDesc");
if (orderField == null || orderField.equals("")) {
	orderField = "id";
}
if (orderType == null || orderType.equals("")) {
	orderType = "false";
}
String order = "";
if (orderType.equals("false")) {
	order = "asc";
}
if (orderType.equals("true")){
	order = "desc";
}
String a = orderField+" "+order;
request.setAttribute("a", a);
%>
<%
try
{

%>
<!--操作-->
<c:if test='${not empty param.opt}'>
 <c:set var="ids" value=""/>
 <!--返回不能删除用户信息-->
 <c:set var="returnInfo" value=""/>
 <!--是否有不能删除的用户,标志控制-->
 <c:set var="delFlag" value="true"/>
  <c:if test="${param.opt=='删除'}">
  </c:if>
</c:if>

<!--变量定义-->
<c:set var="sqlFilter" value=""/>
<!--分页参数定义-->
<c:choose> 
 <c:when test="${empty param.pageIndex}"> 
   <c:set var="pageIndex" value="1"/> 
 </c:when> 
 <c:otherwise> 
   <c:set var="pageIndex" value="${param.pageIndex}"/> 
 </c:otherwise> 
</c:choose>
<c:choose>
  <c:when test="${empty param.pageSize}">
  	 <c:set var="pageSize" value="${PAGESIZE}"/>
  </c:when>
  <c:otherwise>
  	 <c:set var="pageSize" value="${param.pageSize}"/>
  </c:otherwise>
</c:choose>
  <head>
	<title>历史报单查询</title>
</head>
<body onload="init();">
<form name=frm action="" method="post">
		<input type="hidden" id="orderField" name="orderField" value="<%=orderField %>">
		<input type="hidden" id="orderDesc" name="orderDesc" value="<%=orderType %>">
	<!--默认选中板块-->
	<c:set var="defaultSec" value=""/>
	<c:set var="allPartition" value=""/>
<%
  DBBean bean=null;
  ResultSet rs=null;
  StringBuffer sql=null;
  String tempPartiId=null;
  String t_partitionID=delNull(request.getParameter("partitionID"));
  try{
	  bean=new DBBean(JNDI);
	  String tempfilter=null;
	  String allpartition="";
	  //String userpar=session.getAttribute("USERPAR").toString();
	  sql=new StringBuffer();
	  sql.append("select partitionid from v_syspartition where validflag=1 order by partitionid asc");
	  rs=bean.executeQuery(sql.toString());
	  while(rs.next()){
	      allpartition+=rs.getString("partitionid")+",";
	  }
%>
<c:set var="allPartition" value="<%=allpartition%>"/>
<%
	      tempfilter=" and validflag=1 and rownum=1";
	  if("".equals(t_partitionID)){
	      sql=new StringBuffer();
	      sql.append("select partitionid from v_syspartition  where 1=1 "+tempfilter+" order by partitionid asc");
          rs=bean.executeQuery(sql.toString());
	      if(rs.next()){
	          tempPartiId=rs.getString("partitionid");
%>
	      <c:set var="defaultSec" value="<%=tempPartiId%>"/>
<%
	      }
	  }	  
%>
	  
<%
  }catch(Exception e){
       e.printStackTrace();
  }finally{
       if(rs!=null)rs.close();
	   if(bean!=null)bean.close();
  }

  if("".equals(t_partitionID)){
%>
  <jsp:include page="../../public/menu.jsp">
	  <jsp:param name="partitionID" value="${defaultSec}"/>
	  <jsp:param name="idx" value="${defaultSec}"/>
	  <jsp:param name="allPartition" value="${allPartition}"/>
  </jsp:include>
<%
  }else{
%>
  <jsp:include page="../../public/menu.jsp">
      <jsp:param name="allPartition" value="${allPartition}"/>
  </jsp:include>
<%
  }	
%>
<!--查询条件-->
<!--标的号-->
<c:choose> 
 <c:when test="${empty param.code}"> 
   <c:set var="code" value=""/> 
 </c:when> 
 <c:otherwise> 
   <c:set var="code" value="${param.code}"/> 
   <c:set var="sqlFilter" value="${sqlFilter} and code like '${code}' "/>
 </c:otherwise> 
</c:choose>
<!--板块查询条件-->
<c:choose> 
 <c:when test="${empty param.partitionID}"> 
   <c:set var="partitionID" value="${defaultSec}"/> 
   	<c:set var="sqlFilter" value="${sqlFilter} and tradepartition = '${partitionID}' "/>
 </c:when> 
 <c:otherwise> 
   <c:set var="partitionID" value="${param.partitionID}"/>
   <c:choose>
   <c:when test="${partitionID!=allPartition and partitionID!=0}">
     <c:set var="sqlFilter" value="${sqlFilter} and tradepartition = '${partitionID}' "/>
   </c:when>
   <c:otherwise>
     <c:set var="sqlFilter" value="${sqlFilter} and tradepartition in (select partitionid from v_syspartition where validflag=1) "/>
   </c:otherwise>
   </c:choose>
 </c:otherwise> 
</c:choose>
<!--委托号-->
<c:choose> 
 <c:when test="${empty param.id}"> 
   <c:set var="id" value=""/> 
 </c:when> 
 <c:otherwise> 
   <c:set var="id" value="${param.id}"/> 
   <c:set var="sqlFilter" value="${sqlFilter} and id like '${id}' "/>
 </c:otherwise> 
</c:choose>
<!--交易用户ID-->
<c:choose> 
 <c:when test="${empty param.userID}"> 
   <c:set var="userID" value=""/> 
 </c:when> 
 <c:otherwise> 
   <c:set var="userID" value="${param.userID}"/> 
   <c:set var="sqlFilter" value="${sqlFilter} and userid like '${userID}' "/>
 </c:otherwise> 
</c:choose>
<!--状态-->
<c:choose> 
 <c:when test="${empty param.tradeFlag}"> 
   <c:set var="tradeFlag" value=""/> 
 </c:when> 
 <c:otherwise> 
   <c:set var="tradeFlag" value="${param.tradeFlag}"/> 
   <c:set var="sqlFilter" value="${sqlFilter} and tradeflag = ${tradeFlag} "/>
 </c:otherwise> 
</c:choose>
<!--交易时间范围-->
<c:choose> 
 <c:when test="${empty param.startTradeDate}">
    <c:choose>
	  <c:when test="${not empty param.funcflg}">
        <c:set var="startTradeDate" value="<%=sqlDate.toString()%>"/>
		<c:set var="sqlFilter" value="${sqlFilter} and tradedate >= to_date('${startTradeDate} 00:00:00','yyyy-mm-dd hh24:mi:ss') "/>
	  </c:when>
	  <c:otherwise> 
        <c:set var="startTradeDate" value=""/> 
	  </c:otherwise> 
    </c:choose>
 </c:when> 
 <c:otherwise> 
   <c:set var="startTradeDate" value="${param.startTradeDate}"/> 
   <c:set var="sqlFilter" value="${sqlFilter} and tradedate >= to_date('${startTradeDate} 00:00:00','yyyy-mm-dd hh24:mi:ss') "/>
 </c:otherwise> 
</c:choose>
<c:choose> 
 <c:when test="${empty param.endTradeDate}">
   <c:choose>
	  <c:when test="${not empty param.funcflg}">
        <c:set var="endTradeDate" value="<%=sqlDate.toString()%>"/>
		<c:set var="sqlFilter" value="${sqlFilter} and tradedate <= to_date('${endTradeDate}  23:59:59','yyyy-mm-dd hh24:mi:ss') "/>
	  </c:when>
	  <c:otherwise>
         <c:set var="endTradeDate" value=""/>
      </c:otherwise> 
   </c:choose>
 </c:when> 
 <c:otherwise>
 <c:set var="endTradeDate" value="${param.endTradeDate}"/> 
   <c:set var="sqlFilter" value="${sqlFilter} and tradedate <= to_date('${endTradeDate}  23:59:59','yyyy-mm-dd hh24:mi:ss') "/>
 </c:otherwise> 
</c:choose>
	  <br>
		<fieldset width="100%">
		<legend>历史报单查询</legend>
		<span>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			  <tr height="35">
            	<td align="right"> 委托号：</td>
                <td align="left">
                	<input name="id" type="text" class="text" style="width: 100px;" value="${param.id}"onkeypress="notSpace()">
                </td>
            	<td align="right"> 标的号：</td>
                <td align="left">
                	<input name="code" type="text" class="text" style="width: 100px;" value="${param.code}"onkeypress="notSpace()">
                </td>
                <td align="right">交易时间：</td>
                <td align="left">
				<!--如果查询时交易时间为空,则默认为当天的时间-->
				<c:set var="startTradeDateAgr" value=""/>
				<c:set var="endTradeDateAgr" value=""/>
				<c:choose>
					<c:when test="${not empty param.funcflg}">
					<c:set var="startTradeDateAgr" value="<%=sqlDate.toString()%>"/>
					<c:set var="endTradeDateAgr" value="<%=sqlDate.toString()%>"/>
					</c:when>
					<c:otherwise>
					<c:set var="startTradeDateAgr" value="${param.startTradeDate}"/>
					<c:set var="endTradeDateAgr" value="${param.endTradeDate}"/>
					</c:otherwise>
				</c:choose>
				<MEBS:calendar eltID="startTradeDate" eltName="startTradeDate" eltCSS="date" eltStyle="width:80px" eltImgPath="<%=skinPath%>/images/" eltValue="${startTradeDateAgr}"/>
                &nbsp;至&nbsp;<MEBS:calendar eltID="endTradeDate" eltName="endTradeDate" eltCSS="date" eltStyle="width:80px" eltImgPath="<%=skinPath%>/images/" eltValue="${endTradeDateAgr}"/>
                </td>
              </tr>
              <tr height="35">
			    <td align="right"> 交易用户代码：</td>
                <td align="left">
                	<input name="userID" type="text" class="text" style="width: 100px;" value="${param.userID}"onkeypress="onlyNumberAndCharInput()" maxlength="16">
                </td>
              	<td align="right">状态：</td>
              	<td align="left">
              	<select name="tradeFlag">
                		 <option value="" <c:if test="${empty param.tradeFlag}"><c:out value="selected"/></c:if>>全部</option>
                		 <option value="1" <c:if test="${param.tradeFlag==1}"><c:out value="selected"/></c:if>>成交</option>
                		 	<option value="0" <c:if test="${param.tradeFlag=='0'}"><c:out value="selected"/></c:if>>未成交</option>
                 </select>
                </td>
                <td></td>
                <td align="left" colspan="2">
                <input type="button" onclick="queryBtn('hisSubmitList.jsp');" class="btn" value="查询">
                <!-- add by lizhenli 2011-12-08 增加重置功能 -->
            	<input type="button" onclick="resetForm();" class="btn" value="重置">&nbsp;
            	<script>
            		function resetForm(){
            			frm.id.value="";
            			frm.code.value="";
            			frm.userID.value="";
            			frm.tradeFlag.value="";
            		}
            		</script>
                </td>	
              </tr>
        	</table>
        </span>  
		</fieldset>
		<br>
		<table id="tb" border="0" cellspacing="0" cellpadding="0" width="100%" height="300">
	  		<tHead>
	  			<tr height="25"  align=center>
	  			<td class="panel_tHead_LB">&nbsp;</td>
	  			<td class="panel_tHead_MB">&nbsp;</td>
			    <td class="panel_tHead_MB" abbr="id">委托号 </td>
			    <td class="panel_tHead_MB" abbr="code">标的号</td>
			    <td class="panel_tHead_MB" abbr="userid">交易用户代码</td>
			    <td class="panel_tHead_MB" abbr="price">价格</td>
				<td class="panel_tHead_MB" abbr="amount">交易单位数量</td>
			    <td class="panel_tHead_MB" abbr="tradeflag">状态</td>
				<td class="panel_tHead_MB" abbr="tradedate">交易时间</td>
			    <td class="panel_tHead_MB" abbr="submittime">委托时间</td>
				<td class="panel_tHead_MB" abbr="validamount">有效成交数量</td>
			    <td class="panel_tHead_MB" abbr="modifytime">修改时间</td>
					<td class="panel_tHead_RB">&nbsp;</td>
				</tr>
			</tHead>
			<tBody>
			    <db:selectPG var="row" table="v_hissubmit" columns="<%=COLS_HISSUBMIT%>" orderBy="${a}" pageIndex="${pageIndex}" pageSize="${pageSize}" where="1=1${sqlFilter}">
				  <tr onclick="selectTr();" align=center height="25">
		  			<td class="panel_tBody_LB">&nbsp;</td>
		  			<td class="underLine">
		  			<c:if test="${row.tradeflag==1}">	
		  				<font color="#00ff00">●</font>
		  			</c:if>
		  			<c:if test="${row.tradeflag==0}">	
		  				<font color="#FFBB0D">●</font>
		  			</c:if>
					<c:if test="${row.tradeflag==2}">	
		  				<font color="#ABCDEF">●</font>
		  			</c:if>
					<c:if test="${row.tradeflag==3}">	
		  				<font color="#999999">●</font>
		  			</c:if>
		  			</td>
		  			<td class="underLine">${row.id}</td>	  			
		  			<td class="underLine">${row.code}</td>
					  <td class="underLine">${row.userid}</td>
					  <td class="underLine">${row.price}</td>
					  <td class="underLine">${row.amount}</td>
					  <td class="underLine">
					  	<c:if test="${row.tradeflag==0}">未成交</c:if>
					  	<c:if test="${row.tradeflag==1}">成交</c:if>
						<c:if test="${row.tradeflag==2}">招标待定</c:if>
						<c:if test="${row.tradeflag==3}">无效委托</c:if>
					  </td>
					  <td class="underLine"><fmt:formatDate value="${row.tradedate}" pattern="<%=DATEPATTERN%>"/></td>
					  <td class="underLine"><fmt:formatDate value="${row.submittime}" pattern="<%=DATEPATTERN%>"/></td>
					  <td class="underLine">${row.validamount}</td>
					  <td class="underLine"><fmt:formatDate value="${row.modifytime}" pattern="<%=DATEPATTERN%>"/></td>
		  			<td class="panel_tBody_RB">&nbsp;</td>
		  		</tr>
				</db:selectPG>
		  	</tBody>
			<!--计算总页数-->
			<db:select var="c" table="v_hissubmit" columns="count(*) as n" where="1=1${sqlFilter}">
			 <c:set var="totalCnt" value="${c.n}"/>
			</db:select>
			<c:choose> 
			 <c:when test="${totalCnt%pageSize==0}"> 
			   <c:set var="pageCnt" value="${totalCnt/pageSize}"/> 
			 </c:when> 
			 <c:otherwise>
			   <c:choose> 
				 <c:when test="${(totalCnt%pageSize)*10>=5*pageSize}"> 
				   <c:set var="pageCnt" value="${totalCnt/pageSize}"/> 
				 </c:when> 
				 <c:otherwise>
				   <c:set var="pageCnt" value="${totalCnt/pageSize+1}"/>
				 </c:otherwise> 
				</c:choose>
			 </c:otherwise> 
			</c:choose>
			<jsp:include page="../../public/pageTurn1.jsp">
				<jsp:param name="colspan" value="11"/>
				<jsp:param name="pageIndex" value="${pageIndex}"/>
				<jsp:param name="totalCnt" value="${totalCnt}"/>
				<jsp:param name="pageCnt" value="${pageCnt}"/>
				<jsp:param name="pageSize" value="${pageSize}"/>
			</jsp:include>			
		</table>
     <table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr height="35">
          	<td width="40%">
		        <input type="hidden" name="opt">
		        <input type="hidden" name="lpFlag"> 
            </td>
          </tr>
     </table>
</form>
</body>
</html>
<%@ include file="../../public/pageTurn2.jsp"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
function winOpen(url)
{
	window.showModalDialog(url,"", "dialogWidth=420px; dialogHeight=280px; status=yes;scroll=yes;help=no;"); 
}
function winOpen1(url)
{
	window.showModalDialog(url,"", "dialogWidth=420px; dialogHeight=400px; status=yes;scroll=yes;help=no;"); 
}
//-->
//修改会员用户信息
function editUserInfo(id,bargainflag){
	if(parseInt(bargainflag)==1){
	  alert("商品已成交,不能修改!");
	}else{
		var a=window.open("curCommodityMod.jsp?flag=query&code="+id,"_blank","width=400,height=300,scrollbars=yes;");
    //opener.location.href=opener.location.href;
    //var a=openDialog("curCommodityMod.jsp?flag=query&id="+id,"_blank","500","600");
    //window.location="managerList.jsp";
  }
}

//跳转页面
         function pageTo(){
         	   if(event.keyCode==13){
         	   agr=document.frm.pageJumpIdx.value;
             document.frm.pageIndex.value=agr;
             alert(document.frm.pageIndex.value);
             document.frm.submit();	
            }
        }
 
//添加商品

function addRec(frm_delete,tableList,checkName)
{
	if(isSelNothing(tableList,checkName) == -1)
	{
		alert ( "没有可以操作的数据！" );
		return false;
	}
	if(isSelNothing(tableList,checkName))
	{
		alert ( "请选择需要操作的数据！" );
		return false;
	}
	if(confirm("是否以流拍加入到当前交易商品列表？"))
	{ 
		if(confirm("确实要操作这些数据?")){
		  frm.opt.value="添加到当前交易商品";
		  frm.lpFlag.value="1";
	    frm.submit();
	  }else{
	    return false;	
	  }
	}
	else
	{ if(confirm("确实要操作这些数据?")){
		  frm.opt.value="添加到当前交易商品";
		  frm.lpFlag.value="0";
		  frm.submit();
	  }
	  else{
	    return false;	
	  }
	}
}

//点击菜单中的板块栏做查询时
function clickMenu(v){
	frm.partitionID.value=v;
	frm.idx.value=v;
	frm.action="hisSubmitList.jsp";
  frm.submit();	
}

//导出数据(添加查询条件)
 function expData(){
   var allPartition='${ALLPARTITION}';
   var id=encodeURI(frm.id.value);
   var code=encodeURI(frm.code.value);
   var userID=encodeURI(frm.userID.value);
   var tradeFlag=frm.tradeFlag.value;
   var startTradeDate=frm.startTradeDate.value;
   var endTradeDate=frm.endTradeDate.value;
   var partitionID="";
   if(parseInt(frm.partitionID.value)!=parseInt(allPartition)){
       partitionID=frm.partitionID.value;
   }else{
       partitionID="";
   }
   var url="expXls.jsp?type=17&id="+id+"&code="+code+"&userID="+userID+"&tradeFlag="+tradeFlag+"&partitionID="+partitionID+"&startTradeDate="+startTradeDate+"&endTradeDate="+endTradeDate+"";
   parent.window.location=url;
 }

 //导出Excel
function excel(){
  	     // frm.add.value="export";
  	      //frm.submit();
  	      var tableList=document.getElementById("tb");
	       //alert(tableList.rows[1].cells.length);
  	      if(tableList)
  	      {
  	        exportToExcel(tableList,0);
  	      }
  }
</SCRIPT>
<%
}
catch(Exception e)
{
	System.out.println(e.toString());
}
%>