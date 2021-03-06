<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/front/public/includefiles/allIncludeFiles.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>延期交收行情</title>
		<link href="${skinPath}/css/mgr/memberadmin/module.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<!-------------------------Body Begin------------------------->
		<div style = "margin: 0px 14px 0px 14px">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr class="font_b tr_bg">
							<td>
								<div class="tb_bg">
									<table id="delayRealTimeInfo"  width="100%" border="0" cellspacing="0" cellpadding="0"
										 style="margin-right: 14px;" summary="进行中的交易">
										<tr class="font_b tr_bg" id = "firstTr">
											<td width="18%">
												<div class="ordercol" id="noticeId">
													商品代码
												</div>
											</td>
											<td width="12%">
												<div class="ordercol" id="noticeId">
													买交收申报量
												</div>
											</td>
											<td width="12%">
												<div class="ordercol" id="noticeId">
													卖交收申报量
												</div>
											</td>
											<td width="14%">
												<div class="ordercol" id="noticeId">
													当日成交量
												</div>
											</td>
											<td width="14%">
												<div class="ordercol" id="noticeId">
													订货量
												</div>
											</td>
											<td width="12%">
												<div class="ordercol" id="noticeId">
													当日结算价
												</div>
											</td>
											<c:if test="${marketinfo.NEUTRALFLAG==1}">
												<td width="10%">
													<div class="ordercol" id="neutral">
														中立仓申报量
													</div>
												</td>
											</c:if>
										</tr>
										
										<c:forEach items = "${resultData}" var = "qtmap">
											<tr class="font_b tr_bg" id = "${qtmap['COMMODITYID'] }">
												<td width="16%">
													<div class="ordercol" name="commodityId">
													${qtmap['COMMODITYID'] }
													</div>
												</td>
												<td width="10%">
													<div class="ordercol" name="buysettleqty">
														${qtmap['BUYSETTLEQTY'] }
													</div>
												</td>
												<td width="10%">
													<div class="ordercol" name="sellsettleqty">
														${qtmap['SELLSETTLEQTY'] }
													</div>
												</td>
												<td width="12%">
													<div class="ordercol" name="totalamount">
														${qtmap['TOTALAMOUNT'] }
													</div>
												</td>
												<td width="12%">
													<div class="ordercol" name="reservecount">
														${qtmap['RESERVECOUNT'] }
													</div>
												</td>
												<td width="10%">
													<div class="ordercol" name="price">
														${qtmap['PRICE'] }
													</div>
												</td>
												<c:if test="${marketinfo.NEUTRALFLAG==1}">
													<td width="10%">
														<div class="ordercol" name="neutralQty">
														
															<c:choose>
																<c:when test = "${qtmap['NEUTRALSIDE'] == '买'}"> 
																	${qtmap['BUYNEUTRALQTY'] }
																</c:when>
																<c:when test = "${qtmap['NEUTRALSIDE'] == '卖'}"> 
																	${qtmap['SELLNEUTRALQTY'] }
																</c:when>
																<c:otherwise>
																	-
																</c:otherwise>
															</c:choose>
														</div>
													</td>
												</c:if>
											</tr>
										</c:forEach>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
		<!-------------------------Body End------------------------->
	</body>
</html>