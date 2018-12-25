<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/view/resource/css/font/iconfont.css">
<link rel="stylesheet" type="text/css" href="${path }/view/resource/css/style-new.css">
<style type="text/css">
   #stack2 iframe {
       width: 100%;
       height: 60%;
       border: none;
   }
   #modal-stackable .modal-body .fa-plus-circle {
       font-size: 24px;
       color: #5cb85c;
       vertical-align: middle;
       cursor: pointer;
       height:20px;
   }
   #modal-stackable .modal-body .tipMsg {
       line-height: 24px;
       vertical-align: middle;
   }
   .person {
       display: inline-block;
       position: relative;
       margin-right: 5px;
   }
   .person .fa-times-circle {
       position: absolute;
       top: -6px;
       left: -6px;
       font-size: 16px;
       cursor: pointer;
   }
   .person .name {
       display: block;
       padding: 5px 15px;
       border: 1px solid #dedede;
       background: #f9f9f9;
   }
   .no-pad-right {
   	   padding-top: 8px;
   }
   
   
   *{
		margin: 0 auto;
		padding: 0;
		list-style: none;
		text-decoration: none;
	}
	.tables{
		width: 100%;
		padding-left: 20px;
		border: 1px solid #ccc;
	}
	.cge{
		font-size: 17px;
		color: #222222;
		height: 42px;
		line-height: 42px;
		border-bottom: 1px solid #CCCCCC;
	}
	.cge span{
		color: red;
		font-size: 12px;
	}
	.ulbox{
		width: 100%;
		
	}
	.ulbox li{
		width: 100%;
		height: 42px;
		border-bottom: 1px solid #CCCCCC;
	 line-height: 42px;
	 font-size: 14px;
	}
	.ulbox li span{
		float: right;
		padding-right: 10px;
		color: #7D7D7D;
	}
	.team {
		padding-top: 10px;
	}
</style>
<!--BEGIN TITLE & BREADCRUMB PAGE-->
<!--END TITLE & BREADCRUMB PAGE-->
<!--BEGIN CONTENT-->
<div class="page-content bg-white">
   <div class="sos tables">
		<div class="cge" style="display: block;width: 100%;height: 43px;">待处理的SOS信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goPage('sos')" style="display: block;width: 30px;height: 7px;float: right;margin-right: 10px;margin-top: 15px;"><div style="width:7px;height: 7px;background: #ccc;float: left;margin-right: 3px;"></div><div style="width:7px;height: 7px;background: #ccc;float: left;margin-right: 3px;"></div><div style="width:7px;height: 7px;background: #ccc;float: left;"></div></a></div>
		<ul class="ulbox" id="sos">
			<!-- <li>张默默 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li> -->
		</ul>
   </div>
   <div class="team tables">
		<div class="cge" style="display: block;width: 100%;height: 43px;">团队行为查看&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="goPage('teamBehavior')" style="display: block;width: 30px;height: 7px;float: right;margin-right: 10px;margin-top: 15px;"><div style="width:7px;height: 7px;background: #ccc;float: left;margin-right: 3px;"></div><div style="width:7px;height: 7px;background: #ccc;float: left;margin-right: 3px;"></div><div style="width:7px;height: 7px;background: #ccc;float: left;"></div></a></div>
		<ul class="ulbox" id="team">
			<!-- <li>张默默 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li>
			<li>张默默 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：内容内容内容内容内容     <span>2017-9-8  10:00:00</span></li> -->
		</ul>
	</div>
    
    <div id="modal-stackable" tabindex="-1" role="dialog" aria-labelledby="modal-stackable-label" aria-hidden="true" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
	                <h4 id="modal-stackable-label" class="modal-title">申请提现</h4>
	            </div>
	            <div class="modal-body">
		            <div class="row">
		                <div class="col-md-9">
		                	<div class="form-group">
		                        <label class="col-md-3 control-label"><span class='require'>*</span>&nbsp;&nbsp;申请金额</label>
		                        <div class="col-md-9">
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" data-dismiss="modal" class="btn btn-success">确定</button>
	                <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
	            </div>
	        </div>
	    </div>
	</div>
    
    <div class="index-box">
        <div class="row">
            <div class="col-md-12">
                <p class="index-title sm-margin">常用操作
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 no-pad-right">
<!--                 <a href="javascript:ajaxContent('/admin/admin/instructheadquarters/index.html?insertRole=true&searchRole=true&updateRole=true&deleteRole=true');" class="index-entry-box"> -->
                <a href="javascript:void(0);" onclick="goPage('404')" class="index-entry-box">
                    <span class="index-icon bg1">
                        <i class="glyphicon glyphicon-send"></i>
                    </span>
                    <p class="index-iocn-title">404坐席信息录入</p>
                    <p class="index-icon-sub">点击进入总部指令页面</p>
                </a>
            </div>
            <div class="col-md-4 no-pad-right">
                <a href="javascript:void(0);" onclick="goPage('headquartersDirective')" class="index-entry-box">
                    <span class="index-icon bg2">
                        <i class="fa fa-calendar"></i>
                    </span>
                    <p class="index-iocn-title">总部指令</p>
                    <p class="index-icon-sub">点击进入订单管理页面</p>
                </a>
            </div>
             <div class="col-md-4 no-pad-right">
                <a href="javascript:void(0);" onclick="goPage('products')" class="index-entry-box">
                    <span class="index-icon bg3">
                        <i class="glyphicon glyphicon-film"></i>
                    </span>
                    <p class="index-iocn-title">产品信息</p>
                    <p class="index-icon-sub">点击进入我的视频页面</p>
                </a>
            </div>
            <div class="col-md-4 no-pad-right">
                <a href="javascript:void(0);" onclick="goPage('orders')" class="index-entry-box">
                    <span class="index-icon bg4">
                        <i class="glyphicon glyphicon-usd"></i>
                    </span>
                    <p class="index-iocn-title">订单信息</p>
                    <p class="index-icon-sub">点击进入收入列表页面</p>
                </a>
            </div>
            <div class="col-md-4 no-pad-right">
                <a href="javascript:void(0);" onclick="goPage('imageAndText')" class="index-entry-box">
                    <span class="index-icon bg5">
                        <i class="glyphicon glyphicon-usd"></i>
                    </span>
                    <p class="index-iocn-title">图文编辑</p>
                    <p class="index-icon-sub">点击进入收入列表页面</p>
                </a>
            </div>
           
            <div class="col-md-4 no-pad-right">
                <a href="javascript:void(0);" onclick="goPage('tel')" class="index-entry-box">
                    <span class="index-icon bg6">
                        <i class="glyphicon glyphicon-usd"></i>
                    </span>
                    <p class="index-iocn-title">预约回电</p>
                    <p class="index-icon-sub">点击进入收入列表页面</p>
                </a>
            </div>
           
        </div>
    </div>
