<%@ page contentType="text/html;charset=GBK"%>
<script type='text/javascript' src='${basePath}/dwr/engine.js'>
	
</script>
<script type='text/javascript' src='${basePath}/dwr/util.js'>
</script>
<script type="text/javascript"
	src='${basePath}/dwr/interface/checkAction.js' />
</script>
<script type="text/javascript"
	src='${basePath}/dwr/interface/customerAdd.js' />
</script>
<style>
<!--
select {
	width: 100px;
	overflow: hidden;
}
-->
</style>
<%
	String memberNo = "��ʾ��Ϣ,δȷ����Ϣ";
	String organization = "��ʾ��Ϣ,δȷ����Ϣ";
	String manager = "��ʾ��Ϣ,δȷ����Ϣ";
	String brokerage = "��ʾ��Ϣ,δȷ����Ϣ";
	String shortId = "��ʾ��Ϣ,δȷ����Ϣ";
	String customerName = "��ʾ��Ϣ,δȷ����Ϣ";
	String papersName = "��ʾ��Ϣ,δȷ����Ϣ";
	String papersType = "��ʾ��Ϣ,δȷ����Ϣ";
%>
<table width="90%" border="0" align="center" cellpadding="0"
	cellspacing="2">
	<!-- ������Ϣ -->
	<tr>
		<td colspan="4">
			<div class="div_cxtj">
				<img src="<%=skinPath%>/cssimg/13.gif" />
				&nbsp;������Ϣ
			</div>
			<div class="div_tj">
				<table width="90%" border="0" class="table2_style">

					<input type="hidden" name="obj.createTime"
						value="${obj.createTime}">
					<input type="hidden" name="obj.customerNo" id="customerId"
						value="${obj.customerNo}">
					<tr height="35">
						<td align="right" width="15%">
							������Ա:
						</td>
						<td width="100%" align="left" colspan="2">
							<select name="obj.memberNo" id="memberNo" style="width: 200px;"
								onchange="change(this.value)" onblur="myblur('memberNo')"
								onfocus="myfocus('memberNo')">
								<option value="">
									��ѡ��
								</option>
								<c:forEach items="${memberInfoList}" var="result">
									<option value="${result.id}" title ='(${result.id})${result.name}'>
										(${result.id})${result.name}
									</option>
								</c:forEach>
							</select>
							<strong class="check_input">&nbsp;*</strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="width: 225px;"><div id="memberNo_vTip"></div>
							</span>
						</td>
						</tr>
						<tr>
						
						<td align="right" width="15%">
							��������:
						</td>
						<td width="45%" align="left" colspan="2">
							<select name="objSpecial.organizationNo" id="organization"  style="width: 200px;" onchange="changeOrganization(this.value)">
								<option value="">
									��ѡ��
								</option>
							</select>
						</td>
					</tr>
					<tr>

					</tr>
					<tr>
						<td align="right" width="15%">
							�����Ӽ�:
						</td>
						<td width="45%" align="left" colspan="2">
							<select id="brokerage" name="objSpecial.brokerageNo"  style="width: 200px;">
								<option value="">
									��ѡ��
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right" width="15%">
							�����˺�:
						</td>
						<td align="left">
							<input type="text" id="memberNos" readonly="readonly"
								style="width: 30px; background-color: #bebebe">
							<input type="text"
								style="background-color: #FFFFFF; height: 20px; width: 147px; border: 1px solid #7f9db9;"
								id="shortId" onfocus="myfocus('shortId')" maxlength="19" onblur="myblur('shortId')">
							<strong class="check_input">&nbsp;*</strong>
						</td>
						<td style="padding-right: 15px;">
							<div id="shortId_vTip"></div>
						</td>
					</tr>
					<tr height="35">
						<td align="right" width="15%">
							�ͻ�����:
						</td>
						<td align="left" width="45%">
							<input type="text" name="obj.name" id="customerName"
								value="${obj.name}" class="input_text_mid"
								onblur="myblur('customerName')"
								onfocus="myfocus('customerName')" maxlength="60">
							<strong class="check_input">&nbsp;*</strong>
						</td>
						<td style="padding-right: 15px;">
							<div id="customerName_vTip"></div>
						</td>
					</tr>
					<tr>
						<td align="right">
							֤������:
						</td>
						<td>
							<select name="obj.papersType" id="papersType"
								style="width: 110px;" onblur="myblur('papersType')"
								onfocus="myfocus('papersType')">
								<c:forEach items="${papersTypeUpdateMap}" var="maps">
									<option value="${maps.key}"
										<c:if test="${obj.papersType==maps.key}">selected="selected"</c:if>>
										${maps.value}
									</option>
								</c:forEach>
							</select>
							<strong class="check_input">&nbsp;*</strong>
						</td>
						<td style="padding-right: 15px;">
							<div id="papersType_vTip"></div>
						</td>
					</tr>
					<tr height="35">
						<td align="right">
							֤������:
						</td>
						<td>
							<input type="text" name="obj.papersName" id="papersName"
								value="${obj.papersName}" class="input_text_mid"
								onblur="myblur('papersName')" onfocus="myfocus('papersName')">
							<strong class="check_input">&nbsp;*</strong>
						</td>
						<td style="padding-right: 15px;">
							<div id="papersName_vTip"></div>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>


