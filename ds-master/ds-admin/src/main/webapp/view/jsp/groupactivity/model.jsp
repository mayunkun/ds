<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
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
        <div class="page-title">团购维护</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">团购管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">团购维护</li>
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
                     <input name="productId" id="productId" value="${dto.productId }" type="hidden">
                     <input name="storeId" id="storeId" value="${dto.storeId }" type="hidden">
                     <input name="categoryId" id="categoryId" value="${dto.categoryId }" type="hidden">

					 <div class="form-body pal">
                            <div class="form-group">
                                <label class="col-md-3 control-label">
	                                <span class="require">*</span>
	                                团购标题：
                                </label>
                                <div class="col-md-6">
                                    <input type="text" name="name" id ="name" value="${dto.name }" placeholder="请填写团购标题" class="form-control">
                                </div>
                            </div>
                              <div class="form-group">
                                <label class="col-md-3 control-label">
                                <span class="require">*</span>设置团购商品：</label>
                                <div class="col-md-3">
                                    <input type="text" id ="_productId" value="${tjProduct.name }" placeholder="请选择加入团购的商品" class="form-control input-medium" />
                                </div>
                            		<button type="button" data-target="#modal-wide-width" data-toggle="modal" class="btn btn-success">选择商品</button>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">团购价格：</label>
                                <div class="col-md-6">
                                    <input type="text" name="price" id="price" value="${dto.price }" placeholder="商品团购价格" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">参团总量：</label>
                                <div class="col-md-6">
                                   <input type="text" name="total" id="total" value="${dto.total }" placeholder="请填写自然数，参与团购商品的数量" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">需满足数量：</label>
                                <div class="col-md-6">
                                   <input type="text" name="needTotal" id="needTotal" value="${dto.needTotal }" placeholder="团购活动成立的最小购买量！" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">虚拟购买数：</label>
                                <div class="col-md-6">
                                   <input type="text" name="buyUserNum" id="buyUserNum" value="${dto.buyUserNum }" placeholder="虚拟已购买参团人数" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">开始时间：</label>
                                <div class="col-md-6">
                                    <input type="text" name="startTime" id="startTime" value="<fmt:formatDate value="${dto.startTime }" type="date" />" placeholder="团购开始时间" class="form-control input-date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">结束时间：</label>
                                <div class="col-md-6">
                                    <input type="text" name="endTime" id="endTime" value="<fmt:formatDate value="${dto.endTime }" type="date" />" placeholder="团购结束时间" class="form-control input-date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">团购商品图片：</label>
                               	<div class="col-md-6">
                                    <div id="fine-uploader-advertiseImg" class="fine-uploader"></div>
                                    <div class="goodsimg" style="<c:if test="${empty dto.advertiseImg}">display:none;</c:if>">
                                    	<input type="hidden" id="advertiseImg" name="advertiseImg" value="${dto.advertiseImg }" class="form-control" readonly />
									    <img id="advertiseImg_" style="width: 35px; height: 35px;" src="${dto.advertiseImg }"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">团购介绍：</label>
                                <div class="col-md-6">
									<textarea cols="3"  rows="3" id="detail" name="detail" style="height:500px;">${dto.detail }</textarea>
                                </div>
                            </div>
                            <script type="text/javascript">
								    var editordetailsen = KindEditor.create('textarea[name="detail"]', {
									resizeType : 1,
									allowPreviewEmoticons : true,
									allowImageUpload : true,
									
									items : [
										'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
										'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
										'insertunorderedlist', '|', 'emoticons', 'image', 'link']
									});
							</script>
				                            
                           <div class="form-group">
                                <div class="col-md-offset-3 col-md-6">
                                    <button type="button" id="btnsubmit" class="btn btn-success ">&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
                                </div>
                            </div>
                           </div>
                   		</form>
			   		    <div id="modal-wide-width" tabindex="-1" role="dialog" aria-labelledby="modal-responsive-label" aria-hidden="true" class="modal fade">
			                <div class="modal-dialog modal-wide-width" role="document">
			                    <div class="modal-content" style="overflow: auto; margin: auto; width: 100%;">
			                        <div class="modal-header">
			                            <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
			                            <h4 id="modal-wide-width-label" class="modal-title">选择商品</h4>
			                        </div>
			                        <div class="modal-body">
			                            <iframe src="${path }/admin/openselect/product.html" id="frame" style="overflow: auto; margin: auto; width: 100%; height:60%"></iframe>
			                        </div>
			                        <div class="modal-footer">
			                            <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
			                            <button type="button" class="btn-success">确定</button>
			                        </div>
			                    </div>
			                </div>
            			</div>
            			 
            			
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
	getTime($('.input-date'));

	bindUploader('fine-uploader-advertiseImg', function(id,name,responseJSON,xhr) {
		if(responseJSON.success) {
			$('.goodsimg').show();
			$('#advertiseImg').val(responseJSON.data);
			$('#advertiseImg_').attr('src', responseJSON.data);
		}
	});
	
	$('#modal-wide-width').on('click','.btn-success', function (e) {
	    $('#modal-wide-width').modal('hide');
	    $('.input-medium').val(window.product.name);
	    $("#productId").val(window.product.id);
	    $("#storeId").val(window.product.storeId);
	    $("#categoryId").val(window.product.categoryId);
	});
	
	$('#contentForm #btnsubmit').on('click',function() {
		var name = $.trim($('#name').val());
		if (!name) {
			layer.msg('团购名称不能为空！');
			return false;
		} 
		var productId = $('#productId').val();
		if (!productId) {
			layer.msg('团购商品不能为空！');
			return false;
		} 
		
		editordetailsen.sync();
		appajax(_path + "/admin/groupactivity/model.html",
			$("#contentForm").serialize(), function(data) {
			if (data.success) {
				ajaxContent(_path + '/admin/groupactivity/index.html')
			}
		}, function(msg) {
			layer.msg("异常，请稍后操作！");
		});
		return false;
	});  
</script>