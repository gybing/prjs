<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="gnnt.MEBS.integrated.mgr.integrated.IntegratedGlobal,
				gnnt.MEBS.integrated.mgr.model.usermanage.MFirmApply"%>
<%
	request.setAttribute("certificateTypeMap",IntegratedGlobal.getCertificateTypeMap());
%>
<script type="text/javascript">
	function showPic(pic){
		document.getElementById("pictureShowcs").style.display="none";
		if("${entity.type}"=="3"){
			document.getElementById("pictureShowos").style.display="none";
			document.getElementById("pictureShow").style.display="none";
		}else if("${entity.type}"=="1"){
			document.getElementById("yingYePic").style.display="none";
			document.getElementById("shuiWuPic").style.display="none";
			document.getElementById("zuZhiPic").style.display="none";
			document.getElementById("kaiHuPic").style.display="none";
		}
		document.getElementById(pic).style.display="";
	}
	function showXYS(){
		var url="${basePath}/trade/mfirm/forwordGetPicturesXYS.action?applyID=${entity.applyID}";
		showDialog(url, "", 600, 700);
	}
	function downtodesk(picture){
		var url="${basePath}/trade/mfirm/forwordDownPicturesToDesk.action?applyID=${entity.applyID}&picture="+picture;
		//showDialog(url, "", 600, 700);
		window.open(url, "", "", "");
	}
	function openbig(picture){
		var url="${basePath}/trade/mfirm/forwordOpenBigPic.action?applyID=${entity.applyID}&picture="+picture;
		showDialog(url, "", 600, 500);
	}
