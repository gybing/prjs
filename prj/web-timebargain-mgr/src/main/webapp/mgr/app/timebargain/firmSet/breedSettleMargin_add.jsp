<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>

<html>
  <head>
    <title>��������Ʒ�ֽ��ձ�֤��</title>
	  <link rel="stylesheet" href="${skinPath }/css/validationengine/validationEngine.jquery.css" type="text/css" />
	  <link rel="stylesheet" href="${skinPath }/css/validationengine/template.css" type="text/css" />
	  <script src="${publicPath }/js/jquery-1.6.min.js" type="text/javascript"></script>
	  <script src="${basePath}/mgr/app/timebargain/js/languages/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="GBK"></script>
	  <script src="${publicPath }/js/validationengine/jquery.validationEngine.js" type="text/javascript" charset="GBK"></script>
		
	  <script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#frm").validationEngine('attach');
			// ���Ӱ�ťע�����¼�
			$("#add").click(function(){
				// ��֤��Ϣ
				if(jQuery("#frm").validationEngine('validate')){
					
					var vaild = affirm("��ȷ��Ҫ������");
					if(vaild){
						// ������ϢURL
						var addUrl = $(this).attr("action");
						// ȫ URL ·��
						var url = "${basePath}"+addUrl;
						$("#frm").attr("action",url);
						$("#frm").submit();
					}
				}
			});
		});

		// ����Ʒ��ID, ��ȡƷ������
		function getBreed(id){
			var oldAjaxAsync = $.ajaxSettings.async;
			var url = "${basePath}/ajaxcheck/firmSet/getBreedJson.action?breedID=" + id;
			$.ajaxSettings.async = false;
			$.getJSON(url,null,function call(result){
				
				document.getElementById("settleMarginAlgr_B").value = result[26];
				if(document.getElementById("settleMarginAlgr_B").value == '1'){
					document.getElementById("settleMarginRate_B").value = result[27] * 100;
				}else{
					document.getElementById("settleMarginRate_B").value = result[27];
				}
				
				document.getElementById("settleMarginAlgr_S").value = result[28];
				if(document.getElementById("settleMarginAlgr_S").value == '1'){
					document.getElementById("settleMarginRate_S").value = result[29] * 100;
				}else{
					document.getElementById("settleMarginRate_S").value = result[29];
				}
					
				document.getElementById("payoutAlgr").value = result[30];
				if(document.getElementById("payoutAlgr").value == '1'){
					document.getElementById("payoutRate").value = result[31] * 100;
				}else{
					document.getElementById("payoutRate").value = result[31];
				}

			});
			$.ajaxSettings.async = oldAjaxAsync;

		}
	  </script>
		
    <script type="text/javascript">

      //���������ֺ�.
	  function onlyDoubleInput()
	  {
	    if (event.keyCode<46 || event.keyCode>57 || event.keyCode == 47)
	    {
	      event.returnValue=false;
	    }
	  } 

       function settleMarginAlgr_B_change(){
    		if ($("#settleMarginAlgr_B").val() == "1") {
    			$("#settleMarginRate_BPercent").show();
    		}else {
    			$("#settleMarginRate_BPercent").hide();
    		}
    	}

    	function settleMarginAlgr_S_change(){
    		if ($("#settleMarginAlgr_S").val() == "1") {
    			$("#settleMarginRate_SPercent").show();
    		}else {
    			$("#settleMarginRate_SPercent").hide();
    		}
    	}

    	function payoutAlgr_change(){
    		if ($("#payoutAlgr").val() == "1") {
    			$("#payoutRatePercent").show();
    		}else {
    			$("#payoutRatePercent").hide();
    		}
    	}

    	function on_change(){

    		if ($("#settleMarginAlgr_B").val() == "1") {
    			$("#settleMarginRate_BPercent").show();
    		}else {
    			$("#settleMarginRate_BPercent").hide();
    		}

    		if ($("#settleMarginAlgr_S").val() == "1") {
    			$("#settleMarginRate_SPercent").show();
    		}else {
    			$("#settleMarginRate_SPercent").hide();
    		}

    		if ($("#payoutAlgr").val() == "1") {
    			$("#payoutRatePercent").show();
    		}else {
    			$("#payoutRatePercent").hide();
    		}
    	}
    
    	function window_load(){
   	   
    		on_change();
   	    }
    </script>
  </head>
  <body onload="window_load()">
	<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="" targetType="hidden" >

	  <div class="div_cx">
		<table border="0" width="100%" align="center">
		  <tr>
		    <td>
			  <div class="warning">
			    <div class="content">
			               ��ܰ��ʾ :�������⽻�ձ�֤��
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
						������Ϣ
					  </div>
					  <div class="div_cxtjR"></div>
					</div>
					<div style="clear: both;"></div>
				    <div>
					  <table border="0" cellspacing="0" cellpadding="10" align="center" class="table2_style">
					    <tr>
		          		  <td align="right">�����̴��룺</td>   
						  <td>
							<input type="text" id="firmID" name="entity.firmID" 
								   class="validate[required,maxSize[<fmt:message key='MFirm.firmId_q' bundle='${PropsFieldLength}' />],custom[onlyLetterNumber],ajax[mouseCheckFirmByFirmId]] input_text " />
							<span class="required">*</span>
						  </td>
						  
            			  <td align="right">Ʒ�ִ��룺</td>   		   
            			  <td>
							<select id="breedID" name="entity.breedID" class="validate[required]" onchange="getBreed(this.value),on_change()">
                   			  <option value="">��ѡ��</option>
                   			  <c:forEach items="${breedList}" var="map" >
								<option value="${map['BREEDID']}">${map['BREEDNAME']}</option>
							  </c:forEach>
                			</select>
							<span class="required">*</span>
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
					  <div class="div_cxtjC">
						��֤��
					  </div>
					  <div class="div_cxtjR"></div>
					</div>
					<div style="clear: both;"></div>
				    <div>
			      
					  <table border="0" cellspacing="0" cellpadding="0"  class="table2_style" align="center">
					    <tr>
			              <td>
			              
                            <table cellSpacing="0" cellPadding="5" border="0" align="center" class="common"> 
								<tr>
        	                      <td>���ձ�֤��</td>
                                </tr>
                                <tr>
                                  <td align="right">�򷽷�ʽ��</td>
                                  <td>
                                    <select id="settleMarginAlgr_B" name="entity.settleMarginAlgr_B" style="width:80" onchange="settleMarginAlgr_B_change()" class="validate[required]">
					                  <option value="">��ѡ��</option>
					                  <c:forEach items="${algrMap}" var="map" >
									    <option value="${map.key}">${map.value}</option>
									  </c:forEach>
			                        </select> 
                                    <span class="required">*</span>
                                  </td>
                                  <td align="right" >�򷽱�׼��</td>
                                  <td>
			                        <input  id="settleMarginRate_B" name="entity.settleMarginRate_B" 
			  	                            onkeypress="return onlyDoubleInput()" class="validate[required,maxSize[10],custom[onlyDoubleSp]] input_text" />         
                                    <span id="settleMarginRate_BPercent">%</span><span class="required">*</span>
                                  </td>
                                 
                                </tr>
                                <tr >
                                  <td align="right" >������ʽ��</td>
                                  <td>
                                    <select id="settleMarginAlgr_S" name="entity.settleMarginAlgr_S" style="width:80" class="validate[required]" onchange="settleMarginAlgr_S_change()">
					                  <option value="">��ѡ��</option>
					                  <c:forEach items="${algrMap}" var="map" >
									    <option value="${map.key}">${map.value}</option>
									  </c:forEach>
			                        </select>
                                    <span class="required">*</span>
                                  </td>
                                  <td align="right" >������׼��</td>
                                  <td>
			                        <input  id="settleMarginRate_S" name="entity.settleMarginRate_S" 
			  	                            onkeypress="return onlyDoubleInput()" class="validate[required,maxSize[10],custom[onlyDoubleSp]] input_text" />         
                                    <span id="settleMarginRate_SPercent">%</span><span class="required">*</span>
                                  </td>
                                
                             </tr>
                             <tr>
        	                   <td align="right">���ջ����㷨��</td>
                               <td>
                                   <select id="payoutAlgr" name="entity.payoutAlgr" style="width:80" class="validate[required]" onchange="payoutAlgr_change()">
					                  <option value="">��ѡ��</option>
					                  <c:forEach items="${algrMap}" var="map" >
									    <option value="${map.key}">${map.value}</option>
									  </c:forEach>
			                       </select>
                                 <span class="required">*</span>
                               </td>
                               <td align="right">���ջ����׼��</td>
                               <td>
			                     <input  id="payoutRate" name="entity.payoutRate" 
			  	                         onkeypress="return onlyDoubleInput()" class="validate[required,maxSize[10],custom[onlyDoubleSp]] input_text" />         
                                 <span id="payoutRatePercent">%</span><span class="required">*</span>
                               </td>
                               
                             </tr>
	                       </table>  
					
				         </td>
				       </tr>
			         </table>
			       </div> 
			       
			     </td>
		       </tr>
		</table>
	  </div>
	  <div class="tab_pad">
	    <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
		  <tr>
		    <td align="center">
			  <rightButton:rightButton name="����" onclick="" className="btn_sec" action="/timebargain/firmSet/breedSpecial/addSettleMargin.action" id="add"></rightButton:rightButton>
			  &nbsp;&nbsp;
			  <button class="btn_sec" onClick="window.close();">�ر�</button>
		    </td>
		  </tr>
	    </table>
	  </div>
    </form>
  </body>
</html>
<%@ include file="/mgr/public/jsp/footinc.jsp"%>