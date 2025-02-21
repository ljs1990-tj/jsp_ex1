<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		try{
			String query = 
				"UPDATE STUDENT SET "
				+ "STU_NAME = '" + stuName +"',"
				+ "STU_DEPT = '" + stuDept +"' "
				+ "WHERE STU_NO = '" + stuNo + "'";
			
			int result = 
					stmt.executeUpdate(query);	
			out.println("저장되었습니다.");
			out.println("<button onclick='fnBack()'>되돌아가기</button>");
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>
<script>
	function fnBack(){
		location.href = "stu-list2.jsp";
	}
</script>







