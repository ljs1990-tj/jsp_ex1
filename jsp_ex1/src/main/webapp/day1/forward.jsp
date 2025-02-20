<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>test</div>
		
	<jsp:forward page="forward-view.jsp">
		<jsp:param name="userId" value="hong123"></jsp:param>
		<jsp:param name="userAge" value="30"></jsp:param>
	</jsp:forward>
</body>
</html>