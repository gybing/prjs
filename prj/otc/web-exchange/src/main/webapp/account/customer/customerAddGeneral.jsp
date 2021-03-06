<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<script type="text/javascript" src="<%=basePath%>/public/checkPW.js"></script>
<html>
	<head>
		<title>客户信息添加</title>
	</head>
	<body leftmargin="0" topmargin="0" style="overflow-y:hidden">
		<form action="${basePath}/account/customerGeneral/add.action" name="frm"
			method="post" targetType="hidden">
			<div class="st_title">
				&nbsp;&nbsp;&nbsp;
				<img src="<%=skinPath%>/cssimg/st_ico1.gif" align="absmiddle" />
				&nbsp;客户信息添加
			</div>
			<div style="overflow:auto;height:490px;">
				<table border="0" width="100%" align="center">
					<tr>
						<td>
							<%@include file="commonTable.jsp"%>
							<!-- 另一个开始-->
							<table width="90%" border="0" align="center" cellpadding="0"
								cellspacing="2">
								<tr>
									<td colspan="4">
										<div class="div_cxtj">
											<img src="<%=skinPath%>/cssimg/13.gif" />
											&nbsp;密码信息
										</div>
										<div class="div_tj">
											<table width="90%" border="0" class="table2_style">
												<tr>
													<td align="right" width="15%">
														交易密码:
													</td>
													<td width="45%">
														<label>
															<input type="password" name="obj.password" id="password"
																class="input_textmid" onblur="myblur('password')"
																onfocus="myfocus('password')">
															<strong class="check_input">&nbsp;*</strong>
														</label>
													</td>
													<td style="padding-right: 10px;" align="left">
														<div id="password_vTip">
															&nbsp;
														</div>
													</td>
												</tr>
												<tr>
													<td align="right" width="15%">
														交易密码确认:
													</td>
													<td>
														<label>
															<input type="password" name="password1" id="password1"
																class="input_textmid" onblur="myblur('password1')"
																onfocus="myfocus('password1')">
															<strong class="check_input">&nbsp;*</strong>
														</label>
													</td>
													<td style="padding-right: 10px;" align="left">
														<div id="password1_vTip">
															&nbsp;
														</div>
													</td>
												</tr>
												<tr height="35">
													<td align="right" width="15%">
														电话密码:
													</td>
													<td>
														<label>
															<input type="password" name="obj.phonePWD"
																id="phonePassword" onblur="myblur('phonePassword')"
																onfocus="myfocus('phonePassword')" class="input_textmid">
															<strong class="check_input">&nbsp;*</strong>
														</label>
													</td>
													<td style="padding-right: 10px;" align="left">
														<div id="phonePassword_vTip">
															&nbsp;
														</div>
													</td>
												</tr>
												<tr>
													<td align="right" width="10%">
														电话密码确认:
													</td>
													<td>
														<label>
															<input type="password" name="phonePWD1"
																id="phonePassword1" onblur="myblur('phonePassword1')"
																onfocus="myfocus('phonePassword1')"
																class="input_textmid">
															<strong class="check_input">&nbsp;*</strong>
														</label>
													</td>
													<td style="padding-right: 10px;" align="left">
														<div id="phonePassword1_vTip">
															&nbsp;
														</div>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
								<!-- 另一个结束-->
							</table>
						</td>
					</tr>
				</table>
			</div>
			<div class="tab_pad">
				<table cellspacing="0" cellpadding="0" border="0" width="100%"
					align="center">
					<tr>
						<td align="center">
							<button class="btn_sec" onClick="addCustomer()" id="add">
								添加
							</button>
						</td>
						<td align="center">
							<button class="btn_sec" onClick="window.close()">
								关闭
							</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
