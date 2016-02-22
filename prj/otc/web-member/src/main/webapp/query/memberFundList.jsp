
<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<%@page import="java.util.*"%>
<html xmlns:MEBS>
	<head>
		<title>�ۺϻ�Ա�ʽ��ѯ</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
		<IMPORT namespace="MEBS"
			implementation="${basePath}/common/jslib/calendar.htc">
	</head>
	<body>
		<div class="div_list">
			<table id="tb" border="0" cellspacing="0" cellpadding="0"
				width="100%">
				<tr>
					<td>
						<ec:table items="resultList"
							autoIncludeParameters="${empty param.autoInc}" var="memberFund"
							action="${basePath}/query/queryMemberFundSearch/list.action?sortName=primary.memberNo"
							title="" minHeight="450" listWidth="100%"
							retrieveRowsCallback="limit" sortRowsCallback="limit"
							filterRowsCallback="limit" csvFileName="�����б�.csv"
							style="table-layout:fixed">
							<ec:row ondblclick="">
								<ec:column width="3%" property="_0" title="���"
									value="${GLOBALROWCOUNT}" sortable="false" filterable="false" />
								<ec:column property="memberNo[like]" title="�ۺϻ�Ա���" width="5%"
									style="text-align:left; " value="${memberFund.memberNo}"
									ellipsis="true"  sortable="false" filterable="false"/>
								<ec:column property="memberName[like]" title="�ۺϻ�Ա����" width="6%"
									style="text-align:left; " value="${memberFund.memberName}"
									ellipsis="true"  sortable="false" filterable="false"/>
								<ec:column property="beginningCaptical[=][double]" title="�ڳ�Ȩ��"
									width="7%" style="text-align:right; "  sortable="false" filterable="false">
									<fmt:formatNumber value="${memberFund.beginningCaptical}"
										pattern="#,##0.00" />
								</ec:column>
								<ec:column property="runtimeFundio[=][double]" title="�����"
									width="6%" style="text-align:right; "  sortable="false" filterable="false">
									<fmt:formatNumber value="${memberFund.runtimeFundio}"
										pattern="#,##0.00" />
								</ec:column>
								<ec:column property="runtimeClosepl[=][double]" title="ƽ��ӯ��"
									width="6%" style="text-align:right; "  sortable="false" filterable="false">
									<fmt:formatNumber value="${memberFund.runtimeClosepl}"
										pattern="#,##0.00" />
								</ec:column>
								<ec:column property="floatingLoss[=][double]" title="�ֲ�ӯ��"
									width="6%" style="text-align:right; "  sortable="false" filterable="false">
									<fmt:formatNumber value="${memberFund.floatingLoss}"
										pattern="#,##0.00" />
								</ec:column>
								<ec:column property="runtimeFee[=][double]" title="������"
									width="5%" style="text-align:right; "  sortable="false" filterable="false">
									<fmt:formatNumber value="${memberFund.runtimeFee}"
										pattern="#,##0.00" />
								</ec:column>
								<ec:column property="presentCaptical[=][double]" title="��ǰȨ��"
									width="7%" style="text-align:right; "  sortable="false" filterable="false">
									<fmt:formatNumber value="${memberFund.presentCaptical}"
										pattern="#,##0.00" />
								</ec:column>
								<ec:column property="riskRate_log[=][String]" title="������"
									width="4%" style="text-align:right;"
									value="${memberFund.riskRate_log}" sortable="false"
									filterable="false" />
							</ec:row>
						</ec:table>
					</td>
				</tr>
			</table>
		</div>
		</td>
		</tr>
		</table>
		</div>
		<!-- �༭�͹�����ʹ�õ� ͨ�õ��ı���ģ�� -->
		<textarea id="ecs_t_input" rows="" cols="" style="display: none">
			<input type="text" class="inputtext" value=""
				onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="" />
		</textarea>
		<!-- �༭�͹�����ʹ�õĲ���ģ�� -->
		<textarea id="esc_fundFlowType" rows="" cols="" style="display: none">
		<select onBlur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="fundFlowType[=]">
			<ec:options items="fundFlowMap" />
		</select>
	    </textarea>
	</body>
</html>

<SCRIPT type="text/javascript">
		function search1(){
			frm.submit();
			//checkTotalQueryDate(frm.beginDate.value,frm.endDate.value);
			//changeOn();
		}
		 function init(queryType){
			 document.getElementById("beginDate").disabled=true;
			document.getElementById("endDate").disabled=true;
			change(queryType);
		}

function clickText() {
	var memberIds = frm.memberIds.value;
	var url = "${basePath}/report/customer/memberInfoList.action?oldMemberIds="
			+ memberIds;
	var result = window.showModalDialog(url, '',
			"dialogWidth=350px;dialogHeight=520px");
	if (result != null && result != '') {
		var result1 = result.split('####');
		frm.memberIds.value = result1[0];
		frm.memberNames.value = result1[1];
	}
}
		</SCRIPT>