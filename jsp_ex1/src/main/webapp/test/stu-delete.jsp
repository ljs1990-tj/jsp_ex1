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
	
		stmt.executeUpdate("DELETE FROM TBL_STULIST WHERE STU_ID = '" + stuId + "'");
		stmt.executeUpdate("DELETE FROM TBL_GRADE WHERE STU_ID = '" + stuId + "'");
		out.println("삭제되었습니다.");	
	%>
	<button onclick="fnBack()">되돌아가기</button>
</body>
</html>
<script>

	function fnBack(){
		location.href = "stu-list.jsp";
	}
</script>