<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="gnnt.MEBS.common.model.*,java.util.Date,java.text.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="../globalDef.jsp"%>
<%@ include file="../session.jsp"%>

<%
BankFeeAndOffsetDao dao = new BankFeeAndOffsetDaoImpl();
User user = (User)session.getAttribute("CURRENUSER");

boolean flag = false;

String save = request.getParameter("save");
System.out.println("save--"+save);
if(save!=null)
{
	if(save.equals("1"))
	{
		String bankCode = request.getParameter("bankCode");
		String Amount = request.getParameter("Amount");
		String B_Date = request.getParameter("B_Date");
		String oper = user.getUserId();
		String Remark = request.getParameter("Remark");
		
		StringBuilder sql = new StringBuilder("insert into F_TransferRights(ID,BankCode,Amount,OperatorID,Remark)");
		sql.append(" values( ").append("SEQ_F_TRANSFERRIGHTS.nextval").append(",'").append(bankCode).append("',")
				.append(Amount).append(",'").append(oper).append("',").append("'")
				.append(Remark).append("' )");
		System.out.println(sql.toString());
		flag = dao.insertTransferRights(sql.toString(),bankCode,B_Date,Double.parseDouble(Amount));
	}
	response.sendRedirect("reportMarketFeeOnBank.jsp?flag="+flag);
}

if(request.getParameter("flag")!=null&&request.getParameter("flag").equals("false"))
{
	%>
	<script type="text/javascript">
	//<!--
	window.alert("添加成功！");
	//-->
	</script>
	<%	
}else if(request.getParameter("flag")!=null&&request.getParameter("flag").equals("true"))
{
	%>
	<script type="text/javascript">
	//<!--
	window.alert("添加失败！请检查划转金额是否正确，划转金额不可以超过当日收益！");
	//-->
	</script>
	<%	
}

int pageSize = BANKPAGESIZE;
int size = Tool.strToInt(request.getParameter("pageSize"));
if(size>0){
	pageSize = size;
}
int pageIndex= Tool.strToInt(request.getParameter("pageIndex"));
if(pageIndex < 0)  pageIndex = 1;
String filter = " ";

String bankID = Tool.delNull(request.getParameter("bankID"));
if(!bankID.trim().equals("")&&!bankID.trim().equals("-1"))
{
	filter += " and bankID='"+ bankID +"'";
}

//String s_time = Tool.delNull(request.getParameter("s_time"));
//if(!s_time.trim().equals(""))
//{
//	filter += " and trunc(B_Date) = to_date('"+s_time+"','yyyy-mm-dd')";
//}

filter += " order by BankCode desc";

Set<List<Object>> set = dao.MarketFeeOnBankQuery(null,filter);

int maxpage = set.size()%pageSize==0 ? set.size()/pageSize : set.size()/pageSize+1;
if(pageIndex>maxpage){
	pageIndex=maxpage;
}
//ObjSet obj = ObjSet.getInstance(moneyList, pageSize, pageIndex);

%>

