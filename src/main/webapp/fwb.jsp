<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
   <!--  <link rel="stylesheet" href="../css/wangEditor.min.css"  media="all"> -->
    <script src="../js/jquery.min.js" charset="utf-8"></script>
</head>

<style>
        .text {
            border: 1px solid #ccc;
            height: 700px;
            width:800px;
        }
</style>

<body>
    <div id="editor" class="text">
        <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
    </div>
    
    <button id="btn1">获取html</button>
<button id="btn2">获取text</button>

    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="../js/wangEditor.min.js"></script>
    
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#editor');
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
        
        //设置
       // editor.txt.html('<span style="color: rgb(194, 79, 74);">撒范德萨地方</span>');
        //追加设置
       // editor.txt.append('<p>追加的内容23</p>');
 /*      var str=  "</code></pre><p><br></p><p><br></p><p>&lt;ul class=\"nav nav-pills\"&gt;\n" +
        		"  &lt;li role=\"presentation\" class=\"active\"&gt;&lt;a href=\"#\"&gt;Home&lt;/a&gt;&lt;/li&gt;\n" +
        		"  &lt;li role=\"presentation\"&gt;&lt;a href=\"#\"&gt;Profile&lt;/a&gt;&lt;/li&gt;\n" +
        		"  &lt;li role=\"presentation\"&gt;&lt;a href=\"#\"&gt;Messages&lt;/a&gt;&lt;/li&gt;\n" +
        		"&lt;/ul&gt;&nbsp;&nbsp;<br></p>"; */
        		editor.txt.text('<span style="color: rgb(194, 79, 74);">&lt;/ul&gt;&nbsp;&nbsp;<br>撒范德萨地方</span>');
        		
      //  editor.txt.html(str);
        
        
        //清空内容
       // editor.txt.clear();
        
        //获取内容：
  	document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        //alert(editor.txt.html())
        
        
        editor.txt.append(editor.txt.html());;
    }, false);
        
        
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
</body>
</html>