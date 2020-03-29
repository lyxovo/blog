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
	<link rel="stylesheet" href="../css/right.css">
	
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
  
  dd=layedit.build('b_content',{
	  height: 580, //设置编辑器高度
	 // uploadImage: {url: '/upload/', type: 'post'}
  }); //建立编辑器
  
});


//-------------------	
	
var layer="";	
layui.use('layer', function(){
	  layer = layui.layer;
});

//添加标签
function add_tag(){
	layer.prompt({
		  formType: 0,//0,文本框，1，密码框，2，文本域
		  value: '',//初始值
		  title: '添加文章标签',//标题
		  area: ['200px', '20px'] //自定义文本域宽高
		}, function(value, index, elem){
		  //alert(value); //得到value
		  
	 var tag_html= "<button onclick='del_tag_category(this)'  type=\"button\" class=\"add_tag layui-btn layui-btn-xs layui-btn-radius layui-btn-warm\">\n" +
			  "		<span>"+value+"</span>\n" +
			  "		<i class=\"layui-icon\">&#x1006;</i>\n" +
			  "	</button>";
		  
		  $("#add_tag").before(tag_html);
		  layer.close(index); //点击确定时候关闭，没有点击确定不会关闭
	});
	
	
}

//删除分类/标签
function del_tag_category(t){
	$(t).remove();
}

/* 复选框---选中分类专栏触发事件 */
function add_category_checkbox(t){
	var id=$(t).attr("id");
	if($(t).is(':checked')){//选中',true
		 var tag_html= "<button onclick='del_tag_category(this)' id='"+id+"'  type=\"button\" class=\"add_category layui-btn layui-btn-xs layui-btn-radius layui-btn-warm\">\n" +
		  "		<span>"+$(t).val()+"</span>\n" +
		  "		<i class=\"layui-icon\">&#x1006;</i>\n" +
		  "	</button>";
	 	 $("#add_category").before(tag_html);
	}else{
		//删除。
		id="#"+id;
		$(id).remove();
	}
}

     

//新建分类
function add_category(){
	layer.prompt({
		  formType: 0,
		  value: '',
		  title: '新建分类专栏',
		  area: ['200px', '20px'] 
		}, function(value, index, elem){
		  
		 var tag_html= "<button onclick='del_tag_category(this)'  type=\"button\" class=\"add_category layui-btn layui-btn-xs layui-btn-radius layui-btn-warm\">\n" +
			  "		<span>"+value+"</span>\n" +
			  "		<i class=\"layui-icon\">&#x1006;</i>\n" +
			  "	</button>";
		  
		  $("#add_category").before(tag_html);
		  layer.close(index); 
	});
}

//保存之前验证
 function save_before_check(){
	if($("#b_title").val()==""){//标题头
		layer.msg('请输入文章标题', {icon: 5,anim: 4});
		$("#b_title").focus();
		return false;
	}else if(layedit.getContent(dd)==""){
		layer.msg('请输入内容', {icon: 5,anim: 1});
		$("#b_content").focus();
		return false;
	}else if($(".add_tag span").length==0){
		layer.msg('请填写文章标签', {icon: 5,anim: 6});
		return false;
	}else if($(".add_category span").length==0){
		layer.msg('请填写文章专栏', {icon: 5,anim: 6});
		return false;
	}
	return true;
} 

//提交保存  
function save_blog(){
	//save_before_check();
	
	//文章标题
	var b_title=$("#b_title").val();
	b_title="b_title="+b_title;
	
	//标签
	var _tag_span="";
	var arr_tag_span=$(".add_tag span");
	for(var i=0;i<arr_tag_span.length;i++){
		_tag_span+="&tag_name="+$(arr_tag_span[i]).text();
	}
	if(_tag_span==""){//后台保证不出错
		_tag_span="&tag_name=";
	}
	//console.log(_tag_span);
	//分类专栏
	var _category_span="";
	var arr_category_span=$(".add_category span");
	for(var i=0;i<arr_category_span.length;i++){
		_category_span+="&category="+$(arr_category_span[i]).text();
	}
	if(_category_span==""){//后台保证不出错
		_category_span="&category=";
	}
	
	//console.log(_category_span);
	//富文本内容
	var b_content=layedit.getContent(dd);//包含html
	//b_content=JSON.stringify(b_content);
	b_content=encodeURIComponent(b_content);
	//decodeURIComponent(f.ctjs)//显示
	b_content="&b_content="+b_content;
	console.log(b_content);
	
	var serialize=b_title + _tag_span + _category_span + b_content;
	//console.log(serialize);
	//return;
	 $.ajax({
		url: "../blog/saveBlog.do",
		data: serialize,
		dataType: "json", 
		type:"POST",
		
		success: function(result){
			if(result.flag==1){
				var blog=JSON.stringify(result.blog);
				//console.log(result.blog);
				//window.location.href="../blog/saveSuccess.do?blog="+blog;//转到成功页面。
			}else{
				layer.alert('对不起，文章保存失败！！！', {icon: 5,anim: 4});
			}
		},
		error:function(){
			layer.alert('对不起，文章保存失败！！！', {icon: 5,anim: 4});
		}
	}); 


	

}
</script>


