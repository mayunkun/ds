<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">菜单信息</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">系统管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">菜单信息<c:if test="${empty dto.id }">添加</c:if><c:if test="${not empty dto.id }">修改</c:if></li>
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
						<input name="_pid" id="_pid" value="${_pid }" type="hidden">
						
						<div class="form-body pal">
							<div class="form-group">
								<label class="col-md-3 control-label"><span class='require'>*</span>&nbsp;&nbsp;菜单名称：</label>
								<div class="col-md-6">
									 <div class="input-icon right">
		                                <input type="text" class="form-control" value="${dto.name }" placeholder="菜单名称" name="name" id="name">
		                             </div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">URL：</label>
								<div class="col-md-6">
									<input type="text" class="form-control" value="${dto.url }" placeholder="URL" name="url" id="url">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">父菜单: </label>
								<div class="col-md-6">
									<select class="chosen-select form-control" name="pid" id="pid">
										<option value="0" >---请选择---</option>
										<c:forEach var="var" items="${pmenu}">
											<option value="${var.id}" <c:if test="${var.id==dto.pid}">selected="selected"</c:if>>${var.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图标: </label>
								<div class="col-md-6">
									<select data-style="btn-white" class="selectpicker form-control">
										<c:forEach var="var" items="${icons}">
							                <option data-icon="${var.typename }" value="${var.id}" <c:if test="${var.id==dto.icon}">selected="selected"</c:if>>${var.typename }</option>
							            </c:forEach>
						            </select>
						            <input type="hidden" id="icon" name="icon" value="${dto.icon }" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">等级: </label>
								<div class="col-md-6">
									<input type="text" class="form-control" value="${dto.level }" placeholder="等级" name="level" id="level">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">序号: </label>
								<div class="col-md-6">
									<input type="text" class="form-control" value="${dto.num }" placeholder="序号" name="num" id="num">
								</div>
							</div>
		                    <div class="form-group">
		                        <div class="col-md-offset-3 col-md-6">
		                        	<button class="btn btn-success">保存</button>
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
    /** 处理图标**/
	$('.selectpicker').selectpicker({
	    iconBase: 'fa',
	    tickIcon: 'fa-check'
	});
	
	$('.selectpicker').selectpicker('val', '${dto.icon}');
	
	$('.selectpicker').on('change', function() {
		$('#icon').val($('.selectpicker').val());
	});
	
	$('#contentForm .btn.btn-success').on('click', function() {
		var name = $.trim($('#name').val());
		if (!name) {
			layer.msg('菜单名称不能为空！');
			return false;
		}
		
		appajax(_path + "/admin/function/model.html",
		$("#contentForm").serialize(),
		function(data) {
			if (data.success) {
				ajaxContent(_path + '/admin/function/index.html?pid=' + $("#pid").val())
			}
		}, function(msg) {
			layer.msg("异常，请稍后操作！");
		});
		
		return false;
	});
</script>
