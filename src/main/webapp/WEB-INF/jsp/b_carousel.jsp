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


//添加友情链接
$(function(){
	$("#_add_fl").click(function(){
		var fl_name=$("#fl_name").val();
		var fl_url=$("#fl_url").val();
		
		
/* 		var li="<li><a href='"+fl_url+"'  target='_blank'>"+fl_name+"</a></li>";
		$("#fl_ul").append(li);
		layer.msg("添加成功");
		return; */
		
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
    ,url: '../blog/upload.do' //改成您自己的上传接口
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
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
    ,done: function(res, index, upload){
    	console.log(res);
    	
/*       if(res.files.file){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      } */
     // this.error(index, upload);//上传失败
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
			   	<div id="friendly_link_save" ><!-- 友情链接 -->
					
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
					        <tr><th>文件名</th>
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
