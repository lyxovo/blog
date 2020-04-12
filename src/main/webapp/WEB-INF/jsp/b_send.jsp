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
	
	<!-- <link rel="icon" href="./images/title.ico" type="image/x-icon"/> -->
	<script type="text/javascript" src="../js/jquery.min.js"></script><!-- 引入jquery文件 -->
	
	<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  	<script src="../layui/layui.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    
	
	<link rel="stylesheet" href="../css/left_middle.css">
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/right.css">
	
	<title>个人博客222！</title>
	
<style>

/* 标题头文本框 */
.input_inner{
	width:748px;
	height:35px;
	background-color: #f2f2f2;
}

/* 富文本 */
 .text{
	width:750px;
	margin-top:18px;
	height:500px;
	
} 
/* 文本内容高度 */
.w-e-text-container{
	height:500px !important; 
}


/* 添加标签 */
._tag{
	float:left;
	margin-top:60px;
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
	margin-top:320px;
}

/* 距离右边 */
#left-middle{
	margin-right:-50px;
	margin-top:10px;
}

/* 遮罩层样式 */
 .mask {       
         position: absolute; top: 0px; filter: alpha(opacity=60); background-color: #c2c2c2;     
         z-index: 1002; left: 0px;     
         opacity:0.3; -moz-opacity:15.5;   
         width:270px;
         height:125px;
         top:793px;  
         left:310px;
     } 
     
 .mask_font {       
   		position: absolute;
         top:845px;  
         left:350px;
         color:red;
         font-size: 18px;
         z-index: 1003;
         font-weight:bold;
         
     } 
        
        
