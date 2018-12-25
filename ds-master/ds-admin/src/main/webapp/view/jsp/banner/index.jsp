<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">官网首图</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">主页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">官网首图</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">官网首图列表</li>
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
								<input class="search-input" id="name" name="name" placeholder="团购名称" type="text">
							</li>
							<li class="search-item">
								<span class="search-btn">查询</span>
							</li>
							<li class="search-item pull-right">
								<a class="btn btn-success" id="add-btn"> <i class="fa fa-plus"></i> 添加活动</a>
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
		url : _path + '/admin/banner/list.html',
		height : ($(window).height())-250,
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

		colNames : [ '功能名称', '首图', '创建时间', '操作' ],
		colModel : [
			{
				name : 'name',
				index : 'name',
				align : 'center',
				width : 100
			},
			{
				name: 'imageUrl', 
				index: 'imageUrl', 
				width: 80, 
				height: 50, 
				align : 'center',
				sortable: false, 
				editable: false, 
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue !=''){
						ret = '<img alt="" src="' + cellvalue + '" height="50px" width="80px">';
					}
					 return ret;
				}
			},
			{
				name : 'createTime',
				index : 'createTime',
				align : 'center',
				width : 100,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = new Date(cellvalue).Format("yyyy-MM-dd");
					}
					return ret;
				}
			},
			{
				name : 'id',
				index : 'id',
				width : 200,
				align : 'center',
				fixed : true,
				sortable : false,
				resize : false,
				formatter : function(cellvalue, options, rowObject) {
					return '<a href="javascript:_edit(\'' + cellvalue + '\');"><span class="ts-table-start">编辑</span></a>';
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
			url : _path + '/admin/groupactivity/list.html',
			postData : {
				'name' : $.trim($("#name").val())
			}, //发送数据 
			page : 1
		}).trigger("reloadGrid"); //重新载入 
}

//添加
$('#add-btn').on("click", function(){
	ajaxContent(_path + "/admin/banner/toModel.html");
});

//编辑
function _edit(id) {
	ajaxContent(_path + "/admin/banner/toModel.html?id=" + id);
}

//删除
function _delete(id) {
	layer.confirm('您确定要删除该信息吗?', function(idx){
		appajax(_path + '/admin/groupactivity/delete.html', {'id' : id}, function(data) {
			if (data.success) {
				$('#grid-table').trigger('reloadGrid');
			}
		}, function(msg) {
			layer.msg("异常，请稍后操作！");
		});
		layer.close(idx);
	});
}
</script>