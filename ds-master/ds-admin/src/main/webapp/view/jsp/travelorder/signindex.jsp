<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">旅游报名</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">主页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">旅游管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">旅游报名</li>
	</ol>
	<div class="clearfix"></div>
</div>
<!--BEGIN CONTENT-->
<div class="page-content">
	<div class="row">
		<div class="col-lg-12"> 
			<!-- 修改 start --> 
				
			<!-- 修改 end -->
		</div>
		<div class="col-lg-12">
			<div class="portlet box">
				
				<div class="portlet-body">
					<div class="mbm">
						<div class="table-responsive">
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--END CONTENT-->
<script type="text/javascript">
jQuery(function($) {
	var grid_selector = "#grid-table";
	var pager_selector = "#grid-pager";
	
	$('.search-btn').on('click',function(){
		getQueryParams(grid_selector);
	});
	
	//enter键查询
	document.onkeydown=function(event){
	    var e = event || window.event || arguments.callee.caller.arguments[0];
	    if(e && e.keyCode==13) {
	    	getQueryParams(grid_selector);
	    }
	};
	
	jQuery(grid_selector).jqGrid({
		datatype : "json",
		url : _path + '/admin/travelorder/signlist.html?acitivtyId=${tjOrder.acitivtyId}',
		height : 560,
		jsonReader : {
			root : function(obj) {
				return obj.rows;
			},
			page : function(obj) {

				return obj.page;
			},
			total : function(obj) {

				return obj.total;
			},
			repeatitems : false
		},

		colNames : [ '用户名称',  '联系方式', '价格', '支付类型', '订单号', '状态', '报名时间', '备注' ],
		colModel : [
			{
				name : 'userName',
				index : 'userName',
				width : 80
			},
			{
				name : 'phone',
				index : 'phone',
				width : 80
			},
			{
				name : 'payPrice',
				index : 'payPrice',
				width : 80,
				align : 'right',
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = cellvalue/100;
					}
					return ret;
				}
			},
			{
				name : 'payType',
				index : 'payType',
				width : 50,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue == '1'){
						ret = '支付宝';
					}
					if(cellvalue == '2'){
						ret = '积分';
					}
					return ret;
				}
			},
			{
				name : 'orderNo',
				index : 'orderNo',
				width : 50
			},
			{
				name : 'state',
				index : 'state',
				width : 50,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue == '-1'){
						ret = '新建';
					}
					if(cellvalue == '1'){
						ret = '已支付';
					}
					if(cellvalue == '8'){
						ret = '完成';
					}
					if(cellvalue == '-2'){
						ret = '取消';
					}
					return ret;
				}
			},
			{
				name : 'createTime',
				index : 'createTime',
				width : 70,
				formatter : function(cellvalue,options, rowObject) {
					var ret = '';
					if(cellvalue != null){
						ret = new Date(cellvalue).Format("yyyy-MM-dd hh:mm");
					} 
					return ret;
				}
			},
			
			{
				name : 'detail',
				index : 'detail',
				width : 200,
			}
		],
		loadComplete : function() {
			var table = this;
			setTimeout(function(){
				updatePagerIcons(table);
			}, 0);
		},

		viewrecords : true,
		rowNum : 10,
		rowList : [ 10, 20, 30 ],
		pager : pager_selector,
		altRows : true,
		multiselect : false,
		multiboxonly : true,
		autowidth : true,
		sortable : true, //可以排序 
		sortname : 'id', //排序字段名 
		sortorder : "desc", //排序方式：倒序，本例中设置默认按id倒序排序 
	});

	$(window).resize(function() {
		$(window).unbind("onresize");
		$(grid_selector).setGridHeight($(window).height() - 170);
		$(window).bind("onresize", this);
	});
});


</script>