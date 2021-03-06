<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../public/common.jsp"%>
<html>
  <head>
    <base target="_self">
    <title>设置角色权限</title>
  </head>
<c:if test="${not empty modSuccess }">
	<script>
		window.returnValue=1;
		window.close();
	</script>
</c:if>
<style>
.cls
{
	display:none;
}
.opn
{
	display:;
}
</style>
  <body>
    <form name="frm" method="post">
		<fieldset width="100%">
		<legend>设置角色权限</legend>
		<BR>
		<span>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">			  
				<tr height="35">
            		<td align="" width="20%">
            			角色代码：${role.id }<input name="roleId" type="hidden" value="${role.id }">
            		</td>               
				</tr>
				<tr height="35">
				<td align="left">
				
				<!-- 权限根节点 -->
				<div id=div_ck class=opn>&nbsp;&nbsp;
				<c:set var="roleDispatchMark" value="false"/>
				<c:forEach items="${role.rightSet }" var="roleRight">
					<c:if test="${roleRight.id == treeRight.id }">
						<c:set var="roleDispatchMark" value="true"/>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${roleDispatchMark }">
						<input type="checkbox" id="main" name="ck" checked="checked" onclick="selectCks('${treeRight.id }');setParents('${treeRight.right.id }');" value="${treeRight.id }">
						<span style="font-weight: bold;cursor:hand;text-decoration: underline;" onclick="clkDiv('${treeRight.id }')">${treeRight.name }</span>
					</c:when>
					<c:otherwise>
						<input type="checkbox"  id="main"   name="ck" onclick="selectCks('${treeRight.id }');setParents('${treeRight.right.id }');" value="${treeRight.id }">
						<span onclick="clkDiv('${treeRight.id }')">${treeRight.name }</span>
					</c:otherwise>
				</c:choose>
				<input type=hidden name="pid" value="${treeRight.right.id }">
				<input type="hidden" name="div_st" value="1"><br></div>
				
				<!-- 模块权限 -->
				<c:forEach items="${treeRight.rightSet }" var="moduleRight">
					<c:set var="roleDispatchModuleMark" value="false"/>
					<c:forEach items="${role.rightSet }" var="roleRight">
						<c:if test="${roleRight.id == moduleRight.id }">
							<c:set var="roleDispatchModuleMark" value="true"/>
						</c:if>
					</c:forEach>
					<div id=div_ck class=opn>&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:choose>
						<c:when test="${roleDispatchModuleMark }">
							<input type="checkbox"  name="ck" checked="checked" onclick="selectCks('${moduleRight.id }');setParents('${moduleRight.right.id }');" value="${moduleRight.id }">
							<span style="font-weight: bold;cursor:hand;text-decoration: underline;" onclick="clkDiv('${moduleRight.id }')">${moduleRight.name }</span>
						</c:when>
						<c:otherwise>
							<input type="checkbox"  name="ck" onclick="selectCks('${moduleRight.id }');setParents('${moduleRight.right.id }');" value="${moduleRight.id }">
					        <span onclick="clkDiv('${moduleRight.id }')">${moduleRight.name }</span>
						</c:otherwise>
					</c:choose>
					<input type=hidden name="pid" value="${moduleRight.right.id }">
					<input type="hidden" name="div_st" value="1"><br></div>
				
					<!-- 一级菜单权限 -->
					<c:forEach items="${moduleRight.rightSet }" var="menuRight">
						<c:set var="roleDispatchMenuMark" value="false"/>
						<c:forEach items="${role.rightSet }" var="roleRight">
							<c:if test="${roleRight.id == menuRight.id }">
								<c:set var="roleDispatchMenuMark" value="true"/>
							</c:if>
						</c:forEach>
						<div id=div_ck class=opn>&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:choose>
							<c:when test="${roleDispatchMenuMark }">
								<input type="checkbox"  name="ck" checked="checked" onclick="selectCks('${menuRight.id }');setParents('${menuRight.right.id }');" value="${menuRight.id }">
								<span style="font-weight: bold;cursor:hand;text-decoration: underline;" onclick="clkDiv('${menuRight.id }')">${menuRight.name }</span>
							</c:when>
							<c:otherwise>
								<input type="checkbox"  name="ck" onclick="selectCks('${menuRight.id }');setParents('${menuRight.right.id }');" value="${menuRight.id }">
						<span onclick="clkDiv('${menuRight.id }')">${menuRight.name }</span>
							</c:otherwise>
						</c:choose>
						<input type=hidden name="pid" value="${menuRight.right.id }">
						<input type="hidden" name="div_st" value="1"><br></div>
					
						<!-- 二级菜单权限 -->
						<c:forEach items="${menuRight.rightSet }" var="childMenuRight">
							<c:set var="roleDispatchChildMenuMark" value="false"/>
							<c:forEach items="${role.rightSet }" var="roleRight">
								<c:if test="${roleRight.id == childMenuRight.id }">
									<c:set var="roleDispatchChildMenuMark" value="true"/>
								</c:if>
							</c:forEach>
							<div id=div_ck class=opn>&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test="${roleDispatchChildMenuMark }">
									<input type="checkbox"  name="ck" checked="checked" onclick="selectCks('${childMenuRight.id }');setParents('${childMenuRight.right.id }');" value="${childMenuRight.id }">
									<span style="font-weight: bold;cursor:hand;text-decoration: underline;" onclick="clkDiv('${childMenuRight.id }')">${childMenuRight.name }</span>
								</c:when>
								<c:otherwise>
									<input type="checkbox"  name="ck" onclick="selectCks('${childMenuRight.id }');setParents('${childMenuRight.right.id }');" value="${childMenuRight.id }">
									<span onclick="clkDiv('${childMenuRight.id }')">${childMenuRight.name }</span>
								</c:otherwise>
							</c:choose>
							<input type=hidden name="pid" value="${childMenuRight.right.id }">
							<input type="hidden" name="div_st" value="1"><br></div>
							
							<!-- 按钮级权限 -->
							<c:forEach items="${childMenuRight.rightSet }" var="buttonRight">
								<c:set var="roleDispatchButtonMark" value="false"/>
								<c:forEach items="${role.rightSet }" var="roleRight">
									<c:if test="${roleRight.id == buttonRight.id }">
										<c:set var="roleDispatchButtonMark" value="true"/>
									</c:if>
								</c:forEach>
								<div id=div_ck class=opn>&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${roleDispatchButtonMark }">
										<input type="checkbox"  name="ck" checked="checked" onclick="selectCks('${buttonRight.id }');setParents('${buttonRight.right.id }');" value="${buttonRight.id }">
										<span style="font-weight: bold;cursor:hand;text-decoration: underline;" onclick="clkDiv('${buttonRight.id }')">${buttonRight.name }</span>
									</c:when>
									<c:otherwise>
										<input type="checkbox"  name="ck" onclick="selectCks('${buttonRight.id }');setParents('${buttonRight.right.id }');" value="${buttonRight.id }">
										<span onclick="clkDiv('${buttonRight.id }')">${buttonRight.name }</span>
									</c:otherwise>
								</c:choose>
								<input type=hidden name="pid" value="${buttonRight.right.id }">
								<input type="hidden" name="div_st" value="1"><br></div>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</c:forEach>
			</td>
		</tr>
	</table>
	<BR>
    </span>
