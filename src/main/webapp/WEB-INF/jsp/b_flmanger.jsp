<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<!-- 其他js -->
<head>
	<meta charset="UTF-8">
	<meta name="keywords" content="个人博客">
	<meta name="description" content="个人博客！">
	<meta name="renderer" content="webkit">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<link rel="icon" href="./images/title.ico" type="image/x-icon"/>
	<script type="text/javascript" src="../js/jquery.min.js"></script><!-- 引入jquery文件 -->
	
	<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  	<script src="../layui/layui.js" charset="utf-8"></script>
	
	<link rel="stylesheet" href="../css/left_middle.css">
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="stylesheet" href="../css/header.css">
	
	
	<title>个人博客！</title>

<style>
/* 		#footer{
			margin-top:90%;
		}  */
 body {
 	background: #E9EAED;
	/* background-image: url("../image/secai.jpg"); */
}


#left-middle {
    margin-top: 10px;
    width: 830px;
    float: none;
    margin-left: 240px;
} 

.nav_on{

margin-left:-8px;
}

	#fl_name, #fl_url{
		width:265px;
		margin-left:18px;
		
	}

	#_add_fl{
	width:265px;
	margin-left:-410px;
	margin-bottom: 30px;
	}
	
		/* 账号密码文字	 */
	.layui-form-label{
		margin-left:-45px;
		font: bold ;
	}
	
	
		#friendly_link ul li{
			float: left;
			margin-right:15px;
			margin-bottom: 10px;
		}
		#friendly_link ul li a{
			color:blue; 
			font-size: 14px;
		}
		#friendly_link ul li a:hover{
			color:#14a7ed;
		}
		
		 #friendly_link{
			width:235px;
			margin-left:-72px;
			margin-bottom: 20px;
			padding-bottom: 5px;
			background: #fff;
			position: fixed;
			top:340px;
			
			
		}
		 #friendly_link ul{
			margin:0 auto;
			padding: 0;
			width:240px;
			display: inline-block;
		}
		
		.right_title{
			height: 50px;
			width:300px;
			margin-top:8px;
		}
		.title_content{
			float: left;
			font-size: 17px;
			line-height: 20px;
			margin-top: 15px;
			text-align: left;
			margin-left: 15px;
			border-left: 3px solid #14a7ed;
		}
		
		
		.fl_tr th{
			text-align: center;
		}
		
		/* 聚焦时候文本框变色 */
input:focus{
    border-style:solid;
    border-color: #03a9f4;
	box-shadow: 0 0 5px #03a9f4;
} 

/* 表格样式 */
#fl_table_css{
	margin-left:25px;
}
		
</style>	

<script>

var layer="";	
layui.use('layer', function(){
	  layer = layui.layer;
});


$(function(){
	$("#friendly_link_save").hide();//隐藏添加表单
	$("#show_fl").click(function(){
		$("#friendly_link_save").toggle();//点击显示添加表单
	});
	
	//查询所有的友情连接列表
	queryFlsList();
	
	//添加友情链接
	$("#_add_fl").click(function(){
		var fl_name=$("#fl_name").val();
		var fl_url=$("#fl_url").val();
		//验证
		if(fl_name==""){
			layer.msg("请输入链接名称");
			$("#fl_name").focus();
			return;
		}else if(fl_url==""){
			layer.msg("请输入链接地址");
			$("#fl_url").focus();
			return;
		}
	
	 	$.ajax({
			url:'../blog/saveFriendlink.do',
			type:"post",
			data:{
				fl_name:fl_name,
				fl_url:fl_url
			},
			dataType:"json",
			success:function(result){
				if(result.flag==1){
					layer.msg("添加成功");
					queryFlsList();
				}else{
					layer.alert("失败。");
				}
				
			},
			error:function(){
				layer.alert("出错了");
			}
		}); 
	});
	
	
});


//查询友情连接的列表
function queryFlsList(){
 	$.ajax({
		url:'../blog/queryFlsList.do',
		type:"post",
		dataType:"json",
		success:function(result){
			var _html="";
			$.each(result.fls,function(i,item){
				console.log(item);
				_html+="<tr>\n" +
				"	<td>"+item.flText+"</td>\n" +
				"	<td>"+item.flUrl+"</td>\n" +
				"	 <td>\n" +
				"		<button onclick='del_fl("+item.flId+")'  type=\"button\" class=\"del_fl  layui-btn  layui-btn-normal layui-btn-sm\"><i class=\"layui-icon\">&#xe640;</i></button>\n" +
				"	</td>\n" +
				"</tr>";
			});
			$("table tbody").html(_html);
			
			//最右边的显示链接 
			var li="";
			$.each(result.fls,function(i,item){
				li+="<li><a href='"+item.flUrl+"'  target='_blank'>"+item.flText+"</a></li>";
			});
			$("#fl_ul").html(li);
			
		},
		error:function(){
			alert("出错了");
		}
	}); 
}	
//删除fl
function del_fl(flId){
 	 $.ajax({
		url:'../blog/delFlByflId.do',
		type:"post",
		data:{
			flId:flId,
		},
		dataType:"json",
		success:function(result){
			if(result.flag==1){
				layer.msg("删除成功");
				queryFlsList();
			}else{
				layer.msg("删除失败。");
			}
			
		},
		error:function(){
			layer.alert("出错了");
		}
	}); 
}



