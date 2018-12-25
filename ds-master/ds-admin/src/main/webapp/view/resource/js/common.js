function getRootPath() {
	// 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	// 获取主机地址，如： http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// 获取带"/"的项目名，如：/uimcardprj
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPaht + projectName);
}

function uploadImg(imgId, fileId){
	$.ajaxFileUpload({  
        url: _path + '/upload/uploadindex.html',  
        secureuri:false,  
        fileElementId:fileId,//file标签的id  
        dataType: 'json',//返回数据的类型  
        success: function (data, status) { 
        	if (data.success) {
	       		 $("#" + imgId).attr("src", data.data);
	             $("#_" + imgId).val(data.data);
        	} else {
        		if (data.msg == '-1') {
        			layer.msg('对不起，上传' + type + '过大！请换其他' + type + '！');
        		}
        		if (data.msg == '-2') {
        			layer.msg('对不起，不允许上传' + type + '！');
        		}
        		if (data.msg == '-3') {
        			layer.msg('对不起，系统不支持您所上传' + type + '的后缀名！');
        		}
        		if (data.msg == '-4') {
        			layer.msg('对不起，上传' + type + '失败，请更换其他' + type + '后重试！');
        		}
    		}
        },  
        error: function (data, status, e) {  
            alert(e);  
        }  
    }); 
} 

var REGX_HTML_ENCODE = /"|&|'|<|>|[\x00-\x20]|[\x7F-\xFF]|[\u0100-\u2700]/g;
/**
 * html编码转义
 * 
 * @param {String}
 *            s 字符串
 * @return {String} html转义字符串
 */
function encodeHtml(s) {
	return (typeof s != "string") ? s : s.replace(REGX_HTML_ENCODE,
			function($0) {
				var c = $0.charCodeAt(0), r = [ "&#" ];
				c = (c == 0x20) ? 0xA0 : c;
				r.push(c);
				r.push(";");
				return r.join("");
			});
}

/**
 * tip提示格式化
 * 
 * @param {String}
 *            val 显示的文本
 * @return {String} tip提示文本
 */
function tipFormat(val) {
	if (val == null)
		return "";
	val = encodeHtml(val);
	return '<span title="' + val + '">' + val + '</span>';
}

/**
 * 获得cookie
 * 
 * @param {cookie的键}
 *            key
 * @param {属性}
 *            options
 * @return {cookie的值}
 */