<script type="text/javascript">
	function change(id) {
		document.getElementById("memberNos").value = id;
		customerAdd.getOrganizationList(id, function(organizationList) {
			if (organizationList == "") {
				var organization = document.getElementById("organization");
				DWRUtil.removeAllOptions(organization);
				organization.style.width = '200px';
				var item1 = document.createElement("OPTION");
				organization.options.add(item1);
				item1.value = "";
				item1.innerText = "请选择";

				/**
				 * var manager=document.getElementById("manager");
					DWRUtil.removeAllOptions(manager);
					manager.style.width='200px';
					var item2 = document.createElement("OPTION");
					manager.options.add(item2);
					item2.value ="";
					item2.innerText = "请选择";
					 
				 */
				return;
			}
			if (typeof window['DWRUtil'] == 'undefined') {
				window.DWRUtil = dwr.util;
			}
			var organization = document.getElementById("organization");
			DWRUtil.removeAllOptions(organization);
			organization.style.width = '200px';
			var item1 = document.createElement("OPTION");
			organization.options.add(item1);
			item1.value = "";
			item1.innerText = "请选择";
			for ( var i = 0; i < organizationList.length; i++) {
				//DWRUtil.addOptions(brokerage,brokerageList[i].name);
				var item = document.createElement("OPTION");
				organization.options.add(item);
				item.value = organizationList[i].organizationNO;
				item.title=organizationList[i].organizationNO;
				item.innerText = organizationList[i].name;
			}
		});
		customerAdd.getBrokerageListByMember(id, function(brokerageList) {
			if (brokerageList == "") {
				var brokerage = document.getElementById("brokerage");
				DWRUtil.removeAllOptions(brokerage);
				brokerage.style.width = '200px';
				var item3 = document.createElement("OPTION");
				brokerage.options.add(item3);
				item3.value = "";
				item3.innerText = "请选择";

				/**
				 * var manager=document.getElementById("manager");
					DWRUtil.removeAllOptions(manager);
					manager.style.width='200px';
					var item2 = document.createElement("OPTION");
					manager.options.add(item2);
					item2.value ="";
					item2.innerText = "请选择";
					 
				 */
				return;
			}
			if (typeof window['DWRUtil'] == 'undefined') {
				window.DWRUtil = dwr.util;
			}
			var brokerage = document.getElementById("brokerage");
			DWRUtil.removeAllOptions(brokerage);
			brokerage.style.width = '200px';
			var item3 = document.createElement("OPTION");
			brokerage.options.add(item3);
			item3.value = "";
			item3.innerText = "请选择";
			for ( var i = 0; i < brokerageList.length; i++) {
				var item = document.createElement("OPTION");
				brokerage.options.add(item);
				item.title=brokerageList[i].name;
				item.value = brokerageList[i].brokerageNo;
				item.innerText = brokerageList[i].name;
			}
		});
	}
	function addCustomer() {
		if (!memberNo("memberNo"))//在修改时，不需要判断这个
			flag = false;
		if(customerNoUsed!=3){
				return false;
		}else{
			var flag = myblur("all");
			if (!flag) {
				return false;
			}
			var vaild = affirm("您确定要操作吗？");
			if(vaild==true){
		    frm.submit();
	   		 }else{
	          return false;
    		}
		}
	}
	function checkMemberNo(userID) {
		var innerHTML = "";
		var id = document.getElementById("memberNo").value
				+ document.getElementById("shortId").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "不能为空";
		} else if (trim1(id).length != 15||trim1(id).length!=id.length) {
			innerHTML = "交易账号应为15位数字且不含空格";
		} else if (isNaN(user.value)) {
			innerHTML = "不合法的数字";
		} else {
			innerHTML = "";
			flag = true;
		}
		vTip.innerHTML = innerHTML;
		if (flag) {
			vTip.className = "";
		} else {
			vTip.className = "onError";
		}
		document.getElementById("customerId").value = id;
		return flag;
	}
	function checkMemberNoLaw(){
		var vTip = document.getElementById("shortId_vTip");
		if(checkMemberNo("shortId")){
			vTip.className = "onError";
			vTip.innerHTML="正在检测数据合法性";
			checkCustomerNo();
		}
	}
	function checkPapersTypeLaw(){
		var vTip = document.getElementById("papersName_vTip");
		if(papersName("papersName")){
			vTip.innerHTML="正在检查数据合法性";
			vTip.className = "onError";
			checkPapersUsed();
		}
	}
	function password(userID) {
		var innerHTML = "";
		var user = document.getElementById(userID);
		if (user != null) {
			var vTip = document.getElementById(userID + "_vTip");
			var flag = false;
			if (checkPassword(user.value) != "") {
				innerHTML = checkPassword(user.value);
			} else {
				flag = true;
			}
			vTip.innerHTML = innerHTML;
			if (flag) {
				vTip.className = "";
			} else {
				vTip.className = "onError";
			}
			return flag;
		} else {
			return true;
		}
	}

	function passwordcompare(userID, compareuserID) {
		var innerHTML = "";
		var user = document.getElementById(userID);
		if (user != null) {
			var comparevalue = document.getElementById(compareuserID).value;
			var vTip = document.getElementById(userID + "_vTip");
			var flag = false;
			if (checkPassword(user.value) != "") {
				innerHTML = checkPassword(user.value);
			} else {
				if (user.value != comparevalue) {
					innerHTML = "密码与确认密码不一致！";
				} else {
					flag = true;
				}
			}
			vTip.innerHTML = innerHTML;
			if (flag) {
				vTip.className = "";
			} else {
				vTip.className = "onError";
			}
			return flag;
		} else {
			return true;
		}
	}
	var customerNoUsed=1;
	var isPapersUsed=1;
	/**
	 * 检测账户是否被用过 1正在检测，2：已被用过 ，3：未被用过
	 */
	 function checkCustomerNo(){
		var id = document.getElementById("memberNo").value
				+ document.getElementById("shortId").value;
			document.getElementById("customerId").value = id;
			var vTip = document.getElementById("shortId_vTip");
			checkAction.existId(id, function(isExist) {
				if (isExist) {
					customerNoUsed=2;
					vTip.innerHTML="此账号已存在，请重新添加！";
					vTip.className = "onError";
				}else{
					customerNoUsed=3;
					vTip.innerHTML="此账号未被使用";
					vTip.className = "";
				}
			});
	 }
	
</script>
<%@ include file="/public/footInc.jsp"%>