<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="common/resource.jsp" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<meta charset="utf-8" />
<title>众链科技</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="cache-control" content="no-cache">
<body>
	<div>
		<!--BEGIN BACK TO TOP-->
		<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
		<!--END BACK TO TOP-->
		
		<!--BEGIN TOPBAR-->
		<jsp:include page="common/header.jsp" />
		<!--END TOPBAR-->
		
		<div id="wrapper">
			<!--BEGIN SIDEBAR MENU-->
			<nav id="sidebar" role="navigation" class="navbar-default navbar-static-side">
				<div class="sidebar-collapse menu-scroll">
					<ul id="side-menu" class="nav">
						<li class="user-panel">
							<div class="clearfix"></div>
						</li>
						<li>
							<a href="index.html">
								<i class="fa fa-tachometer fa-fw"><div class="icon-bg bg-orange"></div></i><span class="menu-title">首页概况</span>
							</a>
						</li>
						<c:forEach var="var" items="${menulist }">
							<li class="parent-item">
								<a href="#"><i class="fa ${var.iconcode } fa-fw"><div class="icon-bg bg-green"></div></i>
									<span class="menu-title">${var.name }</span><span class="fa arrow"></span>
								</a>
								<ul class="nav nav-second-level">
								    <c:forEach var="subvar" items="${var.childlist }">
										<li class="child-item">
											<a href="javascript:ajaxContent('${path }${subvar.url }');"><i class="fa ${subvar.iconcode }"></i>
												<span class="submenu-title">${subvar.name }</span>
											</a>
										</li>
								    </c:forEach>
								</ul>
							</li>
						</c:forEach>
					</ul>
				</div>
			</nav>
			<!--END SIDEBAR MENU-->
			
			<!--BEGIN CHAT FORM-->
			<jsp:include page="common/chat.jsp" />
			<!--END CHAT FORM-->
			
			<!--BEGIN PAGE WRAPPER-->
			<div id="page-wrapper">
				<jsp:include page="common/content.jsp" />
			</div>
			<!--BEGIN FOOTER-->
			<jsp:include page="common/footer.jsp" />
			<!--END FOOTER-->
			<!--END PAGE WRAPPER-->
		</div>
	</div>
<script type="text/javascript">
	$('#side-menu').on('click', 'li.child-item', function() {
		$(this).parents('#side-menu').children('.parent-item').find('li').removeClass('active');
		$(this).addClass('active');
	})
</script>
</body>
</html>