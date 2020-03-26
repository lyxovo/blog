<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
  <meta charset="utf-8">
  <title>Layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../layui/layui.js" charset="utf-8"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>


<div style="width:700px;height:200px; border: 1px solid red; ">
<p>aaa<img src="E:/temp_test/muipic.png" alt="muipic.png"></p><p>bbb<a target="_self" href="http://localhost:8082/test.jsp">http://localhost:8082/test.jsp</a></p><p>cc<img src="http://localhost:8082/layui/images/face/65.gif" alt="[威武]"><img src="http://localhost:8082/layui/images/face/51.gif" alt="[兔子]"></p><p><br></p>
</div>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>常规用法</legend>
</fieldset>
 
<div class="layui-form">
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">中文版</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
      </div>
    </div>

<hr>
<textarea id="demo" style="display: none;"></textarea>

<button type="button" onclick="_submitc()">提交</button>

  </div>
</div>

<hr>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>常规轮播</legend>
</fieldset>  
 
<div class="layui-carousel" id="test5">
  <div carousel-item="">
    <div><img src="../picture/20200310223353150764.png"></div>
    <div><img src="../picture/20200324150406725493.png"></div>
    <div><img src="../picture/20200314092634983027.png"></div>
    <div>条目5</div>
  </div>
</div> 


</body>

<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //图片轮播
  carousel.render({
    elem: '#test5'
    ,width: '778px'
    ,height: '440px'
    ,interval: 1000
  });
  
}); 
</script>



<script>
layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	  //常规用法
	  laydate.render({
	    elem: '#test1'
	  });
	  
}); 
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
  
  dd=layedit.build('demo',{
	  height: 180, //设置编辑器高度
	
	 // uploadImage: {url: '/upload/', type: 'post'}
  }
  
  ); //建立编辑器
  
});

function _submitc(){
	 console.log(dd);//下标数，1
	 console.log(layedit.getContent(dd));//包含html
}

</script>


</html>