<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">角色列表</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">角色管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">角色列表</li>
	</ol>
	<div class="clearfix"></div>
</div>
<!--BEGIN CONTENT-->
<div class="page-content">
	<div class="row">
		<div class="col-lg-12">
			<!-- 修改 start --> 
			<div class="row search-box">
				<div class="col-md-12">
					<ul class="col-md-12 search-list clearfix">
						<li class="search-item">
							<span class="search-kwd">角色名称：</span> 
							<input class="search-input" id="name" name="name" type="text">
						</li>
						<li class="search-item">
							<span class="search-kwd">等&nbsp;&nbsp;&nbsp;级：</span> 
							<input class="search-input" id="level" name="level" type="text"> 
						</li>
					</ul>
				</div>
				<div class="col-md-12" >
					<ul class="col-md-12 search-list clearfix">
						<li>
							<span class="search-btn">查询</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 修改 end -->
		</div>
		<div class="col-lg-12">
			<div class="portlet box">
				<div class="portlet-header">
					<div>
						<span class="btn btn-success" id="add-btn">新增</span>
					</div>
				</div>
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
		url : _path + '/admin/role/list.html',
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

		colNames : [ '名称', '头像', '上级角色', '等级', '详情', '操作' ],
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
				name : 'pName',
				index : 'pName',
				align : 'center',
				width : 100,
// 				formatter : function(cellvalue, options, rowObject) {
// 					if(cellvalue == '0'){
// 						return '';
// 					}
// 				}
			},
			{
				name : 'level',
				index : 'level',
				width : 100,
				align : 'center',
			},
			{
				name : 'detail',
				index : 'detail',
				align : 'center',
				width : 100
			},
			{
				name : 'id',
				index : 'id',
				width : 200,
				fixed : true,
				align : 'center',
				sortable : false,
				resize : false,
				formatter : function(cellvalue, options, rowObject) {
					return '<a href="javascript:_edit(\'' + cellvalue +'\');"><span class="ts-table-start">编辑</span></a>' + 
        			   	   '<a href="javascript:_permissionset(\'' + cellvalue +'\');"><span class="ts-table-issue">权限设置</span></a>' + 
 			   	           '<a href="javascript:_delete(\'' + cellvalue +'\');"><span class="ts-table-btn">删除</span></a>';
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
	var name = $.trim($("#name").val());
	var level = $.trim($("#level").val());
	$(grid_selector).jqGrid(
		'setGridParam',
		{
			url : _path + '/admin/role/list.html',
			postData : {
				'name' : name,
				'level' : level
			}, //发送数据 
			page : 1
		}).trigger("reloadGrid"); //重新载入 
}

//添加
$('#add-btn').on("click", function(){
	ajaxContent(_path + '/admin/role/modelindex.html');
});

//编辑
function _edit(id) {
	ajaxContent(_path + '/admin/role/modelindex.html?id=' + id);
}

//权限设置
function _permissionset(id) {
	ajaxContent(_path + '/admin/role/permissionindex.html?id=' + id);
}

//删除
function _delete(id) {
	layer.confirm('您确定要删除该信息吗?', function(idx){
		appajax(_path + '/admin/role/delete.html', {'id' : id}, function(data) {
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
