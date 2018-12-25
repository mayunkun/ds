<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>众链科技-login</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="cache-control" content="no-cache">
<link rel="shortcut icon" href="${path }/view/resource/images/icons/favicon.ico">
<link rel="stylesheet" href="${path }/view/resource/css/font/iconfont.css">
<link rel="stylesheet" href="${path }/view/resource/css/style.css">
</head>
<body>
<div class="common-login-page">
	<div class="clp-inner-box">
		<p class="clp-title">众链科技</p>
		<form name="formLogin" id="formLogin"  method="post">
			<div class="clp-input-group">
				<dl class="clp-normal-dl js-bor" id="phone-js-bor">
					<dt><i class="font f-user"></i></dt>
					<dd class="clp-input">
						<input type="text" class="code-input" id="phone" name="phone" iscookie="true" value="admin" placeholder="请输入用户名/手机号">
					</dd>
					<dd class="clp-tips" id="phoneError">账号信息错误</dd>
				</dl>
				<dl class="clp-normal-dl js-bor" id="pwd-js-bor">
					<dt><i class="font f-pass"></i></dt>
					<dd class="clp-input">
						<input type="password" class="code-input" id="pwd" name="pwd" iscookie="true" value="123456" placeholder="请输入登录密码">
					</dd>
					<dd class="clp-tips" id="pwdError">密码错误</dd>
				</dl>
				<div class="clear">
					<dl class="clp-code-dl js-bor" id="verifyCode-js-bor">
						<dt><i class="font f-code"></i></dt>
						<dd class="clp-input">
							<input class="verifyCode" name="verifyCode" type="text" id="verifyCode" title="" value="" placeholder="请输入验证码" />
						</dd>
						<dd class="clp-tips" id="verifyCodeError">验证码错误</dd>
					</dl>
					<div class="clp-code-img">
						<img id="verifyCodeImage" src="${path}/system/verifyCodeImage.html" />
						<span onclick="javascript:img_change('${path}/system/verifyCodeImage.html');">看不清楚，换一张</span>
					</div>
				</div>
				<span class="clp-login-btn">登录</span>
				<p>
					<span class="clp-link">忘记密码</span>
					<span class="clp-right">还没有账号？<span class="clp-link">立即注册</span></span>
				</p>
			</div>
		</form>
	</div>
</div>
<script src="${path }/view/resource/js/jquery-2.0.3.min.js"></script>
<script src="${path }/view/resource/js/jquery.cookie.js"></script>
<script src="${path }/view/resource/js/layer/layer.js"></script>
<script src="${path }/view/resource/js/common.js"></script>
<script type="text/javascript">
	var _path = '${path }';
	getCookie();

	$(".clp-input input").on("focus",function(){
		$(this).parents(".js-bor").addClass("active");
	});
	$(".clp-input input").on("blur",function(){
		$(this).parents(".js-bor").removeClass("active");
	});
	
	$("#on_off").change(function() {
		if ($("#on_off").prop('checked')) {
			$("#on_off").attr("checked", true);
			$("#on_off").val("1");
			$.cookie("COOKIE_NAME", true);
		}  else {
			$("#on_off").attr("checked", false);
			$("#on_off").val("0");
			$.cookie("COOKIE_NAME", false);
		}
	});
	
	//设置cookie
	function setCookie(name,value) {
		if ($('#on_off').val() == '1') {
			$("input[iscookie='true']").each(function() {
				$.cookie(this.name, $("#"+this.name).val(), "/", 7*24);
				$.cookie("COOKIE_NAME","true", "/", 7*24);
			});
		} else {
			$("input[iscookie='true']").each(function() {
				$.cookie("COOKIE_NAME", false);
				$.cookie(this.name,"");
			});
		}
	}
	
	//读取cookie
	function getCookie() {
		var COOKIE_NAME = $.cookie("COOKIE_NAME");
		var phone = $.cookie("phone");
		if (COOKIE_NAME == true || phone != "") {
			$("input[iscookie='true']").each(function() {
				$($("#"+this.name).val($.cookie(this.name)));
			});
			$("#on_off").attr("checked", true);
			$("#on_off").val("1");
		}  else {
			$("#on_off").attr("checked", false);
			$("#on_off").val("0");
			$.cookie("COOKIE_NAME", false);
		}
	}

	//刷新验证码
	function img_change(_url) {
		var date = new Date();
		var img = document.getElementById("verifyCodeImage");
		img.src = _url + "?a=" + date.getTime();
	}

	//enter键登录
	document.onkeydown = function(event) {
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if (e && e.keyCode == 13) {
			login();
		}
	};

	$('#formLogin .clp-login-btn').on('click', function() {
		login();
	});

	function login() {
		var phone = $.trim($('#phone').val());
		if (!phone) {
			$('#phoneError').html('用户名不能为空');
			$('#phone-js-bor').addClass('error');
			return false;
		} else {
			$('#phoneError').html('');
			$('#phone-js-bor').removeClass('error');
		}

		var pwd = $.trim($('#pwd').val());
		if (!pwd) {
			$('#pwdError').html('密码不能为空');
			$('#pwd-js-bor').addClass('error');
			return false;
		} else {
			$('#pwdError').html('');
			$('#pwd-js-bor').removeClass('error');
		}

		var verifyCode = $.trim($('#verifyCode').val());
		if (!verifyCode) {
			$('#verifyCode-js-bor').addClass('error');
			return false;
		} else {
			$('#verifyCodeError').html('');
			$('#verifyCode-js-bor').removeClass('error');
		}

		appajax(_path + '/admin/loginCheck.html', $("#formLogin").serialize(),
			function(data) {
				if (data.success) {
					setCookie();
					window.location.href = _path + "/admin/index.html";
				} else {
					if (data.msg == '-1') {
						$('#phoneError').html('用户信息不存在');
						$('#phone-js-bor').addClass('error');
					}
	
					if (data.msg == '-2') {
						$('#phoneError').html('用户名或者密码错误');
						$('#phone-js-bor').addClass('error');
					}
	
					if (data.msg == '-3') {
						$('#verifyCodeError').html('验证码错误');
						$('#verifyCode-js-bor').addClass('error');
					}
				}
			}, function(msg) {
				alert("异常，请稍后操作！");
			});
	}
</script>
</body>
</html>
    