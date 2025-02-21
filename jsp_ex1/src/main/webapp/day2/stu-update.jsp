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
	<form action="stu-update-result.jsp">
	<%
		// 1. db 연결(inculde)
		// 2. try~catch()
		// 3. statement(stmt)
		//    객체에서 executeQuery() 함수를 통해 쿼리 호출
		// 4. 이름, 학과 input에 db에서 조회한 결과(이름,학과)를 넣기
		String stuNo = request.getParameter("stuNo");
		String query = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();		
	%>
		<input name="stuNo" value="<%= stuNo %>" hidden>
		<div>
			이름 :
			<input name="stuName" 
				   value="<%= rs.getString("STU_NAME") %>">
		</div>
		<div>
			학과 : 
			<input name="stuDept" 
				   value="<%= rs.getString("STU_DEPT") %>">
		</div>
		<input type="submit" value="저장">
	</form>


</body>
</html>