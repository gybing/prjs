<%@ page contentType="text/html;charset=GBK"%>
<table border="0" width="100%" align="center">
	<tr height="30"></tr>
	<tr>
		<div class="warning">
				<div class="content">
					温馨提示 :交易商注册申请添加
				</div>
			</div>
		<td>
			<div class="div_cxtj">
    	<div class="div_cxtjL"></div>
        <div class="div_cxtjC">基本信息</div>
        <div class="div_cxtjR"></div>
    </div>
			<div style="clear: both;"></div>
			<div class="div_tj">
				<table border="0" cellspacing="0" cellpadding="4" width="100%"
					align="center" class="table2_style">
					<tr height="20">
						<td align="right">
							<span class="required">*</span>
							交易商代码：
						</td>
						<td>
							<input type="text" id="id" class="validate[required,maxSize[${firmLen}],custom[onlyLetterNumber],ajax[checkFirmByFirmId]] input_text" name="entity.firmId"
								value="${tradeid }">
						</td>
						<td align="left" height="" colspan="2">
							<div class="onfocus">
								不能为空！
							</div>
						</td>
					</tr>
					<tr>
						<td align="right">
							<span class="required">*</span>
							用户名：
						</td>
						<td >
							<input type="text" id="username" class="validate[required,funcCall[checkUserId],ajax[checkFirmByUserId],maxSize[16]] input_text" name="username" value="${entity.userID }"/>
						</td>
						<td colspan="2">
							<div class="onfocus">
								不能为空，用于登录交易系统！
							</div>
							<input type="hidden" id="password" class="validate[required] input_text_pwdmin" name="password" value="${entity.password }"/>
						</td>
					</tr>
					<tr>
						<td align="right">
							<span class="required">*</span>
							交易商名称：
						</td>
						<td>
							<input type="text" id="name" class="validate[required,maxSize[<fmt:message key='firmName' bundle='${PropsFieldLength}' />]] input_text" name="entity.name"
								value="${entity.name}" >
						</td>
						<td align="left" height=""  colspan="2">
							<div class="onfocus">
								不能为空！
							</div>
						</td>
					</tr>
					<tr height="35" id="frontIsNeedKeyCode"  style="display: none;">
						<td align="right" class="td_size" width="20%">
							是否启用 KEY ：
						</td>
						<input type="hidden" name="enableKey" value="N" id="enableKey">
						<td align="left" colspan="2"><input id="kcodech" type="checkbox" onclick="checkKey(this)"/>
							<span id="showkey" style="display: none;"><span class="required">*</span>
								<input id="kcode" name="kcode" style="width: 122px;" type="text" value="0123456789ABCDE" readonly="readonly" class="validate[required,custom[onlyLetterNumber]] input_text" />
							</span>
						</td>
					</tr>
					<tr>
						<td align="right" width="22%">
							交易商全称：
						</td>
						<td width="30%">
							<input type="text" id="fullName" class="validate[maxSize[<fmt:message key='fullName' bundle='${PropsFieldLength}' />]] input_text" name="entity.fullName"
								value="${entity.fullName}"  colspan="3">
						</td>
						<td align="right" wdith="20%">
							<span class="required">*</span>
							交易商类型：
						</td>
						<td width="*">
							<select id="type" class="validate[required] input_text"
								name="entity.type" onchange="getHidden()" onclick="reduceValue(this.value)">
								<c:forEach items="${mfirmTypeMap}" var="map">
									<option value="${map.key}"
										title='${map.value}'
										<c:if test="${entity.type==map.key }">selected="selected"</c:if>>
										${map.value}
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="4" >
							<div id="content" style="display: none;">
								<table border="0" cellspacing="0" cellpadding="0"
									width="100%" height="60px;">
									<tr>
										<td align="right" width="22%">
											所属行业：&nbsp;
										</td>
										<td width=30%">
											<select id="industryCode" name="entity.industryCode"  class="input_text">
												<option value="">请选择</option>
												<c:forEach var="industry" items="${industryList}">
													<c:if test="${industry.isvisibal eq 'Y'}">
													<option value="${industry.code}" title="${industry.name}" <c:if test="${entity.industryCode eq industry.code}">selected="selected"</c:if>>${industry.name}</option>
													</c:if>
												</c:forEach>
											</select>	
										</td>
										<td align="right" width="20%">
											&nbsp;&nbsp;所属地域：&nbsp;
										</td>
										<td width="*">
											<select id="zoneCode" name="entity.zoneCode"  class="input_text">
												<option value="">请选择</option>
												<c:forEach var="zone" items="${zoneList}">
													<c:if test="${zone.isvisibal eq 'Y'}">
													<option value="${zone.code}" title="${zone.name}" <c:if test="${entity.zoneCode eq zone.code}">selected="selected"</c:if>>${zone.name}</option>
													</c:if>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td align="right" width="22%">
											<span class="required">*</span><fmt:message key="MFirm.organizationCode" bundle="${PropsFieldDic}" />：&nbsp;
										</td>
										<td width="30%">
											<input type="text" id="organizationCode" class="validate[required,custom[onlyLetterNumber],maxSize[9]] input_text"  name="entity.organizationCode" 
												value="${entity.organizationCode}" data-prompt-position="topLeft:0">
										</td>
										<td align="right" width="20%">
											&nbsp;&nbsp;<fmt:message key="MFirm.corporateRepresentative" bundle="${PropsFieldDic}" />：&nbsp; 
										</td>
										<td width="26%">
											<input type="text" id="corporateRepresentative" class="validate[maxSize[16]] input_text"   name="entity.corporateRepresentative" 
												value="${entity.corporateRepresentative}" data-prompt-position="topLeft:0">
										</td>
									</tr> 
								</table>
						</td>
					</tr>
					</div>
					<tr>
						<td align="right">
							<span class="required">*</span>
							<fmt:message key="MFirm.certificateType" bundle="${PropsFieldDic}" />：
						</td>
						<td>
							<select id="certificateType" name="entity.certificateType" class="validate[required] input_text">
								<c:forEach items="${certificateTypeList }" var="certificateType">
									<option value="${certificateType.code }" title="${certificateType.name }" 
										<c:if test="${entity.certificateType eq certificateType.code }">selected="selected"</c:if>>
										${certificateType.name }
									</option>
								</c:forEach>
							</select>
						</td>
						<td align="right">
							<span class="required">*</span>
							<fmt:message key="MFirm.certificateNO" bundle="${PropsFieldDic}" />：
						</td>
						<td>
							<input type="text" class="validate[required,maxSize[<fmt:message key='certificateNO' bundle='${PropsFieldLength}'/>],custom[onlyLetterNumber]] input_text" id="certificateNO" name="entity.certificateNO"
								value="${entity.certificateNO}" data-prompt-position="topLeft:30,0">
						</td>
					</tr>
					<tr>
					<td align="right">
					<span class="required">*</span>
						交易商类别：
					</td>
					<td>
						<select id="firmCategoryId" name="entity.firmCategoryId"  class="validate[required] input_text">
							<option value="-1">未分类</option>
							<c:forEach var="firmCategory" items="${firmCategoryList}">
								<c:if test="${firmCategory.isvisibal eq 'Y'}">
								<option value="${firmCategory.id}" title="${firmCategory.name}">${firmCategory.name}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				</table>
			</div>
		</td>
	</tr>
	
	<tr>
		<td>
			<div class="div_cxtj">
    	<div class="div_cxtjL"></div>
        <div class="div_cxtjC">联系信息</div>
        <div class="div_cxtjR"></div>
    </div>
			<div style="clear: both;"></div>
			<div class="div_tj">
				<table border="0" cellspacing="0" cellpadding="4" width="100%"
					align="center" class="table2_style">
					<tr>
						<td align="right" width="22%">
							<span class="required">*</span>
							联系人：
						</td>
						<td width="30%">
							<input type="text" id="contactMan" class="validate[required,maxSize[<fmt:message key='contactMan' bundle='${PropsFieldLength}' />]] input_text" name="entity.contactMan"
								value="${entity.contactMan}" >
						</td>
					    <td align="right" width="21%">
							电话：
						</td>
						<td width="*">
							<input type="text" id="phone" class="validate[maxSize[<fmt:message key='phone' bundle='${PropsFieldLength}' />]] input_text" name="entity.phone" 
								value="${entity.phone}" >
						</td>
				    </tr>
					<tr>
					    <td align="right">
							<span class="required">*</span>
							手机号码：
						</td>
						<td>
							<input type="text" id="mobile" class="validate[required,custom[mobile],maxSize[<fmt:message key='mobile' bundle='${PropsFieldLength}' />]] input_text" name="entity.mobile" 
								value="${entity.mobile}" >
						</td>		
						
						<td align="right">
							传真：
						</td>
						<td>
							<input type="text" id="fax" class="validate[maxSize[<fmt:message key='fax' bundle='${PropsFieldLength}' />],custom[fax]] input_text" name="entity.fax" 
								value="${entity.fax}" >
						</td>
					</tr>
					<tr>
					    <td align="right">
							<span class="required">*</span>
							电子邮箱：
						</td>
						<td>
							<input type="text" id="email" class="validate[required,maxSize[<fmt:message key='email' bundle='${PropsFieldLength}' />],custom[email]] input_text" name="entity.email" 
								value="${entity.email}"   data-prompt-position="bottomLeft:-5">
						</td>
						
						<td align="right">
							邮编：
						</td>
						<td>
							<input type="text" id="postcode" class="validate[maxSize[<fmt:message key='postcode' bundle='${PropsFieldLength}' />],custom[number]] input_text" name="entity.postCode"
								value="${entity.postcode}" >
						</td>
					</tr>
					<tr>
					    <td align="right">
							<span class="required">*</span>
							联系地址：
						</td>
						
						<td colspan="3" align="left">
							<input type="text" id="address" style="width: 290px;"
								class="validate[required,maxSize[<fmt:message key='address' bundle='${PropsFieldLength}' />]] input_text"
								name="entity.address" value="${entity.address}" />
						</td>
					</tr>
					<tr>
						<td align="right" width="20%">
							备注信息：
						</td>
						<td colspan="3" width="*">
							<textarea rows="3" cols="45" name="entity.note" id="note"
								class="validate[maxSize[<fmt:message key='note' bundle='${PropsFieldLength}' />]] ">${entity.note }</textarea>
						</td>
					</tr>
					<tr>
						<td align="right">
							权限：
						</td>
						<td colspan="3" id="moduleIdtd">
							<input type="checkbox" id="selectallbox" name="selectallbox" value="0" onclick="selectall(this.value)"/>
							<label>全选</label>
							<!-- <input type="hidden" id="selectallbox" name="selectallbox" value="0"> -->
							<c:forEach var="map" items="${tradeModuleMap}">
							<c:if test="${map.value.isFirmSet eq 'Y'}">
								<input type="checkbox" id="ch${map.key}" name="firmModules" value="${map.key}"/>
								<label onclick="ch${map.key}.click();">${map.value.shortName}</label>
							</c:if>
							</c:forEach>
						</td>
						<script>
							function selectall(flag){
								if(flag=='0'){
									var firmModules = document.getElementsByName("firmModules");
									for(var i=0;i<firmModules.length;i++){
										firmModules[i].checked=true;
									}
									document.getElementById("selectallbox").value="1";
								}else{
									var firmModules = document.getElementsByName("firmModules");
									for(var i=0;i<firmModules.length;i++){
										firmModules[i].checked=false;
									}
									document.getElementById("selectallbox").value="0";
								}
							}
						</script>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
