<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
<meta charset="utf-8" />
<title>交易系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="cache-control" content="no-cache">
<link rel="shortcut icon" href="${path }/view/resource/images/icons/favicon.ico">
<link rel="stylesheet" href="${path }/view/resource/css/font/iconfont.css">
<link rel="stylesheet" href="${path }/view/resource/css/global.css">
<link rel="stylesheet" href="${path }/view/resource/css/login.css">
</head>
<body class="wrap">
	<div class="head-wrap">
		<div class="head">
			<div class="logo"><img src="${path }/view/resource/images/demo-logo.png" alt=""></div>
			<div class="head-right">
			</div>
		</div>
	</div>
	<div class="login-wrap">
		<div class="login">
			<div class="login-box clear">
				<div class="login-ad">
					<img src="${path }/view/resource/images/login/login-ad.jpg" alt="" />
				</div>
				<div class="login-from-box">
					<ul class="register-tabs-nav">
        				<li>
                            <a href="#default" class="tabulous_active">账号登录<i></i></a>
                        </li>
                  	</ul>
                  	<div class="register-tab-container">
                  		<div class="register-input-box login-style">
                  			<form name="formLogin" id="formLogin"  method="post">
                  				<dl class="register-input-item">
                  					<dt>账   号：</dt>
                  					<dd><input type="text" class="code-input" id="phone" name="phone" iscookie="true" placeholder="请输入用户名"></dd>
                  				</dl>
                  				<dl class="register-input-item">
                  					<dt>密   码：</dt>
                  					<dd><input type="password" class="code-input" id="pwd" name="pwd" iscookie="true" placeholder="请输入登录密码"></dd>
                  				</dl>
                  				<dl class="register-input-item">
                  					<dt>验证码：</dt>
                  					<dd class="register-small-input"><input class="verifyCode" name="verifyCode" type="text" id="verifyCode" title="" value="" nullmsg="请输入验证码!" /></dd>
                  					<dd class="register-code">
                  						<img id="verifyCodeImage" src="${path}/system/verifyCodeImage.html"  onclick="javascript:img_change('${path}/system/verifyCodeImage.html');" title="看不清，换一张" />
                  					</dd>
                  				</dl>
                  				<dl class="register-clause">
                  					<dt>
                  						 <input type="checkbox" id="on_off" name="on_off" checked="" value="" />
                  					</dt>
                  					<dd>
                  						<span>七天自动登录</span>
                  						<a href="javascript:void(0);" class="register-forget">忘记密码</a>
                  					</dd>
                  				</dl>
                  				<dl class="register-input-item">
                  					<dt></dt>
                  					<dd><span class="register-btn">立即登录</span></dd>
                  				</dl>
                  			</form>
                  		</div>
                  	</div>
				</div>
			</div>
		</div>
	</div>
	<div class="foot-wrap">
		<div class="foot">
			<p class="foot-list">
				<a href="javascript:void(0);">首页</a>
				<a href="javascript:void(0);">联系我们</a>
				<a href="javascript:void(0);">招聘英才</a>
				<a href="javascript:void(0);">合作洽谈</a>
				<a href="javascript:void(0);">企业资质</a>
			</p>
		</div>
		<div class="foot-law">
            <p>Copyright &copy; 2017 众链科技连有限公司 All Rights Reserved.</p>
		</div>
	</div>	
<script src="${path }/view/resource/js/jquery-2.0.3.min.js"></script>
<script src="${path }/view/resource/js/jquery.cookie.js"></script>
<script src="${path }/view/resource/js/layer/layer.js"></script>
<script src="${path }/view/resource/js/common.js"></script>
<script type="text/javascript">
	var _path = '${path }';
	getCookie();

	$('.register-btn').on('change','.login-select',function(){
		if($(this).val()){
			$(this).removeClass('no-select');
		}else{
			$(this).addClass('no-select');
		}
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
				/* $.cookie(this.name, null); */
				/* setCookie("COOKIE_NAME", null); */
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

	$('#formLogin .register-btn').on('click', function() {
		login();
	});

	function login() {
		var phone = $.trim($('#phone').val());
		if (!phone) {
			layer.msg('用户名不能为空！');
			return false;
		}

		var pwd = $.trim($('#pwd').val());
		if (!pwd) {
			layer.msg('密码不能为空！');
			return false;
		}

		var verifyCode = $.trim($('#verifyCode').val());
		if (!verifyCode) {
			layer.msg('验证码不能为空！');
			return false;
		}

		appajax(_path + '/admin/loginCheck.html', $("#formLogin").serialize(),
			function(data) {
				if (data.success) {
					setCookie();
					window.location.href = _path + "/admin/index.html";
				} else {
					if (data.msg == '-1') {
						layer.msg("用户信息不存在！");
					}
	
					if (data.msg == '-2') {
						layer.msg("用户名或者密码错误！");
					}
	
					if (data.msg == '-3') {
						layer.msg("验证码错误！");
					}
	
					if (data.msg == '2') {
						layer.msg("您的信息正在审核中，请稍后！");
					}
				}
			}, function(msg) {
				alert("异常，请稍后操作！");
			});
	}
</script>
</body>
</html>
    