<!-- ��һ����ʼ-->
<table width="90%" border="0" align="center" cellpadding="0"
	cellspacing="2">
	<tr>
		<td colspan="4">
			<div class="div_cxtj">
				<img src="<%=skinPath%>/cssimg/13.gif" />
				&nbsp;��ϵ��Ϣ
			</div>
			<div class="div_tj">
				<table width="90%" border="0" class="table2_style">

					<tr height="35">
						<td align="right" width="15%">
							��ϵ�绰:
						</td>
						<td width="45%">
							<input type="text" name="obj.phone" id="phone"
								onblur="myblur('phone')" onfocus="myfocus('phone')"
								class="input_textxmax" value="${obj.phone}">

						</td>
						<td style="padding-right: 15px;" align="left">
							<div id="phone_vTip">
								&nbsp;
							</div>
						</td>
					<tr>
						<td align="right" width="15%">
							�������:
						</td>
						<td>
							<label>
								<input type="text" name="obj.fax" id="fax" class="input_textmin"
									onblur="myblur('fax')" onfocus="myfocus('fax')"
									value="${obj.fax}">
							</label>
						</td>
						<td style="padding-right: 15px;" align="left">
							<div id="fax_vTip">
								&nbsp;
							</div>
						</td>
					</tr>
					<tr>
						<td align="right" width="15%">
							��������:
						</td>
						<td>
							<input type="text" name="obj.postCode" id="postCode"
								onblur="myblur('postCode')" "
								class="input_textmin"
								value="${obj.postCode}">
						</td>
						<td style="padding-right: 15px;">
							<div id="postCode_vTip">
								&nbsp;
							</div>
						</td>
					</tr>
					<tr>
						<td align="right" width="15%">
							��������:
						</td>
						<td>
							<input type="text" name="obj.email" id="email"
								onblur="myblur('email')" onfocus="myfocus('email')"
								class="input_text_mid" value="${obj.email}">
						</td>
						<td style="padding-right: 15px;">
							<div id="email_vTip">
								&nbsp;
							</div>
						</td>
					</tr>
					<tr height="35">
						<td align="right">
							ͨѶ��ַ:
						</td>
						<td>
							<input type="text" name="obj.address" id="address"
								class="input_textxmax" value="${obj.address}">
						</td>
						<td style="padding-right: 15px;">
							<div id="address_vTip">
								&nbsp;
							</div>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<!-- ��һ������-->
