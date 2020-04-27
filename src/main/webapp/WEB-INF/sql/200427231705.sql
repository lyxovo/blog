/*
MySQL Backup
Source Server Version: 5.5.62
Source Database: my_blog
Date: 2020/4/27 23:17:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_picture` varchar(255) DEFAULT NULL COMMENT '上传内容图片名称',
  `b_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `b_content` longtext COMMENT '内容',
  `b_author` int(11) DEFAULT NULL COMMENT '作者，当前登录人',
  `b_createdate` datetime DEFAULT NULL COMMENT '创建文章时间',
  `b_createupdate` datetime DEFAULT NULL COMMENT '修改文章时间',
  `b_visitors` int(11) DEFAULT NULL COMMENT '--浏览人数--只有当浏览的时候才添加，一般放在redis中，再定时更新到数据库中会更好。',
  `b_discuss` int(11) DEFAULT NULL COMMENT ' ---评论人数',
  `b_contentText` longtext,
  `b_live` int(2) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `blog_carousel`
-- ----------------------------
DROP TABLE IF EXISTS `blog_carousel`;
CREATE TABLE `blog_carousel` (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_url` varchar(255) DEFAULT NULL COMMENT '轮播图片url',
  `carousel_name` varchar(255) DEFAULT NULL COMMENT '轮播图片',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`carousel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `blog_category`
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `u_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL COMMENT '标签名称',
  `category_number` int(11) DEFAULT NULL COMMENT '专栏中显示的文章数量',
  `b_id` int(11) DEFAULT NULL COMMENT '关联的博客',
  `c_live` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `blog_friendly_links`
-- ----------------------------
DROP TABLE IF EXISTS `blog_friendly_links`;
CREATE TABLE `blog_friendly_links` (
  `fl_id` int(11) NOT NULL AUTO_INCREMENT,
  `fl_url` varchar(255) DEFAULT NULL COMMENT '友情链接url',
  `fl_text` varchar(255) DEFAULT NULL COMMENT '友情链接',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`fl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `blog_tag`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) DEFAULT NULL COMMENT '标签名称',
  `tag_number` int(11) DEFAULT NULL COMMENT '标签中显示的文章数量',
  `b_id` int(11) DEFAULT NULL COMMENT '关联的博客',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `blog` VALUES ('35',NULL,'java 信息基础','<p></p><p></p><p></p><h2><span style=\"font-weight: bold;\">Java是一门<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1\">面向对象</a>编程语言，</span>不仅吸收了<a target=\"_blank\" href=\"https://baike.baidu.com/item/C%2B%2B\">C++</a>语言的各种优点，还摒弃了C++里难以理解的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%9A%E7%BB%A7%E6%89%BF\">多继承</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8C%87%E9%92%88/2878304\">指针</a>等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程<sup>&nbsp;[1]</sup><a name=\"ref_[1]_12654100\">&nbsp;</a>&nbsp;。</h2><p><br></p><div label-module=\"para\">Java具有简单性、面向对象、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F/19276232\">分布式</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%81%A5%E5%A3%AE%E6%80%A7/4430133\">健壮性</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AE%89%E5%85%A8%E6%80%A7/7664678\">安全性</a>、平台独立与可移植性、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%9A%E7%BA%BF%E7%A8%8B/1190404\">多线程</a>、动态性等特点<sup>&nbsp;[2]</sup><a name=\"ref_[2]_12654100\">&nbsp;</a>&nbsp;。Java可以编写<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A1%8C%E9%9D%A2%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F/2331979\">桌面应用程序</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Web%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F\">Web应用程序</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F%E7%B3%BB%E7%BB%9F/4905336\">分布式系统</a>和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B5%8C%E5%85%A5%E5%BC%8F%E7%B3%BB%E7%BB%9F/186978\">嵌入式系统</a>应用程序等<sup>&nbsp;[3]</sup><a name=\"ref_[3]_12654100\">&nbsp;</a>&nbsp;。</div><ol><li>1&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#1\">发展历程</a></li><li>2&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2\">编程开发</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2_1\">编程环境</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2_2\">编程工具</a></li><li>3&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#3\">语言特点</a></li></ol><ol><li>4&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#4\">工作原理</a></li><li>5&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5\">语言基础</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_1\">基本数据结构</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_2\">关键字</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_3\">运算符</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_4\">程序举例</a></li></ol><p>&lt;label&gt;&lt;input type=\'checkbox\' checked value=\'\' checked onclick=\'add_category_checkbox(this)\'&gt;月底&lt;/label&gt;&lt;label&gt;&lt;input type=\'checkbox\'  value=\'\' checked onclick=\'add_category_checkbox(this)\'&gt;月底&lt;/label&gt;&lt;label&gt;&lt;input type=\'checkbox\'  value=\'\' checked onclick=\'add_category_checkbox(this)\'&gt;月底&lt;/label&gt;&lt;label&gt;&lt;input type=\'checkbox\'  value=\'\' checked onclick=\'add_category_checkbox(this)\'&gt;月底&lt;/label&gt;&lt;label&gt;&lt;input type=\'checkbox\'  value=\'\' checked onclick=\'add_category_checkbox(this)\'&gt;月底&lt;/label&gt;<br></p><p></p><p></p><p></p>','1','2020-04-05 22:24:55','2020-04-11 21:41:03','0','0','Java是一门面向对象编程语言，不仅吸收了C  语言的各种优点，还摒弃了C  里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程','1'), ('36',NULL,'站长工具导航','<ul><li><p>站长工具导航</p></li><li>SEO信息查询<p><a href=\"http://t.mb5u.com/q/\">网站综合查询</a><a href=\"http://t.mb5u.com/GooglePR/\">Google PR查询</a><a href=\"http://t.mb5u.com/alexa/\">Alexa排名查询</a><a href=\"http://t.mb5u.com/baidu/\">百度权重查询</a><a href=\"http://t.mb5u.com/shoulu/\">网站收录查询</a><a href=\"http://t.mb5u.com/linkin/\">反向链接查询</a><a href=\"http://t.mb5u.com/link/\">友情链接查询</a><a href=\"http://t.mb5u.com/zhishu/\">百度指数查询</a></p></li><li>网站信息查询<p><a href=\"http://t.mb5u.com/meta/\">网页Meta信息检测</a><a href=\"http://t.mb5u.com/header/\">网站Header信息</a><a href=\"http://www.mb5u.com/tool/keywords/\">网页关键字密度查询</a><a href=\"http://t.mb5u.com/yuandaima/\">网页源代码查看</a><a href=\"http://t.mb5u.com/robot/\">蜘蛛抓取模拟</a></p></li><li>域名相关查询<p><a href=\"http://t.mb5u.com/ip/\">域名IP地址查询</a><a href=\"http://t.mb5u.com/ip2d/\">IP反查域名</a><a href=\"http://t.mb5u.com/hex/\">网址转换成HEX编码</a><a href=\"http://t.mb5u.com/dels/\">域名删除时间查询</a><a href=\"http://t.mb5u.com/whois/\">域名Whois查询</a></p></li><li>站长常用工具<p><a href=\"http://www.mb5u.com/tool/htmljs/\">HTML/JS转换工具</a><a href=\"http://t.mb5u.com/jsys/\">Js压缩/格式化工具</a><a href=\"http://t.mb5u.com/robots/\">robots.txt文件生成</a><a href=\"http://t.mb5u.com/jquery/\">jquery在线手册</a></p></li><li>设计常用工具<p><a href=\"http://www.mb5u.com/tool/css2/\">CSS2中文手册</a><a href=\"http://t.mb5u.com/css3/\">CSS3中文手册</a><a href=\"http://t.mb5u.com/html/\">HTML中文手册</a><a href=\"http://www.mb5u.com/tool/csslj/\">样式表滤镜手册</a><a href=\"http://www.mb5u.com/tool/peise/\">在线配色工具</a><a href=\"http://www.mb5u.com/tool/cssjianfei/\">CSS精简优化工具</a></p></li><li>其他常用工具<p><a href=\"http://t.mb5u.com/daxiaoxie/\">字母大小写转换</a><a href=\"http://t.mb5u.com/phone/\">手机号码归属地查询</a><a href=\"http://t.mb5u.com/sfz/\">身份证查询</a><a href=\"http://www.mb5u.com/tool/zishutongji/\">在线字数统计查询</a><a href=\"http://t.mb5u.com/huilv/\">货币汇率换算工具</a><a href=\"http://t.mb5u.com/kuaidi/\">快递查询工具</a></p></li><li><p></p></li></ul><p><br></p>','1','2020-04-05 22:35:32','2020-04-05 22:35:32','0','0','站长工具导航SEO信息查询网站综合查询Google PR查询Alexa排名查询百度权重查询网站收录查询反向链接查询友情链接查询百度指数查询网站信息查询网页Meta信息检测网站Header信息网页关键字密度查询网页源代码查看蜘蛛抓取模拟域名相关查询域名IP地址查询IP反查域名网址转换成HEX编码域名删除时间查询域名Whois查询站长常用工具HTML/JS转换工具Js压缩/格式化工具robots.txt文件生成jquery在线手册设计常用工具CSS2中文手册CSS3中文手册HTML中文手册样式表滤镜手册在线配色工具CSS精简优化工具其他常用工具字母大小写转换手机号码归属地查询身份证查询在线字数统计查询货币汇率换算工具快递查询工具','1'), ('37',NULL,'java 提升基础学习','<pre>/** \n * 获取现在时间,这个好用 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getSqlDate() {  \n    Date sqlDate = new java.sql.Date(new Date().getTime());  \n    return sqlDate;  \n}  \n  \n/** \n * 获取现在时间 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getNowDate() {  \n    Date currentTime = new Date();  \n    SimpleDateFormat formatter = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");  \n    String dateString = formatter.format(currentTime);  \n    ParsePosition pos = new ParsePosition(8);  \n    Date currentTime_2 = formatter.parse(dateString, pos);  \n    return currentTime_2;  \n}  \n  </pre>','1','2020-04-05 23:06:29','2020-04-05 23:06:29','0','0','/** \n * 获取现在时间,这个好用 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getSqlDate() {  \n    Date sqlDate = new java.sql.Date(new Date().getTime());  \n    return sqlDate;  \n}  \n  \n/** \n * 获取现在时间 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getNowDate() {  \n    Date currentTime = new Date();  \n    SimpleDateFormat formatter = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");  \n    String dateString = formatter.format(currentTime);  \n    ParsePosition pos = new ParsePosition(8);  \n    Date currentTime_2 = formatter.parse(dateString, pos);  \n    return currentTime_2;  \n}','1'), ('38',NULL,'ajax 提交- serialize()、serializeArray()','<p></p><p></p><p></p><pre><code>public List&lt;Userinfo&gt; selectUserinfo() {<br>    PageHelper.startPage(2, 3); //使用分页插件<br>    List&lt;Userinfo&gt; userinfos =studentMapper.selectUserinfo();<br>    PageInfo&lt;Userinfo&gt; infos=new PageInfo&lt;Userinfo&gt;(userinfos); <br>    List&lt;Userinfo&gt; list = infos.getList(); <br>    return userinfos; <br>}</code></pre><p>————————————————<br>版权声明：本文为CSDN博主「我爱吃红薯」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_45315910/java/article/details/100156072</p><p></p><p></p><p></p>','1','2020-04-06 21:51:17','2020-04-10 21:28:47','0','0','public List','1'), ('39',NULL,'Oracle 分页','<p>说明：&nbsp;select * from ( select row_.*, rownum rownum_ from ( select * from &nbsp;userinfo ) row_ &nbsp;where rownum &lt;= &nbsp;#{pageNum} * #{pageSize} )a where rownum_ &gt; &nbsp;( #{pageNum}- 1) * #{pageSize}<br>&nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp;解析：先查询select * from &nbsp;userinfo 总条数并起个别名 row_,<br>&nbsp; &nbsp; &nbsp; &nbsp; 然后查询select row_.*, rownum rownum_ from ( select * from &nbsp;userinfo ) row_ &nbsp;where rownum &lt;= &nbsp;#{pageNum} * #{pageSize} ，把所有数据和rownum固定字段列查询并起别名，<br>&nbsp; &nbsp; &nbsp; &nbsp; 最后从a中查询出想要的数据,主要是使用rownum固定字段列筛选实现分页 where rownum_ &gt; &nbsp;( #{pageNum}- 1) * #{pageSize}<br>————————————————<br>版权声明：本文为CSDN博主「我爱吃红薯」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_45315910/java/article/details/100156072</p>','1','2020-04-06 21:52:20','2020-04-06 21:52:20','0','0','说明：','1'), ('40',NULL,'maven 地址','<h3><a data-click=\"{\n			\'F\':\'778317EA\',\n			\'F1\':\'9D73F1C4\',\n			\'F2\':\'4CA6DE6B\',\n			\'F3\':\'54E5243F\',\n			\'T\':\'1586180248\',\n						\'y\':\'5D3FFFFD\'\n												}\" href=\"https://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd&amp;wd=&amp;eqid=a787de52004bf411000000035e8b3097\" target=\"_blank\"><em>Maven</em>&nbsp;Repository: Search/Browse/Explore</a></h3><div>查看此网页的中文翻译，请点击&nbsp;<a href=\"http://www.baidu.com/link?url=p1O9mW6xWDDhdLRhLNAvgRkl2yLz3aTJ57pqLA3UNI63yyuRsjaRCFf9AZljN66PqpF6QiAYWCGSMjwsUza2bi4x7FCaQsEwmlYlGD_xSH4XEkrSxjfympDm6NpEUbK4KZ6rYNYDIkG0LtAtd7DMqpHyuPR55sNo7IJeayzji_2AG9EC1NFXG4iUhdFcVyZK\" target=\"_blank\">翻译此页</a></div><div><em>maven</em>&nbsp;model module osgi persistence platform plugin repository rest rlang scala sdk security server service spring starter streaming testing tools ui web web...</div><div><a target=\"_blank\" href=\"http://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd\">https://mvnrepository.com/&nbsp;</a><div id=\"tools_13291758886426082870_1\"><a><i></i></a></div>&nbsp;-&nbsp;<arsv_snapshot\':\'1\'}\" href=\"http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed19fa950d100b88224514d72161968b532294d85f93130a1c187bf7fe7a62460b8c9638305d&amp;p=8b2a971288db5bf849bd9b7d0707&amp;newp=8e72d615d9c04bf617f5c7710f4e92695d0fc20e38d6d401298ffe0cc4241a1a1a3aecbf2d201b07d9c67e6702a84f56e0f13c783d0034f1f689df08d2ecce7e76c73f&amp;user=baidu&amp;fm=sc&amp;query=maven&amp;qid=a787de52004bf411&amp;p1=1\" target=\"_blank\">百度快照</arsv_snapshot\':\'1\'}\"></div>','1','2020-04-06 21:53:00','2020-04-06 21:53:00','0','0','<a data-click=\"{\n			\'F\':\'778317EA\',\n			\'F1\':\'9D73F1C4\',\n			\'F2\':\'4CA6DE6B\',\n			\'F3\':\'54E5243F\',\n			\'T\':\'1586180248\',\n						\'y\':\'5D3FFFFD\'\n												}\" href=\"https://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd','1'), ('41',NULL,'java ss','<p>asdf</p>','1','2020-04-07 22:38:48','2020-04-07 22:38:48','0','0','asdf','1'), ('42',NULL,'分类栏设置啰里啰嗦','<p>阿萨德发撒的发撒的发士大夫士大夫撒地方水电费</p><p>阿斯蒂芬</p>','1','2020-04-07 22:51:27','2020-04-07 22:51:27','0','0','阿萨德发撒的发撒的发士大夫士大夫撒地方水电费阿斯蒂芬','1'), ('43',NULL,'a','<p>sadsdfs</p>','1','2020-04-08 21:58:57','2020-04-08 21:58:57','0','0','sadsdfs','1'), ('44',NULL,'s','<p>sdf</p>','1','2020-04-08 21:59:12','2020-04-08 21:59:12','0','0','sdf','1'), ('45',NULL,'sdffff','<p>sdf</p>','1','2020-04-08 21:59:25','2020-04-08 21:59:25','0','0','sdf','1'), ('46',NULL,'aaaaaaaaaaaaa','<p>sdfffffffffffffffffffffffffff</p>','1','2020-04-08 21:59:44','2020-04-08 21:59:44','0','0','sdfffffffffffffffffffffffffff','1'), ('47',NULL,'7878','<p>234234234</p>','1','2020-04-08 22:01:03','2020-04-08 22:01:03','0','0','234234234','1'), ('48',NULL,'java2222','<p>23333safdfsafsdaf</p>','1','2020-04-08 22:01:27','2020-04-08 22:01:27','0','0','23333safdfsafsdaf','1'), ('49','','java 信息基础12','<h2><span style=\"font-weight: bold;\">Java是一门<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1\">面向对象</a>编程语言，</span>不仅吸收了<a target=\"_blank\" href=\"https://baike.baidu.com/item/C%2B%2B\">C++</a>语言的各种优点，还摒弃了C++里难以理解的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%9A%E7%BB%A7%E6%89%BF\">多继承</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8C%87%E9%92%88/2878304\">指针</a>等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程<sup>&nbsp;[1]</sup><a name=\"ref_[1]_12654100\">&nbsp;</a>&nbsp;。</h2><p><br></p><div label-module=\"para\">Java具有简单性、面向对象、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F/19276232\">分布式</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%81%A5%E5%A3%AE%E6%80%A7/4430133\">健壮性</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AE%89%E5%85%A8%E6%80%A7/7664678\">安全性</a>、平台独立与可移植性、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%9A%E7%BA%BF%E7%A8%8B/1190404\">多线程</a>、动态性等特点<sup>&nbsp;[2]</sup><a name=\"ref_[2]_12654100\">&nbsp;</a>&nbsp;。Java可以编写<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A1%8C%E9%9D%A2%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F/2331979\">桌面应用程序</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Web%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F\">Web应用程序</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F%E7%B3%BB%E7%BB%9F/4905336\">分布式系统</a>和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B5%8C%E5%85%A5%E5%BC%8F%E7%B3%BB%E7%BB%9F/186978\">嵌入式系统</a>应用程序等<sup>&nbsp;[3]</sup><a name=\"ref_[3]_12654100\">&nbsp;</a>&nbsp;。</div><ol><li>1&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#1\">发展历程</a></li><li>2&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2\">编程开发</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2_1\">编程环境</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2_2\">编程工具</a></li><li>3&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#3\">语言特点</a></li></ol><ol><li>4&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#4\">工作原理</a></li><li>5&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5\">语言基础</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_1\">基本数据结构</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_2\">关键字</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_3\">运算符</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_4\">程序举例</a></li></ol><p><br></p>','1','2020-04-05 22:24:55','2020-04-05 22:24:55','0','0','Java是一门面向对象编程语言，不仅吸收了C  语言的各种优点，还摒弃了C  里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程','1'), ('50','','站长工具导航2','<ul><li><p>站长工具导航</p></li><li>SEO信息查询<p><a href=\"http://t.mb5u.com/q/\">网站综合查询</a><a href=\"http://t.mb5u.com/GooglePR/\">Google PR查询</a><a href=\"http://t.mb5u.com/alexa/\">Alexa排名查询</a><a href=\"http://t.mb5u.com/baidu/\">百度权重查询</a><a href=\"http://t.mb5u.com/shoulu/\">网站收录查询</a><a href=\"http://t.mb5u.com/linkin/\">反向链接查询</a><a href=\"http://t.mb5u.com/link/\">友情链接查询</a><a href=\"http://t.mb5u.com/zhishu/\">百度指数查询</a></p></li><li>网站信息查询<p><a href=\"http://t.mb5u.com/meta/\">网页Meta信息检测</a><a href=\"http://t.mb5u.com/header/\">网站Header信息</a><a href=\"http://www.mb5u.com/tool/keywords/\">网页关键字密度查询</a><a href=\"http://t.mb5u.com/yuandaima/\">网页源代码查看</a><a href=\"http://t.mb5u.com/robot/\">蜘蛛抓取模拟</a></p></li><li>域名相关查询<p><a href=\"http://t.mb5u.com/ip/\">域名IP地址查询</a><a href=\"http://t.mb5u.com/ip2d/\">IP反查域名</a><a href=\"http://t.mb5u.com/hex/\">网址转换成HEX编码</a><a href=\"http://t.mb5u.com/dels/\">域名删除时间查询</a><a href=\"http://t.mb5u.com/whois/\">域名Whois查询</a></p></li><li>站长常用工具<p><a href=\"http://www.mb5u.com/tool/htmljs/\">HTML/JS转换工具</a><a href=\"http://t.mb5u.com/jsys/\">Js压缩/格式化工具</a><a href=\"http://t.mb5u.com/robots/\">robots.txt文件生成</a><a href=\"http://t.mb5u.com/jquery/\">jquery在线手册</a></p></li><li>设计常用工具<p><a href=\"http://www.mb5u.com/tool/css2/\">CSS2中文手册</a><a href=\"http://t.mb5u.com/css3/\">CSS3中文手册</a><a href=\"http://t.mb5u.com/html/\">HTML中文手册</a><a href=\"http://www.mb5u.com/tool/csslj/\">样式表滤镜手册</a><a href=\"http://www.mb5u.com/tool/peise/\">在线配色工具</a><a href=\"http://www.mb5u.com/tool/cssjianfei/\">CSS精简优化工具</a></p></li><li>其他常用工具<p><a href=\"http://t.mb5u.com/daxiaoxie/\">字母大小写转换</a><a href=\"http://t.mb5u.com/phone/\">手机号码归属地查询</a><a href=\"http://t.mb5u.com/sfz/\">身份证查询</a><a href=\"http://www.mb5u.com/tool/zishutongji/\">在线字数统计查询</a><a href=\"http://t.mb5u.com/huilv/\">货币汇率换算工具</a><a href=\"http://t.mb5u.com/kuaidi/\">快递查询工具</a></p></li><li><p></p></li></ul><p><br></p>','1','2020-04-05 22:35:32','2020-04-05 22:35:32','0','0','站长工具导航SEO信息查询网站综合查询Google PR查询Alexa排名查询百度权重查询网站收录查询反向链接查询友情链接查询百度指数查询网站信息查询网页Meta信息检测网站Header信息网页关键字密度查询网页源代码查看蜘蛛抓取模拟域名相关查询域名IP地址查询IP反查域名网址转换成HEX编码域名删除时间查询域名Whois查询站长常用工具HTML/JS转换工具Js压缩/格式化工具robots.txt文件生成jquery在线手册设计常用工具CSS2中文手册CSS3中文手册HTML中文手册样式表滤镜手册在线配色工具CSS精简优化工具其他常用工具字母大小写转换手机号码归属地查询身份证查询在线字数统计查询货币汇率换算工具快递查询工具','1'), ('51','','java 提升基础学习33','<pre>/** \n * 获取现在时间,这个好用 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getSqlDate() {  \n    Date sqlDate = new java.sql.Date(new Date().getTime());  \n    return sqlDate;  \n}  \n  \n/** \n * 获取现在时间 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getNowDate() {  \n    Date currentTime = new Date();  \n    SimpleDateFormat formatter = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");  \n    String dateString = formatter.format(currentTime);  \n    ParsePosition pos = new ParsePosition(8);  \n    Date currentTime_2 = formatter.parse(dateString, pos);  \n    return currentTime_2;  \n}  \n  </pre>','1','2020-04-05 23:06:29','2020-04-05 23:06:29','0','0','/** \n * 获取现在时间,这个好用 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getSqlDate() {  \n    Date sqlDate = new java.sql.Date(new Date().getTime());  \n    return sqlDate;  \n}  \n  \n/** \n * 获取现在时间 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getNowDate() {  \n    Date currentTime = new Date();  \n    SimpleDateFormat formatter = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");  \n    String dateString = formatter.format(currentTime);  \n    ParsePosition pos = new ParsePosition(8);  \n    Date currentTime_2 = formatter.parse(dateString, pos);  \n    return currentTime_2;  \n}','1'), ('52','','ajax 提交- serialize()、serializeArray()22','<pre><code>public List&lt;Userinfo&gt; selectUserinfo() {<br>    PageHelper.startPage(2, 3); //使用分页插件<br>    List&lt;Userinfo&gt; userinfos =studentMapper.selectUserinfo();<br>    PageInfo&lt;Userinfo&gt; infos=new PageInfo&lt;Userinfo&gt;(userinfos); <br>    List&lt;Userinfo&gt; list = infos.getList(); <br>    return userinfos; <br>}</code></pre><p>————————————————<br>版权声明：本文为CSDN博主「我爱吃红薯」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_45315910/java/article/details/100156072</p>','1','2020-04-06 21:51:17','2020-04-06 21:51:17','0','0','public List','1'), ('53','','Oracle 分页2312','<p>说明：&nbsp;select * from ( select row_.*, rownum rownum_ from ( select * from &nbsp;userinfo ) row_ &nbsp;where rownum &lt;= &nbsp;#{pageNum} * #{pageSize} )a where rownum_ &gt; &nbsp;( #{pageNum}- 1) * #{pageSize}<br>&nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp;解析：先查询select * from &nbsp;userinfo 总条数并起个别名 row_,<br>&nbsp; &nbsp; &nbsp; &nbsp; 然后查询select row_.*, rownum rownum_ from ( select * from &nbsp;userinfo ) row_ &nbsp;where rownum &lt;= &nbsp;#{pageNum} * #{pageSize} ，把所有数据和rownum固定字段列查询并起别名，<br>&nbsp; &nbsp; &nbsp; &nbsp; 最后从a中查询出想要的数据,主要是使用rownum固定字段列筛选实现分页 where rownum_ &gt; &nbsp;( #{pageNum}- 1) * #{pageSize}<br>————————————————<br>版权声明：本文为CSDN博主「我爱吃红薯」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_45315910/java/article/details/100156072</p>','1','2020-04-06 21:52:20','2020-04-06 21:52:20','0','0','说明：','1'), ('54','','maven 地址22','<h3><a data-click=\"{\n			\'F\':\'778317EA\',\n			\'F1\':\'9D73F1C4\',\n			\'F2\':\'4CA6DE6B\',\n			\'F3\':\'54E5243F\',\n			\'T\':\'1586180248\',\n						\'y\':\'5D3FFFFD\'\n												}\" href=\"https://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd&amp;wd=&amp;eqid=a787de52004bf411000000035e8b3097\" target=\"_blank\"><em>Maven</em>&nbsp;Repository: Search/Browse/Explore</a></h3><div>查看此网页的中文翻译，请点击&nbsp;<a href=\"http://www.baidu.com/link?url=p1O9mW6xWDDhdLRhLNAvgRkl2yLz3aTJ57pqLA3UNI63yyuRsjaRCFf9AZljN66PqpF6QiAYWCGSMjwsUza2bi4x7FCaQsEwmlYlGD_xSH4XEkrSxjfympDm6NpEUbK4KZ6rYNYDIkG0LtAtd7DMqpHyuPR55sNo7IJeayzji_2AG9EC1NFXG4iUhdFcVyZK\" target=\"_blank\">翻译此页</a></div><div><em>maven</em>&nbsp;model module osgi persistence platform plugin repository rest rlang scala sdk security server service spring starter streaming testing tools ui web web...</div><div><a target=\"_blank\" href=\"http://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd\">https://mvnrepository.com/&nbsp;</a><div id=\"tools_13291758886426082870_1\"><a><i></i></a></div>&nbsp;-&nbsp;<arsv_snapshot\':\'1\'}\" href=\"http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed19fa950d100b88224514d72161968b532294d85f93130a1c187bf7fe7a62460b8c9638305d&amp;p=8b2a971288db5bf849bd9b7d0707&amp;newp=8e72d615d9c04bf617f5c7710f4e92695d0fc20e38d6d401298ffe0cc4241a1a1a3aecbf2d201b07d9c67e6702a84f56e0f13c783d0034f1f689df08d2ecce7e76c73f&amp;user=baidu&amp;fm=sc&amp;query=maven&amp;qid=a787de52004bf411&amp;p1=1\" target=\"_blank\">百度快照</arsv_snapshot\':\'1\'}\"></div>','1','2020-04-06 21:53:00','2020-04-06 21:53:00','0','0','<a data-click=\"{\n			\'F\':\'778317EA\',\n			\'F1\':\'9D73F1C4\',\n			\'F2\':\'4CA6DE6B\',\n			\'F3\':\'54E5243F\',\n			\'T\':\'1586180248\',\n						\'y\':\'5D3FFFFD\'\n												}\" href=\"https://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd','1'), ('55','','java ss222','<p>asdf</p>','1','2020-04-07 22:38:48','2020-04-07 22:38:48','0','0','asdf','1'), ('56','','aaaaaaaaaaaaa','<p>sdfffffffffffffffffffffffffff</p>','1','2020-04-08 21:59:44','2020-04-08 21:59:44','0','0','sdfffffffffffffffffffffffffff','1'), ('57','','7878','<p>234234234</p>','1','2020-04-08 22:01:03','2020-04-08 22:01:03','0','0','234234234','1'), ('58','','java2222','<p>23333safdfsafsdaf</p>','1','2020-04-08 22:01:27','2020-04-08 22:01:27','0','0','23333safdfsafsdaf','1'), ('59','','java 信息基础12','<h2><span style=\"font-weight: bold;\">Java是一门<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1\">面向对象</a>编程语言，</span>不仅吸收了<a target=\"_blank\" href=\"https://baike.baidu.com/item/C%2B%2B\">C++</a>语言的各种优点，还摒弃了C++里难以理解的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%9A%E7%BB%A7%E6%89%BF\">多继承</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8C%87%E9%92%88/2878304\">指针</a>等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程<sup>&nbsp;[1]</sup><a name=\"ref_[1]_12654100\">&nbsp;</a>&nbsp;。</h2><p><br></p><div label-module=\"para\">Java具有简单性、面向对象、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F/19276232\">分布式</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%81%A5%E5%A3%AE%E6%80%A7/4430133\">健壮性</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AE%89%E5%85%A8%E6%80%A7/7664678\">安全性</a>、平台独立与可移植性、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%9A%E7%BA%BF%E7%A8%8B/1190404\">多线程</a>、动态性等特点<sup>&nbsp;[2]</sup><a name=\"ref_[2]_12654100\">&nbsp;</a>&nbsp;。Java可以编写<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A1%8C%E9%9D%A2%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F/2331979\">桌面应用程序</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Web%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F\">Web应用程序</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F%E7%B3%BB%E7%BB%9F/4905336\">分布式系统</a>和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B5%8C%E5%85%A5%E5%BC%8F%E7%B3%BB%E7%BB%9F/186978\">嵌入式系统</a>应用程序等<sup>&nbsp;[3]</sup><a name=\"ref_[3]_12654100\">&nbsp;</a>&nbsp;。</div><ol><li>1&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#1\">发展历程</a></li><li>2&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2\">编程开发</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2_1\">编程环境</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#2_2\">编程工具</a></li><li>3&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#3\">语言特点</a></li></ol><ol><li>4&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#4\">工作原理</a></li><li>5&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5\">语言基础</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_1\">基本数据结构</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_2\">关键字</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_3\">运算符</a></li><li>▪&nbsp;<a href=\"https://baike.baidu.com/item/Java/85979?fr=aladdin#5_4\">程序举例</a></li></ol><p><br></p>','1','2020-04-05 22:24:55','2020-04-05 22:24:55','0','0','Java是一门面向对象编程语言，不仅吸收了C  语言的各种优点，还摒弃了C  里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程','1'), ('60','','站长工具导航2','<ul><li><p>站长工具导航</p></li><li>SEO信息查询<p><a href=\"http://t.mb5u.com/q/\">网站综合查询</a><a href=\"http://t.mb5u.com/GooglePR/\">Google PR查询</a><a href=\"http://t.mb5u.com/alexa/\">Alexa排名查询</a><a href=\"http://t.mb5u.com/baidu/\">百度权重查询</a><a href=\"http://t.mb5u.com/shoulu/\">网站收录查询</a><a href=\"http://t.mb5u.com/linkin/\">反向链接查询</a><a href=\"http://t.mb5u.com/link/\">友情链接查询</a><a href=\"http://t.mb5u.com/zhishu/\">百度指数查询</a></p></li><li>网站信息查询<p><a href=\"http://t.mb5u.com/meta/\">网页Meta信息检测</a><a href=\"http://t.mb5u.com/header/\">网站Header信息</a><a href=\"http://www.mb5u.com/tool/keywords/\">网页关键字密度查询</a><a href=\"http://t.mb5u.com/yuandaima/\">网页源代码查看</a><a href=\"http://t.mb5u.com/robot/\">蜘蛛抓取模拟</a></p></li><li>域名相关查询<p><a href=\"http://t.mb5u.com/ip/\">域名IP地址查询</a><a href=\"http://t.mb5u.com/ip2d/\">IP反查域名</a><a href=\"http://t.mb5u.com/hex/\">网址转换成HEX编码</a><a href=\"http://t.mb5u.com/dels/\">域名删除时间查询</a><a href=\"http://t.mb5u.com/whois/\">域名Whois查询</a></p></li><li>站长常用工具<p><a href=\"http://www.mb5u.com/tool/htmljs/\">HTML/JS转换工具</a><a href=\"http://t.mb5u.com/jsys/\">Js压缩/格式化工具</a><a href=\"http://t.mb5u.com/robots/\">robots.txt文件生成</a><a href=\"http://t.mb5u.com/jquery/\">jquery在线手册</a></p></li><li>设计常用工具<p><a href=\"http://www.mb5u.com/tool/css2/\">CSS2中文手册</a><a href=\"http://t.mb5u.com/css3/\">CSS3中文手册</a><a href=\"http://t.mb5u.com/html/\">HTML中文手册</a><a href=\"http://www.mb5u.com/tool/csslj/\">样式表滤镜手册</a><a href=\"http://www.mb5u.com/tool/peise/\">在线配色工具</a><a href=\"http://www.mb5u.com/tool/cssjianfei/\">CSS精简优化工具</a></p></li><li>其他常用工具<p><a href=\"http://t.mb5u.com/daxiaoxie/\">字母大小写转换</a><a href=\"http://t.mb5u.com/phone/\">手机号码归属地查询</a><a href=\"http://t.mb5u.com/sfz/\">身份证查询</a><a href=\"http://www.mb5u.com/tool/zishutongji/\">在线字数统计查询</a><a href=\"http://t.mb5u.com/huilv/\">货币汇率换算工具</a><a href=\"http://t.mb5u.com/kuaidi/\">快递查询工具</a></p></li><li><p></p></li></ul><p><br></p>','1','2020-04-05 22:35:32','2020-04-05 22:35:32','0','0','站长工具导航SEO信息查询网站综合查询Google PR查询Alexa排名查询百度权重查询网站收录查询反向链接查询友情链接查询百度指数查询网站信息查询网页Meta信息检测网站Header信息网页关键字密度查询网页源代码查看蜘蛛抓取模拟域名相关查询域名IP地址查询IP反查域名网址转换成HEX编码域名删除时间查询域名Whois查询站长常用工具HTML/JS转换工具Js压缩/格式化工具robots.txt文件生成jquery在线手册设计常用工具CSS2中文手册CSS3中文手册HTML中文手册样式表滤镜手册在线配色工具CSS精简优化工具其他常用工具字母大小写转换手机号码归属地查询身份证查询在线字数统计查询货币汇率换算工具快递查询工具','1'), ('61','','java 提升基础学习33','<pre>/** \n * 获取现在时间,这个好用 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getSqlDate() {  \n    Date sqlDate = new java.sql.Date(new Date().getTime());  \n    return sqlDate;  \n}  \n  \n/** \n * 获取现在时间 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getNowDate() {  \n    Date currentTime = new Date();  \n    SimpleDateFormat formatter = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");  \n    String dateString = formatter.format(currentTime);  \n    ParsePosition pos = new ParsePosition(8);  \n    Date currentTime_2 = formatter.parse(dateString, pos);  \n    return currentTime_2;  \n}  \n  </pre>','1','2020-04-05 23:06:29','2020-04-05 23:06:29','0','0','/** \n * 获取现在时间,这个好用 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getSqlDate() {  \n    Date sqlDate = new java.sql.Date(new Date().getTime());  \n    return sqlDate;  \n}  \n  \n/** \n * 获取现在时间 \n *  \n * @return返回长时间格式 yyyy-MM-dd HH:mm:ss \n */  \npublic static Date getNowDate() {  \n    Date currentTime = new Date();  \n    SimpleDateFormat formatter = new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\");  \n    String dateString = formatter.format(currentTime);  \n    ParsePosition pos = new ParsePosition(8);  \n    Date currentTime_2 = formatter.parse(dateString, pos);  \n    return currentTime_2;  \n}','1'), ('62','','ajax 提交- serialize()、serializeArray()22','<pre><code>public List&lt;Userinfo&gt; selectUserinfo() {<br>    PageHelper.startPage(2, 3); //使用分页插件<br>    List&lt;Userinfo&gt; userinfos =studentMapper.selectUserinfo();<br>    PageInfo&lt;Userinfo&gt; infos=new PageInfo&lt;Userinfo&gt;(userinfos); <br>    List&lt;Userinfo&gt; list = infos.getList(); <br>    return userinfos; <br>}</code></pre><p>————————————————<br>版权声明：本文为CSDN博主「我爱吃红薯」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_45315910/java/article/details/100156072</p>','1','2020-04-06 21:51:17','2020-04-06 21:51:17','0','0','public List','1'), ('63','','Oracle 分页2312','<p>说明：&nbsp;select * from ( select row_.*, rownum rownum_ from ( select * from &nbsp;userinfo ) row_ &nbsp;where rownum &lt;= &nbsp;#{pageNum} * #{pageSize} )a where rownum_ &gt; &nbsp;( #{pageNum}- 1) * #{pageSize}<br>&nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp;解析：先查询select * from &nbsp;userinfo 总条数并起个别名 row_,<br>&nbsp; &nbsp; &nbsp; &nbsp; 然后查询select row_.*, rownum rownum_ from ( select * from &nbsp;userinfo ) row_ &nbsp;where rownum &lt;= &nbsp;#{pageNum} * #{pageSize} ，把所有数据和rownum固定字段列查询并起别名，<br>&nbsp; &nbsp; &nbsp; &nbsp; 最后从a中查询出想要的数据,主要是使用rownum固定字段列筛选实现分页 where rownum_ &gt; &nbsp;( #{pageNum}- 1) * #{pageSize}<br>————————————————<br>版权声明：本文为CSDN博主「我爱吃红薯」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_45315910/java/article/details/100156072</p>','1','2020-04-06 21:52:20','2020-04-06 21:52:20','0','0','说明：','1'), ('64','','maven 地址22','<h3><a data-click=\"{\n			\'F\':\'778317EA\',\n			\'F1\':\'9D73F1C4\',\n			\'F2\':\'4CA6DE6B\',\n			\'F3\':\'54E5243F\',\n			\'T\':\'1586180248\',\n						\'y\':\'5D3FFFFD\'\n												}\" href=\"https://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd&amp;wd=&amp;eqid=a787de52004bf411000000035e8b3097\" target=\"_blank\"><em>Maven</em>&nbsp;Repository: Search/Browse/Explore</a></h3><div>查看此网页的中文翻译，请点击&nbsp;<a href=\"http://www.baidu.com/link?url=p1O9mW6xWDDhdLRhLNAvgRkl2yLz3aTJ57pqLA3UNI63yyuRsjaRCFf9AZljN66PqpF6QiAYWCGSMjwsUza2bi4x7FCaQsEwmlYlGD_xSH4XEkrSxjfympDm6NpEUbK4KZ6rYNYDIkG0LtAtd7DMqpHyuPR55sNo7IJeayzji_2AG9EC1NFXG4iUhdFcVyZK\" target=\"_blank\">翻译此页</a></div><div><em>maven</em>&nbsp;model module osgi persistence platform plugin repository rest rlang scala sdk security server service spring starter streaming testing tools ui web web...</div><div><a target=\"_blank\" href=\"http://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd\">https://mvnrepository.com/&nbsp;</a><div id=\"tools_13291758886426082870_1\"><a><i></i></a></div>&nbsp;-&nbsp;<arsv_snapshot\':\'1\'}\" href=\"http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed19fa950d100b88224514d72161968b532294d85f93130a1c187bf7fe7a62460b8c9638305d&amp;p=8b2a971288db5bf849bd9b7d0707&amp;newp=8e72d615d9c04bf617f5c7710f4e92695d0fc20e38d6d401298ffe0cc4241a1a1a3aecbf2d201b07d9c67e6702a84f56e0f13c783d0034f1f689df08d2ecce7e76c73f&amp;user=baidu&amp;fm=sc&amp;query=maven&amp;qid=a787de52004bf411&amp;p1=1\" target=\"_blank\">百度快照</arsv_snapshot\':\'1\'}\"></div>','1','2020-04-06 21:53:00','2020-04-06 21:53:00','0','0','<a data-click=\"{\n			\'F\':\'778317EA\',\n			\'F1\':\'9D73F1C4\',\n			\'F2\':\'4CA6DE6B\',\n			\'F3\':\'54E5243F\',\n			\'T\':\'1586180248\',\n						\'y\':\'5D3FFFFD\'\n												}\" href=\"https://www.baidu.com/link?url=2DbLHMzh0BeQjuXgUY0gHpGTAwwLCxGo4KV2CfrQvCgDk7tAH8ExVxfefnc04tAd','1'), ('65','','java ss222','<p>asdf</p>','1','2020-04-07 22:38:48','2020-04-07 22:38:48','0','0','asdf','1');
INSERT INTO `blog_category` VALUES ('1','10','java','1','35','0'), ('1','11','阅读','1','36','1'), ('1','12','javaee','1','37','1'), ('1','13','分页插件','1','38','0'), ('1','14','写作','1','39','1'), ('1','15','阅读','1','41','1'), ('1','16','写作','1','42','1'), ('1','17','阅读','1','42','1'), ('0','18','发呆','1','42','0'), ('0','19','a','1','43','0'), ('0','20','sdf','1','44','0'), ('0','21','ss','1','45','0'), ('0','22','fffffffss','1','46','0'), ('0','23','223','1','47','0'), ('0','24','333','1','48','0'), ('1','25','分页插件','1','38','0'), ('1','26','吖','1','38','0'), ('1','27','分页插件','1','38','0'), ('1','28','分页插件','1','38','1'), ('1','29','javaee','1','38','1'), ('1','30','吖','1','38','1'), ('1','31','java','1','35','0'), ('1','32','javaee','1','35','0'), ('1','33','分页插件','1','35','0'), ('1','34','java','1','35','0'), ('1','35','分页插件','1','35','0'), ('1','36','java','1','35','1'), ('1','37','分页插件','1','35','1'), ('1','38','javaee','1','35','1');
INSERT INTO `blog_friendly_links` VALUES ('8','http://www.baidu.com','admin','1'), ('9','http://www.baidu.com','admin','1'), ('14','http://www.baidu.com','理一下的博客','1');
INSERT INTO `blog_tag` VALUES ('7','其他','1','36'), ('8','java 基础','1','37'), ('9','a','1','43'), ('10','sdf','1','44'), ('11','cc','1','45'), ('12','ss','1','46'), ('13','1','1','47'), ('14','asdf','1','48'), ('19','分页插件','1','38'), ('23','java','1','35');
