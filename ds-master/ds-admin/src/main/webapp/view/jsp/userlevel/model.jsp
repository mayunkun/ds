<link rel="stylesheet" type="text/css" href="${path }/admin/view/resource/css/addgoods.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
    ul,li,ol {
      margin: 0;
      padding: 0;
    }
    .fine-uploader {
      overflow: hidden;
    }
    .ke-container {
        width: 570px !important;
    }
    .pic-upload-btn {
        position: relative;
        overflow: hidden;
    }
    .pic-upload-btn img.pic-upload-show {
        width: 100%;
    }
    .pic-upload-btn input.upload-input {
        position: absolute;
        top: -20px;
        left: -20px;
        width: 1000px;
        height: 1000px;
    }
    .list-item {
        width: initial;
        height: initial;
    }
</style>
<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
    <div class="page-header pull-left">
        <div class="page-title">用户等级维护</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">用户等级管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">用户等级管理</li>
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
                                    <input type="text" name="name" id = "name" value="${dto.name }" placeholder="名称" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">等级：</label>
                                <div class="col-md-6">
                                    <input type="text" name="level" id = "level" value="${dto.level }" placeholder="等级" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">图标：</label>
                               <div class="col-md-6">
                                    <div id="fine-uploader-iconImagePath" class="fine-uploader"></div>
                                    <div class="goodsimg" style="<c:if test="${empty dto.iconImagePath}">display:none;</c:if>">
                                    	<input type="hidden" id="iconImagePath" name="iconImagePath" value="${dto.iconImagePath }" class="form-control" readonly />
									    <img id="iconImagePath_" style="width: 35px; height: 35px;" src="${dto.iconImagePath }"/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
								<label class="col-md-3 control-label">描述：</label>
								<div class="col-md-6">
									<textarea class="col-md-12" rows="12" id="detail" name="detail" >${dto.detail }</textarea>
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

<!-- 上传商品图片的模板 -->
<script type="text/template" id="goodsimg-template">
    <div class="qq-uploader-selector" qq-drop-area-text="Drop files here">
        <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
            <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
        </div>
        <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
            <span class="qq-upload-drop-area-text-selector"></span>
        </div>
        <div class="qq-upload-button-selector">
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                </li>
            </ul>
            <div>
                <button type="submit" class="btn btn-success"> 上传 </button>
            </div>
        </div>
    </div>
</script>
<script type="text/javascript">
	bindUploader('fine-uploader-iconImagePath', function(id,name,responseJSON,xhr) {
		if(responseJSON.success) {
			$('.goodsimg').show();
			$('#iconImagePath').val(responseJSON.data);
			$('#iconImagePath_').attr('src', responseJSON.data);
		}
	});


	 $('#contentForm .btn.btn-success').on(
		'click',
		function() {
			var name = $.trim($('#name').val());
			if (!name) {
				layer.msg('名称不能为空！');
				return false;
			}
	
			appajax(_path + "/admin/userlevel/model.html", $("#contentForm").serialize(), function(data) {
				if (data.success) {
					ajaxContent(_path + '/admin/userlevel/index.html')
				}
			}, function(msg) {
				layer.msg("异常，请稍后操作！");
			});
	
			return false;
		}); 
</script>
