<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav id="sidebar" role="navigation" class="navbar-default navbar-static-side">
	<div class="sidebar-collapse menu-scroll">
		<ul id="side-menu" class="nav">
			<li class="user-panel">
				<div class="thumb">
					<c:if test="${empty user.headImg }">
						<img src="https://s3.amazonaws.com/uifaces/faces/twitter/kolage/128.jpg" alt="" class="img-circle" />
					</c:if>
					<c:if test="${not empty user.headImg }">
						<img src="${user.headImg}" alt="" class="img-circle" />
					</c:if>
				</div>
				<div class="info">
					<p>
						<c:if test="${not empty user.name }">${user.name }</c:if>
						<c:if test="${empty user.name }">${user.phone }</c:if>
					</p>
					<ul class="list-inline list-unstyled">
						<li>
							<a href="extra-profile.html" data-hover="tooltip" title="简介"><i class="fa fa-user"></i></a>
						</li>
						<li>
							<a href="email-inbox.html" data-hover="tooltip" title="邮件"><i class="fa fa-envelope"></i></a>
						</li>
						<li>
							<a href="#" data-hover="tooltip" title="设置" data-toggle="modal" data-target="#modal-config"><i class="fa fa-cog"></i></a>
						</li>
						<li>
							<a href="extra-signin.html" data-hover="tooltip" title="登出"><i class="fa fa-sign-out"></i></a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</li>
			<li class="active">
				<a href="javascript:;">
					<i class="fa fa-tachometer fa-fw"><div class="icon-bg bg-orange"></div></i><span class="menu-title">首页预览</span>
				</a>
			</li>
			<li id="menuli"></li>
		</ul>
	</div>
</nav>
<script type="text/javascript">
appajax(_path + "/admin/menulist.html",{}, function(data) {
	if (data.success) {
		var plist = data.object,
		html = "",
		content = $('#menuli');
		for(var i=0; i<plist.length; i++) {
			html += '<a href="javascript:void(0);"><i class="fa ' + plist[i].iconcode +' fa-fw"><div class="icon-bg bg-green"></div></i>';
			html += '	<span class="menu-title">' + plist[i].name + '</span><span class="fa arrow"></span>';
			html += '</a>';
			var clist = plist[i].childlist;
		    html += '<ul class="nav nav-second-level">';
		    for(var j=0;j<clist.length;j++) {
				html += '	<li>';
				html += '		<a  onclick="ajaxContent(\'' + _path + clist[j].url + '\')"><i class="fa ' + clist[j].iconcode + '"></i>';
				html += '			<span class="submenu-title">' + clist[j].name + '</span>';
				html += '		</a>';
				html += '	</li>';
		    }
			html += '</ul>'; 
		}
		content.append(html);
	}else{
		window.location.href = _path + "/admin/login.html";
	}
}, function(msg) {
	alert("异常，请稍后操作！");
});
</script>
