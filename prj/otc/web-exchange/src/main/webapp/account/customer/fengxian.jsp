<%@ page contentType="text/html;charset=GBK"%>
<html><head>
<link href="${skinPath}/css/mgr/memberadmin/module.css" rel="stylesheet" type="text/css" />
<script src="${publicPath }/js/jquery-1.6.min.js" type="text/javascript"></script>
<script src="${publicPath }/js/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="GBK"></script>
<script src="${publicPath }/js/validationengine/jquery.validationEngine.js" type="text/javascript" charset="GBK"></script>
<script type="text/javascript" src="${publicPath}/js/autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${publicPath}/js/PasswordMode.js"></script>
</head>
<body>
<a name="firstAnchor"></a> 
<div id="print" style="margin-left:15px;margin-right:15px;margin-top:30px;margin-bottom:20px;border:2px dashed #F4A460;">
<div align="center"><font size="4" color="#e73a49">风险告知书</font></div>
<br/><strong style="color:#e73a49">尊敬的交易商：</strong>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;请您务必仔细阅读本《风险告知书》的内容，您需要理解并签署本《风险告知书》后方可在长三角商品交易所（以下简称“交易所” ）开户和参与交易。
<br/>&nbsp;&nbsp;&nbsp;&nbsp;商品交易是有风险的，您的投资可能会有损失，甚至可能超过初始投资额。因此，请你谨慎考虑自身财务状况和风险承受能力。在进行交易之前，请您明确以下内容：
<br/>&nbsp;&nbsp;&nbsp;&nbsp;一、您必须认真阅读并遵守交易所的相关规则，如果您无法满足交易所相关规则的要求，您所持有的购销商品将可能根据有关规则被代为转让，您将承担由此产生的后果。
<br/>&nbsp;&nbsp;&nbsp;&nbsp;二、由于国家法律法规及政策的变化、交易所相关规则的修改、紧急措施的出台等原因，您持有的购销商品可能无法继续持有，您将承担由此导致的损失。
<br/>&nbsp;&nbsp;&nbsp;&nbsp;三、在不符合交易条件或交易规则规定的特殊情形下，您可能无法买进或者卖出商品。出现这类情况，您的交易资金有可能无法弥补全部损失，您将承担由此导致的全部损失。
<br/>&nbsp;&nbsp;&nbsp;&nbsp;四、由于地震、水灾、火灾等不可抗力因素或者计算机系统、通讯系统故障等交易所不能预见、不能避免并不能克服的原因，可能造成您的指令无法成交或者无法全部成交，您将承担由此导致的损失。
<br/>&nbsp;&nbsp;&nbsp;&nbsp;五、利用网络进行商品交易时将存在（包括但不限于）以下风险，您将承担由此导致的损失：
<br/>&nbsp;&nbsp;&nbsp;&nbsp;1.如果您缺乏网上交易经验，可能因操作不当造成交易失败或交易失误；
<br/>&nbsp;&nbsp;&nbsp;&nbsp;2.您的交易密码丢失或被他人盗用；
<br/>&nbsp;&nbsp;&nbsp;&nbsp;3.由于无法控制和不可预测的系统故障、设备故障、通讯故障、电力故障、网络故障等因素，可能导致系统非正常运行甚至瘫痪，使您的交易指令出现延迟、中断、数据错误等情况；
<br/>&nbsp;&nbsp;&nbsp;&nbsp;4.由于网上交易系统存在被网络黑客和计算机病毒攻击的可能性，由此可能导致系统故障，是交易无法进行及行情信息出现错误或延迟；
<br/>&nbsp;&nbsp;&nbsp;&nbsp;5.互联网上的数据传输可能因通信繁忙等原因出现延迟、中断、数据错误或不完全，从而使网上交易出现延迟、中断等异常情形。
<br/>&nbsp;&nbsp;&nbsp;&nbsp;本《风险告知书》无法揭示从事商品交易的所有风险和交易所全部无法控制和不可预测的情形。请您在入市交易之前，全面了解交易所的相关规则及规定，对自身的经济承受能力、风险控制能力、身体及心理承受能力作出客观评估。
</div>
<div id="noprint" align="right" style="margin-right:10px;margin-bottom:5px;"><input type="button" value="打印" onclick="myPrint()"/></div>
<br/>
</body>
<SCRIPT type="text/javascript">
	window.onload=function(){
		window.location.hash = firstAnchor;
	}
	function myPrint(){
		document.getElementById("noprint").style.display="none";
		window.print();
		document.getElementById("noprint").style.display="";
	}
</SCRIPT>
</html>