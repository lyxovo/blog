<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery.min.js" type="text/javascript"></script>

</head>
<script type="text/javascript">

</script>

<body>
<h3>SimpleBookStore</h3>
	<form >
		<div>
			编号：<input type="text" name="bid" value="${book.bid}"/>
			书名：<input type="text" name="bname" value="${book.bname}"/>
		</div>
		
		<div>
			价格：<input type="text" name="bprice" value="${book.bprice}"/>
			作者：<input type="text" name="bauther" value="${book.bauther}"/>
		</div>
		
		<div>
			图片：<input type="text" name="bpicture" value="${book.bpicture}"/>
		</div>
		
		<div>
			<a href="../book/list.do">返回首页</a>
		</div>
	</form>
</body>
</html>