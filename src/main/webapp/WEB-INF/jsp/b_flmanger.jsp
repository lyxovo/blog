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


.nav_on{
	margin-left:-8px;
}

	#left-middle{
	
	/* margin-right:-50px; */
	margin-top:18px;
}


	#fl_name, #fl_url{
		width:265px;
		margin-left:18px;
		
	}

	#_add_fl{
	width:265px;
	margin-left:-260px;
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
			width:300px;
			margin-bottom: 20px;
			padding-bottom: 15px;
			padding-bottom: 5px;
			background: #f4f5f6;
		}
		 #friendly_link ul{
			margin:0 auto;
			padding: 0;
			width:270px;
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
		
		#footer{
			margin-top:90%;
		}
		
		
		.fl_tr th{
			text-align: center;
		}
		
</style>	

<script>

$(function(){
	$("#friendly_link_save").hide();//隐藏添加表单
	
	$("#show_fl").click(function(){
		$("#friendly_link_save").toggle();//点击显示添加表单
	});
	
	$("#del_fl").click(function(){//删除
		alert(123);
	});
	
});

	
var layer="";	
layui.use('layer', function(){
	  layer = layui.layer;
});


//添加友情链接
$(function(){
	$("#_add_fl").click(function(){
		var fl_name=$("#fl_name").val();
		var fl_url=$("#fl_url").val();
		
		
 		var li="<li><a href='"+fl_url+"'  target='_blank'>"+fl_name+"</a></li>";
		$("#fl_ul").append(li);
		layer.msg("添加成功");
		return; 
		
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
					console.log(result);
					var li="";
					$.each(result,function(i,item){
						console.log(item);
						li+="<li><a href='"+item.fl_url+"'  target='_blank'>"+item.fl_name+"</a></li>";
					});
					$("#fl_ul").append(li);
					
				}else{
					alert("失败。");
				}
				
			},
			error:function(){
				alert("出错了");
			}
		}); 
	
	
	});
});



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
			<!-- 中间部分（点击左边触发） -->
			
			<div id="left-middle">
			<!-- 表格 -->
			
			   <div>
			   	<button id="show_fl" style="float:left;" type="button" class="layui-btn  layui-btn-sm"><i class="layui-icon">&#xe654;</i>添加</button>
			   	<table class="layui-table">
				  <colgroup>
				    <col width="150">
				    <col >
				    <col width="200">
				  </colgroup>
				  <thead>
				    <tr class="fl_tr">
				      <th>链接名称</th>
				      <th>链接地址</th>
				      <th>操作</th>
				    </tr> 
				  </thead>
				  <tbody>
				    <tr>
				      <td>贤心</td>
				      <td>2016-11-29</td>
				       <td>
				      	<button id="del_fl" type="button" class="layui-btn  layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe640;</i></button>
				      </td>
				    </tr>
				    <tr>
				      <td>
				     	于千万
				      </td>
				      <td>于千万</td>
				      <td>
				      	<button type="button" class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe640;</i></button>
				      </td>

				    </tr>
				  </tbody>
				</table>
				</div>
			   	
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
				      <button id="_add_fl" class="layui-btn" >添加</button>
				  </div>
					
				</div>
			</div>
			
		</div>
	
		<div id="right">
			<h2 style="color:red;margin-top:10px;">效果展示</h2>
		   	<div id="friendly_link" ><!-- 友情链接 -->
				
				<div class="right_title">
					<div class="title_content">&nbsp;<span>友情链接 </span></div>
				</div>
				<ul id="fl_ul">
				<!-- 	    <li><a href="#"  target="_blank">个人博客</a></li>
					    <li><a href="#"  target="_blank">学生会</a></li> -->
				</ul>
			</div>
		</div>
		
	
	</div>
	<!-- 底部 -->
	<div id="footer" >
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
	</div>
</body>	

</html>	 
