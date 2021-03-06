<%@ page contentType="text/html;charset=GBK"%>
<% request.setAttribute("pageTitle","用户注册");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" flush="false"></jsp:include>
<%@ include file="/front/public/includefiles/allIncludeFiles.jsp"%>
<link href="${skinPath}/css/mgr/memberadmin/module.css" rel="stylesheet" type="text/css" />
<script src="${publicPath }/js/jquery-1.6.min.js" type="text/javascript"></script>
<script src="${publicPath }/js/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="GBK"></script>
<script src="${publicPath }/js/validationengine/jquery.validationEngine.js" type="text/javascript" charset="GBK"></script>
<script type="text/javascript" src="${publicPath}/js/autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${publicPath}/js/PasswordMode.js"></script>
<script>
jQuery(document).ready(function() {
	jQuery("#registfrm").validationEngine({
		ajaxFormValidation : true,
		ajaxFormValidationURL : "../../checkneedless/commoncheck/checkFirmApplyForm.action?t="+Math.random(),
		onAjaxFormComplete : ajaxValidationCallback,
		onBeforeAjaxFormValidation : beforeCall
	});
	//提交前事件
	function beforeCall(form, options) {
		return true;
	}
	//提交后事件
	function ajaxValidationCallback(status, form, json, options) {
		//如果返回成功
		if (status === true) {
			if (!$("#agree").is(":checked")) {
				alert("请您先同意我们的条款");
			}else{
				var vaild = affirm("您确定要操作吗？");
				if(vaild){
					//注册信息URL
					var registerUrl = $("#register").attr("action");
					//全URL路径
					var url = "${basePath}"+registerUrl;
					$("#registfrm").attr("action",url);
					registfrm.submit();
				}
				
			}
			
		}
	}
	//设置提交的点击事件
	$("#register").click(function(check) {
		if ($("#registfrm").validationEngine('validateform')) {
		}
	});
});
//清空验证码值
function clearValue(){
	document.getElementById("imgcode").value="";
}
//显示颜色  
function pwStrength(pwd){
	PasswordMode.pwStrength(pwd,"strength_L","strength_M","strength_H");
	return;
}

//更换验证码图片
function changeregistimg(id) {
	document.getElementById("verifycode").src = "${publicPath}/jsp/loginimage.jsp?"+ Math.random();
}

function onlyLetterNumber(ch,vec){
	var s = this.value;
	var china = "";
	var strs = "";
	if(ch){
		china = "\\u4e00-\\u9fa5";
	}
	if(vec){
		for(var i=0;i<vec.length;i++){
			strs += "|\\"+vec[i];
		}
	}
	var matchs='\^[0-9A-Za-z'+china+strs+']{1,}\$';
	var patrn = new RegExp(matchs,"ig");
	if (patrn.exec(s)) {
		return true ;
	}
	return false;
}
//回调函数
function showMsgBoxCallbak(result,msg){
	if(result==1){
		window.location.href="${basePath}";
	}else{
		//输入的验证码值与系统生成的值不一样时，更新系统生成的验证码值
		changeregistimg();
		//清楚限制连续点击事件
		clearSubmitCount();
		//清空验证码输入值
		clearValue();
	}
}

//当交易商类型为'个人的时候',隐藏地域编号、行业编号、组织结构代码和法人代表
	function getHidden(type){
		if(type !=3){
			$("#content").css("display","block");
		}else{
			$("#content").css("display","none");
		}
	}

	function get(id){
		return document.getElementById(id);
	}
	function checkUserId(){
		var userId =$("#userID").val();
		if(!isStr(userId,true)){
			return "*包含非法字符";
		}
		
	}
	/**
 * 判断是否包含特殊字符 s 被验证的字符串 ch true汉字不算特殊字符串，false 汉字算是字符串 vec 特殊字符数组，包含在数组中的不算特殊字符
 * true 不包含特殊字符 false 包含特殊字符
 */
	function isStr(s,ch,vec){
	if(isEmpty(s)){
		return true;
	}
	var china = "";
	var strs = "";
	if(ch){
		china = "\\u4e00-\\u9fa5";
	}
	if(vec != null){
		for(var i=0;i<vec.length;i++){
			strs += "|\\"+vec[i];
		}
	}
	var matchs='\^[0-9A-Za-z'+china+strs+']{1,}\$';
	var patrn = new RegExp(matchs,"ig");
	if (patrn.exec(s)) {
		return true ;
	}
	return false;
}
	/**
 * 判断是否为空字符串
 */
	function isEmpty(s){
		if(mytrim(s+'').length<=0){
			return true;
		}
		return false;
	}
	function mytrim(s){
		return s.replace(/(^\s*)|(\s*$)/g, "");
	}
