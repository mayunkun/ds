<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link type="text/css" rel="stylesheet" href="${path }/view/resource/zTree/css/zTreeStyle/window.css" type="text/css">
<!--Ztree-->
<link type="text/css" rel="stylesheet" href="${path }/view/resource/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${path }/view/resource/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${path }/view/resource/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
var _path = '${path }';
/** * 是否为mac系统 * */ 
var isMac = function() {
	return /macintosh|mac os x/i.test(navigator.userAgent);
}();
/** * 是否为windows系统 * */ 
var isWindows = function() {
	return /windows|win32/i.test(navigator.userAgent);
}();
$(document).ready(function() {
    if (isMac) {
    	var head = document.getElementsByTagName('head')[0];
	    var link = document.createElement('link');
	    link.href = _path + '/view/resource/zTree/css/zTreeStyle/mac.css';
	    link.rel = 'stylesheet';
	    link.type = 'text/css';
	    head.appendChild(link);
	}
});
</script>
<script type="text/javascript">
var setting = {
	check: {
		enable: true,
		chkStyle: "checkbox",
		chkboxType: { "Y": "ps", "N": "ps" }
	},
	data: {
		simpleData: {
			enable: true,
			idKey: "id",  //id和pid，这里不用多说了吧，树的目录级别  
			   pIdKey: "pid",  
			   rootPId: 0   //根节点
		}
	},
	callback: {
		onCheck: getChildSelected
	} 
};

appajax(_path + "/admin/role/getnodelist.html",
	$("#contentForm").serialize(),
	function(data) {
		if (data.success) {
			$.fn.zTree.init($("#treeDemo"), setting, data.data);
		}
	}, function(msg) {
		layer.msg("异常，请稍后操作！");
	});

//全选
$('#_checkall').on('click',function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	treeObj.checkAllNodes(true);
});

//重置
$('#_checkreset').on('click',function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	treeObj.checkAllNodes(false);
});

function getChildSelected(event, treeId, treeNode) {
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var node = treeObj.getNodeByTId(treeNode.tId);

	var flg = node.checked;
	EachChildNodes(node, treeObj,flg);
}

//递归
function EachChildNodes(node,treeObj,flg) {
	if(flg == true){
		treeObj.checkNode(node, true, true);
	}else{
		node.checked = false;
	}
	
	//判断是否有子节点
	if (node.children == undefined)
		return;
	for (var i = 0; i < node.children.length; i++) {
		EachChildNodes(node.children[i], treeObj,flg);
	}
}

//提交
$('#_submit').on('click',function(){
    var treeObj = $.fn.zTree.getZTreeObj("treeDemo"),
    	nodes = treeObj.getCheckedNodes(true),
    	n = "", btns = "";
    for(var i=0; i<nodes.length;i++){
    	if(nodes[i].ismenu == 'true'){
        	if(n == ""){//获取选中节点的值
        		n = nodes[i].id;
        	}else{
        		n = n + "," + nodes[i].id;
        	}
    	}
//     	else{
//     		if(btns == ""){
//     			btns = nodes[i].id;
//         	}else{
//         		btns = btns + "," + nodes[i].id;
//         	}
//     	}
    }
    $('#menuids').val(n);
//     $('#btns').val(btns);
    if(n == ""){
    	layer.msg("请选择菜单！");
		return false;
    }
//     else if(btns == ""){
//     	layer.msg("请选择该菜单下的可操作的按钮！");
//     	return false;
//     }
    else{
    	appajax(_path + "/admin/role/permissionmodel.html",
			$("#contentForm").serialize(),
			function(data) {
				if (data.success) {
					layer.msg('角色设置成功！');
					ajaxContent(_path + '/admin/role/index.html')
				}
			}, function(msg) {
				layer.msg("异常，请稍后操作！");
			}); 
    }
   
    return false;
});

</script>
<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	<div class="page-header pull-left">
        <div class="page-title">权限</div>
    </div>
	<ol class="breadcrumb page-breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">首页</a>&nbsp;&nbsp;
			<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="javascript:void(0);">角色管理</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
		</li>
		<li class="active">权限维护</li>
	</ol>
	<div class="clearfix"></div>
</div>

<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<h4>请为《${dto.name }》分配权限！</h4>
			<form class="form-horizontal" id="contentForm" style="padding-left: 50px;">
				<input name="id" id="id" value="${dto.id }" type="hidden">
				<input name="menuids" id="menuids" type="hidden">
				<input name="btns" id="btns" type="hidden">
				
				<div class="form-group" style="text-align: left;">
					<a class="btn btn-success" id="_checkall">全选</a>	
					<a class="btn btn-success" id="_checkreset">重置</a>	
					<a class="btn btn-success" id="_submit">保存</a>	
	  			</div>
	  			<div class="space-4"></div>
				<div class="form-group">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<div class="space-4"></div>
			</form>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	</div>
<!-- /.page-content -->
