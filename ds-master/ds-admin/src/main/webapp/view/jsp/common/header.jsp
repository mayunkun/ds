<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<div id="header-topbar-option-demo" class="page-header-topbar">
	<nav id="topbar" role="navigation" style="margin-bottom: 0; z-index: 2;" class="navbar navbar-default navbar-static-top">
		<div class="navbar-header">
			<a id="logo" href="index.html" class="navbar-brand">
				<img class="logo-img js-lg-logo" src="${path }/view/resource/images/logo.png" alt="" />
				<img class="logo-img-s js-sm-logo none" src="${path }/view/resource/images/logo-s.png" alt="" />
			</a>
		</div>
		<div class="topbar-main">
			<a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>
			<ul class="nav navbar navbar-top-links navbar-right mbn">
				<li class="dropdown topbar-user">
					<a data-hover="dropdown" href="#" class="dropdown-toggle">
						<c:if test="${empty user.headImg }">
							<img src="${path }/view/resource/images/demo-user.jpg" alt="" class="img-responsive img-circle" />
						</c:if>
						<c:if test="${not empty user.headImg }">
							<img src="${user.headImg}" alt="" class="img-responsive img-circle" />
						</c:if>&nbsp;
						<span class="hidden-xs">
							<c:if test="${not empty user.name }">${user.name }</c:if>
						</span>&nbsp;
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu dropdown-user pull-right">
						<li>
							<a href="javascript:userinfo('${user.id }');" data-hover="tooltip" title="个人设置">
							<i class="fa fa-gear"></i>&nbsp;&nbsp;个人设置</a>
						</li>
						<li>
							<a href="javascript:logout();" data-hover="tooltip" title="退出">
							<i class="fa fa-key"></i>&nbsp;&nbsp;退出登录</a>
						</li>
					</ul>
				</li>
				<li id="topbar-chat" class="hidden-xs">
					<a href="javascript:void(0)" class="btn-chat"><i class="fa fa-comments"></i>
						<span class="badge badge-info">${mescount }</span>
					</a>
				</li>
			</ul>
		</div>
	</nav>
</div>	
<script type="text/javascript">
	var _path = '${path }';
	$("#menu-toggle").on("click",function(){
		if($(".js-lg-logo").hasClass("none")){
			$(".js-lg-logo").removeClass("none");
			$(".js-sm-logo").addClass("none");
		}else{
			$(".js-sm-logo").removeClass("none");
			$(".js-lg-logo").addClass("none");			
		}
	});
	
	function userinfo(userId) {
		ajaxContent(_path + "/admin/user/modelindex.html?id=" + userId + '&redirect=index');
	}
	
	function logout(){
		layer.confirm('您确定要退出系统吗？', function(idx){
			window.location.href = _path + "/admin/logout.html";
		});
	}
</script>
