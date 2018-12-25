<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">${dto.groupname }设置</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:ajaxContent('${path }/admin/datadict/index.html');">数据字典</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">${dto.groupname }设置</li>
	</ol>
	<div class="clearfix"></div>
</div>
<!--BEGIN CONTENT-->
<div class="page-content">
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box">
				<div class="portlet-header">
					<div>
						<a href="javascript:childAdd();"><span class="btn btn-success" id="add-btn">新增</span></a>
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
	
	jQuery(grid_selector).jqGrid({
		datatype : "json",
		url : _path + '/admin/datadict/childlist.html?grouptype=${dto.grouptype }',
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

		colNames : [ '数据名称', '编码', '操作' ],
		colModel : [
			{
				name : 'typename',
				index : 'typename',
				width : 300
			},
			{
				name : 'typecode',
				index : 'typecode',
				width : 300
			},
			{
				name : 'id',
				index : 'id',
				width : 200,
				fixed : true,
				sortable : false,
				resize : false,
				formatter : function(cellvalue, options, rowObject) {
					return '<a href="javascript:_edit(\'' + cellvalue +'\');"><span class="ts-table-start">编辑</span></a>' + 
      			           '<a href="javascript:_delete(\'' + cellvalue +'\');"><span class="ts-table-btn">删除</span></a>';;
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

//添加行
function childAdd(){
	 ajaxContent(_path + "/admin/datadict/submodelindex.html?typegroupid=" + $('#pid').val());
}
 
//编辑行
function _edit(id) {
	ajaxContent(_path + "/admin/datadict/submodelindex.html?id=" + id + '&typegroupid=' + $('#pid').val());
}

//删除
function _delete(id) {
	layer.confirm('您确定要删除该信息吗?', function(idx){
		appajax(_path + '/admin/datadict/childdelete.html', {'id' : id}, function(data) {
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