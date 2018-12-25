<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<div id="chat-form" class="fixed">
	<div class="chat-inner">
		<h2 class="chat-header">
			<a href="javascript:;" class="chat-form-close pull-right">
				<i class="glyphicon glyphicon-remove"></i>
			</a>
			<c:if test="${not empty user.name }">${user.name }</c:if>
			<c:if test="${empty user.name }">Hi</c:if>
			，您有<span>${mestotal }</span>条系统消息
		</h2>
		<div class="chat-group">
			<c:forEach var="var" items="${messages }">
				<ul class="msg-list">
					<li class="msg-top">
						<span class="msg-date">
							<fmt:formatDate value="${var.createTime}" type="both" pattern="yyyy年MM月dd日 HH:mm"/>
						</span>
						<c:if test="${var.state eq '-1'}">
							<span class="msg-no" id="${var.id }">未读</span>
						</c:if>
						<c:if test="${var.state eq '1'}">
							<span class="msg-yes">已读</span>
						</c:if>
					</li>
					<li class="msg-content">${var.content }</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('.msg-no').on('click',function() {
		var $this = $(this);
		var mescount = $('#topbar-chat .badge-info').html();
		
		var mesId = $(this).attr('id');
		appajax(_path + "/notice/updatenotice.html",
			{"id":mesId, "state":1 },
			function(data) {
				if (data.success) {
					$this.removeClass('msg-no').addClass('msg-yes');
					$('.msg-yes').html('已读');
					
					$('#topbar-chat .badge-info').html(Number(mescount) - 1);
				}
			}, function(msg) {
				alert("异常，请稍后操作！");
			});
	});
</script>