<html xmlns:MEBS>
  <head>
	<META http-equiv="Content-Type" content="text/html; charset=GBK">
    <IMPORT namespace="MEBS" implementation="<%=request.getContextPath()%>/bankInterface/lib/calendar.htc">
	<script language="javascript" src="../lib/tools.js"></script>
    <title>分银行市场收益明细</title>
  </head>
  
  <body>
  	<form id="frm" action="" method="post">
		<fieldset width="95%">
			<legend>分银行市场收益明细</legend>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="35">
				<tr height="35">
					<td align="right">银行代码&nbsp;</td>
					<td align="left">
						<select name="bankID" class="normal" style="width: 100px">
							<OPTION value="-1">全部</OPTION>
							<%
							for(int i=0;i<vecBankList.size();i++){
								BankValue bankv = vecBankList.get(i);
								%><option value="<%=bankv.bankID%>" <%=bankv.bankID.equals(bankID)?"selected":""%>><%=bankv.bankID%>|<%=bankv.bankName%></option><%
							}
							%>
						</select>
					</td>
					<!-- 
					<td align="right">结算日期&nbsp;</td>
					<td align="left">
						<MEBS:calendar eltName="s_time" eltStyle="width:80px" eltImgPath="<%//request.getContextPath()%>/bankInterface/skin/default/images/" eltValue="<%//s_time%>"/>
					</td>
					 -->
					<td colspan="2" align="center">
						<button type="button" class="smlbtn" onclick="doQuery();">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="smlbtn" onclick="_reset();">重置</button>&nbsp;
					</td>
				</tr>
			</table>
		</fieldset>
			<br>
	  <table id="tableList" border="0" cellspacing="0" cellpadding="0" width="100%" height="400">
  		<tHead>
  			<tr height="25" align=center>
  				<td class="panel_tHead_LB">&nbsp;</td>
				<td class="panel_tHead_MB" align="center">银行代码</td>
				<td class="panel_tHead_MB" align="center">银行名称</td>
				<td class="panel_tHead_MB" align="center">上日收益</td>
				<td class="panel_tHead_MB" align="center">新增收益</td>
				<td class="panel_tHead_MB" align="center">划转收益</td>
				<td class="panel_tHead_MB" align="center">当日收益</td>
				<td class="panel_tHead_MB" align="center">收益划转</td>
				<td class="panel_tHead_MB" align="center">查看划转记录</td>
				<td class="panel_tHead_RB">&nbsp;</td>
			</tr>
		</tHead>
		<tBody>

	  		<%
	  		int cou = 0;
			for( List<Object> li : set )
			{
				cou++;
				if(cou>((pageIndex-1)*pageSize)&&cou<(pageIndex*pageSize+1))
				{
				%>
				<tr height="22" align=center >
					<td class="panel_tBody_LB">&nbsp;</td>
				<%
				List<Object> list = (List<Object>)li;
				for(int i=1;i<list.size();i++)
				{
					if(i==0)
					{
						%>
						<td class="underLine" align="center"><fmt:parseDate value="<%=list.get(i).toString() %>" var="date" pattern="yyyy-MM-dd"/><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />&nbsp;</td>
						<%
					}else if(i==3||i==4||i==5||i==6)
					{
						%>
						<td class="underLine" align="center"><fmt:formatNumber value="<%=list.get(i) %>" pattern="#,##0.00"/>&nbsp;</td>
						<%
					}
					else
					{
						%>
							<td class="underLine" align="center"><%=list.get(i)%>&nbsp;</td>
						<%
					}
				}
				%>
					<td class="underLine" align="center"><a href="javascript:change('<%=list.get(1) %>','<%=list.get(2) %>','<%=list.get(0) %>');">划转</a></td>
					<td class="underLine" align="center"><a href="javascript:_goto('operate/MarketFeeOnBankLU.jsp?bankID=<%=list.get(1) %>&bankIDH=<%=list.get(1) %>')">查看</a></td>
					<td class="panel_tBody_RB">&nbsp;</td>
	  			</tr>	
				<%
				}
			}
			%>
	  	</tBody>
	  	<tFoot>
			<tr height="100%">
				<td class="panel_tBody_LB">&nbsp;</td>
				<td colspan="9">&nbsp;</td>
				<td class="panel_tBody_RB">&nbsp;</td>
			</tr>
			<tr height="22">
				<td class="panel_tBody_LB">&nbsp;</td>
				<td class="pager" colspan="9" align=right>
				第<%=pageIndex%>/<%=maxpage%>页 &nbsp;&nbsp;共<%=set.size()%>条 &nbsp;&nbsp;每页
				<input name="pageSize" class="text" type="text" style="width:25px;" value="<%=pageSize%>" onkeydown="return pgJumpChk()">条 &nbsp;&nbsp;
				<%
				if(pageIndex != 1)
				{
					%>
					<span style="cursor:hand" onclick="pgTurn(0)">首页</span> &nbsp;&nbsp;<span style="cursor:hand" onclick="pgTurn(-1)">上页</span> &nbsp;&nbsp;	
					<%
				}
				else
				{
					%>
					首页 &nbsp;&nbsp;上页 &nbsp;&nbsp;	
					<%
				}

				if(pageIndex != maxpage)
				{
					%>
					<span style="cursor:hand" onclick="pgTurn(1)">下页</span> &nbsp;&nbsp;<span style="cursor:hand" onclick="pgTurn(2)">尾页</span> &nbsp;&nbsp;	
					<%
				}
				else
				{
					%>
					下页 &nbsp;&nbsp;尾页 &nbsp;&nbsp;	
					<%
				}

				%>
				到<input class="text" type="text" style="width:25px;" name="pageJumpIdx" onkeydown="return pgJumpChk()">页

				<input name=pageIndex type=hidden value="<%=pageIndex%>">
				</td>
				<td class="panel_tBody_RB">&nbsp;</td>
			</tr>
			<tr height="22">
				<td class="panel_tFoot_LB">&nbsp;</td>
				<td class="panel_tFoot_MB" colspan="9"></td>
				<td class="panel_tFoot_RB">&nbsp;</td>
			</tr>
		</tFoot>
	</table>
	</from>
  </body>
