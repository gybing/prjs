<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>ϵͳ�û����</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
		<SCRIPT type="text/javascript">
			function type_onclick(num,name){
				var url = "${basePath}/tradeManage/commodityTradingParameter/displayCommodity.action?tradeTimeSequenct="+num+"&name="+name;
//alert(url);
				var value=dialog(url, window, 800, 500);
				if(value==1111)
					window.location.reload();
			}
		
		</SCRIPT>
	</head>
	<body>
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
							<form name="frm"
								action="${basePath}/tradeManage/commodityTradingParameter/searchList.action"
								method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td height="40" width="370">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td class="table3_td_1mid" align="left">
															���׽�����:&nbsp;
															<label>
																<input type="text"
																	class="input_text" name="${GNNT_}name[like]"
																value="${oldParams['name[like]'] }" id="sectionId" />
															</label>
														</td>
														<td class="table3_td_anniu" align="left">
															<button class="btn_sec" onclick="submitMember()">
																��ѯ
															</button>&nbsp;&nbsp;
															<button class="btn_cz" onclick="myReset()">
																����
															</button>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						
						<div class="div_gn">
							<button class="anniu_btn" id='update' onclick="updateRMI()">
								ʵʱ��Ч
							</button>
						</div>

						<div class="div_list">
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
										<ec:table items="resultList"
											autoIncludeParameters="${empty param.autoInc}"
											var="tradeTime"
											action="${basePath}/tradeManage/commodityTradingParameter/searchList.action"
											minHeight="345" listWidth="100%"
											retrieveRowsCallback="limit" sortRowsCallback="limit"
											filterRowsCallback="limit" 
											csvFileName="�����б�.csv" style="table-layout:fixed">
											<ec:row recordKey="${tradeTime.sectionId}">
												<ec:column width="3%" property="_0" title="���" value="${GLOBALROWCOUNT}" sortable="false" filterable="false" />
												<ec:column property="name[like]" title="���׽�����" width="19%"
													style="text-align:left;">
													<a href="#" class="blank_a"
														onclick="return update('${tradeTime.sectionId}');"><font
														color="#880000">${tradeTime.name}</font>
													</a>
												</ec:column>
												<ec:column property="startTime[like]" title="���׿�ʼʱ��"
													width="15%" style="text-align:left;"
													value="${tradeTime.startTime}" />
												<ec:column property="endTime[like]" title="���׽���ʱ��"
													width="18%" style="text-align:left;"
													value="${tradeTime.endTime}" />
												<ec:column property="startDate[like]" title="������ʼ����"
													width="18%" style="text-align:left;"
													value="${tradeTime.startDate}" />
												<ec:column property="endDate[like]" title="���׽�������"
													width="18%" style="text-align:left;"
													value="${tradeTime.endDate}" />
												<ec:column property="endDate[like]" title="���׽���Ʒ"
													width="18%" style="text-align:left;"
												>
													<a href="javascript:type_onclick(${GLOBALROWCOUNT},'${tradeTime.name}')">����</a>
												</ec:column>
							<!--value="<button onclick='type_onclick(${GLOBALROWCOUNT})'>����</button>"   -->						 
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
		<!-- �༭�͹�����ʹ�õĽ���״̬ģ�� -->
		<textarea id="ecs_t_status" rows="" cols="" style="display: none">
			<select onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="status[=][int]">
				<ec:options items="tradeStatusMap" />
			</select>
	    </textarea>
		<SCRIPT type="text/javascript">
		function add(){
			var url = "${basePath}/tradeManage/commodityTradingParameter/forwardAdd.action";
			ecsideDialog(url,"",580,280);
		}
		function deleteByCheckBox(){
			var url = "${basePath}/tradeManage/commodityTradingParameter/delete.action";
			deleteEcside(ec.ids,url);
		}
		function update(id){
			var url = "${basePath}/tradeManage/commodityTradingParameter/forwardUpdate.action?obj.sectionId="+id;
			ecsideDialog(url,"",580,280);
		}
		function submitMember(){
			frm.submit();
		}
		function updateRMI() {
			if(affirm("��ȷ��Ҫ������")){
				frm.action = "${basePath}/tradeManage/commodityTradingParameter/updateRMI.action";
				frm.submit();
			}
		}
		</SCRIPT>
	</body>
</html>
<%@ include file="/public/footInc.jsp"%>