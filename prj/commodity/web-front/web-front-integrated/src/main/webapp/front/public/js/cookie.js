/**
 * ��¼ʱ��¼�û�������ʹ��
 */
var cookieUtil={
	set:function(name,value,hours,path){
		var name = escape(name);
		var value = escape(value);
		var expires = new Date();
		expires.setTime(expires.getTime() + hours*3600000);
		path = path == "" ? "" : ";path=" + path;
		_expires = (typeof hours) == "string" ? "" : ";expires=" + expires.toUTCString();
		document.cookie = name + "=" + value + _expires + path;
		
	},
	get:function(name){
		var name = escape(name);
		var allcookies = document.cookie;
		name += "=";
		var pos = allcookies.indexOf(name);
		if (pos != -1){
			var start = pos + name.length;
			var end = allcookies.indexOf(";",start);
			if (end == -1) end = allcookies.length;
			var value = allcookies.substring(start,end);
			return unescape(value);
		}else{
			return "";
		}
	},
	remove:function(name,path){
		var name = escape(name);
		var expires = new Date(0);
		path = path == "" ? "" : ";path=" + path;
		document.cookie = name + "="+ ";expires=" + expires.toUTCString() + path;
	}
}