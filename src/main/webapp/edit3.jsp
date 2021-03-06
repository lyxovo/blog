﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="keywords" content="个人博客">
	<meta name="description" content="个人博客！">
	<title>卖米-飞花-的个人博客！</title>
	
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="stylesheet" href="../css/header.css">

<style>
    .fr-wrapper > div[style*="z-index:999"]{
        top:-10000px;
        opacity: 0;
        position: absolute;
    }
    .second-toolbar{
        border-bottom-left-radius: 2px;
        border-bottom-right-radius: 2px;
    }
</style>

	
	<style>
		pre code{
	        font-size: 15px;
	        font-family: "Consolas", "Bitstream Vera Sans Mono", "Courier New", "Courier", "monospace";
	        line-height: 1.4;
	        border-radius: 5px;
	    }
	    pre {
	        position: relative;
	        overflow: hidden !important;
	    }

	    code {
	      display: block;
	      overflow-y: auto;
	    }

	    code.has-numbering {
	        padding-left: 45px;
	    }

	    .pre-numbering {
	        position: absolute;
	        top: -15.5px;
	        left: 0;
	        width: 35px;
	        padding: 8px 0px 8px 0;
	        border-right: 1px solid #abb2bf;
	        text-align: center;
	        font-family: "Consolas", "Bitstream Vera Sans Mono", "Courier New", "Courier", "monospace";
	        font-size: 15px;
	        line-height: 1.4;
	        color: #abb2bf;
	        background: #282c34;
	        border-top-left-radius:5px;
	        border-bottom-left-radius: 5px;
	    }

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
			height:75px;
			float:left;
			margin-top:20px;
			margin-left:25px;
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

		#comment{
			width:790px;
			margin-top:20px;
			background: white;
			float:left;
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
			float:left;
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

			#art_content{
				width: 100% !important;
				margin-top: 10px !important;
				margin-left: 0 !important;
				margin-right: 0 !important;
				margin-bottom: 0 !important;
				font-size: 0.9em !important;
			}
			#right{
				display: none !important;
			}
			#comment{
				display: none;
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
	</style>
	
	
		<style>
		li{
			list-style: none;
		}

	</style>
	
	
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

</head>

