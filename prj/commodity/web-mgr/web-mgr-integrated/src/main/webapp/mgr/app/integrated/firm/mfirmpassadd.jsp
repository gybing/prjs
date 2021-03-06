<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>

<html>
	<head>
		<title>交易商添加</title>
	</head>

	<link rel="stylesheet"
		href="${skinPath }/css/validationengine/validationEngine.jquery.css"
		type="text/css" />
	<link rel="stylesheet"
		href="${skinPath }/css/validationengine/template.css" type="text/css" />
	<script src="${publicPath }/js/jquery-1.6.min.js"
		type="text/javascript">

</script>
	<script
		src="${basePath }/mgr/app/integrated/js/jquery.validationEngine-zh_CN.js"
		type="text/javascript" charset="GBK">

</script>
	<script
		src="${publicPath }/js/validationengine/jquery.validationEngine.js"
		type="text/javascript" charset="GBK">

</script>
	<script>
jQuery(document).ready(function() {
	//frontIsNeedKey：Y表示前台管理启用key 
	<%if(Global.getMarketInfoMap().get("frontIsNeedKey").equals("Y") 
			&& Global.getMarketInfoMap().get("marketNO") != null 
			&& !"0".equals(Global.getMarketInfoMap().get("marketNO"))){%>
		$("#frontIsNeedKeyCode").css("display","block");
	<%}%>
	if ("" != '${ReturnValue.info}' + "") {
		parent.document.frames('leftFrame').location.reload();
	}

	jQuery("#frm").validationEngine( {
		relative:true,
		ajaxFormValidation : true,
		ajaxFormValidationURL : "../../ajaxcheck/checkFirmForm.action",
		onAjaxFormComplete : ajaxValidationCallback,
		onBeforeAjaxFormValidation : beforeCall
	});

	
	function beforeCall(form, options) {
		return true;
	}

	// Called once the server replies to the ajax form validation request
		function ajaxValidationCallback(status, form, json, options) {
			if (status === true) {
				var vaild = affirm("您确定要操作吗？");
				if (vaild == true) {
					form.validationEngine('detach');
					//$('#frm').attr('action', 'action');
					$('#frm').submit();
				}
			}
		}

		$("#add").click(function(check) {
			if ($("#frm").validationEngine('validateform')) {
			}
		});
	});
function pimg(id) {
	return document.getElementById(id);
}
function onfo(id) {
	pimg(id).className = "";
}
function none(id) {
	pimg(id).className = "";
}
function checkUserId(){
	var userId =$("#username").val();
	if(!isStr(userId,true)){
		return "*包含非法字符";
	}
}
function checkKey(inp){
	if(inp.checked){
		document.getElementById("showkey").style.display="";
		var m = initKeyCode('<%=Global.getMarketInfoMap().get("marketNO") %>',document.getElementById("id").value,frm);
		if(!m.passed){
			alert(m.msg);
			document.getElementById("kcodech").checked = false;
			checkKey(document.getElementById("kcodech"));
		}
		document.getElementById("enableKey").value="Y";
	}else{
		document.getElementById("showkey").style.display="none";
		document.getElementById("kcode").value="0123456789ABCDE";
		document.getElementById("enableKey").value="N";
	}
}
function selectall(flag){
	if(flag=='0'){
		$("input[name='checkbox']").attr("checked","true");
		$("#selectall").val('1');
	}else{
		$("input[name='checkbox']").attr("checked","false");
		$("#selectall").val('0');
	}
}
</script>
	<body style="" onload="getHidden()">
		<form id="frm" name="frm"
			action="${basePath}/trade/mfirm/auditPass.action" method="post"
			targetType="hidden">
			<input type="hidden" name="applyID"
				value="${entity.applyID }">
			<input type="hidden" name="createTime" value="${entity.createTime }">
			<input type="hidden" name="auditNote" value="${auditNote }">
			<div class="div_cx"  style="overflow:auto;height:480px;" >
				<table border="0" width="85%" align="center">
					<tr>
						<td>
							<%@include file="mfirmpasscommon.jsp"%>
						</td>
						<!-- 当交易商类型为'个人的时候',隐藏地域编号、行业编号、组织结构代码和法人代表 -->
							<script type="text/javascript">
								function getHidden(){
									var type=document.getElementById("type").value;
									var content=document.getElementById("content");
									if(type ==3){
										content.style.display = "none";
									}else{
										content.style.display = "block";
									}
								}
								function reduceValue(type){
								if(type==3){
									//当交易商类型为个人时，防止之前输入的域编号、行业编号、组织结构代码和法人代表的值录入
									$("#zoneCode").attr("value","");
									$("#industryCode").attr("value","");
									$("#organizationCode").attr("value","");
									$("#corporateRepresentative").attr("value","");
								}else{
									$("#zoneCode").attr("value","${entity.zoneCode}");
									$("#industryCode").attr("value","${entity.industryCode}");
									$("#organizationCode").attr("value","${entity.organizationCode}");
									$("#corporateRepresentative").attr("value","${entity.corporateRepresentative}");
								}
							}
							</script>
					</tr>
				</table>
			</div>
			<div width="5%">
				<table>
					<tr height="15">
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<div class="tab_pad" width="10%">
				<table border="0" cellspacing="0" cellpadding="4" width="100%"
					align="center">
					<tr>
						<td align="right">
							<rightButton:rightButton name="添加" onclick="" className="btn_sec"
								action="/trade/mfirm/auditPass.action" id="add"></rightButton:rightButton>
							&nbsp;&nbsp;
							<button class="btn_sec" onClick=window.close();>
								关闭
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
<script type="text/javascript" src="${basePath}/mgr/public/js/keycode.js"></script>
<%@ include file="/mgr/public/jsp/footinc.jsp"%>