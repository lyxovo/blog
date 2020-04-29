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
 body {
 	background: #E9EAED;
	/* background-image: url("../image/secai.jpg"); */
} 

.nav_on{
	margin-left:-8px;
}



#left-middle {
    margin-top: 10px;
    width: 830px;
    float: none;
    margin-left: 240px;
} 

#friendly_link_save{
margin-left:20px;
	
}


</style>	

<script>
	
var layer="";	
layui.use('layer', function(){
	  layer = layui.layer;
});

$(function(){
	selectPhotos();
});

//查询图片列表
function selectPhotos(){
	$.ajax({
		url:"../blog/queryBlogCarousels.do",
		dataType:"json",
		success:function(res){
		       var tr_html="";
		       $.each(res.bcList,function(i,item){
					console.log(item);
					tr_html+='<tr>'
					+'<td><img src="'+item.carouselUrl+'"/></td>'
					+'<td>'+item.carouselName+'</td>'
					+'<td>'+item.fileSize+'kb</td>'
					+'<td><span style="color: #5FB878;">上传成功</span></td>'
					+'<td><button onclick=delCarouselId('+item.carouselId+') class="layui-btn layui-btn-xs layui-btn-danger demo-delete"><i class="layui-icon layui-icon-delete"></i>删除</button></td>'
					+'</tr>';
				});
				 $("#demoList").html(tr_html);
		},
		error:function(){
			alert("出错了");
			 $("#demoList").html("");
		}
	});
	
}


//删除图片
function delCarouselId(cid){
	$.ajax({
		url:"../blog/delCarouselById.do",
		data:{cid:cid},
		dataType:"json",
		success:function(res){
			if(res.flag==1){
				layer.msg('删除成功.',{icon: 1}); 
				selectPhotos();
			}else{
				layer.alert('删除失败.',{icon: 5}); 
			}
		},
		error:function(){
			layer.alert('出错了.',{icon: 5}); 
		}
	});
}

</script>

<!--layui 图片轮播 -->
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //图片轮播
  carousel.render({
    elem: '#slide_show'
    ,width: '350px'
    ,height: '250px'
    ,interval: 1000
  });
  
}); 
</script>

<!--layui 图片上传,多文件列表示例 -->
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '../blog/doUpload2.do' //改成您自己的上传接口
    //,url: '../blog/upload.do' //测试
    ,accept: 'images' //指定允许上传时校验的文件类型
    ,multiple: true //是否允许多文件上传。
    ,field:"photo" //设定文件域的字段名
    ,auto: false
    ,size:5120 //设定文件最大上传5M 1024*5
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
    	  console.log(file);
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td></td>'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-normal demo-delete "><i class="layui-icon layui-icon-delete"></i>删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){//上传成功,返回的数据信息
    	console.log(res);
    	console.log(index);
    	console.log(upload);
    	/*   if(res.errno==0){ //上传成功
    	//获取上传成功行
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html("<img src='"+res.data+"' />"); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }  */
      
     if(res.errno==0){ //上传成功
    	//获取上传成功行
    	
        //var tr = demoListView.find('tr#upload-'+ index);
 /*        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html("<img src='"+res.data+"' />"); */
        
       // res.bcList
     
       var tr_html="";
       $.each(res.bcList,function(i,item){
			console.log(item);
/* 			tr_html+='<tr>'
			+'<td>"'+item.carouselName+'"</td>'
			+'<td>上传成功</td>'
			+'<td><span style="color: #5FB878;">上传成功</span></td>'
			+'<td></td>'
			+'</tr>'; */
			
			tr_html+='<tr>'
				+'<td><img src="'+item.carouselUrl+'"/></td>'
				+'<td>'+item.carouselName+'</td>'
				+'<td>'+item.fileSize+'kb</td>'
				+'<td><span style="color: #5FB878;">上传成功</span></td>'
				+'<td><button onclick=delCarouselId('+item.carouselId+') class="layui-btn layui-btn-xs layui-btn-danger demo-delete"><i class="layui-icon layui-icon-delete"></i>删除</button></td>'
				+'</tr>';
			
		});//参数数组对象

		 $("#demoList").html(tr_html);
        
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
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
					<li><a href="../blog/index.do?cat=b_flmanger" >友情链接管理</a></li>
					<li><a href="../blog/index.do?cat=b_carousel" class="now_on">轮播图管理</a></li>
					<li><a href="../blog/index.do?cat=b_other" >其他</a></li>
				</ul>
			</div>
			<!-- 中间部分（点击左边触发） -->
			
			<div id="left-middle">
			   	<div id="friendly_link_save" >
					
					<div class="layui-upload">
					<div style="float:left;">
						<br>
					    <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
					    <button type="button" class="layui-btn" id="testListAction">开始上传</button>
					</div>
					<br>
					  <div class="layui-upload-list" >
					    <table class="layui-table" style="width:99%;">
					      <thead>
					        <tr>
					        <th>图片</th>
					        <th>文件名</th>
					        <th>大小</th>
					        <th>状态</th>
					        <th>操作</th>
					      </tr></thead>
					      <tbody id="demoList"></tbody>
					    </table>
					  </div>
					  
					</div> 
					<br>
				</div>
			</div>
			
		</div>
	
<!-- 		<div id="right">
			<h2 style="color:red;margin-top:10px;">效果展示</h2>
		   	<div id="friendly_link" >友情链接
				<div id="slide_show"  class="layui-carousel">滑动幻灯片
				  <div carousel-item="">
					<div>条目1</div>
					<div>条目2</div>
					<div>条目3</div>
				    <div>条目4</div>
				  </div>
				</div>
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