<body>
	<div id="header_main">
		<div id="header">
						<div id="logo">
								<a href=https://www.qsp.net.cn><img src=static/picture/360294_ubang.png alt=""></a>
			</div>
			<div id="nav">
				<ul>
					<li><a href=https://www.qsp.net.cn class="nav_on">首页</a></li>
									</ul>
			</div>
			<div id="searchBox">
				<form action="../search/" method="get" target="_blank">
					<button type = "submit"><i class="fa fa-search" aria-hidden="true"></i></button>
					<input type="search" placeholder="搜索本站" name="keywords">
				</form>
			</div>
		</div>
	</div>

	<div id="main">
		<div id="left">
			<div id="art">
				<div id="art_title">
					<h2>卖米-飞花</h2>
					<p>编辑：谯胜平&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					分类：<span>阅读</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					标签：<span>散文</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					发布时间：<span>2019-02-20</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					浏览次数：<span>1752</span>次</p>
				</div>
				<div id="art_content">
					<div class="fr-view">
						<blockquote><p>飞花，北大才女。原名张培祥，1979年生于湖南醴陵一个山区农户，自小于贫寒中刻苦学习，1997年考入北京大学法学院。2001年攻读法学硕士。2003年非典期间患白血病，三个月后，年仅24岁的张培祥去世。张培祥生前曾有翻译和编写作品出版，并有小说、散文发表。文中描述场景皆是作者的亲身经历。</p></blockquote><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><img src="static/picture/ubang_(4)_20190220638840.jpg" alt="ubang_(4)_20190220638840.jpg" width="577" height="350" class="fr-fic fr-dii"></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">01</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">天刚蒙蒙亮，母亲就把我叫起来了：&ldquo;琼宝，今天是这里的场，我们担点米到场上卖了，好弄点钱给你爹买药。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我迷迷糊糊睁开双眼，看看窗外，日头还没出来呢。我实在太困，又在床上赖了一会儿。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">隔壁传来父亲的咳嗽声，母亲在厨房忙活着，饭菜的香气混合着淡淡的油烟味飘过来，慢慢驱散了我的睡意。我坐起来，穿好衣服，开始铺床。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;姐，我也跟你们一起去赶场好不好？你买冰棍给我吃！&rdquo;弟弟顶着一头睡得乱蓬蓬的头发跑到我房里来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;毅宝，你不能去，你留在家里放水。&rdquo;隔壁传来父亲的声音，夹杂着几声咳嗽。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">弟弟有些不情愿地冲隔壁说：&ldquo;爹，天气这么热，你自己昨天才中了暑，今天又叫我去，就不怕我也中暑！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;人怕热，庄稼不怕？都不去放水，地都干了，禾都死了，一家人喝西北风去？&rdquo;父亲一动气，咳嗽得越发厉害了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">弟弟冲我吐吐舌头，扮了个鬼脸，就到父亲房里去了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">只听见父亲开始叮嘱他怎么放水，去哪个塘里引水，先放哪丘田，哪几个地方要格外留神别人来截水，等等&hellip;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">02</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">吃过饭，弟弟就找着父亲常用的那把锄头出去了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我和母亲开始往谷箩里装米，装完后先称了一下，一担八十多斤，一担六十多斤。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我说：&ldquo;妈，我挑重的那担吧。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;你学生妹子，肩膀嫩，还是我来。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲说着，一弯腰，把那担重的挑起来了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我挑起那担轻的，跟着母亲出了门。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;路上小心点！咱们家的米好，别便宜卖了！&rdquo;父亲披着衣服站在门口嘱咐道。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;知道了，你快回床上躺着吧。&rdquo;母亲艰难地把头从扁担旁边扭过来，吩咐道，&ldquo;饭菜在锅里，中午你叫毅宝热一下吃！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">赶场的地方离我家大约有四里路，我和母亲挑着米，在窄窄的田间小路上走走停停，足足走了一个钟头才到。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">场上的人已经不少了，我们赶紧找了一块空地，把担子放下来，把扁担放在地上，两个人坐在扁担上，拿草帽扇着。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">一大早就这么热，中午就更不得了，我不由得替弟弟担心起来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">他去放水，是要在外头晒上一整天的。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我往四周看了看，发现场上有许多人卖米，莫非他们都等着用钱？</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">场上的人大都眼熟，都是附近十里八里的乡亲，人家也是种田的，谁会来买米呢？</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">03</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我问母亲，母亲说：&ldquo;有专门的米贩子会来收米的。他们开了车到乡下来赶场，收了米，拉到城里去卖，能挣好些哩。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我说：&ldquo;凭什么都给他们挣？我们也拉到城里去卖好了！&rdquo;其实自己也知道不过是气话。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲说：&ldquo;咱们这么一点米，又没车，真弄到城里去卖，挣的钱还不够路费呢！早先你爹身体好的时候，自己挑着一百来斤米进城去卖，隔几天去一趟，倒比较划算一点。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我不由心里一紧，心疼起父亲来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">从家里到城里足足有三十多里山路呢，他挑着那么重的担子走着去，该多么辛苦！就为了多挣那几个钱，把人累成这样，多不值啊！</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">但又有什么办法呢？家里除了种地，也没别的收入，不卖米，拿什么钱供我和弟弟上学？</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我想着这些，心里一阵阵难过起来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">看看旁边的母亲，头发有些斑白了，黑黝黝的脸上爬上了好多皱纹，脑门上密密麻麻都是汗珠，眼睛有些红肿。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;妈，你喝点水。&rdquo;我把水壶递过去，拿草帽替她扇着。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">04</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">米贩子们终于开着车来了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">他们四处看着卖米的人，走过去仔细看米的成色，还把手插进米里，抓上一把米细看。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;一块零五。&rdquo;米贩子开价了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">卖米的似乎嫌太低，想讨价还价。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;不还价，一口价，爱卖不卖！&rdquo;米贩子态度很强硬，毕竟，满场都是卖米的人，只有他们是买家，不趁机压价，更待何时？</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲注意着那边的情形说：&ldquo;一块零五？也太便宜了。上场还卖到一块一呢。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">正说着，有个米贩子朝我们这边走过来了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">他把手插进大米里，抓了一把出来，迎着阳光细看着。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;这米好咧！又白又匀净，又筛得干净，一点沙子也没有！&rdquo;母亲堆着笑，语气里有几分自豪。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">的确，我家的米比场上其他人卖的米都好。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">05</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">那人点了点头，说：&ldquo;米是好米，不过这几天城里跌价，再好的米也卖不出好价钱来。一块零五，卖不卖？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲摇摇头：&ldquo;这也太便宜了吧？上场还卖一块一呢。再说，你是识货的，一分钱一分货，我这米肯定好过别家的！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">那人又看了看米，犹豫了一下，说：&ldquo;本来都是一口价，不许还的，看你们家米好，我加点，一块零八，怎么样？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲还是摇头：&ldquo;不行，我们家这米，少说也要卖到一块一。你再加点？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">那人冷笑一声，说：&ldquo;今天肯定卖不出一块一的行情，我出一块零八你不卖，等会散场的时候你一块零五都卖不出去！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;卖不出去，我们再担回家！&rdquo;那人的态度激恼了母亲。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;那你就等着担回家吧。&rdquo;那人冷笑着，丢下这句话走了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我在旁边听着，心里算着：一块零八到一块一，每斤才差两分钱。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">这里一共150斤米，总共也就三块钱的事情，路这么远，何必再挑回去呢？我的肩膀还在痛呢。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我轻轻对母亲说：&ldquo;妈，一块零八就一块零八吧，反正也就三块钱的事。再说，还等着钱给爹买药呢。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;那哪行？&rdquo;母亲似乎有些生气了，&ldquo;三块钱不是钱？再说了，也不光是几块钱的事，做生意也得讲点良心，咱们辛辛苦苦种出来的米，质量也好，哪能这么贱卖了？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我不敢再说，我知道种田有多么累。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">光说夏天放水，不就把爹给病倒了？弟弟也才十一二岁的毛孩子，还不得找着锄头去放水！</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">毕竟，这是一家人的生计啊！</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">06</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">又有几个米贩子过来了，他们也都只出一块零五。有一两个出到一块零八，也不肯再加。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲仍然不肯卖。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">看看人渐渐少了，我有些着急了。母亲也一定也很心急吧，我想。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;妈，你去那边树下凉快一下吧！&rdquo;我说。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲一边擦汗，一边摇头：&ldquo;不行。我走开了，来人买米怎么办？你又不会还价！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我有些惭愧。&ldquo;百无一用是书生&rdquo;，虽然在学校里功课好，但这些事情上就比母亲差远了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">又有好些人来买米，因为我家的米实在是好，大家都过来看，但谁也不肯出到一块一。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">看看日头到头顶上了，我觉得肚子饿了，便拿出带来的饭菜和母亲一起吃起来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲吃了两口就不吃了，我知道她是担心米卖不出去，心里着急。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲叹了口气：&ldquo;还不知道卖得掉卖不掉呢。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我趁机说：&ldquo;不然就便宜点卖好了。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲说：&ldquo;我心里有数。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">07</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">下午人更少了，日头又毒，谁愿意在场上晒着呢。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">看看母亲，衣服都粘在背上了，黝黑的脸上也透出晒红的印迹来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;妈，我替你看着，你去溪里泡泡去。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲还是摇头：&ldquo;不行，我有风湿，不能在凉水里泡。你怕热，去那边树底下躲躲好了。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;不用，我不怕晒。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;那你去买根冰棍吃好了。&rdquo;母亲说着，从兜里掏出两毛钱零钱来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我最喜欢吃冰棍了，尤其是那种叫&ldquo;葡萄冰&rdquo;的最好吃，也不贵，两毛钱一根。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">但我今天突然不想吃了：&ldquo;妈，我不吃，喝水就行。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">最热的时候也过去了，转眼快散场了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">卖杂货的小贩开始降价甩卖，卖菜，卖西瓜的也都吆喝着：&ldquo;散场了，便宜卖了！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我四处看看，场上已经没有几个卖米的了，大部分人已经卖完回去了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">08</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲也着急起来，一着急，汗就出得越多了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">终于有个米贩子过来了：&ldquo;这米卖不卖？一块零五，不讲价！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲说：&ldquo;你看我这米，多好！上场还卖一块一呢&hellip;&hellip;&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">不等母亲说完，那人就不耐烦地说：&ldquo;行情不同了！想卖一块一，你就等着往回担吧！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">奇怪的是，母亲没有生气，反而堆着笑说：&ldquo;那，一块零八，你要不要？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">那人从鼻子里哼了一声，说：&ldquo;你这个价钱，不是开场的时候也难得卖出去，现在都散场了，谁买？做梦吧！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲的脸一下子白了，动着嘴唇，但什么也没说。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">一旁的我忍不住插嘴了：&ldquo;不买就不买，谁稀罕？不买你就别站在这里挡道！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;哟，大妹子，你别这么大火气。&rdquo;那人冷笑着说，&ldquo;留着点气力等会把米担回去吧！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">等那人走了，我忍不住埋怨母亲：&ldquo;开场的时候人家出一块零八你不卖，这会好了，人家还不愿意买了！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲似乎有些惭愧，但并不肯认错：&ldquo;本来嘛，一分钱一分货，米是好米，哪能贱卖了？出门的时候你爹不还叮嘱叫卖个好价钱？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;你还说爹呢！他病在家里，指着这米换钱买药治病！人要紧还是钱要紧？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲似乎没有话说了，等了一会儿，低声说：&ldquo;一会儿人家出一块零五也卖了吧。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">可是再没有人来买米了，米贩子把买来的米装上车，开走了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">09</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">散场了，我和母亲晒了一天，一颗米也没卖出去。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;妈，走吧，回去吧，别愣在那儿了。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我收拾好毛巾、水壶、饭盒，催促道。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲迟疑着，终于起了身。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;妈，我来挑重的。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;你学生妹子，肩膀嫩&hellip;&hellip;&rdquo;不等母亲说完，我已经把那担重的挑起来了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲也没有再说什么，挑起那担轻的跟在我后面，踏上了回家的路。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">肩上的担子好沉，我只觉得压着一座山似的。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">突然脚下一滑，我差点摔倒。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我赶紧把剩下的力气都用到腿上，好容易站稳了，但肩上的担子还是倾斜了一下，洒了好多米出来。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;啊，怎么搞的？&rdquo;母亲也放下担子走过来，嘴里说，&ldquo;我叫你不要挑这么重的，你偏不听，这不是洒了。多可惜！真是败家精！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">败家精是母亲的口头禅，我和弟弟干了什么坏事她总是这么数落我们。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">但今天我觉得格外委屈，也不知道为什么。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;你在这等会儿，我回家去拿个簸箕来把地上的米扫进去。浪费了多可惜！拿回去可以喂鸡呢！&rdquo;母亲也不问我扭伤没有，只顾心疼洒了的米。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">10</strong><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">&nbsp;</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我知道母亲的脾气，她向来是&ldquo;刀子嘴，豆腐心&rdquo;的，虽然也心疼我，嘴里却非要骂我几句。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">想到这些，我也不委屈了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;妈，你回去还要来回走个六七里路呢，时候也不早了。&rdquo;我说。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;那地上的米怎么办？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我灵机一动，把头上的草帽摘下来：&ldquo;装在这里面好了。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲笑了：&ldquo;还是你脑子活，学生妹子，机灵。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">说着，我们便蹲下身子，用手把洒落在地上的米捧起来，放在草帽里，然后把草帽顶朝下放在谷箩里，便挑着米继续往家赶。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">回到家里，弟弟已经回来了，母亲便忙着做晚饭，我跟父亲报告卖米的经过。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">父亲听了，也没抱怨母亲，只说：&ldquo;那些米贩子也太黑了，城里都卖一块五呢，把价压这么低！这么挣庄稼人的血汗钱，太没良心了！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我说：&ldquo;爹，也没给你买药，怎么办？&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">父亲说：&ldquo;我本来就说不必买药的嘛，过两天就好了，花那个冤枉钱做什么！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">晚上，父亲咳嗽得更厉害了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word; text-align: center;"><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">11</strong><strong style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">&nbsp;</strong></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲对我说：&ldquo;琼宝，明天是转步的场，咱们辛苦一点，把米挑到那边场上去卖了，好给你爹买药。&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;转步？那多远，十几里路呢！&rdquo;我想到那漫长的山路，不由有些发怵。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;明天你们少担点米去，每人担50斤就够了。&rdquo;父亲说。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;那明天可不要再卖不掉担回来！&rdquo;我说，&ldquo;十几里山路走个来回，还挑着担子，可不是说着玩的！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">&ldquo;不会了不会了。&rdquo;母亲说，&ldquo;明天一块零八也好，一块零五也好，总之都卖了！&rdquo;</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">母亲的话里有许多辛酸和无奈的意思，我听得出来，但不知道怎么安慰她。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我自己心里也很难过，有点想哭。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">我想，别让母亲看见了，要哭就躲到被子里哭去吧。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(51, 51, 51); overflow-wrap: break-word;">可我实在太累了，头刚刚挨到枕头就睡着了，睡得又香又甜。</p>					</div>
				</div>
			</div>
		</div>


		<div id="right">

			<div id="hot_art" ><!-- 热门文章 -->
				<div class="right_title">
					<div class="title_content">&nbsp;热门文章</div>
				</div>
				<ul>
	
				    <li><div class="row_dot"></div><a href=../art/104.html  target="_blank">卖米-飞花</a></li>
				    <li><div class="row_dot"></div><a href=../art/105.html  target="_blank">codeup.首字母大写</a></li>
				    <li><div class="row_dot"></div><a href=../art/168.html  target="_blank">推荐几个非常不错的富文本编辑器</a></li>
				    <li><div class="row_dot"></div><a href=../art/114.html  target="_blank">17-19年浙大计科考研经验帖汇总</a></li>
				    <li><div class="row_dot"></div><a href=../art/113.html  target="_blank">【配置教程】sublime text3出现there are no packages available for installation</a></li>
				    <li><div class="row_dot"></div><a href=../art/111.html  target="_blank">计算机专业大学排名（基于第四轮学科评估）</a></li>
				</ul>
			</div>
			<div id="guess_like" ><!-- 猜你喜欢 -->
				<div class="right_title">
					<div class="title_content">&nbsp;猜你喜欢</div>
				</div>
	
			</div>

			<div id="art_tag" ><!-- 文章标签 -->
				<div class="right_title">
					<div class="title_content">&nbsp;文章标签</div>
				</div>
				
				<ul>
					<li><a href=../tag/考研经验 style="background: #f3a557;" title="考研经验(10)">考研经验(10)</a></li>
					<li><a href=../tag/计算机考研 style="background: #83AF9B;" title="计算机考研(8)">计算机考研(8)</a></li>
					<li><a href=../tag/408 style="background: #43ac6a;" title="408(1)">408(1)</a></li>
					<li><a href=../tag/数学一 style="background: #EDC951;" title="数学一(1)">数学一(1)</a></li>
					<li><a href=../tag/shadowsocks style="background: #FE4365;" title="shadowsocks(2)">shadowsocks(2)</a></li>
					<li><a href=../tag/科学上网 style="background: #43ac6a;" title="科学上网(3)">科学上网(3)</a></li>
				</ul>
			</div>

			<div id="friendly_link" ><!-- 友情链接 -->
				<div class="right_title">
					<div class="title_content">&nbsp;友情链接</div>
				</div>
				<ul>
					<li><a href=https://www.qsp.net.cn  target="_blank">个人博客</a></li>
					<li><a href=http://www.glh.org.cn  target="_blank">贵联会</a></li>
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