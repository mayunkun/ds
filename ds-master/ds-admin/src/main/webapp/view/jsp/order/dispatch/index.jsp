<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

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
								<input class="search-input" id="username" name="username" placeholder="用户名" type="text">
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
								<span class="search-btn search">查询</span>
							</li>
							<!-- <li class="search-item pull-right">
								<a class="btn btn-success" id="add-btn"> <i class="fa fa-plus"></i> 添加利率规则</a>
							</li> -->
						</ul>
						</nav>
					</div>
				</div>
				<div class="box-header" style="padding-left:2%">
					<input name="operaterId" id="operaterId" value="" type="hidden" /> 
					<button id="addproduct" type="button" data-target="#modal-wide-width-communitys" data-toggle="modal" class="btn btn-success dispatch">批量分配</button>
					<div id="modal-wide-width-communitys" tabindex="-1" role="dialog" aria-labelledby="modal-responsive-label" aria-hidden="true" class="modal fade">
						<div class="modal-dialog modal-wide-width" role="document">
							<div class="modal-content"
								style="overflow: auto; margin: auto; width: 100%;">
								<div class="modal-header">
									<button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
									<h4 id="modal-wide-width-label" class="modal-title">选择审核员</h4>
								</div>
								<div class="modal-body">
									<iframe src="${path }/order/dispatch/toModel.html" id="frame-communitys" name="frame" style="overflow: auto; margin: auto; width: 100%; height: 65%; border: none;"></iframe>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success">确定</button>
									<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
								</div>
							</div>
						</div>
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
	
	$('.search').on('click',function(){
		getQueryParams(grid_selector);
	});
	
	$('.dispatch').on('click',function(){
		if(ids.length==0){
			layer.msg("请选择要分配的订单！");
			return false;
		}
// 		ajaxContent(_path + "/order/dispatch/toModel.html?ids=" + ids);
	});
	
	//enter键查询
	document.onkeydown=function(event){
	    var e = event || window.event || arguments.callee.caller.arguments[0];
	    if(e && e.keyCode==13) {
	    	getQueryParams(grid_selector);
	    }
	};
	
	$('#modal-wide-width-communitys').on('hidden.bs.modal', function (e) {
		document.getElementById('frame-communitys').contentWindow.location.reload(true);
	})
	
	//订单分配
	$('#modal-wide-width-communitys').on('click','.btn-success', function (e) {
		var operaterId = $("#frame-communitys").contents().find("#grid-table").jqGrid("getGridParam", "selarrrow");
	    if(!window.operaterId || operaterId==''){
	    	layer.msg("请选择审核员！");
			return false;
	    } else{
	    	appajax(_path + '/order/dispatch/dispatch.html?ids='+ids+"&operaterId="+operaterId,null, function(data) {
				if (data.success) {
					$('#modal-wide-width-communitys').modal('hide');
					layer.msg('操作成功！');
					getQueryParams(grid_selector);
// 					ajaxContent(_path + '/order/dispatch/index.html');
				}
			}, function(msg) {
				layer.msg("异常，请稍后操作！");
			});
	    	ids.splice(0,ids.length);
// 	    	$("#frame-communitys").contents().getQueryParams(grid_selector);
	    }
		/* if (window.communitys) {
			var html = '';
			$(window.communitys).each(
				function(idx, val) {
					if($.inArray(val.id, checkedGoodsArr) == -1){
						html += '<tr>';
						html += '	<td style="display: none"><input name="community_id" checked="checked" value="' + val.id + '" type="checkbox"></td>';
						html += '	<td class="text-left">'
								+ val.name + '</td>';
						html += '	<td class="text-left">'
								+ val.cityArea
								+ '</td>';
						html += '	<td class="text-left">'
								+ val.address
								+ '</td>';
								html += '	<td class="text-left"><a href="javascript:void(0)" onclick="javascript:_remove(this);">删除</a></td>';
						html += '</tr>';
					}
				}
			);
			$('#goods_list').append(html);
			window.communitys = [];
		} */
	});
	
	var ids = new Array();
	jQuery(grid_selector).jqGrid({
		datatype : "json",
		url : _path + '//order/dispatch/list.html',
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

		colNames : [ '订单ID', '用户', '审核员', '订单金额', '应还金额', '订单利率', '创建时间', '应还时间', '押币数量', '押币时间', '还款时间', '订单状态' ],
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
				name : 'operatorName',
				index : 'operatorName',
				align : 'center',
				width : 150
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
			}
		],
		loadComplete : function(data) {
			var table = this;
			setTimeout(function(){
				updatePagerIcons(table);
			}, 0);
			var datas = $(grid_selector).jqGrid("getDataIDs");
			if(ids.length>0){
				for (var i = 0; i < datas.length; i++) {
					for (var j = 0; j < ids.length; j++) {
						if(ids[j] == datas[i]) {
							$(grid_selector).jqGrid('setSelection',datas[i]);
						}
					}
				}
			}
		},
		onSelectAll:function(rowids,status) {
			if (status) {
				for (var i = 0; i < rowids.length; i++) {
// 					ids.push(rowids[i]);
					for (var j = 0; j < ids.length; j++) {
						var result = false;
						if(ids[j] == rowids[i]) {
							result = true;
							break;
						}
					}
					if(!result){
						ids.push(rowids[i]);
					}
				}
				/* window.parent.window.users = [];
				var data;
				for (var i = 0; i < rowids.length; i++) {
					data = $(grid_selector).jqGrid('getRowData', rowids[i]);
					data.id = rowids[i];
					window.parent.window.users.push(data);
				} */
			}else {
				for (var i = 0; i < rowids.length; i++) {
					for (var j = 0; j < ids.length; j++) {
						if(ids[j] == rowids[i]) {
							ids.splice(j,1);
						}
					}
				}
// 				window.parent.window.users = [];
			}
		},
		onSelectRow: function(rowid,status) {
			if(status){
				if(ids.length>0){
					for (var j = 0; j < ids.length; j++) {
						var result = false;
						if(ids[j] == rowid) {
							result = true;
							break;
						}
					}
					if(!result){
						ids.push(rowid);
					}
				} else{
					ids.push(rowid);
				}
			} else{
				for (var j = 0; j < ids.length; j++) {
					if(ids[j] == rowid) {
						ids.splice(j,1);
						break;
					}
				}
			}
			
			/* var selectedIds = $(grid_selector).jqGrid("getGridParam", "selarrrow");
			//判断是否第一次选择
			if (window.parent.window.users && window.parent.window.users.length > 0) {
				if (status) {
					//该for循环为了避免出现重复项
					for (var i = 0; i < window.parent.window.users.length; i++) {
						if(window.parent.window.users[i].id == rowid) {
							window.parent.window.users.splice(i,1);
						}
					}
					var data = $(grid_selector).jqGrid('getRowData', rowid);
					data.id = rowid;
					window.parent.window.users.push(data);
				}else {
					//将取消的选项去掉
					for (var i = 0; i < window.parent.window.users.length; i++) {
						if(window.parent.window.users[i].id == rowid) {
							window.parent.window.users.splice(i,1);
							return true;
						}
					}
				}
			}else {
				var persons = [];
				var data = $(grid_selector).jqGrid('getRowData', rowid);
				data.id = rowid;
				persons.push(data);
				window.parent.window.users = persons;
			} */
		},

		viewrecords : true,
		rowNum : 10,
		rowList : [ 10, 20, 30 ],
		pager : pager_selector,
		altRows : true,
		multiselect : true,
		multiboxonly : false,
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
			url : _path + '//order/dispatch/list.html',
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
	ajaxContent(_path + "//order/dispatch/toModel.html?operaterType=0");
});

//编辑
function _edit(id, orderId) {
	ajaxContent(_path + "//order/dispatch/toModel.html?operaterType=1&id=" + id + "&orderId=" + orderId);
}

//删除
function _delete(id) {
	layer.confirm('您确定要删除该信息吗?', function(idx){
		appajax(_path + '//order/dispatch/model.html', {'id' : id, 'operaterType' : '2'}, function(data) {
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