function getCookie(key, options) {
	options = options || {};
	var result, decode = options.raw ? function(s) {
		return s;
	} : decodeURIComponent;
	return (result = new RegExp('(?:^|; )' + encodeURIComponent(key)
			+ '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
}

/**
 * 设置cookie
 * 
 * @param {cookie的键}
 *            key
 * @param {cookie的值}
 *            value
 * @param {属性}
 *            options
 * @return {cookie}
 */
function setCookie(key, value, options) {
	if (arguments.length > 1 && (value === null || typeof value !== "object")) {
		options = $.extend({}, options);
		if (value === null) {
			options.expires = -1;
		}
		if (typeof options.expires === 'number') {
			var days = options.expires, t = options.expires = new Date();
			t.setDate(t.getDate() + days);
		}
		return (document.cookie = [
				encodeURIComponent(key),
				'=',
				options.raw ? String(value) : encodeURIComponent(String(value)),
				options.expires ? '; expires=' + options.expires.toUTCString()
						: '', options.path ? '; path=' + options.path : '',
				options.domain ? '; domain=' + options.domain : '',
				options.secure ? '; secure' : '' ].join(''));
	}
}

/**
 * 序列化成对象
 * 
 * @return {JSON}
 */
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

/**
 * 辅助方法(转换日期)
 * 
 * @param value
 * @returns
 * @author:yangh date:2015-05-24
 */
function parseToDate(value) {
	if (value == null || value == '') {
		return undefined;
	}

	var dt;
	if (value instanceof Date) {
		dt = value;
	} else {
		if (!isNaN(value)) {
			dt = new Date(value);
		} else if (value.indexOf('/Date') > -1) {
			value = value.replace(/\/Date\((-?\d+)\)\//, '$1');
			dt = new Date();
			dt.setTime(value);
		} else if (value.indexOf('/') > -1) {
			dt = new Date(Date.parse(value.replace(/-/g, '/')));
		} else {
			dt = new Date(value);
		}
	}
	return dt;
}

/**
 * 时间格式化 格式： 年(y)可以用 1-4 个占位符； 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符；
 * 毫秒(S)只能用 1 个占位符(是 1-3 位的数字)。 用例： new Date().Format("yyyy-MM-dd") -->
 * 2006-07-02 new Date().Format("yyyy-MM-dd hh:mm:ss") --> 2006-07-02 08:09:04
 * new Date().Format("yyyy-MM-dd hh:mm:ss.S") --> 2006-07-02 08:09:04.423
 * 
 * @param {时间格式，如：yyyy-MM-dd、yyyy-MM-dd
 *            hh:mm:ss} fmt
 * @return {字符串}
 */
Date.prototype.Format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

/**
 * 获取某一天的时间
 * @param date 日期
 * @param num 相隔的天数
 * @param fmt 日期格式
 * @returns
 */
function getDateAdd(date, num, fmt){
    var date = date || new Date(),
        timestamp, newDate;
    if(!(date instanceof Date)){
        date = new Date(date.replace(/-/g, '/'));
    }
    timestamp = date.getTime();
    newDate = new Date(timestamp + num * 24 * 3600 * 1000);
    
    return newDate.Format(fmt);
}

/**
 * datatable 处理日期
 * eg formatDate(eval("/Date(data)/".replace(/\//g, '')), "yyyy-MM-dd");
 */
 function formatDate(date, format) {  
    if (!date) return;  
    if (!format) format = "yyyy-MM-dd";  
    switch (typeof date) {  
        case "string":  
            date = new Date(date.replace(/-/, "/"));  
            break;  
        case "number":  
            date = new Date(date);  
            break;  
    }  
    if (!date instanceof Date) return;  
    var dict = {  
        "yyyy": date.getFullYear(),  
        "M": date.getMonth() + 1,  
        "d": date.getDate(),  
        "H": date.getHours(),  
        "m": date.getMinutes(),  
        "s": date.getSeconds(),  
        "MM": ("" + (date.getMonth() + 101)).substr(1),  
        "dd": ("" + (date.getDate() + 100)).substr(1),  
        "HH": ("" + (date.getHours() + 100)).substr(1),  
        "mm": ("" + (date.getMinutes() + 100)).substr(1),  
        "ss": ("" + (date.getSeconds() + 100)).substr(1)  
    };  
    return format.replace(/(yyyy|MM?|dd?|HH?|ss?|mm?)/g, function () {  
        return dict[arguments[0]];  
    });  
}

/**
 * 获得打开该页的URL源
 */
function getOpenerHref() {
	var referrer = document.referrer; // 载入当前页的URL地址
	var parentHref = '';
	try {
		parentHref = parent.location.href;
	} catch (e) {
	} // 在iframe中的URL
	var selfHref = self.location.href; // 当前URL
	// 无载入URL或者载入URL为iframe外层url返回当前页URL
	return (referrer != null && referrer != '' && referrer != parentHref) ? referrer
			: selfHref;
}

function openDialog(dialogObj, url) {
	dialogObj.find("iframe").attr("src", url);
	dialogObj.dialog('open');
}

function closeDialog(obj) {
	obj.dialog('close');
}

function showMessager(title, msg) {
	$.messager.show({
		title : title,
		msg : msg,
		showType : 'show'
	});
}

function gotoSearch(obj) {
	if (typeof EasyuiDatagrid == 'function') {
		obj.datagrid('reload', (new EasyuiDatagrid()).queryParams);
		obj.datagrid('clearSelections');
		if ($.isFunction(window.setBtnDisableEnable)) {
			window.setBtnDisableEnable();
		}
	}
}

function successSubmit(msg, ifGoBack) {
	if (msg.resultType) {
		if (ifGoBack) {
			if ($.isFunction(window.parent.endOfSubmit)) {
				window.parent.endOfSubmit();
			}
		} else {
			window.history.back(-1);
		}
	}
	if ($.isFunction(window.parent.showMessager)) {
		window.parent.showMessager(msg.resultTitle, msg.result);
	}
}

function errorSubmit(data) {
	$.messager.show({
		title : "提交失败，请稍后再试",
		msg : "服务器异常，请稍后再试",
		showType : 'warning'
	});
}

/**
 * 判断是否json
 * 
 * @param str
 * @returns {Boolean}
 */
function isJsonStr(str) {
	if (!str.match("^\{(.+:.+,*){1,}\}$")) {
		return false;
	} else {
		return true;
	}
}

/**
 * 导出文件
 * 
 * @param url
 * @param formId
 */
function exportFile(url, formId) {
	var qp = $("#" + formId).serialize();
	if (url.indexOf("?") == -1) {
		url += '?' + qp;
	} else {
		url += '&' + qp;
	}
	window.location = encodeURI(encodeURI(cxt + url));
}

/**
 * 公共ajax函数
 * 
 * @param url
 * @param data
 * @param callback
 * @returns {String}
 */
function ajaxFunc(url, data, callback) {
	var result = "";
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(url)),
		data : data,
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		async : false,
		cache : false,
		success : function(response) {
			result = response;
			// 扩展回调函数
			if (callback != null) {
				callback(response);
			}
		}
	});
	return result;
}

