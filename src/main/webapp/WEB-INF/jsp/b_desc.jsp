<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="keywords" content="个人博客">
	<meta name="description" content="个人博客！">
	<title>个人博客！</title>
	
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="stylesheet" href="../css/header.css">
 <script type="text/javascript" src="../js/wangEditor.min.js"></script>
 <script type="text/javascript" src="../js/jquery.min.js"></script><!-- 引入jquery文件 -->
	
	<style>
	    body{
	    	text-align: center;
	    	background: #E9EAED;
	    }
		a{
			text-align:center;
			text-decoration: none;
		}
		#main{
			width:1110px;
			min-height: 100vh;
			display: inline-block;
			margin:0 auto;
			margin-top:63px;
			margin-bottom: 17px;
		}
		#left{
			width:790px;
			float:left;
		}
		#art{
			width:790px;
			background:#fff;
			float:left;
		}
		#art_title{
			width:740px;
		/* 	height:75px; */
			float:left;
			margin-top:20px;
			margin-left:25px;
			padding-bottom:30px;
			border-bottom: 1px solid #ddd;
		}
		#art_title h2{
			font-size: 23px;
			margin:0 auto; 
			text-overflow: ellipsis;
		    white-space: nowrap;
		    overflow: hidden;
		}
		#art_title p{
			font-size: 13px;
			margin:0 auto;
			margin-top:10px;
			color:#999;
		}
 		#art_content{
			width:740px;
			display: inline-block;
			background: white;
			float: left;
			margin-top:15px;
			margin-bottom: 25px;
			margin-left: 25px;
			text-align: left;
		} 
		
		/* 设置图片的宽度和高度 */
		#art_content img{
			max-width: 100%;
			height: auto;
		}
		#art_content table{
			max-width: 100%;
			border-collapse: collapse;
		}
		#art_content table tr td{
			padding: 5px 5px 5px 5px;
		}
		#art_content ul li{
			list-style: disc;
		}
		#art_content p{
			max-width: 100%
		}
		#art_content p{
			max-width: 100%;
		}
		#art_content p a{
			word-break: break-all;
		}

	
		#right{
			width:300px;
			float:right;
		}

		#hot_art, #guess_like, #art_tag, #friendly_link{
			width:300px;
			margin-bottom: 20px;
			padding-bottom: 15px;
			background: #fff;
			padding-bottom: 5px;
		}
		#hot_art ul, #guess_like ul, #art_tag ul, #friendly_link ul{
			margin:0 auto;
			padding: 0;
			width:270px;
			display: inline-block;
		}

		.right_title{
			height: 50px;
			width:300px;
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
		.hot_more a{
			display: block;
			float: right;
			font-size: 14px;
			line-height: 20px;
			margin-top: 15px;
			text-align: left;
			margin-right: 15px;
			color:#999;
			text-decoration: none;
		}
		.hot_more a:hover{
			color:#14a7ed;
		}
		.row_dot{
			width:4px;
			height:4px;
			float:left;
			margin-top: 10px;
			margin-right:8px;
			background: #14a7ed;
		}
		#hot_art ul li, #guess_like ul li{
			margin-left: 0;
			text-align: left;
			text-overflow: ellipsis;
		    white-space: nowrap;
		    overflow: hidden;
		    margin-bottom: 10px;
		}
		#hot_art ul li a, #guess_like ul li a{
			text-decoration: none;
			color:#666;
			font-size: 14px;
		}
		#hot_art ul li a:hover, #guess_like ul li a:hover{
			color:#14a7ed;
		}

		#art_tag ul li{
			/* float:left; */
			margin-right: 10px;
			width: calc(33.3% - 6.6px);
		}
		#art_tag ul li:nth-child(3n+3){
			margin-right: 0;
		}
		#art_tag ul li a{
			color:white;
			display: block;
			height:22px;
			width: calc(100% - 10px);
			line-height: 22px;
			padding: 3px 5px;
			margin-bottom: 10px;
			transition: all 0.5s;
			font-size: 13px;
			text-decoration: none;
			overflow:hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		#art_tag ul li a:hover{
			border-radius: 8px;
		}
		#friendly_link ul li{
			float: left;
			margin-right:15px;
			margin-bottom: 10px;
		}
		#friendly_link ul li a{
			text-decoration: none;
			color:#666;
			font-size: 14px;
		}
		#friendly_link ul li a:hover{
			color:#14a7ed;
		}
		@media screen and (max-device-width: 768px){
			#header{
				width: 100% !important;
			}
			#logo{
				width: 100% !important;
				height: 50px;
			}
			#logo a{
				display: block;
				width: 100%;
				height: 50px;
				text-align: center;
			}
			#logo img{
				display: inline-block;
				height: 46px !important;
				margin-top: 3px;
			}
			#nav{
				display: none;
			}
			#searchBox{
				display: none;
			}
			#header_main{
				width:100% !important;
				box-shadow: none !important;
				border-bottom: 1px solid #ddd;
			}
			#main{
				width: calc(100% - 10px) !important;
				margin-top: 43px !important;
				margin-bottom: -1px !important;
			}
			#left{
				width: 100% !important;
			}
			#art{
				width: 100% !important;
			}
			#art_title{
				width: 100% !important;
				height: 50px !important;
				margin-left: 0 !important;
			}
			#art_title h2{
				font-size: 1.3em !important;
			}
			#art_title p{
				display: none;
			}

	
			#right{
				display: none !important;
			}
	
			body{
				background: #fff !important;
			}
			.gutter{
				display: none !important;
			}
			.code .container{
				padding:10px 0px 10px 0px !important;
			}
			#footer_nav ul li a{
				padding:0 5px !important;
				width: auto !important;
			}
		}
		
		li{
			list-style: none;
		}
		
		
