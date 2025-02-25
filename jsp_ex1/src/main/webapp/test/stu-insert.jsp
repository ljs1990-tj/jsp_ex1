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
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuSubject = request.getParameter("stuSubject");
		String stuGrade = request.getParameter("stuGrade");
		
		String query = 
			"INSERT INTO TBL_STULIST "
			+ "VALUES("
			+ "'" + stuId + "',"
			+ "'" + stuName + "',"
			+ "'" + stuDept + "'"
			+ ")";
		stmt.executeUpdate(query);
		query = 
			"INSERT INTO TBL_GRADE "
			+ "VALUES("
			+ "'" + stuId + "',"
			+ "'" + stuSubject + "',"
			+ "'" + stuGrade + "'"
			+ ")";
		stmt.executeUpdate(query);
		
		out.println("저장되었습니다.");
		
	%>
</body>
</html>