</script>


	
</head>

<body>
	<!-- 顶部栏目html -->
	<div id="header_main">
		<div id="header">
		<!-- logo -->
			<div id="logo">
				<!-- <a href="#"><img src="#" alt="">xxx的博客</a> -->
			</div>
			<div id="nav">
				<ul>
					<li><a href="#" class="nav_on">首页</a></li>
				</ul>
			</div>
		</div> 
	</div>
	<!-- 左右html -->
	<div id="main">
		<div id="left" style="margin-left:-8px;">
			<div id = "left-nav">
				 <ul>
					<li><a href="../blog/index.do?cat=b_management" >管理博客</a></li>
					<li><a href="../blog/index.do?cat=b_send" >发博客</a></li>
					<li><a href="../blog/index.do?cat=b_flmanger" class="now_on">友情链接管理</a></li>
					<li><a href="../blog/index.do?cat=b_carousel" >轮播图管理</a></li>
					<li><a href="../blog/index.do?cat=b_other" >其他</a></li>
				</ul>
			</div>
			
			
			<div id="friendly_link" ><!-- 友情链接 -->
				<div class="right_title">
					<div class="title_content">&nbsp;<span>友情链接 </span></div>
				</div>
				<ul id="fl_ul" style="margin-left:15px;">
				</ul>
			</div>
			
			<!-- 中间部分（点击左边触发） -->
			
			<div id="left-middle">
			<!-- 表格 -->
			
			   <div id="fl_table_css">
			   <br>
			   	<button id="show_fl" style="float:left;" type="button" class="layui-btn  layui-btn-sm"><i class="layui-icon">&#xe654;</i>添加</button>
			   	<table class="layui-table" style="width:99%;">
				  <colgroup>
				    <col width="180">
				    <col >
				    <col width="120">
				  </colgroup>
				  <thead>
				    <tr class="fl_tr">
				      <th>链接名称</th>
				      <th>链接地址</th>
				      <th>操作</th>
				    </tr> 
				  </thead>
				  <tbody>
				  </tbody>
				</table>
			
			   	
			   	<hr>
			   	<div id="friendly_link_save" ><!-- 友情链接 -->
					
				<form class="layui-form" >
				  <div class="layui-form-item">
				    <label class="layui-form-label">链接名称</label>
				      <input value="admin" id="fl_name" type="text" name="fl_name" required  placeholder="请输入链接名称" autocomplete="off" class="layui-input">
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">链接地址</label>
				      <input value="http://www.baidu.com" id="fl_url" type="text" name="fl_url" required  placeholder="请输入链接地址" autocomplete="off" class="layui-input">
				  </div>
				</form>
				  <div class="layui-form-item">
				      <button id="_add_fl" class="layui-btn" >提交</button>
				  </div>
				</div>
			</div>
		</div>
			
	</div>
	
<!-- 		<div id="right">
			<h2 style="color:red;margin-top:10px;">&nbsp;</h2>
		   	<div id="friendly_link" >友情链接
				
				<div class="right_title">
					<div class="title_content">&nbsp;<span>友情链接 </span></div>
				</div>
				<ul id="fl_ul" style="margin-left:15px;">
			
				</ul>
			</div>
		</div> -->
		
	
	</div>
	<!-- 底部 -->
<!-- 	<div id="footer" >
		<div id="footer_nav">
			<ul>
				<li class="footer_nav_comm"><a href="./help/关于本站">关于本站</a></li>
				<li class="footer_nav_comm"><a href="./help/联系我们">联系我们</a></li>
				<li class="footer_nav_comm"><a href="./help/申请友链">申请友链</a></li>
				<li class="footer_nav_comm"><a href="./help/投诉建议">投诉建议</a></li>
				<li><a href="./help/网站地图">网站地图</a></li>
			</ul>
		</div>
		<div id="footer_right">©2018-2019 6.0 www.qsp.net.cn All Rights Reserved. <a href="http://www.beian.miit.gov.cn/" target="_blank">黔ICP备17002805号-5</a></div>
	</div> -->
</body>	

</html>	 