/* table 样式 */
table {
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
}
table td,
table th {
  border-bottom: 1px solid #ccc;
  border-right: 1px solid #ccc;
  padding: 3px 5px;
}
table th {
  border-bottom: 2px solid #ccc;
  text-align: center;
} 

/* blockquote 样式 */
blockquote {
  display: block;
  border-left: 8px solid #d0e5f2;
  padding: 5px 10px;
  margin: 10px 0;
  line-height: 1.4;
  font-size: 100%;
  background-color: #f1f1f1;
}

/* code 样式 */
code {
  display: inline-block;
  *display: inline;
  *zoom: 1;
  background-color: #f1f1f1;
  border-radius: 3px;
  padding: 3px 5px;
  margin: 0 3px;
}
pre code {
  display: block;
}

/* ul ol 样式 */
ul, ol {
  margin: 10px 0 10px 20px;
}




.tag_cate_css{
clear: both;float:left;

}

#up_down{
position: absolute;left:1100px;
}
				
</style>

<!-- 刷新页面---分类专栏颜色渐变  -->
 <style>
/*  body{ text-align:center}
 body,a{ font-size:13px;} */
 a{ color:#333333; text-decoration:none;}
/*  .taglist{ width:350px;overflow:hidden; text-align:left; margin:0 auto;border:#dddddd solid 1px;}
 .taglist .tit{ width:100%; height:24px; line-height:24px; background-color:#565662;}
 .taglist .tit a{ padding-left:8px; color:#ffffff;} */
 #category_css a{height:26px; line-height:26px;padding-right:6px;}
 #category_css .tags0{}
 #category_css .tags1{color:#C00; font-size:24px;}
 #category_css .tags2{color:#030; font-size:16px;}
 #category_css .tags3{color:#00F;}
 #category_css .tags4{ font-size:16px;}
 #category_css .tags5{color:#C00; font-size:20px;}
 #category_css .tags6{color:#F06 font-size:20px;}
 #category_css .tags7{color:#030; font-weight:bold; font-size:18px;}
 #category_css .tags8{color:#F06; font-weight:bold;}
 #category_css .tags9{color:#C00; font-weight:bold;font-size:16px;}
 #category_css .tags10{color:#090; font-weight:bold;font-size:18px;}
 #category_css .tags11{color:#09F;}
 #category_css .tags12{color:#F90;font-size:14px;}
 #category_css a:hover{ color:#F00; text-decoration:underline;}
/*  .w95{ width:95%; margin:0 auto; padding-top:6px; padding-bottom:6px;}
 .taglist .w95{} */
 </style>
<!-- 刷新页面---分类专栏颜色渐变  -->
<script type="text/javascript">
 $(document).ready(function() {
	 var myBackgroundCss=new Array("background:#83AF9B","background:#83AF9B","background:#34afd8",
			 "background:#43ac6a","background:#FC9D9A","background:#C8C8A9",
			 "background:#D9D2E9","background:#B4A7D6","background:#9FC5E8",
			 "background:#FFD966","background:#6FA8DC","background:#8E7CC3",
			 "background:#3D85C6","background:#E69138","background:#93C47D",
			 "background:#EA9999","background:#F9CB9C","background:#FFD966");
 	 var tags_a = $("#category_css a");
	 tags_a.each(function(){
		 var x = 9;
		 var y = 0;
		 var rand = parseInt(Math.random() * (x - y + 1) + y);
		 var bg_rand=parseInt(Math.random() * 18);
		 $(this).addClass("tags"+rand);
		 $(this).attr("style","text-align:left;width:265px;"+myBackgroundCss[bg_rand]);
		 
	 });
 })
 </script>	
	
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
                    oDiv.style = ""
                }
            }
        }
	
	$(function(){
		//获取文章内容赋值显示
	  	var val=$("#_bContent").val();
	  	$("#art_content").html(val);
	  	
	  	
	  	
	  	//展开--收缩：标签和分类栏
	  	$("#up_down_p").hide();//默认收缩
		$("#up_down").click(function(){
			var text=$("#up_down").text();
			if(text=="展开"){
				$("#up_down").text("收缩");
			}else{
				$("#up_down").text("展开");
			}
			$("#up_down_p").toggle(500);//点击显示添加表单
		});
		
	});
	

