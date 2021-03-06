<%@ page contentType="text/html;charset=GBK" %>
<jsp:directive.page import="gnnt.MEBS.common.model.User"/>
<%@ include file="/common/public/common.jsp"%>
<script language="javascript">
		var rightMap=${sessionScope.rightMap};
</script>
<script type="text/javascript" src="<%=basePath%>/public/limit.js"
			defer="defer"></script>
<body class="st_body">
<head>
   <title>修改系统用户</title>
</head>
<OBJECT classid=clsid:0023145A-18C6-40C7-9C99-1DB6C3288C3A id="ePass" 
      STYLE="LEFT: 0px; TOP: 0px" width=0 height=0
      CODEBASE="GnntKey.cab#Version=1,0,0,5">
</OBJECT>
     <form name="frm" id="frm" method="post" targetType="hidden">
		<div style="overflow: auto; height: 255px;">
			<table border="0" width="98%" align="center">
				<tr>
					<td>
					<div class="st_title">&nbsp;&nbsp;<img src="<%=skinPath%>/cssimg/st_ico1.gif" align="absmiddle" />&nbsp;修改系统用户</div>
		<table border="0" cellspacing="0" cellpadding="0" width="90%" align="center" class="st_bor">
		  <tr height="35">
           	<td align="right" class="td_size" width="20%"> 用户代码 ：</td>
               <td align="left" colspan="2" width="40%" class="td_size">
               	${obj.userId }
               	<input class="from" type="hidden" id="userid" name="obj.userId" value="${obj.userId}">
               	<input class="from" type="hidden" name="obj.password" value="${obj.password}">
               	<input class="from" type="hidden" name="obj.skin" value="${obj.skin}">
               </td>
         </tr>
         <tr height="35">
			<td align="right" class="td_size" width="20%"> 用户名称 ：</td>
			<td align="left" width="40%" class="td_size">
				<input class="input_text" name="obj.name" id="name" type="text" 
				onblur="checkName('name');"	onfocus="myfocus('name')"
				class="text" value="${obj.name}"><strong class="check_input">&nbsp;*</strong>
			</td>
			<td><div id="name_vTip"></div></td>
		  </tr>
		  <tr height="35">
			<td align="right" class="td_size"> 是否禁用 ：</td>
			<td align="left" class="td_size">
				<select name="obj.isForbid" id="isForbid" class="select_widmid">
					<option value="">请选择</option>
					<option value="Y">禁用</option>
					<option value="N">不禁用</option>
				</select>
				<script type="text/javascript">
					document.getElementById("isForbid").value = "${obj.isForbid }";
				</script>
			</td>
		   </tr>
		  
		  <c:set var="codeValue" value="0123456789ABCDE"/> 
		  <c:choose>
		  <c:when test="${obj.keyCode != '0123456789ABCDE'}">
	           <tr height="35">
	            	<td align="right"> 是否启用key ：</td>
	                <td align="left">
	                	<input type="radio" name="enableKey" value="Y" checked="checked" onClick="onSelect(this.value)">启用
	                	<input type="radio" name="enableKey" value="N" onClick="onSelect(this.value)">不启用
	                </td>
	                <td>
						<div></div>
					</td>
	           </tr>
	  		   <tr id="showTr" style="">
            	<td align="right"> key ：</td>
                <td align="left">
                    <input type="text" id="keyCode" name="obj.keyCode" value="${obj.keyCode }" style="width: 150px;">
                    <button class="btn_sec" name="key" type="button" onclick="addKey()">绑定key</button>
                </td>
                <td>
					<div></div>
				</td>
              </tr>
         </c:when>
         <c:otherwise>
         	<tr height="35">
            	<td align="right"> 是否启用key ：</td>
                <td align="left">
                	<input type="radio" name="enableKey" value="Y" onClick="onSelect(this.value)">启用
                	<input type="radio" name="enableKey" value="N" checked="checked" onClick="onSelect(this.value)">不启用
                </td>
                <td>
					<div></div>
				</td>
            </tr>
			<tr id="showTr" style="display: none">
            	<td align="right"> key ：<br></td>
                <td align="left"><input type="text" id="keyCode" name="obj.keyCode" value="0123456789ABCDE" style="width: 150px;">
                    <button class="btn_sec" name="key" type="button" onclick="addKey()">绑定key</button>
                <br></td>
                <td>
                <div></div>
				</td>
             </tr>					
         </c:otherwise>
		 </c:choose>
		  
		  
		  
		  <tr height="35">
			<td align="right" class="td_size"> 用户描述 ：</td>
			<td align="left">
				<textarea name="obj.description" id="description" cols="20" rows="5"
				onblur="myblur('description');"	onfocus="myfocus('description')"
				 class="normal">${obj.description }</textarea>
			</td>
			<td><div id="description_vTip"></div></td>
		   </tr>
		   <tr><td colspan="3" height="5"></td></tr>
       </table>
       </td>
       </tr>
       </table>
       </div>
       <div class="tab_pad">
	 <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
		  <tr height="35">
			<td align="center" id="tdId">
				<button  class="btn_sec" onClick="updateUser()" id="update">修改</button>
           </td>
			<td align="center">
				<button  class="btn_sec" onClick="window.close()">关闭</button></td>
		  </tr>
	 </table>
	 </div>
