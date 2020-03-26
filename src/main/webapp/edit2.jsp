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
	<link rel="stylesheet" href="../css/right.css">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	
	<title>个人博客！</title>
	
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
                    oDiv.style = ""
                }
            }
        }
</script>

<script>
var dd="";
var layedit="";
layui.use('layedit', function(){
  layedit = layui.layedit;
  
//注意：layedit.set 一定要放在 build 前面，否则配置全局接口将无效。
  layedit.set({
	  uploadImage: {
	    url: '../upload.do' //接口url
	    ,type: 'post' //默认post
	  }
	});
  
  dd=layedit.build('_content',{
	  height: 580, //设置编辑器高度
	 // uploadImage: {url: '/upload/', type: 'post'}
  }
  
  ); //建立编辑器
  
});

/* function _submitc(){
	 console.log(dd);//下标数，1
	 console.log(layedit.getContent(dd));//包含html
} */

</script>
	
	
<style>
/* 标题头 */
.input_inner{
	width:645px;
	height:30px;
}

/* 富文本 */
.create_content{
	margin-top:25px;
}

/* 分类专栏和添加标签 */
.tag_sort{
	margin-left:-400px;
	margin-top:25px;
}

.submit_{
	margin-left:0px;
	margin-top:50px;
}

</style>	
	
</head>


<body>
	<!-- 顶部栏目html -->
	<div id="header_main">
		<div id="header">
		<!-- logo -->
			<div id="logo">
				<a href=https://www.qsp.net.cn><img src=static/picture/360294_ubang.png alt=""></a>
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
			<div id = "left-nav">
				 <ul>
					<li>
						<a href="https://www.qsp.net.cn" class="now_on">推荐</a>
					</li>
					<li><a href="./index?cat=热门" >热门</a>	</li>
					<li><a href="./index?cat=web" >web</a></li>
					<li><a href="./index?cat=其他" >其他</a></li>
				</ul>
			</div>
			<!-- 中间部分（点击左边触发） -->
			
			
			<div id="left-middle">
				<!-- 中间列表2 -->
				
				<!-- 标题头 -->
				<input type="text" autocomplete="off" id="txtTitle" maxlength="100" placeholder="请输入文章标题" class="input_inner"/>
				
				<!-- 富文本 -->
				<div class="create_content">
				  <textarea id="_content" style="display: none;"></textarea>
				</div>
				
				<!--标签 -->
				<div  class="tag_sort">
				  <label class="tag_label">文章标签：</label>
				  
				  <button type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm">
					  <span>服务器</span>
					  <i class="layui-icon">&#x1006;</i>
				  </button>
				  
				  <button type="button" class="layui-btn layui-btn-xs">
					  <i class="layui-icon">&#xe608;</i> 添加文章标签
				  </button>
				</div>
				
				<!--分类专栏 -->
				<div class="tag_sort">
				  
				  <label class="tag_label">分类专栏：</label>
				 <!--  新建分类专栏后赋予的值 -->
				  <button type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm">
					  <span>java</span>
					  <i class="layui-icon">&#x1006;</i>
				  </button>
				  
				  <button type="button" class="layui-btn layui-btn-xs ">
					  <i class="layui-icon">&#xe608;</i> 新建分类专栏
				  </button>
				</div>
				
				<!--提交按钮 -->
				<div class="submit_">
				  <button type="button" class="layui-btn layui-btn-radius layui-btn-primary">
					  发布博客
				  </button>
				  
				  <button type="button" class="layui-btn layui-btn-radius layui-btn-primary">
					  返回
				  </button>
				</div>
				
				
				
				<div style="margin-top:30px;">
				  
				</div>
				
			</div>
			
			
		</div>
	
		<div id="right">
			<div id="hot_art" ><!-- 热门文章 -->
				<div class="right_title">
					<div class="title_content">&nbsp;热门文章</div>
				</div>
				<ul>
						    <li><div class="row_dot"></div><a href=./art/101.html  target="_blank">shadowsocks一键翻墙脚本</a></li>
						    <li><div class="row_dot"></div><a href=./art/100.html  target="_blank">2017年浙大计算机384分考研经验</a></li>
						    <li><div class="row_dot"></div><a href=./art/103.html  target="_blank">情人节搞笑表白程序</a></li>
						    <li><div class="row_dot"></div><a href=./art/102.html  target="_blank">codeup.字符串连接</a></li>
						    <li><div class="row_dot"></div><a href=./art/104.html  target="_blank">卖米-飞花</a></li>
						    <li><div class="row_dot"></div><a href=./art/105.html  target="_blank">codeup.首字母大写</a></li>
						    <li><div class="row_dot"></div><a href=./art/168.html  target="_blank">推荐几个非常不错的富文本编辑器</a></li>
						    <li><div class="row_dot"></div><a href=./art/114.html  target="_blank">17-19年浙大计科考研经验帖汇总</a></li>
						    <li><div class="row_dot"></div><a href=./art/113.html  target="_blank">【配置教程】sublime text3出现there are no packages available for installation</a></li>
						    <li><div class="row_dot"></div><a href=./art/111.html  target="_blank">计算机专业大学排名（基于第四轮学科评估）</a></li>
				</ul>
			</div>

		   	<div id="friendly_link" ><!-- 友情链接 -->
							<div class="right_title">
								<div class="title_content">&nbsp;友情链接</div>
							</div>
							<ul>
								    <li><a href=https://www.qsp.net.cn  target="_blank">谯胜平个人博客</a></li>
								    <li><a href=http://www.glh.org.cn  target="_blank">贵联会</a></li>
							</ul>
			</div>
		</div>
		
	
	</div>
	<!-- 底部 -->
	<div id="footer" style="position: absolute;top:100%;">
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