</table>
<script type="text/javascript">
	if (typeof window['DWRUtil'] == 'undefined') {
		window.DWRUtil = dwr.util;
	}
	function myblur(userID) {
		var flag = true;
		if ("memberNo" == userID) {
			flag = memberNo(userID);
		} else if("shortId"==userID){
			flag=checkMemberNoLaw();
		}else if ("customerName" == userID) {
			flag = customerName(userID);
		} else if ("papersName" == userID) {
			flag = papersName(userID);
		} else if ("papersType" == userID) {
			flag = papersType(userID);
		} else if ("phone" == userID) {
			flag = phone(userID);
		} else if ("fax" == userID) {
			flag = fax(userID);
		} else if ("email" == userID) {
			flag = emailT(userID);
		} else if ("postCode" == userID) {
			flag = postcode(userID);
		} else if ("phonePassword" == userID) {
			flag = password(userID);
		} else if ("password" == userID) {
			flag = password(userID);
		} else if ("phonePassword1" == userID) {
			flag = passwordcompare(userID, "phonePassword");
		} else if ("password1" == userID) {
			flag = passwordcompare(userID, "password");
		} else {
			if (!checkMemberNo("shortId"))
				flag = false;
			if (!customerName("customerName"))
				flag = false;
			if(!papersName("papersName"))
				flag=false;
			if (!phone("phone"))
				flag = false;
			if (!fax("fax"))
				flag = false;
			if (!emailT("email")) {
				flag = false;
			}
			if (!postcode("postCode")) {
				flag = false;
			}
			if (!password("phonePassword")) {
				flag = false;
			}
			if (!password("password")) {
				flag = false;
			}
			if (!passwordcompare("phonePassword1", "phonePassword")) {
				flag = false;
			}
			if (!passwordcompare("password1", "password")) {
				flag = false;
			}
		}

		return flag;
	}

	function postcode(userID) {
		var innerHTML = "";
		var marg = document.getElementById("postCode").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			flag = true;
		} else if (isNaN(user.value)) {
			innerHTML = "��������";
		} else if (!isStr(user.value, true, null)) {
			innerHTML = "���Ϸ��ַ�";
		} else if (user.value.length != 6) {
			innerHTML = "���ȱ���Ϊ6λ";
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
	}

	function phone(userID) {
		var innerHTML = "";
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			flag = true;
		//} else if (isNaN(user.value)) {
		} else if (!checkphone(user.value)) {
			innerHTML = "�������󣬽����������֡��л��ߺͶ���";
		} else if (user.value.length > 64) {
			innerHTML = "���Ȳ��ܳ���64λ";
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
	}
	function fax(userID) {
		return phone(userID);
	}
	function emailT(userID) {
		var innerHTML = "";
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			flag = true;
		} else if (!email(user.value)) {
			innerHTML = "��������";
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
	}

	function memberNo(userID) {
		var innerHTML = "";
		var marg = document.getElementById("memberNo").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "����Ϊ��";
		} else if (isNaN(user.value)) {
			innerHTML = "���Ϸ�������";
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
	}
	function organization(userID) {
		var innerHTML = "";
		var marg = document.getElementById("organization").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "����Ϊ��";
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
	}
	function manager(userID) {
		var innerHTML = "";
		var marg = document.getElementById("manager").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "����Ϊ��";
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
	}
	function brokerage(userID) {
		var innerHTML = "";
		var marg = document.getElementById("brokerage").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "����Ϊ��";
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
	}
	function customerName(userID) {
		var innerHTML = "";
		var marg = document.getElementById("customerName").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "����Ϊ��";
		}else if(user.value.length<1||user.value.length>32) {
			innerHTML = "Ӧ��1~32λ֮��";
		}else if(!checkName(user.value)) {
			innerHTML = "�в��Ϸ��ַ�";
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
	}
	function papersType(userID) {
		return true;
	}
	function papersName(userID) {
		var innerHTML = "";
		var marg = document.getElementById("papersName").value;
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "����Ϊ��";
		} else if (!isStr(user.value, null, new Array('-'))) {
			innerHTML = "�������벻�Ϸ��ַ�";
		} else if (user.value.length > 18 || user.value.length < 6) {
			innerHTML = "���Ȳ���С��6λ�Ҳ��ܳ���18λ";
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
	}
	function myfocus(userID) {
	}
	function changeOrganization(id) {
		var memberNo = document.getElementById('memberNo').value;
		customerAdd.getBrokerageAndManagerList(id, memberNo, function(map) {
			if (!map) {
				return;
			}
			var brokerageList = map['brokerageList'];

			var managerList = map['managerList'];

			var brokerage = document.getElementById("brokerage");
			DWRUtil.removeAllOptions(brokerage);
			brokerage.style.width = '200px';
			var item = document.createElement("OPTION");
			brokerage.options.add(item);
			item.value = "";
			item.innerText = "��ѡ��";
			for ( var i = 0; i < brokerageList.length; i++) {
				//DWRUtil.addOptions(brokerage,brokerageList[i].name);
				var item = document.createElement("OPTION");
				brokerage.options.add(item);
				item.value = brokerageList[i].brokerageNo;
				item.innerText = brokerageList[i].name;
				item.title=brokerageList[i].name;
				if (brokerageList[i].brokerageNo == '${obj.brokerageNo}') {
					item.selected = 'selected';
				}
			}
			/***
			var manager = document.getElementById("manager");
			DWRUtil.removeAllOptions(manager);
			manager.style.width = '7em';
			var item = document.createElement("OPTION");
			manager.options.add(item);
			item.value = "";
			item.innerText = "��ѡ��";
			for ( var i = 0; i < managerList.length; i++) {
				//DWRUtil.addOptions(manager,managerList[i].name);
				var item = document.createElement("OPTION");
				manager.options.add(item);
				item.value = managerList[i].managerNo;
				item.innerText = managerList[i].name;
				if (managerList[i].managerNo == '${obj.managerNo}') {
					item.selected = 'selected';
				}
			}
			 */

		});
	}
	
	function checkPapersUsed(){
		var papersType = document.getElementById("papersType").value;
		var id = document.getElementById("papersName").value;
		var vTip = document.getElementById("papersName_vTip");
		checkAction.existCustomerPapers(id, papersType, '', function(isExist) {
			if (isExist) {
				isPapersUsed=2;
				document.getElementById("papersName").focus();
				vTip.innerHTML="��֤�������Ѵ��ڣ����������ӣ�";
				vTip.className = "onError";
			}else{
				isPapersUsed=3;
				vTip.innerHTML="��֤������δ��ʹ��";
				vTip.className = "";
			}
		});
	}
	function checkName(name){
		 var re = /^\S{1,61}$/;
	   var flag = false;
		if (!re.exec(name)) {
                flag= false;
            }else{
                flag= true;
            }
		return flag;
	}
</script>