<style>
/* 标题头文本框 */
.input_inner{
	width:645px;
	height:30px;
	background-color: #f2f2f2;
}

/* 富文本 */
.create_content{
	margin-top:25px;
}

/* 添加标签 */
._tag{
	float:left;
	margin-top:30px;
}

/* 分类专栏 */
._sort{
	clear:both;
	float:left;
	margin-top:30px;
}


/* 提交 */
.submit_{
	clear:both;
	margin-left:0px;
	margin-top:250px;
}

/* 添加友情链接 */
#add_fl{

}

</style>	
	
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
					<li><a href=https://www.qsp.net.cn class="nav_on">首页</a></li>
				</ul>
			</div>
<!-- 			<div id="searchBox">
				<form action="./search/" method="get" target="_blank">
					<button type = "submit"><i class="fa fa-search" aria-hidden="true"></i></button>
					<input type="search" placeholder="搜索本站" name="keywords">
				</form>
			</div> -->
		</div> 
	</div>
	<!-- 左右html -->
	<div id="main">
		<div id="left">
			<div id = "left-nav">
				 <ul>

					<li><a href="../blog/index.do?cat=b_management" >管理博客</a></li>
					<li><a href="./index?cat=b_send" class="now_on">发博客</a></li>
					<li><a href="./index?cat=b_flManger" >友情链接管理</a></li>
					<li><a href="./index?cat=b_carousel" >轮播图管理</a></li>
					<li><a href="./index?cat=b_other" >其他</a></li>
					
					
				</ul>
			</div>
			<!-- 中间部分（点击左边触发） -->
			
			<div id="left-middle">
				<!-- 中间列表2 -->
				
				<!-- 标题头 -->
				<input type="text" autocomplete="off" id="b_title" maxlength="100" placeholder="请输入文章标题" class="input_inner"/>
				
				<!-- 富文本 -->
				<div class="create_content">
				  <textarea id="b_content" style="display: none;"></textarea>
				</div>
				
				<!--标签 -->
				<div  class="_tag">
				  <label>文章标签：</label>
				  <button id="add_tag" type="button" class="layui-btn layui-btn-xs" onclick="add_tag()">
					  <i class="layui-icon">&#xe608;</i> 添加文章标签
				  </button>
				</div>
				
			
				<!--分类专栏 -->
				<div class="_sort">
				  <label>分类专栏：</label>
				 <!--  新建分类专栏后赋予的值 -->
				  <button id="add_category"  type="button" class="layui-btn layui-btn-xs " onclick="add_category()">
					  <i class="layui-icon">&#xe608;</i> 新建分类专栏
				  </button>
				</div>
				
				<div class="_sort" style="width:230px;height:80px;border: 1px solid gray;">
				   写作<input onclick="add_category_checkbox(this)" type="checkbox" id="xz" value="写作">
				     阅读 <input onclick="add_category_checkbox(this)" type="checkbox" id="yd" value="阅读">
				     发呆<input onclick="add_category_checkbox(this)" type="checkbox" id="fd" value="发呆">
				</div>
				
				
				<!--提交按钮 -->
				<div class="submit_">
				  <button onclick="save_blog()" type="button" class="layui-btn layui-btn-radius layui-btn-primary">
					  发布博客
				  </button>
				  
				  <button type="button" class="layui-btn layui-btn-radius layui-btn-primary">
					  返回
				  </button>
				</div>
				
				<div style="margin-top:30px;"></div>
			</div>
			
		</div>
	
		<div id="right">
		   	<div id="friendly_link" ><!-- 友情链接 -->
							<div class="right_title">
								<div class="title_content">&nbsp;<span>友情链接 </span></div>
							

							</div>
							
							
							<ul>
								    <li><a href=https://www.qsp.net.cn  target="_blank">个人博客</a></li>
								    <li><a href=http://www.glh.org.cn  target="_blank">贵联会</a></li>
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
