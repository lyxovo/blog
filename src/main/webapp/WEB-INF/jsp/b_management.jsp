<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	margin-top:46px;
	margin-left:150px;
}

.span_style{
	margin-left:20px;
}
		
		
/* body {
	background-image: url("../image/secai.jpg");
}  */		
</style>
	
<script>
	
layui.use(['laypage', 'layer'], function(){
	  var laypage = layui.laypage
	  ,layer = layui.layer;	
	  //完整功能
	  laypage.render({//只需要返回条数即可
	    elem: 'do_page'
	    ,count: $("#page_total").val()   //总记录数，数据库获取
	    ,limit:15   //当前的总页数
	    ,layout: ['count', 'prev', 'page', 'next']
	    ,jump: function(obj,first){
	      var href="../blog/index.do?cat=b_management&curr="+obj.curr+"&limit="+obj.limit;
	      $("#b_management_a").attr(href);
	      //首次不执行
	      if(!first){
	    	 // window.location.href=href;
/* 		      $.ajax({
			 		url:href,
					dataType: "json", 
					success: function(result){
						if(result.flag==1){
							
						}else{
							layer.msg("查询失败！！！");
						}
					},
					error:function(){
						layer.msg("查询失败！！！");
					}
				});  */ 
	      }
	      

	      
	      
	    }
	  }); 
}); 
	


	
//设置动态背景
/* $(function(){
	$("body").css("background","url('../image/secai.jpg')");
}); */

//写好多个class 背景，然后的切换办法是执行下面的语句。
//$(this).removeClass('classA').addClass('classB');
	
	
function del_blog(bId){
 	//alert(bId);
	//return; 
 	layer.confirm("是否删除该博客？",{icon:3,title:''},function(index){
	 	 $.ajax({
	 		url:"../blog/delBlog.do",
			data: {"b_id":bId},
			dataType: "json", 
			success: function(result){
				if(result.flag==1){
					window.location.href="../blog/index.do?cat=b_management";
				}else{
					layer.msg("删除失败！！！");
				}
			},
			error:function(){
				layer.msg("删除失败！！！");
			}
		}); 

		layer.close(index);
	}); 
}

	
</script>


<script type="text/javascript"> 
/* 鼠标移动到ul li 显示颜色 */
$(document).ready(function() { 
 	$("ul li").hover(function() { 
		$(this).addClass("color"); 
	}, function() { 
		$(this).removeClass("color"); 
	});  
}); 
</script> 
<style> 
.color { 
background:#f2f2f2; 
} 
</style> 

<!-- <script type="text/javascript">
//动态图片
var currentIndex = 0;
function changeBg() {
    //定义要切换的背景图片，双引号里面"1.jpg","2.jpg","3.jpg","4.jpg"，可以放任意多个用,隔开
    var bgImgs = ["../image/yanz.jpg","../image/su.jpg","../image/secai.jpg"];
    if (currentIndex >= bgImgs.length)
        currentIndex = 0;
    $("body").css("background-image", "url(" + bgImgs[currentIndex] + ")");
    currentIndex += 1;
}
setInterval("changeBg()", 500); //设定定时切换，单位为毫秒这里是3000 毫秒
</script> -->



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
					<li><a id="b_management_a" href="../blog/index.do?cat=b_management" class="now_on">管理博客</a></li>
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
							博客列表						
						</div>
					</div>
					<input id="page_total" type="hidden" value="${pageInfo.total}"/>
						<ul>
						<c:forEach items="${pageInfo.list}" var="blog" step="1" varStatus="status">
							<li>
								<div class="title_and_info">
									<div class="art_title">
										<a target="_blank" href="#">${blog.bTitle}</a>
									</div>
									<div style="text-align:left;margin-top:38px;">
										<a target="_blank" href="#">${blog.bContenttext}...</a>
									</div>
									
									<div class="art_info">
										<span>${blog.createDate}</span>
										<span class="span_style">浏览(${blog.bVisitors}) </span>
										<span class="span_style">评论(${blog.bDiscuss})</span>
										<span>
											<a href="#" onclick="del_blog(${blog.bId})" style="color:red;margin-left:340px;">删除</a>
										</span>
									</div>
								</div>
							</li>
						</c:forEach>
						
						<!-- 分页  设置大于10页的时候，才显示-->
						<c:if test="${fn:length(pageInfo.list)>15}">
							<div  id="do_page" ></div>
						</c:if>
						

						
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
