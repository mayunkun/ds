<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="../../common/resource.jsp" />
<style type="text/css">
	body,.container {
		background: #fff;
	}
	.container {
		padding: 0 15px;
		margin:	0;
	}
</style>
<!--BEGIN CONTENT-->
<div class="container">
	<div class="row">
		<div class="col-lg-12"> 
			<!-- 修改 start --> 
			<div class="search-box" style="margin: 0 0 0px 0;padding: 0px 0;">
				<ul class="col-md-12 search-list clearfix">
					<li class="search-item">
						<input class="search-input" id="username" name="username" placeholder="用户名称" type="text">
					</li>
					<li class="search-item">
						<input class="search-input" id="phone" name="phone" placeholder="手机" type="text">
					</li>
					<li class="search-item">
						<span class="search-btn">查询</span>
					</li>
				</ul>
			</div>
			<!-- 修改 end -->
		</div>
		<div class="col-lg-12">
			<div class="portlet box">
				<div class="portlet-body">
					<div class="row">
                         <div class="col-lg-12">
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
</div>
<!--END CONTENT-->
<script type="text/javascript">
var type = $('#type').val();
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
		url : _path + '/order/dispatch/modellist.html',
		height : 400,
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
		colNames : [ 'id', '名称', '年龄', '手机','地址' ],
		colModel : [
			{
				name : 'id',
				index : 'id',
				width : 10,
				hidden : true
			},
			{
				name : 'name',
				index : 'name',
				align : 'center',
				width : 150
			},
			{
				name : 'sex',
				index : 'sex',
				align : 'center',
				width : 100,
				formatter : function(cellvalue,
						options, rowObject) {
					if (cellvalue == '1') {
						return "男";
					} else if (cellvalue == '2') {
						return "女";
					}
				}
			},
			{
				name : 'phone',
				index : 'phone',
				align : 'center',
				width : 150
			},
			{
				name : 'address',
				index : 'address',
				align : 'center',
				width : 400
			},
		],
		loadComplete : function() {
			//单选处理
			var gridId = grid_selector.substring(1);
			$("#cb_"+gridId).hide();//隐藏全选按钮
			$(grid_selector).find("td[aria-describedby='"+gridId+"_cb']").find("input[type='checkbox']").prop("type","radio") ;//将checkbox替换为radio
			$(grid_selector).find("td[aria-describedby='"+gridId+"_cb']").find("input[type='radio']").prop("name",gridId);//radio设为同一名字 
		},
		onSelectRow: function(rowid,status) {
			if (status == true) {
				window.parent.window.operaterId = rowid;
			}
		},

		viewrecords : true,
		rowNum : 10,
		rowList : [ 10, 20, 30 ],
		pager : pager_selector,
		altRows : true,
		multiselect : true,
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
			url : _path + '/order/dispatch/modellist.html',
			postData : {
				'username' : $.trim($("#username").val()),
				'phone' : $.trim($("#phone").val())
			}, //发送数据 
			page : 1
		}).trigger("reloadGrid"); //重新载入 
}

</script>