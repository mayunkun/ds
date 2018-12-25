<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div class="page-title">角色信息</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">系统管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">角色信息<c:if test="${empty dto.id }">添加</c:if><c:if test="${not empty dto.id }">修改</c:if></li>
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
                                <label class="col-md-3 control-label"><span class="require">*</span>角色名称:</label>
                                <div class="col-md-6">
                                    <input type="text" name="name" id="name" value="${dto.name }" placeholder="角色名称" class="form-control">
                                </div>
                            </div>
                          
                          <c:if test="${dto.pid != '0' || dto.level != '1' }">
							<div class="form-group">
								<label class="col-md-3 control-label">父节点:</label>
								<div class="col-md-6">
									<select class="chosen-select  search-input lg" name="pid" id="pid">
										<option value="0" >---请选择---</option>
										<c:forEach var="var" items="${rolelist }">
											<option value="${var.id }" <c:if test="${var.id==dto.pid}">selected="selected"</c:if>>${var.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							 <div class="form-group">
                                <label class="col-md-3 control-label"><span class="require">*</span> 主图：</label>
                                <div class="col-md-6">
                                    <div id="fine-uploader-imageUrl" class="fine-uploader"></div>
                                    <div class="goodsimg imageUrl" style="<c:if test="${empty dto.imageUrl}">display:none;</c:if>">
	                                   	<input type="hidden" id="imageUrl" name="imageUrl" value="${dto.imageUrl }" class="form-control" readonly />
									    <img id="imageUrl_" style="width: 35px; height: 35px;" src="${dto.imageUrl }"/>
                                    </div>
                                </div>
                            </div>
							 <div class="form-group">
                                <label class="col-md-3 control-label">等级:</label>
                                <div class="col-md-6">
                                    <input type="text" name="level" id="level" value="${dto.level }" placeholder="等级" class="form-control">
                                </div>
                            </div>
						</c:if>
						
							<div class="form-group">
                                <label class="col-md-3 control-label">详情描述:</label>
                                <div class="col-md-6">
                                    <input type="text" name="detail" id="detail" value="${dto.detail }" placeholder="详情" class="form-control">
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
                <button type="submit" class="btn btn-success">上传图片</button>
            </div>
        </div>
    </div>
</script>

<script type="text/javascript">
	bindUploader('fine-uploader-imageUrl', function(id,name,responseJSON,xhr) {
		if(responseJSON.success) {
			$('.goodsimg.imageUrl').show();
			$('#imageUrl').val(responseJSON.data);
			$('#imageUrl_').attr('src', responseJSON.data);
		}
	});

	$('#contentForm .btn.btn-success').on('click', function() {
		var name = $.trim($('#name').val());
		if(!name){
			layer.msg('角色名称不能为空！');
			return false;
		}
		
		var pid = $("#pid option:selected").val();
		var level = $.trim($('#level').val());
		if(pid=='0' && level<=1){
			layer.msg('等级不能小于1！');
			return false;
		}
		var numRex = /^[0-9]*$/;
		if (!numRex.test(level)) {
			layer.msg('等级必须为正整数！');
			return false;
		}
		
		if (!numRex.test(level)) {
			layer.msg('等级必须为正整数！');
			return false;
		}
		
		appajax(_path + "/admin/role/model.html",
			$("#contentForm").serialize(),
			function(data) {
				if(data.msg == '-3'){
					layer.msg("角色编码已经存在！");
				}
				if (data.success) {
					ajaxContent(_path + '/admin/role/index.html')
				}
			}, function(msg) {
				layer.msg("异常，请稍后操作！");
			});
		
		return false;
	});
</script>
