<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<div class="page-title">陪诊服务</div>
	</div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">主页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">陪诊服务</a>&nbsp;&nbsp;<i
			class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li class="active">陪诊服务维护</li>
	</ol>
	<div class="clearfix"></div>
</div>

<!--BEGIN CONTENT-->
<div class="page-content">
    <div class="row">
     <ul id="sliderTab" class="nav nav-tabs ul-edit">
                <li class="active"><a href="#general-slider-tab" data-toggle="tab">基本信息</a></li>
                <li><a href="#album-slider-tab" data-toggle="tab">服务相册</a></li>
            </ul>
        <div class="col-lg-12">
            <div id="sliderTabContent" class="tab-content pan">
                <div id="general-slider-tab" class="tab-pane fade in active">
                    <form action="" method="post" accept-charset="utf-8" class="form-horizontal" id="contentForm">
                    	<input name="id" id="id" value="${dto.id }" type="hidden" />
                    	<input name="type" id="type" value="" type="hidden" />
                    	<input name="supplierId" id="supplierId" value="${dto.supplierId }" type="hidden" />
                    	<input name="cityArea" id="cityArea" value="${dto.cityArea }" type="hidden" /> 
                    	<input name="communitys" id="communitys" value="" type="hidden" />
                    	
                        <div class="form-body pal">
                            <div class="form-group">
                                <label class="col-md-3 control-label">
                                <span class="require">*</span>名称：</label>
                                <div class="col-md-6">
                                    <input type="text" value="${dto.name }" placeholder="请输入服务标题" name="name" id="name" class="form-control">
                                </div>
                            </div>
							<div class="form-group">
                                <label class="col-md-3 control-label">详细描述：</label>
                                <div class="col-md-6">
                                   <textarea id="detail" name="detail" rows="3" class="form-control" style="height:300px;" placeholder="详细描述">${dto.detail }</textarea>
                                   <script type="text/javascript">
									var detailen = KindEditor.create('textarea[name="detail"]', {
										resizeType : 1,
										allowPreviewEmoticons : true,
										allowImageUpload : true,
										urlType : 'domain',
										items : [
											'source', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
											'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
											'insertunorderedlist', '|', 'emoticons', 'image', 'link']
									});
								</script>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"><span class="require">*</span>
                                主图：</label>
                                <div class="col-md-6">
                                    <div id="fine-uploader-imageUrl" class="fine-uploader"></div>
                                    <div class="goodsimg imageUrl" style="<c:if test="${empty dto.imageUrl}">display:none;</c:if>">
	                                   	<input type="hidden" id="imageUrl" name="imageUrl" value="${dto.imageUrl }" class="form-control" readonly />
									    <img id="imageUrl_" style="width: 35px; height: 35px;" src="${dto.imageUrl }"/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-md-offset-3 col-md-6">
                                    <button type="button" id="submit" class="btn btn-success">保存</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div id="modal-wide-width-community" tabindex="-1" role="dialog" aria-labelledby="modal-responsive-label" aria-hidden="true" class="modal fade">
						<div class="modal-dialog modal-wide-width" role="document">
							<div class="modal-content"
								style="overflow: auto; margin: auto; width: 100%;">
								<div class="modal-header">
									<button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
									<h4 id="modal-wide-width-label" class="modal-title">选择社区</h4>
								</div>
								<div class="modal-body">
									<iframe src="${path }/admin/openselect/communitys.html" id="frame-community" name="frame" style="overflow: auto; margin: auto; width: 100%; height: 65%; border: none;"></iframe>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success">确定</button>
									<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
								</div>
							</div>
						</div>
					</div>
					<div id="modal-wide-width-supplier" tabindex="-1" role="dialog" aria-labelledby="modal-responsive-label" aria-hidden="true" class="modal fade">
		                <div class="modal-dialog modal-wide-width" role="document">
		                    <div class="modal-content" style="overflow: auto; margin: auto; width: 100%;">
		                        <div class="modal-header">
		                            <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
		                            <h4 id="modal-wide-width-label" class="modal-title">选择供应商</h4>
		                        </div>
		                        <div class="modal-body">
		                            <iframe src="${path }/admin/openselect/supplier.html" id="frame-supplier" style="overflow: auto; margin: auto; width: 100%; height:60%"></iframe>
		                        </div>
		                        <div class="modal-footer">
		                            <button type="button" class="btn btn-success">确定</button>
		                            <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		                        </div>
		                    </div>
		                </div>
           			</div>
                </div>
                <div id="album-slider-tab" class="tab-pane fade">
                    <form  method="post" accept-charset="utf-8" class="form-horizontal" id="contentFormPhotoAlbum">
                    	<input name="id" id="_id" value="${dto.id }" type="hidden">
                    	<input type="hidden" id="photoAlbum" name="photoAlbum" value="" />
                    	<input name="type" id="type" value="photoAlbum" type="hidden" />
                        <div class="form-body pal">
                            <div class="form-group">
                                <div class="col-md-9">
                                	<ul class="qq-upload-list uploaded-photoAlbum-list">
                                	<c:if test="${not empty dto.photoAlbum}">
                                	<c:if test="${fn:indexOf(dto.photoAlbum, ',') > '-1' }">
	                                		<c:set var="photoAlbums" value="${fn:split(dto.photoAlbum, ',') }" />
							        	  	 <c:forEach var="var" items="${photoAlbums }">
 								        	   <li class="list-item qq-upload-success">
 								                <img class="qq-thumbnail-selector" width="100" height="100" src="${var }">
 								                <button type="button" class="btn btn-success">删除</button>
 								             </li>
	 								         </c:forEach>
                                		</c:if>
                                	<c:if test="${fn:indexOf(dto.photoAlbum, ',') == '-1' }">
							        	   <li class="list-item qq-upload-success">
							                <img class="qq-thumbnail-selector" width="100" height="100" src="${dto.photoAlbum }">
							                <button type="button" class="btn btn-success">删除</button>
							             </li>
                               		</c:if>
                               		</c:if>
                                	</ul>
                                     <div id="_photoAlbum" class="fine-uploader"></div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-md-6">
                                    <button type="button" class="btn btn-success submitBtn">保存</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
 
                
