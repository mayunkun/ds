<link rel="stylesheet" type="text/css" href="${path }/admin/view/resource/css/addgoods.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
    <div class="page-header pull-left">
        <div class="page-title">用户信息</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">系统管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">用户信息<c:if test="${empty dto.id }">添加</c:if><c:if test="${not empty dto.id }">修改</c:if></li>
    </ol>
    <div class="clearfix"></div>
</div>
<!--END TITLE & BREADCRUMB PAGE-->
<!--BEGIN CONTENT-->
<div class="page-content">
    <div class="row">
        <div class="col-lg-12">
            <div id="sliderTabContent" class="tab-content pan">
                <div id="general-slider-tab" class="tab-pane fade in active">
                    <form class="form-horizontal" id="contentForm">
					<input name="id" id="id" value="${dto.id }" type="hidden">
					<input type="hidden" id="address" name="address" value="${dto.address }" />
					<input type="hidden" name="redirect" value="${redirect }" />

					 <div class="form-body pal">
	                     <div class="form-group">
	                         <label class="col-md-3 control-label"><span class="require">*</span>用户名:</label>
	                         <div class="col-md-6">
	                             <input type="text" name="name" id="name" value="${dto.name }" placeholder="用户名" class="form-control">
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-md-3 control-label"><span class="require">*</span>性别:</label>
	                         <div class="col-md-6">
	                         <input name="sex" type="radio" value="1" checked="checked" /> 男
	                                	<input name="sex" type="radio" value="2" /> 女
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-md-3 control-label"><span class="require">*</span>角色:</label>
		                     <div class="col-md-6">
								<select id="roleid"  class="col-md-3 form-control">
									<option value="">请选择</option>	
									<c:forEach var="var" items="${roles }">
										<option value="${var.id }" <c:if test="${var.id eq dto.roleid }">selected</c:if>>${var.name }</option>
									</c:forEach>
								</select>
							 </div>
						  </div>
                            
                          <div class="form-group">
                              <label class="col-md-3 control-label">手机:</label>
                              <div class="col-md-6">
                                  <input type="text" name="phone" id="phone" value="${dto.phone }" placeholder="手机" class="form-control">
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-md-3 control-label">地址:</label>
                              <div class="col-md-2">
		                        <select class="form-control" id="province" onchange="setAddress(this, 'city');">
		                        	<option value="">请选择</option>
		                        	<c:forEach var="var" items="${provinces }">
		                           	<option value="${var.id }" <c:if test="${var.name eq province }">selected</c:if>>${var.name }</option>
		                        	</c:forEach>
		                        </select>
		                    </div>
	                    <c:if test="${not empty city }">
		                    <div class="col-md-2">
		                        <select class="form-control" id="city" onchange="setAddress(this, 'county');">
		                        	<option value="">请选择</option>
		                        	<c:forEach var="var" items="${citys }">
		                           	<option value="${var.id }" <c:if test="${var.name eq city }">selected</c:if>>${var.name }</option>
		                        	</c:forEach>
		                        </select>
		                    </div>
	                    </c:if>
	                    <c:if test="${not empty county }">
		                    <div class="col-md-2">
		                        <select class="form-control" id="county">
		                        	 <option value="">请选择</option>
		                            <c:forEach var="var" items="${countys }">
		                            	<option value="${var.id }" <c:if test="${var.name eq county }">selected</c:if>>${var.name }</option>
		                        	 </c:forEach>
		                        </select>
		                    </div>
	                    </c:if>
	                </div>
	                
	                <div class="form-group">
                        <label class="col-md-3 control-label">
                        </label>
                        <div class="col-md-6">
                            <input type="text" name="addrDetail" id="addrDetail" value="${addrDetail }" placeholder="详细地址" class="form-control">
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
/*****************区域start*******************/
function setAddress(param, childrenId) {
	$(param).parent().nextAll().remove();
	$('#address').val('');
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

$('#contentForm .btn.btn-success').on('click',function() {
	 var address = $("#province option:selected").text() + ',' 
		 + $("#city option:selected").text() + ','
		 + $("#county option:selected").text() + ','
		 + $.trim($('#addrDetail').val());
	$('#address').val(address);

	var name = $.trim($('#name').val());
	if(!name) {
		layer.msg('用户名不能为空！');
		return false;
	}
	
	var phone = $.trim($('#phone').val());
	if(!phone) {
		layer.msg('手机号不能为空！');
		return false;
	}
	var phoneRex = /^1[34578]\d{9}$/;
	if (!phoneRex.test(phone)) {
		layer.msg("请输入11位有效手机号码！");
		return false;
    }
	
	appajax(_path + "/admin/user/model.html?roleid="+$("#roleid option:selected").val(),
		$("#contentForm").serialize(),
		function(data) {
			if (data.success) {
				if(data.data){
					window.location.href = _path + '/admin/index.html';
				} else{
					ajaxContent(_path + '/admin/user/index.html');
				}
			}
		}, function(msg) {
			layer.msg("异常，请稍后操作！");
		});
	
	return false;
});
</script>