</form>
</body>
<script language="javascript" src="<%=serverPath %>/public/jslib/isReadOnly.js"></script>
<SCRIPT LANGUAGE="JavaScript">
var reg =/^\w*DEFAULT_+\w*$/; 
var id='${obj.type}';
var userId='${obj.userId}';
if(id.match(reg)!=null||userId==currenUserId){
	var tableTd=document.getElementById("tdId");
	tableTd.style.display="none";
	var regexTests = document.getElementsByTagName("input");
	var len = regexTests.length;
	for (i = 0; i < len; i++) {
		regexTests[i].readOnly = 'readOnly';
	}
	var regexselect = document.getElementsByTagName("select");
	var len2 = regexselect.length;
	for (i = 0; i < len2; i++) {
		regexselect[i].disabled='disabled';
	}
	var regexText = document.getElementsByTagName("textarea");
	var len3 = regexText.length;
	for (i = 0; i < len3; i++) {
		regexText[i].readOnly='readOnly';
	}
}
	function myblur(userID) {
		var flag = true;
		if ("description" == userID) {
			flag = description(userID);
		} else {
			if (!checkName("name")) {
				flag = false;
			}
			if (!description("description")) {
				flag = false;
			}
		}
		return flag;
	}
	function checkName(userID){
		var innerHTML = "";
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (isEmpty(user.value + "")) {
			innerHTML = "不能为空";
		} else {
			if (user.value.length > 32) {
			innerHTML = "长度应不超过32位";
			flag = false;
			}else if(!isStr(user.value,true,null)){
			innerHTML = "含有不合法字符";
		}else {
			innerHTML = "";
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
	}
	
	function description(userID) {
		var innerHTML = "";
		var user = document.getElementById(userID);
		var vTip = document.getElementById(userID + "_vTip");
		var flag = false;
		if (user.value.length > 64) {
			innerHTML = "长度应不超过64位";
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
		/*var vTip = document.getElementById(userID + '_vTip');
		var innerHTML = "";
		if ('minRiskFund' == userID) {
			innerHTML = "不能为空";
		}
		vTip.innerHTML = innerHTML;
		vTip.className = "onFocus";*/
	}

function updateUser()
{
	var flag = myblur("all");
	if(frm.enableKey[0].checked && frm.keyCode.value == '')
	{
		alert("请输入key值！");
		frm.keyCode.focus();
		return false;
	}
	if(!frm.enableKey[0].checked)
	{
		frm.keyCode.value = "0123456789ABCDE";
	}
	if(!flag){
		return false;
	}
	var usernamelen = getLength(document.getElementById("name").value);
	var descriptionlen = getLength(document.getElementById("description").value);
	var mark = true;
	var sign = false;
	if(usernamelen>32 || descriptionlen>64){
		mark = false;
		alert("您提交的数据长度过大。\n请保证用户姓名长度不超过32，备注长度不超过64。");
	}
	if(frm.name.value == "") {
		alert("姓名不能为空！");
		frm.name.focus();
		return false;
	}
	if(frm.isForbid.value == "") {
		alert("是否禁用不能为空！");
		frm.isForbid.focus();
		return false;
	}
	if(mark){			
		if(userConfirm()){
			sign = true;
		  }else{
			return false;
		  }
	}
	//防止重复提交
	if(sign){
			frm.action = "<%=basePath%>/user/update.action";
			frm.submit();
		}
}


//求混合字符串长度
function getLength(v){
	
	var vlen = 0;
	var str = v.split("");
	for( var a=0 ; a<str.length ; a++)
	{
		if (str[a].charCodeAt(0)<299){ 
			vlen++;
		}else{
			vlen+=2;
		}
	}
	return vlen;
}

     //设置key选项 showTr
   function onSelect(value)
		{
		   if(value=='Y')
		   {
		   		document.getElementById("showTr").style.display='';
		   }
		   else
		   {
		     document.getElementById("showTr").style.display='none';
		   }
		}
		
function addKey()
{
  var str1 = "";
  var errorCode = 0;
  var ifInstalled = true;
  var traderId=document.getElementById("userid").value;
  try
  {

    str1 = ePass.VerifyUser(<%=marketId%>,traderId);	
  }
  catch(err)
  {
    ifInstalled = false;														
  }	
  if(isNaN(str1))
  {
  }
  else
  {
    ifInstalled = true;
    errorCode = parseInt(str1);
    if(errorCode==-10)
    {
      alert("USB身份验证盘驱动程序错误！");	
    }else if (errorCode==-1)
    {
      alert("请插入USB身份验证盘！");	
    }else if (errorCode==-2)
    {
      alert("非法USB身份验证盘！");	
    }else if (errorCode==-3)
    {
      alert("USB身份验证盘不正确");	
    }else if (errorCode==-4)
    {
      alert("USB身份验证盘已经损坏，请联系发放者！");	
    }
  }
  if(!ifInstalled)
  {
    alert("请安装安全控件！");	
    return false;	
  }
  else
  {	   
    if(errorCode==0)
    {
        frm.keyCode.value = str1;	
    }else
    {
        return false;	
    }			
  }
}

</SCRIPT>
<%@ include file="/public/footInc.jsp"%>