<!--END CONTENT-->

<!-- 商品相册上传模板 -->
<script type="text/template" id="qq-template">
    <div class="qq-uploader-selector" qq-drop-area-text="Drop files here">
        <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
            <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
        </div>
        <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
            <span class="qq-upload-drop-area-text-selector"></span>
        </div>
        <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
            <li class="list-item">
                <div class="qq-progress-bar-container-selector">
                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                </div>
                <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                <img class="qq-thumbnail-selector" width="100" height="100" qq-max-size="100" qq-server-scale>
                <button type="button" class="btn btn-success">删除</button>
            </li>
        </ul>
        <div class="qq-upload-button-selector">
            <div><i class="fa fa-plus-square-o" style="font-size: 120px;"></i></div>
        </div>
    </div>
</script>
<script type="text/template" id="my-template">
    <div class="qq-uploader-selector" qq-drop-area-text="Drop files here">
        <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
            <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
        </div>
        <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
            <span class="qq-upload-drop-area-text-selector"></span>
        </div>
        <div class="qq-upload-button-selector">
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li class="list-item">
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="35" qq-server-scale />
                </li>
            </ul>
            <div class="file-btn">
                <i class="fa fa-plus-square-o" style="font-size: 35px;"></i>
            </div>
        </div>
    </div>
</script>
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
var photoAlbumArr = [],photoAlbumCookieArr = [];
if('${dto.photoAlbum }'){
	photoAlbumArr = '${dto.photoAlbum }'.split(",");
}

var uploader = new qq.FineUploader({
    debug: false,
    element: document.getElementById('_photoAlbum'),
    request: {
        endpoint: _path + '/upload/uploadindexvalidate.html',
        inputName: 'file'
    },
    deleteFile: {
        enabled: false,
        endpoint: '/uploads'
    },
    interceptSubmit: false,
    multiple: true,
    retry: {
       enableAuto: false
    },
    validation:{
        allowedExtensions: ['png','jpg','jpeg','gif'],
        acceptFiles: ['png','jpg','jpeg','gif'],
        sizeLimit: 10000000, /*1024*1024＝1048576 bytes*/
        itemLimit:0
    },
    callbacks: {
        onComplete: function(id,name,responseJSON,xhr) {
        	if(responseJSON.success){
            	var dataAdd = responseJSON.data;
            	if(dataAdd){
            		photoAlbumCookieArr.push(dataAdd);
            		 if(photoAlbumCookieArr.length>0){
		            	$('#photoAlbum').val(photoAlbumCookieArr.join(","));
            		 }else{
            			 $('#photoAlbum').val(photoAlbumCookieArr);
            		 }
            	}
        	}
        }
    }
});

