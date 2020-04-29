<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="keywords" content="个人博客">
	<meta name="description" content="个人博客！">
	<meta name="renderer" content="webkit">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<script type="text/javascript" src="../js/jquery.min.js"></script><!-- 引入jquery文件 -->
	
	<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  	<script src="../layui/layui.js" charset="utf-8"></script>
	
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="stylesheet" href="../css/header.css">
	
	<style type="text/css">
		#footer{
			position: absolute;
			top:90%;
		}
		
		body{
			background-color: #EBEBE4;
		}
		
		a:link { 
			color:blue; 
			/* text-decoration:underline; */ 
			text-decoration:none;
			} 
			a:visited { 
			color:gray; 
			text-decoration:none; 
			} 
			a:hover { 
			color:#FF00FF; 
			text-decoration:underline; 
			} 
			a:active { 
			color:#D200D2; 
			text-decoration:none; 
			} 

	</style>
	
	<script type="text/javascript">
	//查询博客详细--by id
	function query_blog_desc(bId){
		window.location.href="../blog/bReturnDesc.do?b_id="+bId;
	}
	</script>
	
<body>
	
	<div id="header_main">
		<div id="header">
			<div id="logo">
				<!-- <a href=https://www.qsp.net.cn><img src="#" alt=""></a> -->
			</div>
			<div id="nav">
				<ul>
					<li><a href="#" class="nav_on">首页</a></li>
				</ul>
			</div>

		</div> 
	</div>

	<div id="middle_main" style="width:800px;height:400px; position:relative;top:150px;margin:0 auto;background-color:white;">
			
			<div id="middle_core1" style="width:680px;height:30px;position:relative;top:30px;margin:0 auto">
				<a  href="../blog/index.do?cat=b_management" style="float: left;">&lt;管理博文</a>
			</div>
			
			<div id="middle_core2" style="width:680px;height:160px; position:relative;top:50px;margin:0 auto;background-color:#EBEBE4">
				<h1 style="text-align: left;margin-top:10px;padding-left:8px; padding-top:8px;">${blog.bTitle}</h1>
				<textarea rows="5" cols="94" maxlength="130" disabled="disabled" style="resize: none;text-align: left;margin-top:17px;border:none;padding-left:8px; ">${blog.bContenttext}...</textarea>
			</div>
			<h4 style="text-align: right;position:relative; top:25px;margin-right:80px;">仗剑天涯，从你的摘要开始。</h4>
			
			<div id="middle_core3" style="width:680px;height:30px; position:relative;top:100px;margin:0 auto">
				<a  href="javascript:void();" onclick="query_blog_desc(${blog.bId})"><i class="layui-icon layui-icon-face-smile"></i>&nbsp;发布成功并查询文章></a>
				
				<a href="../blog/index.do?cat=b_send" style="margin-left:90px;"><i class="layui-icon layui-icon-edit"></i>再写一篇</a>
			</div>
	</div>
	

	
	<div id="footer" style="margin-top:50px;">
		<div id="footer_nav">
			<ul>
				<li class="footer_nav_comm"><a href="../help/关于本站">关于本站</a></li>
				<li class="footer_nav_comm"><a href="../help/联系我们">联系我们</a></li>
				<li class="footer_nav_comm"><a href="../help/申请友链">申请友链</a></li>
				<li class="footer_nav_comm"><a href="../help/投诉建议">投诉建议</a></li>
				<li><a href="../help/网站地图">网站地图</a></li>
			</ul>
		</div>
		<div id="footer_right">©2018-2019 6.0 www.qsp.net.cn All Rights Reserved. <a href="http://www.beian.miit.gov.cn/" target="_blank">黔ICP备17002805号-5</a></div>
	</div>
	
	
</body>
</html>