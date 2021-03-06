<%@ page pageEncoding="GBK" %>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<html>
  <head>
	<title>交易商订货监控</title>
	<link href="${mgrPath}/skinstyle/default/css/app/monitorSet.css" rel="stylesheet" type="text/css">
	<script src="${mgrPath}/app/timebargain/tradeMonitor/js/monitorAjax.js" type="text/javascript"></script>
    <script type="text/javascript">
	<!--
	   //设置数据源地址
		function winload() 
		{
			var orderby=document.getElementById("orderName").innerHTML+"  "+document.getElementById("orderType").innerHTML;
			htFilter.Clear();
			htFilter.Add("orderby",orderby);
			setRequestUrl("${basePath}/timebargain/tradeMonitor/monitorFirmMonitor.action");
			var firmID = document.getElementById("firmID2").innerHTML;
			if (firmID != "null" && firmID != "") {
				frm.parameter.value = firmID;
				query();
			}
		}
		
		function query()
		{
			//变量的值 变量代表交易商或者商品
			var parameter=frm.parameter.value;
			
			clearTimeout(timer);//先停止以前的请求
						
			if(parameter!="")
			{
				if(htFilter.ContainsKey("parameter"))//如果包含parameter查询条件则重新设置否则添加
					htFilter.SetValue("parameter",parameter);
				else 
					htFilter.Add("parameter",parameter);
			}	
			else
			{
				htFilter.Remove("parameter");
			}
					
			//发送请求
			sendRequest();	
		}
	// -->
	</script>
  </head>
  <body bgcolor="#000000" onLoad="winload()">
  <form name="frm" METHOD=POST ACTION="">
  <table width="100%" height="5%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="84%">
        	<div align="right">
        		<span class="pagetype"><label id="queryTypeText">交易商代码</label>：</span>
        		<input type="text" id="parameter"  maxlength="<fmt:message key='MFirm.firmId_q' bundle='${PropsFieldLength}' />" style="width:111" onkeypress="onlyNumberAndCharInput()"/>
        	</div>
		</td>
		<td width="6%"><div align="RIGHT"><input type="button" value="查询" onclick="query()"></div></td>
  </tr>
</table>
     <table width="100%"  height="5%" align="center" cellpadding="0" cellspacing="0"   style="border-collapse:collapse;" id=tbHead onclick=dtquery()>
	   <tr>
	    <td width="3%" class="hq_bt" align="center" ><div align="center"><span id=netStatus></span></div></td>
	    <td width="25%" class="hq_bt" align="center" abbr="CommodityID" style="cursor:hand">商品代码</td>
	    <td width="24%" class="hq_bt" align="center" abbr="BS_Flag" style="cursor:hand">买/卖</td>
	    <td width="24%" class="hq_bt" align="center" abbr="HoldQty" style="cursor:hand">总订货量↓</td>
	    <td width="24%" class="hq_bt" align="center" abbr="EvenPrice" style="cursor:hand">平均订货价</td>
	  </tr>
	  </table>
	 
	  <table width="100%"  height="81%" cellpadding="0" cellspacing="0"  bgcolor="#000000"  id=tbFrame>
	  		<tr valign="top">
	  			<td>
	  				<table width="100%"  valign="top" cellpadding="0" cellspacing="0" id=tb>  		
	  				</table>
	  			</td>
	  		</tr>
	  </table>
	  <table width="100%" height="3%" border="0" cellspacing="0" cellpadding="4" class="pagetype">
		  <tr>
		    <td align="right">
		         当前:<label id="pageIndex"></label>/<label id="totalPage"></label>页&nbsp;共<label id="totalCount"></label>条
				<label id="firstPage">第一页</label>
				<label id="prePage">上一页</label>
				<label id="nextPage">下一页</label>
				<label id="lastPage">最末页</label>
				</td>
		  </tr>
	 </table>
	<label id="orderType" style="display:none">DESC</label>
	<label id="orderName" style="display:none">HoldQty</label>
	<!-- 主键 根据主键控制当前选中行 主键使用列序号标识，如果是组合主键则使用";"分割-->
	<label id="PrimaryKey" style="display:none">1;</label>
	<label id="firmID2" style="display:none">${firmID }</label>
   	</form>
	</body>
</html>
