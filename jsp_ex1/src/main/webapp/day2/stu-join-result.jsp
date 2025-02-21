<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp" %>
	<%
		try{
			String stuNo = request.getParameter("stuNo");
			String stuName = request.getParameter("stuName");
			String stuDept = request.getParameter("stuDept");
			String gender = request.getParameter("gender");
			
		 	ResultSet rs = stmt.executeQuery(
				"SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'"
			);
		 	if(rs.next()){
		 		out.println("이미 사용중인 학번입니다.");
		 		return;
		 	} 
		 	
			String query = 
					"INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GENDER)"
					+ " VALUES("
					+ "'" + stuNo + "',"
					+ "'" + stuName + "',"
					+ "'" + stuDept + "',"
					+ "'" + gender + "')";
			int result = stmt.executeUpdate(query);
			if(result != 0){
				out.println("등록되었습니다.");
			} else {
				out.println("등록 안됨");
			}
			
		}catch(SQLException e){
			out.println("DB 오류");
		}
	%>
	
	
	
</body>
</html>