/**
 * ajax提交form替换content
 * 
 * @param divId
 *            返回替换div
 * @param formId
 *            提交formid
 * @param callback
 *            回调
 */
function ajaxForm(divId, formId, callback) {
	$('#main-content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	
	$("#" + formId).ajaxSubmit({
		cache : false,
		success : function(data) {
			var div = $("#" + divId);
			if (data != "" && div) {
				$("#" + divId).html(data);
			}
			// 扩展回调函数
			if (callback != null) {
				callback(data);
			}
			$('#loading').remove();
			$('#main-content').fadeIn();
		}
	});
}

function ajaxFormNormal(divId, formId, callback) {
	$("#" + formId).ajaxSubmit({
		cache : false,
		success : function(data) {
			if (data != "") {
				$("#" + divId).html(data);
			}
			// 扩展回调函数
			if (callback != null) {
				callback();
			}
		}
	});
}
/**
 * ajax请求url替换指定div
 * 
 * @param shade
 *            是否开启遮罩层
 * @param divId
 *            返回替换div
 * @param url
 *            请求地址
 * @param data
 *            参数
 * @param callback
 *            回调
 */
function ajaxDiv(shade, divId, url, data, callback) {
	if (shade) {
		$('#main-content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	}

	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(url)),
		data : data,
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		async : false,
		cache : false,
		success : function(returnData) {
			$("#" + divId).html(returnData);
			// 扩展回调函数
			if (callback != null) {
				callback();
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			// alert("请求出现错误！");
			window.location.href = _path + '/admin/login.html';
		},
		complete : function(XMLHttpRequest, textStatus) {
			if (shade) {
				$('#loading').remove();
				$('#main-content').fadeIn();
			}
		}
	});
}

/**
 * ajax请求url替换div content
 * 
 * @param url
 *            请求地址
 * @param data
 *            参数
 * @param callback
 *            回调
 */
function ajaxContent(url, data, callback) {
	$("#page-wrapper").html("");
	   $.ajax({
			type : "post",
			url : encodeURI(encodeURI(url)),
			data : data,
			dataType : "html",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : false,
			cache : false,
			success : function(returnData) {
				if (returnData.indexOf('<input name="_login_jsp" type="hidden">') > 0) {
					window.location.href = _path + '/admin/login.html';
				}
				$("#page-wrapper").html(returnData);
				if (callback != null) {
					callback();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				window.location.href = _path + '/admin/login.html';
			},
			complete : function(XMLHttpRequest, textStatus) {
			}
		});
}

/**
 * ajax请求url替换div content
 * 
 * @param url
 *            请求地址
 * @param data
 *            参数
 * @param callback
 *            回调
 */
function ajaxContent_div(divid, url, data, callback) {
	$("#" + divid).html("");
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(url)),
		data : data,
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		async : false,
		cache : false,
		success : function(returnData) {
			if (returnData.indexOf('<input name="_login_jsp" type="hidden">') > 0) {
				window.location.href = _path + '/admin/login.html';
			}

			$("#" + divid).html(returnData);
			// 扩展回调函数
			if (callback != null) {
				callback();
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			window.location.href = _path + '/admin/login.html';

		},
		complete : function(XMLHttpRequest, textStatus) {
		}
	});
}

