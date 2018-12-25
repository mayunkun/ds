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
				<div class="row search-box">
					<div class="col-md-12">
						<ul class="col-md-12 search-list clearfix">
							<li class="search-item">
								<input type="text" id="name" name="name" placeholder="旅游名称" class="search-input">
							</li>
							<li class="search-item">
								<input type="text" id="cityArea" name="cityArea" placeholder="区域" class="search-input">
							</li>
							<li class="search-item">
								<select id="type" name="type" class="form-control" style="width:150px;">
                                     <option value="">类型</option>
                                     <option value="1">周边</option>
                                     <option value="2">国内</option>
                                     <option value="3">出境</option>
                                </select>
							</li>
							<li class="search-item">
								<select id="state" name="state" class="form-control" style="width:150px;">
                                     <option value="">状态</option>
                                     <option value="1">上线</option>
                                     <option value="-1">下线</option>
                                </select>
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
		url : _path + '/admin/travel/list.html',
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

		colNames : [ '旅游名称', '图片', '分类', '类型', '价格(元)', '总人数', '已报名人数', '区域',  '开始时间', '结束时间', '状态', '操作' ],
		colModel : [
			{
				name : 'name',
				index : 'name',
				width : 100
			},
			{
				name : 'imagePath',
				index : 'imagePath',
				width: 60, 
				height: 50, 
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
				name : 'categoryName',
				index : 'categoryName',
				width : 50
			},
			{
				name : 'type',
				index : 'type',
				width : 50,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue == '1'){
						ret = '首页';
					}
					if(cellvalue == '2'){
						ret = '周边近程';
					}
					if(cellvalue == '3'){
						ret = '国内长途';
					}
					if(cellvalue == '4'){
						ret = '出境游';
					}
					return ret;
				}
			},
			{
				name : 'price',
				index : 'price',
				align : 'right',
				width : 50,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = cellvalue/100;
					}
					return ret;
				}
			},
			{
				name : 'totalCount',
				index : 'totalCount',
				align : 'right',
				width : 50
			},
			{
				name : 'appliedCount',
				index : 'appliedCount',
				align : 'right',
				width : 50
			},
			{
				name : 'cityArea',
				index : 'cityArea',
				width : 80
			},
			{
				name : 'startTime',
				index : 'startTime',
				width : 50,
				formatter : function(cellvalue,options, rowObject) {
					var ret = '';
					if(cellvalue != null){
						ret = new Date(cellvalue).Format("yyyy-MM-dd");
					} 
					return ret;
				}
			},
			{
				name : 'endTime',
				index : 'endTime',
				width : 50,
				formatter : function(cellvalue,options, rowObject) {
					var ret = '';
					if(cellvalue != null){
						ret = new Date(cellvalue).Format("yyyy-MM-dd");
					} 
					return ret;
				}
			},
			{
				name : 'state',
				index :'state',
				width : 40,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue == '1'){
						ret = '上线';
					}
					if(cellvalue == '-1'){
						ret = '下线';
					}
					return ret;
				}
			},
			{
				name : 'id',
				index : 'id',
				width : 90,
				fixed : true,
				sortable : false,
				resize : false,
				formatter : function(cellvalue, options, rowObject) {
					return '<a href="javascript:_look(\'' + cellvalue + '\');"><span class="ts-table-start">查看报名</span></a>';
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
			url : _path + '/admin/travel/list.html',
			postData : {
				'name' : $.trim($('#name').val()),
				'type' : $('#type option:selected').val(),
				'state' : $('#state option:selected').val(),
			}, //发送数据 
			page : 1
		}).trigger("reloadGrid"); //重新载入 
}
//查看报名
function _look(id) {
	ajaxContent(_path + "/admin/travelorder/signindex.html?acitivtyId=" + id);
}
</script>