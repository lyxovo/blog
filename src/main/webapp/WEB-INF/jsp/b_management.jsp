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
	
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	
	<title>个人博客！</title>
	<style>
		#footer{
			margin-top:30%;
		}
		
	#left-middle{
	
	margin-right:-50px;
	margin-top:10px;
}

#do_page{
	float:left;
}
		
	</style>
	
	<!-- 友情链接 -->
	<script>
	window.onload=
        function(){
            var oDiv = document.getElementById("friendly_link"),
                H = 0,
                Y = oDiv        
            while (Y) {
                H += Y.offsetTop; 
                Y = Y.offsetParent;
            }
            window.onscroll = function()
            {
                var s = document.body.scrollTop || document.documentElement.scrollTop
                if(s> H - 70) {
                    oDiv.style = "position:fixed;top:70px;"
                } else {
                    oDiv.style = "";
                }
            }
        }
	
	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;	
	
	  //完整功能
 	  laypage.render({//只需要返回条数即可
	    elem: 'do_page'
	    ,count: 20
	    ,layout: ['count', 'prev', 'page', 'next']
	    ,jump: function(obj){
	      console.log(obj);
	    }
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
				<!-- <a href=https://www.qsp.net.cn><img src="#" alt=""></a> -->
			</div>
			<div id="nav">
				<ul>
					<li><a href=https://www.qsp.net.cn class="nav_on">首页</a></li>
				</ul>
			</div>
			<div id="searchBox">
				<form action="./search/" method="get" target="_blank">
					<button type = "submit"><i class="fa fa-search" aria-hidden="true"></i></button>
					<input type="search" placeholder="搜索本站" name="keywords">
				</form>
			</div>
		</div> 
	</div>
	<!-- 左右html -->
	<div id="main">
		<div id="left">
			<div id = "left-nav"  style="">
				 <ul>
					<li><a href="../blog/index.do?cat=b_management" class="now_on">管理博客</a></li>
					<li><a href="../blog/index.do?cat=b_send" >发博客</a></li>
					<li><a href="../blog/index.do?cat=b_flmanger" >友情链接管理</a></li>
					<li><a href="../blog/index.do?cat=b_carousel" >轮播图管理</a></li>
					<li><a href="../blog/index.do?cat=b_other" >其他</a></li>
				</ul>
			</div>
			<!-- 中间部分（点击左边触发） -->
			<div id="left-middle">

				<!-- 中间列表2 -->
				<div id="art-list">
					<div id="art-head">
						<div id="art-list-title">
							推荐						
						</div>
					</div>
					
						<ul>
				
							<li>
								<div class="title_and_info">
									<div class="art_title">
										<a target="_blank" href=/art/190.html>解决谷歌创建新账号时验证手机号不存在的解决方法。</a>
									</div>
									
									<div class="art_info">
										<span style="color:#14a7ed;">计算机与服务器 ⋅ </span>
										<span>谯胜平 ⋅ </span>
										<span>2020-03-19 15:38:23 ⋅ </span>
										<span>浏览(11) ⋅ </span>
										<span>评论(0)</span>
										
										<a href="#" style="color:red;margin-left:180px;">删除</a>
									</div>
								</div>
							</li>
							<li>
								<div class="title_and_info">
									<div class="art_title">
										<a target="_blank" href=/art/190.html>解决谷歌创建新账号时验证手机号不存在的解决方法。</a>
									</div>
									
									<div class="art_info">
										<span style="color:#14a7ed;">计算机与服务器 ⋅ </span>
										<span>谯胜平 ⋅ </span>
										<span>2020-03-19 15:38:23 ⋅ </span>
										<span>浏览(11) ⋅ </span>
										<span>评论(0)</span>
										<a href="#" style="color:red;margin-left:180px;">删除</a>
									</div>
								</div>
							</li>
						
						<li style="display: block;height: 60px;border-bottom: none;">
							<div  id="do_page"></div>
						
						</li>
					</ul>
					
				</div>
			</div>

		</div>
	</div>
	<!-- 底部 -->
	<div id="footer">
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
