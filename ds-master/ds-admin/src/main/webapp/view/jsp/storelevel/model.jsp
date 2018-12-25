<link rel="stylesheet" type="text/css" href="${path }/admin/view/resource/css/addgoods.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
    <div class="page-header pull-left">
        <div class="page-title">店铺等级维护</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">店铺等级管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">店铺等级管理</li>
    </ol>
    <div class="btn btn-blue reportrange hide"><i class="fa fa-calendar"></i>&nbsp;<span></span>&nbsp;report&nbsp;<i class="fa fa-angle-down"></i>
		</div>
    <div class="clearfix"></div>
</div>
<!--END TITLE & BREADCRUMB PAGE-->
<!--BEGIN CONTENT-->
<div class="page-content">
    <div class="row">
        <div class="col-lg-12">
            <div id="sliderTabContent" class="tab-content pan">
                <div id="general-slider-tab" class="tab-pane fade in active">
                    <form accept-charset="utf-8" class="form-horizontal" id="contentForm">
                    <input name="id" id="id" value="${dto.id }" type="hidden">

					 <div class="form-body pal">
                            <div class="form-group">
                                <label class="col-md-3 control-label">名称：</label>
                                <div class="col-md-6">
                                    <input type="text" name="level" id = "level" value="${dto.level }" placeholder="名称" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">描述：</label>
                                <div class="col-md-6">
                                    <input type="text" name="instro" id = "instro" value="${dto.instro }" placeholder="描述" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">产品数量：</label>
                                <div class="col-md-6">
                                    <input type="text" name="productNum" id = "productNum" value="${dto.productNum }" placeholder="产品数量" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">图片数量：</label>
                                <div class="col-md-6">
                                    <input type="text" name="imageNum" id = "imageNum" value="${dto.imageNum }" placeholder="图片数量" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">模版数量：</label>
                                <div class="col-md-6">
                                    <input type="text" name="templateNum" id = "templateNum" value="${dto.templateNum }" placeholder="模版数量" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">价格：</label>
                                <div class="col-md-6">
                                    <input type="text" name="price" id = "price" value="${dto.level }" placeholder="价格" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">排序：</label>
                                <div class="col-md-6">
                                    <input type="text" name="sort" id = "sort" value="${dto.sort }" placeholder="排序" class="form-control">
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
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
</div>
<!-- /.page-content -->
<script type="text/javascript">
	
	 $('#contentForm .btn.btn-success').on(
		'click',
		function() {
			var level = $.trim($('#level').val());
			if (!level) {
				layer.msg('名称不能为空！');
				return false;
			}
	
			appajax(_path + "/admin/storelevel/model.html", $("#contentForm")
					.serialize(), function(data) {
				if (data.success) {
					ajaxContent(_path + '/admin/storelevel/index.html')
				}
			}, function(msg) {
				layer.msg("异常，请稍后操作！");
			});
	
			return false;
		}); 
</script>