</script>
<!-------------------------State Begin------------------------->
<div class="state stateBg">
	<div class="step">
		注册步骤：
		<span>1.填写注册信息……</span> 2.注册成功 3.后台审核成功后指定用于登录的交易员代码，再通过电话或其他联系方式通知注册用户。
	</div>
</div>

<!-------------------------State End------------------------->
<!-------------------------Body Begin------------------------->
<div class="clear"></div>
<iframe  name="hiddenframe" width=0 height=0  application='yes'></iframe>
<form id="registfrm" action="<%=basePath%>/checkneedless/firmapply/register.action" method="post" target="hiddenframe">
	<div class="bodyStep2">
		<!-------------------------↓设置帐户信息------------------------->
		<h3>设置帐户信息↓</h3><div class="step2R">
			<em>*</em><font style="font-weight: bold;font-size: 13px;color:darkorange;">为必填项</font>
		</div>
		<div class="clear"></div>
		<fieldset>
			<input id="createTime" type="hidden" name="entity.createTime" value="" />
			<input id="status" type="hidden" name="entity.status" value="0" />
			
			<div>
				<label width="25%" align="center">用户名：</label>
				<label width="35%">
					<input id="userID" name="entity.userID" class="validate[required,funcCall[checkUserId],maxSize[16],ajax[checknoUserID]] datepicker" data-prompt-position="topLeft:0,8"/><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">密码：</label>
				<label width="35%">
					<input id="password" name="entity.password" type="password" class="validate[required,minSize[6],maxSize[32]]" onKeyUp="pwStrength(this.value);" onblur="pwStrength(this.value)" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false"/><em>*</em>
				</label>
			</div>
			<div>
				<label class="fontSize">密码强度：</label>
				<label width="35%">
					<table width="210" border="0" cellspacing="0" cellpadding="0" bordercolor="#eeeeee" height="15" style='display:inline'>  
						<tr align="center" bgcolor="#f5f5f5">  
							<td width="33%" id="strength_L" class="fontSize">弱</td>  
							<td width="33%" id="strength_M" class="fontSize">中</td>  
							<td width="33%" id="strength_H" class="fontSize">强</td>  
						</tr>
					</table>
				</label>
			</div>
			<div>
				<label width="25%">
					确认密码：
				</label>
				<label  width="35%">
					<input id="password1" type="password" class="validate[required,equals[password]]" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" data-prompt-position="topLeft:0,8"/><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">交易商名称：</label>
				<label width="35%">
					<input id="name" name="entity.name" class="validate[required,maxSize[16]]"/><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">交易商全称：</label>
				<label width="35%">
					<input id="fullName" name="entity.fullName" class="validate[maxSize[64]]"/><em>&nbsp;&nbsp;</em>
				</label>
			</div>
			<div>
				<label width="25%">交易商类型：</label>
				<label style="width: 143px;">
				<select id="type" class="validate[required] input_text" name="entity.type" onchange="getHidden(this.value)" onclick="reduceValue(this.value)" style="width: 131px;">
								<option value="" >请选择</option>
								<c:forEach var="type" items="${com_firmTypeMap}" varStatus="status">
									<option id="type${type.key}" value="${type.key}" name="entity.type" title='${type.key}'
										<c:if  test="${entity.type==type.key }">selected="selected"</c:if>>
										${type.value}
									</option>
								</c:forEach>
				</select><em>*</em>
				</label>
				<script>
					function reduceValue(type){
						if(type==3){
							//当交易商类型为个人时，防止之前输入的域编号、行业编号、组织结构代码和法人代表的值录入
							$("#zoneCode").attr("value","");
							$("#industryCode").attr("value","");
							$("#organizationCode").attr("value","");
							$("#corporateRepresentative").attr("value","");
						}
					}
				</script>
			</div>
			<div id="content" style="display: block;">
				<label width="25%">所属地域：</label>
				<label width="35%">
					<select id="zoneCode" class="validate[maxSize[16]] input_text" name="entity.zoneCode"  style="width: 131px; data-prompt-position="topLeft:0,8">
					<option value="">请选择</option>
						<c:forEach var="zone" items="${zoneList}">
							<c:if test="${zone.isvisibal eq 'Y'}">
							<option value="${zone.code}">${zone.name}</option>
							</c:if>
						</c:forEach>
					</select><em>&nbsp;&nbsp;</em>
				</label>
				<div>
					<label width="25%">所属行业：</label>
					<label width="35%">
						<select id="industryCode" class="validate[maxSize[16]] input_text" name="entity.industryCode"  style="width: 131px; data-prompt-position="topLeft:0,8">
							<option value="">请选择</option>
							<c:forEach var="industry" items="${industryList}">
								<c:if test="${industry.isvisibal eq 'Y'}">
								<option value="${industry.code}">${industry.name}</option>
								</c:if>
							</c:forEach>
						</select><em>&nbsp;&nbsp;</em>
					</label>	
			    </div>
				<div>
				<label width="25%">组织机构代码：</label>
				<label width="35%">
					<input id="organizationCode" type="text" class="validate[required,custom[onlyLetterNumber],maxSize[9]]" name="entity.organizationCode" value="${entity.organizationCode}"/><em>*</em>
				</label>	
			</div>
				<div>
				<label width="25%">法人代表：</label>
				<label width="35%">
					<input id="corporateRepresentative" class="validate[maxSize[16]]" name="entity.corporateRepresentative"/><em>&nbsp;&nbsp;</em>
				</label>	
			</div>
			</div>
			<div>
				<label widht="25%">证件类型：</label>
				<label style="width: 143px;">
					<select id="certificateType" class="validate[required] input_text" name="entity.certificate.code"  style="width: 131px; data-prompt-position="topLeft:0,8">
					<option value="">请选择</option>
						<c:forEach var="certificate" items="${certificateTypeList}">
							<c:if test="${certificate.isvisibal eq 'Y'}">
							<option value="${certificate.code}">${certificate.name}</option>
							</c:if>
						</c:forEach>
					</select><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">证件编号：</label>
				<label width="35%">
					<input id="certificateNO" name="entity.certificateNO" class="validate[required,custom[onlyLetterNumber],maxSize[32]]" data-prompt-position="topLeft:0,8"/><em>*</em>
				</label>
			</div>
		</fieldset>
		<!-------------------------↓填写联系方式------------------------->
		<h3>填写联系方式↓</h3>
		<fieldset>
			<div>
				<label width="25%">联系人：</label>
				<label width="35%">
					<input id="contactMan" class="validate[required,maxSize[16]]" name="entity.contactMan"/><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">联系地址：</label>
				<label width="35%">
					<input id="address" name="entity.address" class="validate[required,maxSize[64]]" data-prompt-position="topLeft:0,8"/><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">手机号码：</label>
				<label width="35%">
					<input id="mobile" class="validate[required,maxSize[12],custom[mobile]]" name="entity.mobile"/><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">电子邮箱：</label>
				<label width="35%">
					<input id="email" class="validate[required,custom[email],maxSize[64]]" name="entity.email" data-prompt-position="bottomLeft:0,-3"/><em>*</em>
				</label>
			</div>
			<div>
				<label width="25%">电话：</label>
				<label width="35%">
					<input id="phone" class="validate[phone,maxSize[32]]" name="entity.phone" data-prompt-position="centerRight:5"/><em>&nbsp;&nbsp;</em>
				</label>
			</div>
			<div>
				<label width="25%">传真：</label>
				<label width="35%">
					<input id="fax" name="entity.fax" class="validate[custom[fax],maxSize[16]]"/><em>&nbsp;&nbsp;</em>
				</label>
			</div>
			<div>
				<label width="25%">邮编：</label>
				<label width="35%">
					<input id="postcode" class="validate[custom[onlyNumberSp],maxSize[10]]"  name="entity.postcode"/><em>&nbsp;&nbsp;</em>
				</label>
			</div>
			<div>
				<label width="25%" for="valclassate">验证码：</label>
				<label style="width: 143px;">
				    <input id="imgcode" name="imgcode" type="text" class="validate[required] imgcode"/><em>*</em>
				</label>
				<img id="verifycode" src="${publicPath}/jsp/loginimage.jsp"
					width="90" height="20" align="absmiddle" />
				<a href="#" onclick= "changeregistimg(id); return false;">看不清？</a>
			</div>
		</fieldset>
		<fieldset>
			
		</fieldset>
		<!-------------------------↓提交------------------------->
		<h3></h3>
		<div class="center">
			<a href="#" class="link_red_12_">
				<span class="label">
					<input id="agree" name="take2" class="take" type="checkbox" checked="checked"/>
				</span>同意服务条款及交易规则 点此阅读服务条款
			</a>
		</div>
		<div class="center">
			<input id="register" type="button" class="button" action="/checkneedless/firmapply/register.action" value="提交注册信息" />
		</div>
	</div>
</form>
<!-------------------------Body End------------------------->
<jsp:include page="/front/frame/footer.jsp" flush="false"></jsp:include>
<%@include file="/front/public/jsp/commonmsg.jsp"%>