</fieldset>
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
	  <tr height="35">
		<td width="40%"><div align="center">
		  <input type="button" name="btn" onclick="return frmChk()" class="btn" value="保存">&nbsp;&nbsp;
		  <input name="cls" type="button" onclick="window.close()" class="btn" value="关闭">&nbsp;&nbsp;
		</div></td>
	    </tr>
	  </table>  
    </form>
  </body>
</html>
<SCRIPT LANGUAGE="JavaScript">
<!--
var cks = document.all("ck");//记录所有权限id
var pids = document.all("pid");//记录父权限id
var div_cks = document.all("div_ck");
var div_sts = document.all("div_st");

function selectCks(id)
{
	if(isLastNode(id))
	{
		return;
	}
	for(var i =0;i < cks.length;i++)
	{
		if(pids[i].value == id)
		{
			cks[i].checked = event.srcElement.checked;
			selectCks(cks[i].value);
		}
	}
}

function clkDiv(id)
{
	for(var i =0;i < cks.length;i++)
	{
		if(cks[i].value == id)
		{
			if(div_sts[i].value == 0)
			{
				div_sts[i].value = 1;
				
				if(isRootNode(id))
				{
					openDiv1(id);
				}
				else
				{
					openDiv(id);
				}		
				
				break;
			}
			else
			{
				div_sts[i].value = 0;
				clsDiv(id);
				break;
			}			
		}
	}
}

function openDiv(id)
{
	if(isLastNode(id))
	{
		return;
	}
	for(var i =0;i < cks.length;i++)
	{
		if(pids[i].value == id)
		{
			div_cks[i].className = "opn";
			div_sts[i].value = 1;
			openDiv(cks[i].value);
		}
	}
}

function openDiv1(id)
{		
	for(var i =0;i < cks.length;i++)
	{
		if(pids[i].value == id)
		{
			div_cks[i].className = "opn";
			div_sts[i].value = 0;
		}
	}
}

function clsDiv(id)
{
	if(isLastNode(id))
	{
		return;
	}
	for(var i =0;i < cks.length;i++)
	{
		if(pids[i].value == id)
		{
			div_cks[i].className = "cls";
			div_sts[i].value = 0;
			clsDiv(cks[i].value);
		}
	}
}

function setParents(parentid)
{
	
	
	for(var i =0;i < cks.length;i++)
	{
		if(cks[i].value == parentid)
		{
			if(event.srcElement.checked) cks[i].checked = event.srcElement.checked;
			setParents(pids[i].value);
		}
	}
	if(isRootNode(parentid))
	{
		return;
	}
}

function isRootNode(id)
{
	for(var i =0;i < cks.length;i++)
	{
		if(cks[i].value == id && pids[i].value == -1)
		{			
			return true;
		}
	}
	return false;
}
//isLastNode 用于查看是否是最底层权限，是返回true，否返回false
function isLastNode(id)
{
	for(var i =0;i < cks.length;i++)
	{
		if(pids[i].value == id)
		{
			return false;
		}
	}
	return true;
}


function frmChk()
{
	var sign=false;
	if(confirm("确认保存?"))
	{
		//add by yangpei 验证主菜单是否被选，如果没有被选，则提示至少给用户赋予一个权限，如果有，则更新用户权限
		if(frm.main.checked){
			frm.btn.disabled=true;
			sign=true;
		}else{
			alert("至少给用户赋予一个权限！");
		}
			
	}
	if(sign)
	{
		frm.action="<%=commonRightControllerPath %>commonRightSaveRoleRights"
		frm.submit();
	}
}

//-->
</SCRIPT>