</script>
<table border="0" width="100%" align="center">
	<tr height="25"></tr>
	<tr>
		<td>
			<div class="div_tj">
				<table border="0" cellspacing="0" cellpadding="4" width="100%"
					align="center" class="table2_style">
					<tr height="20">
						<div class="div_cxtj">
							<div class="div_cxtjL"></div>
							<div class="div_cxtjC">
								基本信息
							</div>
							<div class="div_cxtjR"></div>
						</div>
						<div style="clear: both;"></div>
						<td align="right" >
							注册申请代码
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.applyID}">
						</td>
						<td align="right" >
							会员ID
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.brokerId}">
						</td>
					</tr>
					<tr>
						<td align="right" width="20%">
							<fmt:message key="MFirmApply.name" bundle="${PropsFieldDic}" />
							：
						</td>
						<td width="30%">
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.name}">
						</td>
						<td align="right" width="20%">
							<fmt:message key="MFirmApply.userId" bundle="${PropsFieldDic}" />
							：
						</td>
						<td width="*">
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.userID}">
						</td>
							<input type="hidden" class="input_text_pwdmin" readonly="readonly"
								value="${entity.password}">
					</tr>
					<tr>
						<td align="right">
							<fmt:message key="MFirmApply.fullName" bundle="${PropsFieldDic}" />
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.fullName}">
						</td>
						<td align="right">
							<fmt:message key="MFirmApply.type" bundle="${PropsFieldDic}" />
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly" id="type"
								value="${mfirmTypeMap[entity.type]}">
						</td>
					</tr>
					<tr>
						<td colspan="4" >
							<div id="content" style="display: none;">
								<table border="0" cellspacing="0" cellpadding="0"
									width="100%" height="60px;">
									<tr>
										<td align="right" width="20%">
											<fmt:message key="MFirm.industryCode" bundle="${PropsFieldDic}" />
											：&nbsp;&nbsp;
										</td>
										<td width="30%">
											<input type="text" id="industryCode" class="validate[custom[onlyLetterNumber],maxSize[16]] input_text_pwdmin" readonly="readonly"  name="entity.industryCode" 
												value="${entity.industryCode}" >
										</td>
										<td align="right" width="21%">
											<fmt:message key="MFirm.zoneCode" bundle="${PropsFieldDic}" />
											：&nbsp;&nbsp;
										</td>
										<td width="*">
											<input type="text" id="zoneCode" class="validate[custom[onlyLetterNumber],maxSize[16]] input_text_pwdmin" readonly="readonly"  name="entity.zoneCode" 
												value="${entity.zoneCode}" >
										</td>
									</tr> 
									<tr>
										<td align="right" >
											<fmt:message key="MFirm.organizationCode" bundle="${PropsFieldDic}" />
											：&nbsp;&nbsp;
										</td>
										<td >
											<input type="text" id="organizationCode" class="validate[custom[onlyLetterNumber],maxSize[9]] input_text_pwdmin" readonly="readonly"  name="entity.organizationCode" 
												value="${entity.organizationCode}" >&nbsp;
										</td>
										<td align="right" >
											<fmt:message key="MFirm.corporateRepresentative" bundle="${PropsFieldDic}" />
											：&nbsp;&nbsp;
										</td>
										<td width="*">
											<input type="text" id="corporateRepresentative" class="validate[custom[onlyLetterNumber],maxSize[32]] input_text_pwdmin" readonly="readonly"  name="entity.corporateRepresentative" 
												value="${entity.corporateRepresentative}" >
										</td>
									</tr> 
								</table>
						</td>
					</tr>
					</div>
					<tr>
						<td align="right">
							<fmt:message key="MFirmApply.certificateType" bundle="${PropsFieldDic}" />
							：
						</td>
						<td>
							<c:forEach var="map" items="${certificateTypeMap}">
								<c:if test="${map.key eq entity.certificateType }">
									<input type="text" class="input_text_pwdmin" readonly="readonly"
									value="${map.value}">
								</c:if>
							</c:forEach>
						</td>
						<td align="right">
							<fmt:message key="MFirmApply.certificateNO" bundle="${PropsFieldDic}" />
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.certificateNO}">
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div>
				<table border="0" cellspacing="0" cellpadding="4" width="100%"
					align="center" class="table2_style">
					<tr height="20">
						<div class="div_cxtj">
							<div class="div_cxtjL"></div>
							<div class="div_cxtjC">
								证件信息
							</div>
							<div class="div_cxtjR"></div>
						</div>
						<div style="clear: both;"></div>
					<tr>
						<td align="right">
							<span>
							<input type="button" style="color:#333fff" value="证件正面"
							onClick="showPic('pictureShowcs')"/>
							</span>
						</td>
						<c:if test="${entity.type eq '3'}">
						<td align="right" >
							<span>
							<input type="button" style="color:#333fff" value="证件反面"
							onClick="showPic('pictureShowos')"/>
							</span>
						</td>
						<td align="right" >
							<span>
							<input type="button" style="color:#333fff" value="银行卡正面"
							onClick="showPic('pictureShow')"/>
							</span>
						</td>
						</c:if>
						<c:if test="${entity.type eq '1'}">
						<td align="right" >
							<span>
							<input type="button" style="color:#333fff" value="营业执照"
							onClick="showPic('yingYePic')"/>
							</span>
						</td>
						<td align="right" >
							<span>
							<input type="button" style="color:#333fff" value="税务登记"
							onClick="showPic('shuiWuPic')"/>
							</span>
						</td>
						<td align="right" >
							<span>
							<input type="button" style="color:#333fff" value="机构代码"
							onClick="showPic('zuZhiPic')"/>
							</span>
						</td>
						<td align="right" >
							<span>
							<input type="button" style="color:#333fff" value="开户许可证"
							onClick="showPic('kaiHuPic')"/>
							</span>
						</td>
						</c:if>
						<td align="right" >
							<span>
							<input type="button" style="color:#333fff" value="入市协议书"
							onClick="showXYS()"/>
							</span>
						</td>
						<td width="*" colspan="1">&nbsp;</td>
					</tr>
					<tr align="center">
						<td colspan="7">
							<div align="center">
								<div id="pictureShowcs" style="display:none">
									<img width="190" height="130" src="${basePath}/trade/mfirm/forwordGetPictures.action?applyID=${entity.applyID}&picture=picturecs" onclick="openbig('picturecs')"/>
									<br/><input type="button" value="下载" onclick="downtodesk('picturecs')">
								</div>
								<c:if test="${entity.type eq '3'}">
									<div id="pictureShowos" style="display:none">
										<img width="190" height="130" src="${basePath}/trade/mfirm/forwordGetPictures.action?applyID=${entity.applyID}&picture=pictureos" onclick="openbig('pictureos')"/>
										<br/><input type="button" value="下载" onclick="downtodesk('pictureos')">
									</div>
									<div id="pictureShow" style="display:none">
										<img width="190" height="130" src="${basePath}/trade/mfirm/forwordGetPictures.action?applyID=${entity.applyID}&picture=picture" onclick="openbig('picture')"/>
										<br/><input type="button" value="下载" onclick="downtodesk('picture')">
									</div>
								</c:if>
								<c:if test="${entity.type eq '1'}">
									<div id="yingYePic" style="display:none">
										<img width="190" height="130" src="${basePath}/trade/mfirm/forwordGetPictures.action?applyID=${entity.applyID}&picture=yingYePic" onclick="openbig('yingYePic')"/>
										<br/><input type="button" value="下载" onclick="downtodesk('yingYePic')">
									</div>
									<div id="shuiWuPic" style="display:none">
										<img width="190" height="130" src="${basePath}/trade/mfirm/forwordGetPictures.action?applyID=${entity.applyID}&picture=shuiWuPic" onclick="openbig('shuiWuPic')"/>
										<br/><input type="button" value="下载" onclick="downtodesk('shuiWuPic')">
									</div>
									<div id="zuZhiPic" style="display:none">
										<img width="190" height="130" src="${basePath}/trade/mfirm/forwordGetPictures.action?applyID=${entity.applyID}&picture=zuZhiPic" onclick="openbig('zuZhiPic')"/>
										<br/><input type="button" value="下载" onclick="downtodesk('zuZhiPic')">
									</div>
									<div id="kaiHuPic" style="display:none">
										<img width="190" height="130" src="${basePath}/trade/mfirm/forwordGetPictures.action?applyID=${entity.applyID}&picture=kaiHuPic" onclick="openbig('kaiHuPic')"/>
										<br/><input type="button" value="下载" onclick="downtodesk('kaiHuPic')">
									</div>
								</c:if>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
		<tr>
		<td>
			<div class="div_tj">
				<table border="0" cellspacing="0" cellpadding="4" width="100%"
					align="center" class="table2_style">
					<tr height="20">
						<div class="div_cxtj">
							<div class="div_cxtjL"></div>
							<div class="div_cxtjC">
								联系信息
							</div>
							<div class="div_cxtjR"></div>
						</div>
						<div style="clear: both;"></div>
                    
					<tr>
						<td align="right" width="20%">
							<fmt:message key="MFirmApply.contactMan" bundle="${PropsFieldDic}" />
							：
						</td>
						<td width="30%">
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.contactMan}">
						</td>
						<td align="right" width="20%">
							<fmt:message key="MFirmApply.phone" bundle="${PropsFieldDic}" />
							：
						</td>
						<td width="*">
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.phone}">
						</td>
					</tr>
					<tr>
					    <td align="right">
							手机号码
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.mobile}">
						
						<td align="right">
							<fmt:message key="MFirmApply.fax" bundle="${PropsFieldDic}" />
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.fax}">
						</td>
					</tr>
					<tr>
					    <td align="right">
							<fmt:message key="MFirmApply.email" bundle="${PropsFieldDic}" />
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.email}">
						</td>
						<td align="right">
							邮编
							：
						</td>
						<td>
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.postcode}">
						</td>
					</tr>
					<tr>
						<td align="right" width="20%">
							<fmt:message key="MFirmApply.address" bundle="${PropsFieldDic}" />
							：
						</td>
						<td colspan="3" width="*">
							<input type="text" class="input_text_pwdmin" readonly="readonly"
								value="${entity.address}"  style="width: 300px;">
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="div_tj">
				<table border="0" cellspacing="0" cellpadding="4" width="100%"
					align="center" class="table2_style">
					<tr height="20">
						<div class="div_cxtj">
							<div class="div_cxtjL"></div>
							<div class="div_cxtjC">
								其他信息
							</div>
							<div class="div_cxtjR"></div>
						</div>
						<div style="clear: both;"></div>
						<td align="right" width="20%">
							<fmt:message key="MFirmApply.note" bundle="${PropsFieldDic}" />
							：
						</td>
						<td cols="3" wdith="30%">
							<textarea rows="3" cols="16" readonly="readonly" style="background-color:#EEEEEE; ">${entity.note }</textarea>
						</td>
						<td align="right" width="20%">
							<fmt:message key="MFirmApply.auditNote" bundle="${PropsFieldDic}" />
							：
						</td>
						<td cols="3" width="*">
							<textarea rows="3" cols="16" id="auditNote" <c:if test="${entity.status=='1'||entity.status=='2'}"> readonly="readonly"  style="background-color:#EEEEEE; "</c:if>   onchange="if(value.length><fmt:message key='auditNote' bundle='${PropsFieldLength}' />) value=value.substr(0,<fmt:message key='auditNote' bundle='${PropsFieldLength}' />)"  name="auditNote">${entity.auditNote }</textarea>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>