</div>
<!--END CONTENT-->
<script type="text/javascript">
// 长轮询
var now = new Date();
$(function () {
// 	setInterval('sos()',5000);
//    sos();
//    team();
});

function sos() {
    $.ajax({
        url: _path + "/admin/instructsos/getLongPollinglist.html",
        data: {"rows": 5},
        timeout: 5000,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (textStatus == "timeout") { // 请求超时
                    setTimeout("sos()",2000);
                // 其他错误，如网络错误等
                } else { 
//                 	setTimeout("sos()",2000);
                }
            },
        success: function (data, textStatus) {
        	$("#sos").html("");
        	for(var i = 0;i<data.length;i++){
        		$("#sos").append("<li>"+data[i].sendUserName+" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址："+data[i].address+"     <span>"+data[i].createTime+"</span></li>");
        	}
            if (textStatus == "success") { // 请求成功
            	setTimeout("sos()",2000);
            }
        }
    });
};

function team() {
    $.ajax({
        url: _path + "/admin/interestactivities/getContentList.html",
        data: {"rows": 5},
        timeout: 5000,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (textStatus == "timeout") { // 请求超时
                    setTimeout("team()",2000);
                // 其他错误，如网络错误等
                } else { 
//                 	setTimeout("team()",2000);
                }
            },
        success: function (data, textStatus) {
        	$("#team").html("");
        	for(var i = 0;i<data.length;i++){
        		$("#team").append("<li>"+data[i].cityArea+"有了新的动态</li>");
            }
            if (textStatus == "success") { // 请求成功
            	setTimeout("team()",2000);
            }
        }
    });
};

function jsp(){
	return request.getRequestURI().substring(uri.lastIndexOf("/")+1); 
}

function goPage(param){
		if (param == '404') {							// 404
			ajaxContent(_path + "/admin/instructheadquarters/index.html");
		} else if (param == 'headquartersDirective') {	// 总部指令
			ajaxContent(_path + "/admin/instructheadquarters/index.html");
		} else if (param == 'products') {				// 产品
			ajaxContent(_path + "/admin/productbrand/index.html");
		} else if (param == 'orders') {					// 订单
			ajaxContent(_path + "/admin/productorder/index.html");
		} else if (param == 'imageAndText') {			// 图文
			ajaxContent(_path + "/admin/infoad/index.html");
		} else if (param == 'imageAndText') {			// 预约回电
// 			ajaxContent(_path + "/admin/infoad/index.html");
		} else if (param == 'teamBehavior') {			// 团队行为
			ajaxContent(_path + "/admin/instructteam/index.html");
		} else if (param == 'sos') {			// 团队行为
			ajaxContent(_path + "/admin/instructsos/index.html");
		}
	}
	
</script>