/* 聚焦时候文本框变色 */
input:focus{
    border-style:solid;
    border-color: #03a9f4;
	box-shadow: 0 0 5px #03a9f4;
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
					<li><a href="#" class="nav_on">首页</a></li>
				</ul>
			</div>
		</div> 
	</div>
	<!-- 左右html -->
	<div id="main">
		<div id="left">
			<div id = "left-nav">
				 <ul>
					<li><a href="../blog/index.do?cat=b_management" >管理博客</a></li>
					<li><a href="../blog/index.do?cat=b_send" class="now_on">发博客</a></li>
					<li><a href="../blog/index.do?cat=b_flmanger" >友情链接管理</a></li>
					<li><a href="../blog/index.do?cat=b_carousel" >轮播图管理</a></li>
					<li><a href="../blog/index.do?cat=b_other" >其他</a></li>
				</ul>
			</div>
			<!-- 中间部分（点击左边触发） -->
			
			<div id="left-middle">
				<!-- 中间列表2 -->
				<!-- id，用来判断是修改还是保存 -->
				<input type="hidden" id="b_id" name="b_id" value="${blog.bId}"/>
				<!-- 标题头 -->
			    <input type="text" autocomplete="off" class="form-control input-lg input_inner" id="b_title" maxlength="100" value="${blog.bTitle}"  placeholder="请输入文章标题" >
				
				<!-- 富文本框 -->
				<div id="editor" class="text" style="text-align: left;">
			    </div>
				
				<!--标签 -->
				<div  class="_tag">
				  <label>文章标签：</label>
				<!--   回显文章标签 -->
				   <c:forEach items="${tagsList}" var="tag">
				   		<button onclick='del_tag_category(this)'  type="button" class="add_tag layui-btn layui-btn-xs layui-btn-radius layui-btn-warm">
						<span>${tag.tagName}</span><i class="layui-icon">&#x1006;</i>
						</button>
				   </c:forEach>
				  <button id="add_tag" type="button" class="layui-btn layui-btn-xs" onclick="add_tag()">
					  <i class="layui-icon">&#xe608;</i> 添加文章标签
				  </button>
				</div>
				
			
				<!--分类专栏 -->
				<div class="_sort">
				  <label>分类专栏：</label>
				  	<!--回显分类专栏 -->
				   <c:forEach items="${categorysList}" var="category">
				   		<button onclick='del_tag_category(this)' id="${category.categoryId}"  type="button" class="add_category layui-btn layui-btn-xs layui-btn-radius layui-btn-warm">
							<span>${category.categoryName}</span><i class="layui-icon">&#x1006;</i>
						</button>
				   </c:forEach>
				  
				  
				 <!--  新建分类专栏后赋予的值 -->
				  <button id="add_category"  type="button" class="layui-btn layui-btn-xs " onclick="add_category()">
					  <i class="layui-icon">&#xe608;</i> 新建分类专栏
				  </button>
				</div>
				
				<div id="category_checkbox" class="_sort" style="width:270px;height:120px;border: 1px solid gray;overflow:auto;box-shadow: 0px 0px 2px #888888;text-align: left; padding-left:10px;">
					${categorysLisHtml}

				</div>
				
				<input type="hidden" id="_bContent" value="${blog.bContent}">
				<!--提交按钮 -->
				<div class="submit_">
				  <button onclick="save_blog()" type="button" class="layui-btn layui-btn-radius layui-btn-primary">
					  发布博客
				  </button>
				  
				  <button type="button" id="return_main" class="layui-btn layui-btn-radius layui-btn-primary">
					  返回
				  </button>
				</div>
				
				<div style="margin-top:30px;"></div>
				<!-- 遮罩层 -->
				<div id="mask" class="mask"></div>
				<!-- 遮罩层上面的文字-->
				<span class="mask_font" >分类最多不能超过3个</span>
				
				    
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



 <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="../js/wangEditor.min.js"></script>
<script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#editor');
        editor.customConfig.zIndex = 1;//设置zIndex区域
        editor.customConfig.uploadImgServer = '/upload';  // 上传图片到服务器
        // 或者 var editor = new E( document.getElementById('editor') )
        //创建
     // 表情面板可以有多个 tab ，因此要配置成一个数组。数组每个元素代表一个 tab 的配置
     	//地址：http://yuncode.net/code/c_524ba520e58ce30
     	    // 自定义菜单配置
    editor.customConfig.menus = [
    	    'head',  // 标题
    	    'bold',  // 粗体
    	    'fontSize',  // 字号
    	    'fontName',  // 字体
    	    'italic',  // 斜体
    	    'underline',  // 下划线
    	    'strikeThrough',  // 删除线
    	    'foreColor',  // 文字颜色
    	    'backColor',  // 背景颜色
    	    'link',  // 插入链接
    	    'list',  // 列表
    	    'justify',  // 对齐方式
    	    'quote',  // 引用
    	    'emoticon',  // 表情
    	    'image',  // 插入图片
    	    'table',  // 表格
    	    'video',  // 插入视频
    	    'code',  // 插入代码
    	    'undo',  // 撤销
    	    'redo'  // 重复
    	];
     	
     	
    editor.customConfig.emotions = [
        {
            // tab 的标题
            title: '默认',
            // type -> 'emoji' / 'image'
            type: 'image',
            // content -> 数组
            content: [
                {
                    alt: '[坏笑]',
                    src: 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png'
                },
                {
                    alt: '[舔屏]',
                    src: 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png'
                },
                {
                    alt: '[草泥马]',
                	src:'http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7a/shenshou_thumb.gif'
                },
                {
                    alt: '[围观]',
                	src:'http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f2/wg_thumb.gif'
                },
            ]
        },
        {
            // tab 的标题，全部的
            title: 'emoji',
            // type -> 'emoji' / 'image'
            type: 'emoji',
            // content -> 数组
            content: ['😀', '😃', '😄', '😁', '😆']
        }
    ];
		
       editor.create();
       
  	   val=$("#_bContent").val();
       editor.txt.text(val);
       
        //设置
       // editor.txt.html('<span style="color: rgb(194, 79, 74);">撒范德萨地方</span>');
        //追加设置
       // editor.txt.append('<p>追加的内容23</p>');
        
        //清空内容
       // editor.txt.clear();
        
        //获取内容：
/*   	document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        //alert(editor.txt.html())
        
        
        editor.txt.append(editor.txt.html());;
    }, false); */
        
        
  	/* 
    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false); */
    
    
 /*    document.getElementById('btn1').addEventListener('click', function () {
        var json = editor.txt.getJSON();  // 获取 JSON 格式的内容，得到json对象。
        var jsonStr = JSON.stringify(json); //json字符串
       // editor.txt.html(jsonStr);
        
        console.log(json)
        console.log(jsonStr)
    }); */
    
</script>

<script>

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
		  
		  if(value.length>10){//判断字符串长度10个字符串
			  layer.msg('标签长度不能超过10个字符', {icon: 5,anim: 4});
		  }else if($(".add_tag span").length>=4){//判断标签数量是否大于3个
			  layer.msg('标签数量最多4个', {icon: 5,anim: 6});
		  }else{
				 var tag_html= "<button onclick='del_tag_category(this)'  type=\"button\" class=\"add_tag layui-btn layui-btn-xs layui-btn-radius layui-btn-warm\">\n" +
				  "		<span>"+value+"</span>\n" +
				  "		<i class=\"layui-icon\">&#x1006;</i>\n" +
				  "	</button>";
			  	$("#add_tag").before(tag_html);
		  }
		  
		  layer.close(index); //点击确定时候关闭，没有点击确定不会关闭
	});
	
	
}

