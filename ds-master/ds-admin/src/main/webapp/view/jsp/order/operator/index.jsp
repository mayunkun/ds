<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">订单维护</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">主页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">订单管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">订单维护</li>
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
								<input class="search-input" id="orderId" name="orderId" placeholder="订单ID" type="text">
							</li>
							<li class="search-item">
								<input class="search-input" id="userName" name="userName" placeholder="用户名" type="text">
							</li>
							<li class="search-item">
                                <input type="text" value="<fmt:formatDate value="${dto.startTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />" placeholder="开始时间" name="startTime" id="startTime" class="form-control input-date">
                            </li>
                            <li class="search-item">
                                <input type="text" value="<fmt:formatDate value="${dto.endTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />" placeholder="结束时间" name="endTime" id="endTime" class="form-control input-date">
                            </li>
                            <li class="search-item">
                            	<select class="form-control" id="status" name="status">
                            		<option value="">选择状态</option>
                            		<option value="1">待押币</option>
                            		<option value="2">待放款</option>
                            		<option value="3">待还款</option>
                            		<option value="4">待退币</option>
                            		<option value="5">逾期</option>
                            		<option value="6">完成</option>
                            		<option value="7">取消</option>
                            		<option value="8">不通过</option>
                            	</select>
                            </li>
							<li class="search-item">
								<span class="search-btn">查询</span>
							</li>
							<!-- <li class="search-item pull-right">
								<a class="btn btn-success" id="add-btn"> <i class="fa fa-plus"></i> 添加利率规则</a>
							</li> -->
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
datetimepicker($('.input-date')); 
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
		url : _path + '/order/operator/list.html',
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

		colNames : [ '订单ID', '用户', '银行','卡号','支行', '订单金额', '应还金额', '订单利率', '创建时间', '应还时间', '押币数量', '押币时间', '还款时间', '订单状态', '操作' ],
		colModel : [
			{
				name : 'orderId',
				index : 'orderId',
				align : 'center',
				width : 200
			},
			{
				name : 'userName',
				index : 'userName',
				align : 'center',
				width : 150
			},
			{
				name : 'cardType',
				index : 'cardType',
				align : 'center',
				width : 150
			},
			{
				name : 'cardNum',
				index : 'cardNum',
				align : 'center',
				width : 150
			},
			{
				name : 'bankAddress',
				index : 'bankAddress',
				align : 'center',
				width : 300
			},
			{
				name : 'amountOrder',
				index : 'amountOrder',
				align : 'center',
				width : 150
			},
			{
				name : 'amountRepayment',
				index : 'amountRepayment',
				align : 'center',
				width : 150
			},
			{
				name : 'rateOrder',
				index : 'rateOrder',
				align : 'center',
				width : 150,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = (cellvalue * 100).toFixed(2) + "%";
					}
					return ret;
				}
			},
			{
				name : 'createTime',
				index : 'createTime',
				align : 'center',
				width : 200,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = new Date(cellvalue).Format("yyyy-MM-dd");
					}
					return ret;
				}
			},
			{
				name : 'expireTime',
				index : 'createTime',
				align : 'center',
				width : 200,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = new Date(cellvalue).Format("yyyy-MM-dd");
					}
					return ret;
				}
			},
			{
				name : 'addMoney',
				index : 'addMoney',
				align : 'center',
				width : 150
			},
			{
				name : 'addTime',
				index : 'addTime',
				align : 'center',
				width : 200,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = new Date(cellvalue).Format("yyyy-MM-dd");
					}
					return ret;
				}
			},
			{
				name : 'backTime',
				index : 'backTime',
				align : 'center',
				width : 200,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
					if(cellvalue){
						ret = new Date(cellvalue).Format("yyyy-MM-dd");
					}
					return ret;
				}
			},
			{
				name : 'status',
				index : 'status',
				align : 'center',
				width : 150,
				formatter : function(cellvalue, options, rowObject) {
					var ret = '';
// 					1：待押币 2：待下款 3：待还款 4：待退币 5：逾期 6：完成 7：取消 8：不通过
					if(cellvalue == '1'){
						ret = "待押币";
					} else if(cellvalue == '2'){
						ret = "待放款";
					} else if(cellvalue == '3'){
						ret = "待还款";
					} else if(cellvalue == '4'){
						ret = "待退币";
					} else if(cellvalue == '5'){
						ret = "逾期";
					} else if(cellvalue == '6'){
						ret = "完成 ";
					} else if(cellvalue == '7'){
						ret = "取消";
					} else if(cellvalue == '8'){
						ret = "不通过";
					}
					return ret;
				}
			},
			{
				name : 'id',
				index : 'id',
				width : 100,
				align : 'center',
				fixed : true,
				sortable : false,
				resize : false,
				formatter : function(cellvalue, options, rowObject) {
					return '<a href="javascript:_edit(\'' + cellvalue + '\',\''+rowObject.orderId + '\',\''+rowObject.status+'\');"><span class="ts-table-start">编辑</span></a>';
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
			url : _path + '/order/operator/list.html',
			postData : {
				'userName' : $.trim($("#userName").val()),
				'orderId' : $.trim($("#orderId").val()),
				'startTime' : $("#startTime").val(),
				'endTime' : $("#endTime").val(),
				'status' : $.trim($("#status").val())
			}, //发送数据 
			page : 1
		}).trigger("reloadGrid"); //重新载入 
}

//添加
$('#add-btn').on("click", function(){
	ajaxContent(_path + "/order/operator/toModel.html?operaterType=0");
});

//编辑
function _edit(id, orderId, status) {
	ajaxContent(_path + "/order/operator/toModel.html?operaterType=1&id=" + id + "&orderId=" + orderId + "&status=" + status);
}

//删除
function _delete(id) {
	layer.confirm('您确定要删除该信息吗?', function(idx){
		appajax(_path + '/order/operator/model.html', {'id' : id, 'operaterType' : '2'}, function(data) {
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