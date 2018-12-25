<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">数据字典信息</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">系统管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">数据字典信息<c:if test="${empty dto.id }">添加</c:if><c:if test="${not empty dto.id }">修改</c:if></li>
    </ol>
	<div class="clearfix"></div>
</div>
<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div id="sliderTabContent" class="tab-content pan">
              	<div id="general-slider-tab" class="tab-pane fade in active">
					<form class="form-horizontal" id="contentForm">
						<input name="id" id="id" value="${dto.id }" type="hidden">
						
						<div class="form-body pal">
							<div class="form-group">
								<label class="col-md-3 control-label"><span class='require'>*</span>&nbsp;&nbsp;数据名称: </label>
								<div class="col-md-6">
									<input type="text" class="form-control" value="${dto.groupname }" placeholder="数据名称" name="groupname" id="groupname">
								</div>
							</div>
		
							<div class="form-group">
								<label class="col-md-3 control-label"><span class='require'>*</span>&nbsp;&nbsp;编码: </label>
								<div class="col-md-6">
									<input type="text" class="form-control" value="${dto.grouptype }" placeholder="编码" name="grouptype" id="grouptype">
								</div>
							</div>
		
							<div class="form-group">
		                         <div class="col-md-offset-3 col-md-6">
		                             <button type="button" class="btn btn-success ">&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
		                         </div>
		                    </div>
						</div>
					</form>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</div>
<!-- /.page-content -->
<script type="text/javascript">
	$('#contentForm .btn.btn-success').on('click', function() {
		var groupname = $.trim($('#groupname').val());
		if (!groupname) {
			layer.msg('数据名称不能为空！');
			return false;
		}
		
		var grouptype = $.trim($('#grouptype').val());
		if (!grouptype) {
			layer.msg('编码不能为空！');
			return false;
		}
		
		appajax(_path + "/admin/datadict/model.html",
		$("#contentForm").serialize(),
		function(data) {
			if (data.success) {
				ajaxContent(_path + '/admin/datadict/index.html')
			}
		}, function(msg) {
			layer.msg("异常，请稍后操作！");
		});
		
		return false;
	});
</script>