//删除分类/标签
function del_tag_category(t){
	var id=$(t).attr("id");
	if(id==undefined || id==""){//标签
		$(t).remove();
		
	}else{ //选中后，出现-点击上面的删除，把√去掉。
		id="#"+id;
		//alert(id);
		$(t).remove();
		$(id).attr("checked",false);
		
		//点击移除分类标签---隐藏遮罩层和文字
		$("#mask").hide();
		$(".mask_font").hide(); 
	}
	
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
	
	
	//验证，点击打钩----工具栏数量
	if($(".add_category span").length>=3){//判断标签数量是否大于3个
	  //显示遮罩层    
	  $("#mask").show();
	  $(".mask_font").show();
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
		  
		  if(value.length>10){//判断字符串长度10个字符串
			  layer.msg('分类栏长度不能超过10个字符', {icon: 5,anim: 4});
		  }else if($(".add_category span").length>=3){//判断标签数量是否大于3个
			  layer.msg('分类栏最多3个', {icon: 5,anim: 6});
		  }else{
				 var tag_html= "<button onclick='del_tag_category(this)'  type=\"button\" class=\"add_category layui-btn layui-btn-xs layui-btn-radius layui-btn-warm\">\n" +
				  "		<span>"+value+"</span>\n" +
				  "		<i class=\"layui-icon\">&#x1006;</i>\n" +
				  "	</button>";
				 $("#add_category").before(tag_html);
		  }
		  
		  
		  layer.close(index); 
	});
}

//保存之前验证
 function save_before_check(){
	if($("#b_title").val()==""){//标题头
		layer.msg('请输入文章标题', {icon: 5,anim: 4});
		$("#b_title").focus();
		return false;
	} else if(editor.txt.text()==""){
		layer.msg('请输入内容', {icon: 5,anim: 1});
		$("#editor").focus();
		return false;
	} else if($(".add_tag span").length==0){
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
	if(save_before_check()==false){
		return false;
	}
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
	//editor
	var b_content=editor.txt.html();//获文本域中的内容
	b_content=encodeURIComponent(b_content);
	//decodeURIComponent(f.ctjs)//反解码显示
	b_content="&b_content="+b_content;
	
	var b_contenttext=editor.txt.text();//获文本域中text
	b_contenttext="&b_contenttext="+b_contenttext;
	//console.log(b_contenttext);
	//return ;
	var b_id=$("#b_id").val(); //获取b_id，用来判断是添加还是修改。
	b_id="&b_id="+b_id;
	
	var serialize=b_title + _tag_span + _category_span + b_content + b_contenttext+b_id;
	//console.log(serialize);
	//return;
	 $.ajax({
		url: "../blog/saveBlog.do",
		data: serialize,
		dataType: "json", 
		type:"POST",
		
		success: function(result){
			if(result.flag==1){
				//var blog=JSON.stringify(result.blog);
				console.log(result);
				window.location.href="../blog/success.do?b_id="+result.b_id;//转到成功页面。
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
<script type="text/javascript">
//隐藏遮罩层  和 文字,初始化。
$(function(){
	if($(".add_category span").length>=3){//当大于等于3的时候出现遮罩层。
		$("#mask").show();
		$(".mask_font").show();
	}else{
		$("#mask").hide();
		$(".mask_font").hide();
	}
	
	//返回管理主页
	$("#return_main").click(function(){
		history.go(-1);
	});
	
});

</script> 



</html>	 
