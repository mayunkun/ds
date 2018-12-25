<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    .col-md-6 {
      text-align: left;
      padding-top: 7px;
      margin-bottom: 0;
    }
</style>
<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
		<div class="page-title">订单维护</div>
	</div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">主页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">订单管理</a>&nbsp;&nbsp;<i
			class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li class="active">订单维护</li>
	</ol>
	<div class="clearfix"></div>
</div>

<!--BEGIN CONTENT-->
<div class="page-content">
    <div class="row">
     <ul id="sliderTab" class="nav nav-tabs ul-edit">
                <li class="active"><a href="#general-slider-tab" data-toggle="tab">基本信息</a></li>
            </ul>
        <div class="col-lg-12">
            <div id="sliderTabContent" class="tab-content pan">
                <div id="general-slider-tab" class="tab-pane fade in active">
                    <form action="" method="post" accept-charset="utf-8" class="form-horizontal" id="contentForm">
                    	<input name="id" id="id" value="${dto.id }" type="hidden" />
                        <div class="form-body pal">
                            <div class="form-group">
                                <label class="col-md-3 control-label">
                                	订单ID：</label>
                                <div class="col-md-6">
                                    <input type="text" value="${dto.orderId }" name="orderId" id="orderId" readonly="readonly" class="form-control">
                                </div>
                            </div>
							<div class="form-group">
                                <label class="col-md-3 control-label"> <span class="require">*</span>订单状态：</label>
                                <div class="col-md-6">
                                    <select class="form-control" id="status" name="status">
	                            		<option value=""></option>
<%-- 	                            		<c:if test="${dto.status lt 1 }"><option value="1">待押币</option></c:if> --%>
	                            		<c:if test="${dto.status eq 1 }"><option value="2">待放款</option></c:if>
	                            		<c:if test="${dto.status eq 2 }"><option value="3">待还款</option></c:if>
	                            		<c:if test="${dto.status eq 3 }"><option value="4">待退币</option></c:if>
<%-- 	                            		<c:if test="${dto.status eq 3 }"><option value="5">逾期</option></c:if> --%>
	                            		<c:if test="${dto.status eq 4 or dto.status eq 5}"><option value="6">完成</option></c:if>
<%-- 	                            		<c:if test="${dto.status eq 1 }"><option value="7">取消</option></c:if> --%>
	                            		<c:if test="${dto.status eq 1 }"><option value="8">不通过</option></c:if>
	                            		<!-- <option value="1">待押币</option>
	                            		<option value="2">待放款</option>
	                            		<option value="3">待还款</option>
	                            		<option value="4">待退币</option>
	                            		<option value="5">逾期</option>
	                            		<option value="6">完成</option>
	                            		<option value="7">取消</option>
	                            		<option value="8">不通过</option> -->
	                            	</select>
                                </div>
                            </div>
                            <div class="form-group operator addmoney" style="">
                            	<label class="col-md-3 control-label"> <span class="require">*</span>压币数量：</label>
                                <div class="col-md-6">
                                    <input type="text" value="${dto.addMoney }" name="addMoney" id="addMoney" class="form-control">
                                </div>
                            </div>
                            <div class="form-group operator addmoney">
                            	<label class="col-md-3 control-label"> <span class="require">*</span>压币时间：</label>
                                <div class="col-md-6">
                                    <input type="text" value="<fmt:formatDate value="${dto.addTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />" placeholder="请输入压币时间" name="addTime" id="addTime" class="form-control input-date">
                                </div>
                            </div>
                            <div class="form-group operator backmoney">
                            	<label class="col-md-3 control-label"> <span class="require">*</span>还款金额：</label>
                                <div class="col-md-6">
                                    <input type="text" value="${dto.backMoney }" name="backMoney" id="backMoney" class="form-control">
                                </div>
                            </div>
                            <div class="form-group operator backmoney">
                            	<label class="col-md-3 control-label"> <span class="require">*</span>还款时间：</label>
                                <div class="col-md-6">
                                    <input type="text" value="<fmt:formatDate value="${dto.backTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />" placeholder="请输入还款时间" name="backTime" id="backTime" class="form-control input-date">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-md-offset-3 col-md-6">
                                    <button type="button" id="submit" class="btn btn-success">保存</button>
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

<script type="text/javascript">
datetimepicker($('.input-date')); 
var _path = '${path}';

$(".operator").hide();

$("#status").change(function(){
	$(".operator").hide();
	if($("#status").val()=='2'){
		$(".addmoney").show();
	}
	if($("#status").val()=='4'){
		$(".backmoney").show();
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
		/* var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/ 
		if(!$.trim($('#rateOrder').val()) || $('#rateOrder').val()<=0 || $('#rateOrder').val()>=1 || !re.test($('#rateOrder').val()) ){
			layer.msg('请输入正确利率！');
			return false;
		}
		if(!$.trim($('#startTime').val())){
			layer.msg('请选择开始时间！');
			return false;
		}
		if(!$.trim($('#endTime').val())){
			layer.msg('请选择结束时间！');
			return false;
		}
		if($.trim($('#startTime').val())>$.trim($('#endTime').val())){
			layer.msg('开始时间大于结束时间！');
			return false;
		} */
// 		detailen.sync();
		appajax(_path + '/order/operator/model.html',$("#contentForm").serialize(), function(data) {
			if (data.success) {
				layer.msg('操作成功！');
				ajaxContent(_path + '/order/operator/index.html');
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