</html>

<SCRIPT LANGUAGE="JavaScript">
<!--
function pgTurn(i)
{
	if(i == 0)
	{
		frm.pageIndex.value = 1;
		frm.submit();
	}
	else if(i == 1)
	{		
		frm.pageIndex.value = frm.pageIndex.value * 1 + 1;	
		frm.submit();
	}
	else if(i == 2)
	{
		frm.pageIndex.value = <%=maxpage%>;
		frm.submit();
	}
	else if(i == -1)
	{
		frm.pageIndex.value = frm.pageIndex.value - 1;
		frm.submit();
	}
}

function doQuery()
{
	frm.pageIndex.value = 1;
	frm.action = "reportMarketFeeOnBank.jsp";
	frm.submit();
}

function _reset()
{
	_goto("reportMarketFeeOnBank.jsp?"+Math.random()+"&");
}

function pgJumpChk()
{
	if(event.keyCode == 13)
	{
		if((isNaN(frm.pageJumpIdx.value) || frm.pageJumpIdx.value < 1 || frm.pageJumpIdx.value > <%=maxpage%>) && (isNaN(frm.pageSize.value) || frm.pageSize.value < 1 ))
		{
			alert("请输入1 - <%=maxpage%>间的数字！");
		}
		else
		{
			frm.pageIndex.value = frm.pageJumpIdx.value;
			frm.submit();
		}
	}	
}

function change(id,value,B_Date) {
	var url = "operate/MarketFeeOnBankOper.jsp?bankCode="+id+"&bankName="+value+"&B_Date="+B_Date;
	ecsideDialog(url);
}

function ecsideDialog(url, args, width, height){
	if (!width) width = 600;
	if (!height) height = 400;
	if(checkie()){
		height=height+50;
	}
	if (!args) args='';
	url += '&d='+new Date();
	var result=window.showModalDialog(url, args, "dialogWidth=" + width + "px; dialogHeight=" + height + "px; status=yes;scroll=yes;help=no;");
	if(result!=null||result!=undefined)
	{
		frm.action = "reportMarketFeeOnBank.jsp?save=1&"+result; 
		frm.submit();
	}
}

function checkie()
{
	 if(navigator.userAgent.indexOf("MSIE")>0){ //是否是IE浏览器 
	    if(navigator.userAgent.indexOf("MSIE 6.0")>0){ //6.0 使用1.CSS 
	      return true;
	    } 
	 }
}

function _goto(pathRrl,title)
{
  	parent.parent.workspace.mainFrame.location.href=pathRrl;
	//parent.workspace.topFrame1.document.getElementById("loc").innerHTML=title;
}
//-->
</SCRIPT>