function setCategory(param, childrenId, level) {
	$(param).parent().nextAll().remove();
	var id = $(param).find("option:selected").val();
	if(id){
		appajax(_path + "/admin/accompanying/getcategorydata.html",
		  {"id":id,"level":level},
		  function(data) {
			  if(data.success){
				  if(data.data !='' && data.data != null){
					 var htmlstr = '';
					 if(childrenId == '_categoryId'){
						 htmlstr = ' <div class="col-md-2"><select class="form-control" id="' + childrenId + '" name="' + childrenId + '"><option value="">请选择区划</option>';
					 } else {
						 htmlstr = ' <div class="col-md-2"><select class="form-control" id="' + childrenId + '" name="' + childrenId + '" onchange="setCategory(this, \'_categoryId\', 3);" "><option value="">请选择区划</option>';
					 }
					 if(data.data){
						 $.each(data.data, function(index, value){
					          if(data.success) {
					        	  htmlstr += '<option value="' + value.id + '">' + value.name + '</option>';
					          }
				        });
					 }
					htmlstr += '</select></div>';
					$(param).parent().after(htmlstr); 
				 }
			  }
		  },function(msg){
				alert("异常，请稍后操作！");
			});	
	}else{
		$(param).parent().nextAll().remove();
	}
}

function formatter(value){
	if(value.substr(value.length-1,1)==','){
		value = value.substring(0,value.length-1);
	}
	return value;
}

//保存按钮事件
$('#contentFormPhotoAlbum .submitBtn').on('click',function() {
	var id = $.trim($('#_id').val());
	if (!id) {
		layer.msg('请先保存基本信息！');
		return false;
	}
	
    //合并已上传和刚刚上传为提交的图片
    if ($('#photoAlbum').val().split(',').length > 0) {
        photoAlbumArr = photoAlbumArr.concat($('#photoAlbum').val());
    }
    
    var photoAlbum = '';
    $(photoAlbumArr).each(function(idx, val){
    	if(photoAlbum){
    		photoAlbum += ',';
    	}
    	photoAlbum += val;
    });
    $('#photoAlbum').val(photoAlbum);

    // 空路径处理
    $('#photoAlbum').val(formatter($('#photoAlbum').val()));
	appajax(_path + "/admin/accompanying/model.html", $("#contentFormPhotoAlbum").serialize(), function(data) {
		if (data.success) {
			layer.msg('保存成功！');
			ajaxContent(_path + '/admin/accompanying/index.html?insertRole=${menupower.insertRole}&updateRole=${menupower.updateRole}&deleteRole=${menupower.deleteRole}&searchRole=${menupower.searchRole}');
		}
	}, function(msg) {
		layer.msg("异常，请稍后操作！");
	});

	return false;
});

$('#_photoAlbum').on('click', 'button.btn-success', function(event) {
    event.stopPropagation();
    var dataDel = $(this).data('url');
    var idx = $(this).parent().index();
    if(dataDel){
    	 photoAlbumCookieArr.splice(idx, 1);
    	 if(photoAlbumCookieArr.length>0){
        	$('#photoAlbum').val(photoAlbumCookieArr.join(","));
    	 } else {
    		 $('#photoAlbum').val(photoAlbumCookieArr);
    	 }
    }
    $(this).parent().remove();
});
//编辑状态下 已上传的效果图的删除操作
$('#album-slider-tab .uploaded-photoAlbum-list button.btn-success').on('click', function() {
    event.stopPropagation();
    var idx = $(this).parent().index();
    photoAlbumArr.splice(idx, 1);
    $(this).parent().remove();
});

