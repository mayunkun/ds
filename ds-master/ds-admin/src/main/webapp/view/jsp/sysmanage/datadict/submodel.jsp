<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">${pdto.groupname }</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:ajaxContent('${path }/admin/datadict/addchildindex.html');">${pdto.groupname }列表</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">${pdto.groupname }维护</li>
	</ol>
	<div class="clearfix"></div>
</div>

<div class="page-content">
	<div class="tab-content">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="contentForm">
						<input id="id" type="hidden" name="id" value="${dto.id }">
						<input id="typegroupid" type="hidden" name="typegroupid" value="${pdto.id }">
						
						<div class="form-group">
							<label for="form-field-1" class="col-sm-3 control-label no-padding-right">父节点名称: </label>
							<div class="col-sm-9">
								<label>${pdto.groupname }</label>
							</div>
						</div>
						
						<div class="form-group">
							<label for="form-field-1" class="col-sm-3 control-label no-padding-right"><span class='require'>*</span>&nbsp;&nbsp;数据名称: </label>
							<div class="col-sm-9">
								<input type="text" class="col-xs-10 col-sm-5" name="typename" id="typename" value="${dto.typename }" placeholder="数据名称">
							</div>
						</div>
						<div class="space-4"></div>
	
						<div class="form-group">
							<label for="form-field-1" class="col-sm-3 control-label no-padding-right"><span class='require'>*</span>&nbsp;&nbsp;编码: </label>
							<div class="col-sm-9">
								<input type="text" class="col-xs-10 col-sm-5" name="typecode" id="typecode" value="${dto.typecode }" placeholder="编码">
							</div>
						</div>
						<div class="space-4"></div>
	
						<div class="form-group" style="text-align: center;">
							<button class="btn btn-success">保存</button>
						</div>
						<div class="space-4"></div>
					</form>
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
</div>
<!-- /.page-content -->
<script type="text/javascript">
$('#contentForm .btn.btn-success').on('click', function() {
	var typename = $.trim($('#typename').val());
	if (!typename) {
		layer.msg('数据名称不能为空！');
		return false;
	}
	
	var typecode = $.trim($('#typecode').val());
	if (!typecode) {
		layer.msg('数据名称不能为空！');
		return false;
	}
	
	appajax(_path + "/admin/datadict/savechild.html",
	$("#contentForm").serialize(),
	function(data) {
		if (data.success) {
			ajaxContent(_path + '/admin/datadict/addchildindex.html?id=' + $('#typegroupid').val());
		}
	}, function(msg) {
		layer.msg("异常，请稍后操作！");
	});
	
	return false;
});
</script>
