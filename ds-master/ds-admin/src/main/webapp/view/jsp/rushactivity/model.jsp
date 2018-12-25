<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
    <div class="page-header pull-left">
        <div class="page-title">抢购维护</div>
    </div>
    <ol class="breadcrumb page-breadcrumb">
        <li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li><a href="#">抢购管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">抢购维护</li>
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
                     <input name="productid" id="productid" value="${dto.productId }" type="hidden">
                     <input name="storeId" id="storeId" value="${dto.storeId }" type="hidden">
                      <input name="categoryId" id="categoryId" value="${dto.categoryId }" type="hidden">

					 <div class="form-body pal">
                            <div class="form-group">
                                <label class="col-md-3 control-label">
                                    <span class="require">*</span>抢购标题：</label>
                                <div class="col-md-6">
                                    <input type="text" name="title" id = "title" value="${dto.title }" placeholder="抢购标题" class="form-control">
                                </div>
                            </div>
                              <div class="form-group">
                                <label class="col-md-3 control-label">抢购商品：</label>
                                <div class="col-md-3">
                                    <input type="text" name="productId" id = "productId" value="${tjProduct.name }" placeholder="抢购商品" class="form-control input-medium" />
                                </div>
                            		<button type="button" data-target="#modal-wide-width" data-toggle="modal" class="btn-success">选择商品</button>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">抢购价格：</label>
                                <div class="col-md-6">
                                    <input type="text" name="price" id="price" value="${dto.price }" placeholder="限时抢购价格" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">抢购数量：</label>
                                <div class="col-md-6">
                                   <input type="text" name="restrictTotal" id="restrictTotal" value="${dto.restrictTotal }" placeholder="参加抢购数量" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">限购数量：</label>
                                <div class="col-md-6">
                                   <input type="text" name="restrictionNum" id="restrictionNum" value="${dto.restrictionNum }" placeholder="每人限购数量" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">购买数量：</label>
                                <div class="col-md-6">
                                   <input type="text" name="buyNum" id="buyNum" value="${dto.buyNum }" placeholder="购买数量" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">开始时间：</label>
                                <div class="col-md-6">
                                    <input type="text" name="startTime" id="startTime" value="<fmt:formatDate value="${dto.startTime }" type="date" />" placeholder="开始时间" class="form-control input-date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">结束时间：</label>
                                <div class="col-md-6">
                                    <input type="text" name="endTime" id="endTime" value="<fmt:formatDate value="${dto.endTime }" type="date" />" placeholder="结束时间" class="form-control input-date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">描述：</label>
                                <div class="col-md-6">
									<textarea cols="3"  rows="3" id="intro" name="intro" style="height:500px;">${dto.intro }</textarea>
                                </div>
                            </div>
                            
                            <script type="text/javascript">
								    var editordetailsen = KindEditor.create('textarea[name="intro"]', {
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
                                    <button type="button" class="btn btn-success ">&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
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
<script type="text/javascript">
	$('#modal-wide-width').on('click','.btn-success', function (e) {
	    $('#modal-wide-width').modal('hide');
	    $('.input-medium').val(window.product.name);
	    $("#productid").val(window.product.id);
	    $("#storeId").val(window.product.storeId);
	    $("#categoryId").val(window.product.categoryId);
	});

	getTime($('.input-date'));
	

	
	$('#contentForm .btn.btn-success').on('click',function() {
				 var title = $.trim($('#title').val());
				if (!title) {
					layer.msg('抢购标题不能为空！');
					return false;
				} 
				$("#productId").val($("#productid").val());
				editordetailsen.sync();
				appajax(_path + "/admin/rushactivity/model.html",
					$("#contentForm").serialize(), function(data) {
					if (data.success) {
						ajaxContent(_path + '/admin/rushactivity/index.html')
					}
				}, function(msg) {
					layer.msg("异常，请稍后操作！");
				});
				return false;
			});  
</script>