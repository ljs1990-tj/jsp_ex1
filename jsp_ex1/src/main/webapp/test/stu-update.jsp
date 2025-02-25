<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp"%>	
	<%
		String stuId = request.getParameter("stuId");
		stmt.executeUpdate("UPDATE TBL_STULIST SET STU_DEPT = '소프트웨어' WHERE STU_ID = '" +stuId+ "'");
		response.sendRedirect("stu-view.jsp?stuId="+stuId);
	%>
</body>
</html>