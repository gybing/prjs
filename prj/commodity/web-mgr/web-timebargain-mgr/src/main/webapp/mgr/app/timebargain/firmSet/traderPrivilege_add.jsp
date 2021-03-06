<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>

<html>
  <head>
	<title>添加交易员权限</title>
	  <link rel="stylesheet" href="${skinPath }/css/validationengine/validationEngine.jquery.css" type="text/css" />
	  <link rel="stylesheet" href="${skinPath }/css/validationengine/template.css" type="text/css" />
	  <script src="${publicPath }/js/jquery-1.6.min.js" type="text/javascript"></script>
	  <script src="${publicPath }/js/validationengine/languages/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="GBK"></script>
	  <script src="${publicPath }/js/validationengine/jquery.validationEngine.js" type="text/javascript" charset="GBK"></script>
	  <script type="text/javascript">
		jQuery(document).ready(function() {
			
			// ajax验证交易权限是否存在
			jQuery("#frm").validationEngine( {
				ajaxFormValidation : true,
				ajaxFormValidationURL : "../../../ajaxcheck/firmSet/formCheckTradeprivilege.action",
				onAjaxFormComplete : ajaxValidationCallback,
				onBeforeAjaxFormValidation : beforeCall
			});

			// 提交前事件
			function beforeCall(form, options) {
				return true;
			}

			// 提交后事件
			function ajaxValidationCallback(status, form, json, options) {
				// 如果返回成功
				if (status === true) {
					var vaild = affirm("您确定要操作吗？");
					if(vaild){
						// 添加信息URL
						var addUrl = $("#add").attr("action");
						// 全 URL 路径
						var url = "${basePath}"+addUrl;
						$("#frm").attr("action",url);
						frm.submit();
					}
				}
			}

			// 添加按钮注册点击事件
			$("#add").click(function(){

				//验证信息
				if ($("#frm").validationEngine('validateform')) {
				}
			});
		});
	</script>
		
  </head>
  <body>
    <form id="frm" method="post" enctype="multipart/form-data" action="" targetType="hidden">
			<input type="hidden" name="entity.type" value="3"/>
			<input type="hidden" name="entity.typeID" value="${typeID}"/>
			<input type="hidden" name="entity.kind" value="1"/>
			<div class="div_cx">
				<table border="0" width="100%" align="center">
					<tr>
						<td>
							<div class="warning">
								<div class="content">
									温馨提示 :添加交易员权限
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<table border="0" width="100%" align="center">
								<tr>
									<td>
										<div class="div_cxtj">
											<div class="div_cxtjL"></div>
											<div class="div_cxtjC">
												交易员权限维护
											</div>
											<div class="div_cxtjR"></div>
										</div>
										<div style="clear: both;"></div>
										<div>
											<table border="0" cellspacing="0" cellpadding="10" width="100%" align="center" class="table2_style">	
												<tr>
													<td align="right">
														上市品种：
													</td>
													<td>
														<select id="breedID" name="entity.kindID" class="validate[required]">
														  <option value="">请选择</option>
														  <c:forEach items="${breedList}" var="result" >
															<option value="${result.BREEDID}">${result.BREEDNAME}</option>
														  </c:forEach>
														</select>
														<span class="required">*</span>
													</td>
													
												</tr>	
												<tr>
													<td align="right">
														买方权限：
													</td>
													<td>
														<select id="privilegeCode_B" name="entity.privilegeCode_B" class="validate[required]">
														  <option value="">请选择</option>
														  <option value="101">全权</option>
														  <option value="102">只可订立</option>
														  <option value="103">只可转让</option>
														  <option value="104">无权</option>
														</select>
														<span class="required">*</span>
													</td>
												</tr>
												<tr>
													<td align="right">
														卖方权限：
													</td>
													<td>
														<select id="privilegeCode_S" name="entity.privilegeCode_S" class="validate[required]">
														  <option value="">请选择</option>
														  <option value="201">全权</option>
														  <option value="202">只可订立</option>
														  <option value="203">只可转让</option>
														  <option value="204">无权</option>
														</select>
														<span class="required">*</span>
													</td>
													
												</tr>
												
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<div class="tab_pad">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
					<tr>
						<td align="center">
							<rightButton:rightButton name="添加" onclick="" className="btn_sec" action="/timebargain/firmSet/tradePrivilege/addTraderPrivilege.action" id="add"></rightButton:rightButton>
							&nbsp;&nbsp;
							<button class="btn_sec" onClick="window.close();">关闭</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
<%@ include file="/mgr/public/jsp/footinc.jsp"%>