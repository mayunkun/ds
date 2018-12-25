<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">店铺状态</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">主页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">店铺状态管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">店铺状态</li>
	</ol>
	<div class="clearfix"></div>
</div>
<!--BEGIN CONTENT-->
<div class="page-content">
	<div class="row">
		<div class="col-lg-12"> 
			<!-- 修改 start --> 
				<div class="box-header">
						<div class="collapse navbar-collapse">
						<nav class="navbar navbar-default">
						<ul class="col-md-12 search-list clearfix">
							<li class="search-item">
								<input class="search-input" id="storeName" name="storeName" placeholder="搜索" type="text">
							</li>
							<li class="search-item">
								<select class="form-control" id="state" name="state" style="width: 200px;">
									<option value="">状态</option>
									<option value="-2">不通过</option>
									<option value="-1">待审核</option>
									<option value="1">通过</option>
								</select>
							</li>
							<li class="search-item">
								<span class="search-btn">查询</span>
							</li>
						</ul>
						</nav>
					</div>
				</div> 
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
		url : _path + '/admin/storeaudit/list.html',
		height : 350,
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

		colNames : [ '店铺名称', '联系方式', '店铺分类', '店铺等级' ,'店铺地址', '审核状态', '操作' ],
		colModel : [
			{
				name : 'storeName',
				index : 'storeName',
				width : 100
			},
			{
				name : 'storePhone',
				index : 'storePhone',
			},
			{
				name : 'categoryId',
				index : 'categoryId',
				width : 100
			},
			{
				name : 'levelId',
				index : 'levelId',
				width : 100
			},
			{
				name : 'address',
				index : 'address',
				width : 100
			},
			{
				name : 'state',
				index : 'state',
				width : 80,
				formatter : function(cellvalue, options, rowObject) {
					if (cellvalue == '1') {
						return "审核通过";
					}else if(cellvalue == '-1'){
						return "待审核"
					}else if(cellvalue == '-2'){
						return "未通过"
					}
				}
			},
			{
				name : 'id',
				index : 'id',
				width : 200,
				fixed : true,
				sortable : false,
				resize : false,
				formatter : function(cellvalue, options, rowObject) {
					return '<a href="javascript:_pass(\'' + cellvalue + '\');"><span class="ts-table-start">通过</span></a>' +
						   '<a href="javascript:_reject(\'' + cellvalue + '\');"><span class="ts-table-start">驳回</span></a>' + 
        			       '<a href="javascript:_delete(\'' + cellvalue +'\');"><span class="ts-table-btn">取消</span></a>';
				}
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

function getQueryParams(grid_selector) {
	$(grid_selector).jqGrid(
		'setGridParam',
		{
			url : _path + '/admin/storeaudit/list.html',
			postData : {
				'storeName' : $.trim($("#storeName").val()),
				'state' : $.trim($("#state").val())
			}, //发送数据 
			page : 1
		}).trigger("reloadGrid"); //重新载入 
}

//通过
function _pass(id) {
	appajax(_path + "/admin/storeaudit/modelindex.html",
		{id : id, state : "1"},
		function(data) {
		if (data.success) {
			$('#grid-table').trigger("reloadGrid");
			layer.msg("审核成功！");
			
		}
	}, function(msg) {
		layer.msg("异常，请稍后操作！");
	});
}

//驳回
function _reject(id) {
	appajax(_path + "/admin/storeaudit/modelindex.html",
		 {'id' : id, 'state' : '-2'}, 
		function(data) {
		if (data.success) {
			$('#grid-table').trigger("reloadGrid");
			layer.msg("驳回成功！");
		}
	}, function(msg) {
		layer.msg("异常，请稍后操作！");
	});
}

//删除
function _delete(id) {
	layer.confirm('您确定要删除该信息吗?', function(idx){
		appajax(_path + '/admin/storeaudit/delete.html', {'id' : id}, function(data) {
			if (data.success) {
				$('#grid-table').trigger('reloadGrid');
				layer.msg("删除成功！");
			}
		}, function(msg) {
			layer.msg("异常，请稍后操作！");
		});
		layer.close(idx);
	});
}
</script>