</script>

</head>
<body>
	<div id="header_main">
		<div id="header">
				<div id="logo">
			<!-- <a href="#"><img src="#" alt=""></a> -->
			</div>
			<div id="nav">
				<ul>
					<li><a href=https://www.qsp.net.cn class="nav_on">首页</a></li>
				</ul>
			</div>
	<!-- 		<div id="searchBox">
				<form action="../search/" method="get" target="_blank">
					<button type = "submit"><i class="fa fa-search" aria-hidden="true"></i></button>
					<input type="search" placeholder="搜索本站" name="keywords">
				</form>
			</div> -->
		</div>
	</div>
<input type="hidden" id="_bContent" value="${blog.bContent}">
	<div id="main">
		<div id="left">
			<div id="art">
				<div id="art_title" >
					<h1 id="b_title" class="tag_cate_css" >${blog.bTitle }</h1>
					<p class="tag_cate_css" >
					作者：<span id="b_author">${blog.bAuthor }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					发布时间：<span id="b_createdate">${blog.createDate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					阅读量：<span id="b_visitors">${blog.bVisitors}</span>次
					 <a href="javascript:void(0);" id="up_down" >展开</a>
					</p>
					<div id="up_down_p"  class="tag_cate_css" >
						<p class="tag_cate_css">
							分类专栏：
							<c:forEach items="${categoryList}" var="category">
								<span class="category_name">${category.categoryName}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</p>
						
						<p class="tag_cate_css">
							文章标签：
							<c:forEach items="${tagList}" var="tag">
								<span class="tag_name">${tag.tagName}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</p>
						
					</div>
				</div>
		
				<!-- 文章的内容 -->
				<div id="art_content">
				</div>

			</div>
		</div>

		<div id="right">
			<div id="hot_art" ><!-- 热门文章 -->
				<div class="right_title">
					<div class="title_content">&nbsp;热门文章</div>
				</div>
				<ul>
					<c:forEach items="${hotBlogList}" var="hotBlog">
						 <li><div class="row_dot"></div><a href="../blog/bReturnDesc.do?b_id=${hotBlog.bId}"  style="color:orange;font-size: 18px;">${hotBlog.bTitle}</a>
						 <br>
						 <span style="float:left;font-size: 12px;color:gray;margin-left:12px;">阅读数&nbsp;&nbsp;${hotBlog.bVisitors}</span>
						 </li>
					</c:forEach>
				</ul>
			</div>
			
			<div id="hot_art" ><!-- 热门文章 -->
				<div class="right_title">
					<div class="title_content">&nbsp;最新文章</div>
				</div>
				<ul>
					<c:forEach items="${newBlogList}" var="newBlog">
						 <li><div class="row_dot"></div><a href="../blog/bReturnDesc.do?b_id=${newBlog.bId}"  target="_blank" style="color:orange;font-size: 18px;">${newBlog.bTitle}</a>
						 </li>
					</c:forEach>
				</ul>
			</div>
			<div id="hot_art" ><!-- 归档 -->
				<div class="right_title">
					<div class="title_content">&nbsp;归档</div>
				</div>
			</div>
			
			<div id="guess_like" ><!-- 猜你喜欢 -->
				<div class="right_title">
					<div class="title_content">&nbsp;猜你喜欢</div>
				</div>
			</div>

			<div id="art_tag" ><!-- 文章标签 -->
				<div class="right_title">
					<div class="title_content">&nbsp;文章分类专栏</div>
				</div>
				
			
				
				<ul id="category_css">
					<c:forEach items="${listCategoryOfUser}" var="cate">
						<li><a href="#" style="background:#93ac4a;width:220px;" title="${cate.categoryName}(${cate.categoryNumber})">${cate.categoryName} <span style="float:right;">${cate.categoryNumber }篇</span></a></li>
					</c:forEach>
				</ul>
				
			</div>

			<div id="friendly_link" ><!-- 友情链接 -->
				<div class="right_title">
					<div class="title_content">&nbsp;友情链接</div>
				</div>
				<ul>
					<c:forEach items="${bfls}" var="fl">
						<li><a href="${fl.flUrl}"  target="_blank">${fl.flText }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div id="footer">
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