/*****************区域start*******************/
function setAddress(param, childrenId) {
	$(param).parent().nextAll().remove();
	var _childrenId = '';
	if(childrenId == 'city'){
		_childrenId = 'county';
	}
	if(childrenId == 'city' || childrenId == 'county'){
		var _parentId = $(param).find("option:selected").val();
		if(_parentId){
			appajax(_path + "/area/getdata.html",
			  {"parentId":_parentId },
			  function(data) {
				  if(data.success){
					  if(data.data !='' && data.data != null){
						 var htmlstr = '';
						 if(childrenId == '_categoryId'){
							 htmlstr = ' <div class="col-md-2"><select class="form-control" id="' + childrenId + '" name="' + childrenId + '"><option value="">请选择</option>';
						 } else {
							 htmlstr = ' <div class="col-md-2"><select class="form-control" id="' + childrenId + '" name="' + childrenId + '" onchange="setAddress(this, \''+_childrenId+'\');" "><option value="">请选择</option>';
						 }
						 if(data.data){
							 $.each(data.data, function(index, value){
						          if(data.success) {
						        	  htmlstr += '<option value="' + value.id + '">' + value.name + '</option>';
						          }
					        });
						 }
						htmlstr += '</select></div>';
						$(param).parent().after(htmlstr); 
					 }
				  }
			  },function(msg){
					alert("异常，请稍后操作！");
				});	
		}else{
			$(param).parent().nextAll().remove();
		}
	}
}
/*****************区域end*******************/

$('#modal-wide-width-community').on('hidden.bs.modal', function (e) {
	document.getElementById('frame-community').contentWindow.location.reload(true);
});
	
$('#modal-wide-width-supplier').on('hidden.bs.modal', function (e) {
	document.getElementById('frame-supplier').contentWindow.location.reload(true);
});

$('#modal-wide-width-supplier').on('click', '.btn-success', function(e) {
	$('#modal-wide-width-supplier').modal('hide');
	$('.input-medium').val(window.supplier.name);
	$("#supplierId").val(window.supplier.id);
});

function _remove(param){
	$(param).parent().parent().remove();
};

$('#modal-wide-width-community').on('click', '.btn-success', function(e) {
	var checkedGoodsArr = [];
	$("input[name='community_id']").each(function(idx, val) {
		checkedGoodsArr[idx] = $(this).val();
	});

	$('#modal-wide-width-community').modal('hide');
	$('#goods_list').show();
	if (window.communitys) {
		var html = '';
		$(window.communitys).each(
			function(idx, val) {
					if($.inArray(val.id, checkedGoodsArr) == -1){
						html += '<tr>';
						html += '	<td style="display: none"><input name="community_id" checked="checked" value="' + val.id + '" type="checkbox"></td>';
						html += '	<td class="text-left">'
								+ val.name + '</td>';
						html += '	<td class="text-left">'
								+ val.cityArea
								+ '</td>';
						html += '	<td class="text-left">'
								+ val.address
								+ '</td>';
								html += '	<td class="text-left"><a href="javascript:void(0)" onclick="javascript:_remove(this);">删除</a></td>';
						html += '</tr>';
					}
			}
		);
		$('#goods_list').append(html);
		window.communitys = [];
	}
});

$('#contentForm').on(
	'click',
	'#submit',
	function() {
		if(!$.trim($('#name').val())){
			layer.msg('请输入标题！');
			return false;
		}
		if(!$.trim($('#imageUrl').val())){
			layer.msg('请上传主图！');
			return false;
		}
		detailen.sync();
		appajax(_path + '/admin/banner/model.html',$("#contentForm").serialize(), function(data) {
			if (data.success) {
			  	//要返回数据
			    $("#_id").val(data.data.id);
				layer.msg('操作成功！');
				$('#sliderTab').children().eq(0).removeClass('active');
				$('#general-slider-tab').removeClass(' in active ');
				
				$('#sliderTab').children().eq(1).addClass('active');
				$('#album-slider-tab').addClass(' in active ');
			}
		}, function(msg) {
			layer.msg("异常，请稍后操作！");
		});
		return false;
		
	//编辑状态下 已上传的效果图的删除操作
	$('#album-slider-tab .uploaded-photoAlbum-list button.btn-success').on('click', function() {
	    event.stopPropagation();
	    var idx = $(this).parent().index();
	    photoAlbumArr.splice(idx, 1);
	    $(this).parent().remove();
	});
});
</script>
