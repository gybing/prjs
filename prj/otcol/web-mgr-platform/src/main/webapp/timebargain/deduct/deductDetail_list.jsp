<%@ include file="/timebargain/common/taglibs.jsp"%>
<%@ page pageEncoding="GBK" %>
<html>
  <head>
    <%@ include file="/timebargain/common/ecside_head.jsp" %>
<script language="JavaScript" src="<c:url value="/timebargain/scripts/global.js"/>"></script>
<LINK REL="stylesheet" type="text/css" href="<c:url value="/timebargain/styles/common.css"/>" />
<SCRIPT language="javascript">
	function next(){
		
		parent.location.href = "<c:url value="/timebargain/deduct/deduct.do?funcflg=deductGo&date="/>" + '<%=(String)request.getAttribute("date")%>' + "&code=" + '<%=(String)request.getAttribute("code")%>' + "&id=" + '<%=(String)request.getAttribute("id")%>';
	}
	
	function goFrontTep(){
		parent.location.href = "<c:url value="/timebargain/deduct/deductKeepFirm.jsp?date="/>" + '<%=(String)request.getAttribute("date")%>' + "&code=" + '<%=(String)request.getAttribute("code")%>' + "&id=" + '<%=(String)request.getAttribute("id")%>';
		
	}
</SCRIPT>
  </head>
			
  <body>
   <table width="100%">
  <tr><td>
  		<ec:table items="deductDetailList" var="deduct" 
			action="${pageContext.request.contextPath}/timebargain/deduct/deduct.do?funcflg=nextDeductDetail"	
			autoIncludeParameters="${empty param.autoInc}"
			xlsFileName="commodity.xls" 
			csvFileName="commodity.csv"
			showPrint="true" 
			listWidth="100%"
			title=""	
			rowsDisplayed="20"
  		>
  		<ec:row>
  			<ec:column property="customerID" title="交易客户ID" width="100" style="text-align:center;"/> 
  			
  			<ec:column property="buyQty" title="买订货量" format="quantity" calcTitle= "合计" calc="total" width="100"  style="text-align:right;"/> 
  			<ec:column property="sellQty" title="卖订货量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/> 
  			<ec:column property="buyKeepQty" title="买保留量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			
  			<ec:column property="sellKeepQty" title="卖保留量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="relPureHoldQty" title="净订货量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="pL" title="盈亏合计" width="100" style="text-align:right;"/> 
  			<ec:column property="pL_ratio" title="盈亏率" width="100" style="text-align:right;"/> 
  			<ec:column property="counteractQty" title="对冲量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="orderQty" title="委托量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="deductableQty" title="可强减量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="estimateQty" title="估算强减量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="deductQty" title="应强减量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="deductedQty" title="已强减量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  			<ec:column property="counteractedQty" title="已对冲量" format="quantity" calcTitle= "合计" calc="total" width="100" style="text-align:right;"/>
  		</ec:row>
  		<ec:extend >
  			
  		</ec:extend>
  		</ec:table>
  </td></tr>
  <tr></tr><tr></tr><tr></tr><tr></tr>

  <tr>
  	<td align="left">
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:button property="next" styleClass="button" onclick="return next()">执行强减</html:button>
		<html:button property="next" styleClass="button" onclick="return goFrontTep()">返回上一步</html:button>
  	</td>
  </tr>
</table>

	<!-- 编辑和过滤所使用的 通用的文本框模板 -->
	<textarea id="ecs_t_input" rows="" cols="" style="display:none">
		<input type="text" class="inputtext" value="" onblur="ECSideUtil.updateEditCell(this)" 
		 style="width:100%;" name="Qty" />
	</textarea>
	<!-- 编辑状态所用模板 -->
	<textarea id="ecs_t_status" rows="" cols="" style="display:none" >
		<select onblur="ECSideUtil.updateEditCell(this)" style="width:100%;" name="bS_Flag" >
			<ec:options items="BS_FLAG" />
		</select>
	</textarea>		
	<textarea id="ecs_t_WL" rows="" cols="" style="display:none" >
		<select onblur="ECSideUtil.updateEditCell(this)" style="width:100%;" name="wL" >
			<ec:options items="WL" />
		</select>
	</textarea>	
<%@ include file="/timebargain/common/messages.jsp" %>
<script type="text/javascript">
<!--



// -->
</script>

  </body>
</html>
