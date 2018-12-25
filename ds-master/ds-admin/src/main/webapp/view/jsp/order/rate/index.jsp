<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">订单利率</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">主页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">订单管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">订单利率</li>
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
							<!-- <li class="search-item">
								<input class="search-input" id="name" name="name" placeholder="团购名称" type="text">
							</li>
							<li class="search-item">
								<span class="search-btn">查询</span>
							</li> -->
							<li class="search-item pull-right">
								<a class="btn btn-success" id="add-btn"> <i class="fa fa-plus"></i> 添加利率规则</a>
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
		url : _path + '/order/rate/list.html',
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

		colNames : [ '订单利率', '起始时间', '截止时间', '操作' ],
		colModel : [
			{
				name : 'rateOrder',
				index : 'rateOrder',
				align : 'center',
				width : 100
			},
			{
				name : 'startTime',
				index : 'startTime',
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
				name : 'endTime',
				index : 'endTime',
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
					return '<a href="javascript:_edit(\'' + cellvalue + '\');"><span class="ts-table-start">编辑</span></a><a href="javascript:_delete(\'' + cellvalue + '\');"><span class="ts-table-start">删除</span></a>';
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
			url : _path + '/order/rate/list.html',
			postData : {
				'name' : $.trim($("#name").val())
			}, //发送数据 
			page : 1
		}).trigger("reloadGrid"); //重新载入 
}

//添加
$('#add-btn').on("click", function(){
	ajaxContent(_path + "/order/rate/toModel.html?operaterType=0");
});

//编辑
function _edit(id) {
	ajaxContent(_path + "/order/rate/toModel.html?operaterType=1&id=" + id);
}

//删除
function _delete(id) {
	layer.confirm('您确定要删除该信息吗?', function(idx){
		appajax(_path + '/order/rate/model.html', {'id' : id, 'operaterType' : '2'}, function(data) {
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