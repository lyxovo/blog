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


//查询一个book详细
function querydesc(bid){
	window.location.href="../book/getBook.do?bid="+bid
}

function addbook(){
	window.location.href="../book/turnToAddPage.do";
}


function deleteBook(bid){
	window.location.href="../book/deleteBook.do?bid="+bid
}
</script>

<body>
<h3>SimpleBookStore</h3>
	<form method="post" action="../book/list.do">
		<div>
		<button type="button" onclick="addbook()">添加书籍</button>
		<br>
			<table border="1">
				<tr>
					<th></th>
					<th>书名</th>
					<th>价格</th>
					<th>作者</th>
					<th>图片</th>
					<th>操作</th>
				</tr>
				
			<c:forEach items="${bookList}" var="book" step="1" varStatus="status">
				<tr>
			  		<td><input type="checkbox" name="bid" value="${book.bid}"/></td>
				   <td>${book.bname}</td>
				   <td>${book.bprice}</td>
				   <td>${book.bauther}</td>
				   <td>${book.bpicture}</td>
				    <td>
				    <button type="button" onclick="querydesc(${book.bid})">查询详细</button>
				     <button type="button" onclick="deleteBook(${book.bid})">删除</button>
				    </td>
				</tr>
			</c:forEach>
				
			</table>
		</div>
		
		
	</form>
</body>
</html>