function ajaxRenderDiv(divid, url, data, callback) {
	$('#' + divid).fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(url)),
		data : data,
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		async : false,
		cache : false,
		success : function(returnData) {
			$("#" + divid).html(returnData);
			// 扩展回调函数
			if (callback != null) {
				callback();
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			window.location.href = _path + '/admin/login.html';
		},
		complete : function(XMLHttpRequest, textStatus) {
			$('#loading').remove();
			$('#' + divid).fadeIn();

		}
	});
}
/**
 * ajax请求url替换div content
 * 
 * @param url
 *            请求地址
 * @param data
 *            参数
 * @param callback
 *            回调
 */
function appajax(url, formData, callback, error) {
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		url : url,// 请求的action路径
		data : formData,
		dataType : "json",
		error : function() {// 请求失败处理函数
			window.location.href = _path + '/admin/login.html';
		},
		success : function(d) {
			if (d.total == -1) {
				alert("用户尚未登录 请登录");
				window.location.href = _path + '/admin/login.html';
				return false;
			}
			callback(d);
		},
		error : function(msg) {
			error(msg)
		}
	});
}
/**
 * ajax请求url替换div content
 * 
 * @param url
 *            请求URL
 * @param data
 *            请求参数数据
 * @param callback
 *            回调
 */
function ajaxContentConfirm(url, data, callback) {
	var d = dialog({
		title : '操作提示',
		content : "确定要这样操作吗？",
		okValue : '确定',
		ok : function() {
			// this.title('提交中…');
			ajaxContent(url, data, callback);
			return true;
		},
		cancelValue : '取消',
		cancel : function() {
			return true; // false
		}
	});
	d.show();
}

/*
 *调用时传入选择的input
 */
function getTime(obj){
	var datepicker = obj.datepicker({
        language: 'zh-CN',
        autoclose: true,//选中之后自动隐藏日期选择框
        clearBtn: true,//清除按钮
        todayBtn: "linked",//今日按钮
        todayHighlight: true,
        format: 'yyyy-mm-dd',
    });
	
    datepicker.on('changeDate', function(event) {
    	event.preventDefault();
    	if(event.date){
    		var result = event.date.Format("yyyy-MM-dd");
    	}
    	return result;
    });
}

/*
 *调用时传入选择的input 精确到分
 */

function datetimepicker(obj){
	var datetimepicker = obj.datetimepicker({
		language: 'zh',
		format: 'YYYY-MM-DD HH:mm:ss',
        pick12HourFormat: false,
	});
	
	datetimepicker.on('changeDate', function(event) {
		event.preventDefault();
		if(event.date){
			var result = event.date.Format("yyyy-mm-dd HH:mm:ss");
		}
		return result;
	});
}

function updatePagerIcons(table) {
	var replacement = 
	{
		'ui-icon-seek-first' : 'fa fa-angle-double-left bigger-140',
		'ui-icon-seek-prev' : 'fa fa-angle-left bigger-140',
		'ui-icon-seek-next' : 'fa fa-angle-right bigger-140',
		'ui-icon-seek-end' : 'fa fa-angle-double-right bigger-140'
	};
	$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
		var icon = $(this);
		var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
		
		if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
}

function bindUploader(domid,callback){
	var goodsUploader = new qq.FineUploader({
	    debug: false,
	    element: document.getElementById(domid),
	    request: {
	    	endpoint: _path + '/upload/uploadindexvalidate.html',
	        inputName: 'file'
	    },
	    deleteFile: {
	        enabled: false,
	        endpoint: '/uploads'
	    },
	    template: "goodsimg-template",
	    interceptSubmit: false,
	    multiple: true,
	    retry: {
	       enableAuto: false
	    },
	    validation:{
	        allowedExtensions: ['png','jpg','jpeg','gif'],
	        acceptFiles: ['png','jpg','jpeg','gif'],
	        sizeLimit: 10000000, /*1024*1024＝1048576 bytes*/
	        itemLimit:0
	    },
	    callbacks: {
	        onComplete: callback
	    }
	});
}

// 点击查看大图
$(document).on('click', '.goodsimg img', function() {
    layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        skin: 'layui-layer-nobg', //没有背景色
        shadeClose: true,
        area: '800px',
        content: '<img class="layer-img" src="'+$(this).prop("src")+'"/>'
    });
});

//返回
function _return(url, searchRole, insertRole, updateRole, deleteRole){
	if(url.indexOf('?') > -1) {
		url += '&';
	} else {
		url += '?';
	}
	ajaxContent(url + 'searchRole=' + searchRole + '&insertRole=' + insertRole + '&updateRole=' + updateRole + '&deleteRole=' + deleteRole);
}
