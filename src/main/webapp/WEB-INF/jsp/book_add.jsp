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

function saveBook(){
	var formValue=$('form').serialize();
 	$.ajax({
		url:'../book/save.do',
		data:formValue,
		dataType:"json",
		success:function(result){
			if(result.flag==1){
				alert("添加成功。");
				window.location.href="../book/list.do";
				
			}else{
				alert("失败。");
			}
			
			
		},
		error:function(){
			alert("出错了");
		}
	
	}); 
	

	
}




</script>

<body>
<h3>SimpleBookStore</h3>
	<form>
		<div>
			书名：<input type="text" name="bname" value="${book.bname}"/>
			价格：<input type="text" name="bprice" value="${book.bprice}"/>
		</div>
		
		<div>
			作者：<input type="text" name="bauther" value="${book.bauther}"/>
			图片：<input type="text" name="bpicture" value="${book.bpicture}"/>
		</div>
		
		<div>
			<button type="button" onclick="saveBook()">提交</button>  
			<a href="../book/list.do">返回首页</a>
		</div>
	</form>
</body>
</html>