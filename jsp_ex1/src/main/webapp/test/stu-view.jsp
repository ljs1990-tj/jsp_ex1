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
		String query = 
			"SELECT * FROM TBL_STULIST S "
			+ "INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID "
			+ "WHERE S.STU_ID = '" + stuId + "'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		out.println("이름 : ");
		out.println(rs.getString("STU_NAME"));
		out.println("<br>");
		out.println("학과 : ");
		out.println(rs.getString("STU_DEPT"));
		out.println("<br>");
		out.println("과목 : ");
		out.println(rs.getString("SUBJECT"));
		out.println(", ");
		out.println("점수 : ");
		out.println(rs.getString("GRADE"));
		while(rs.next()){
			out.println("<br>");
			out.println("과목 : ");
			out.println(rs.getString("SUBJECT"));
			out.println(", ");
			out.println("점수 : ");
			out.println(rs.getString("GRADE"));
		}
	%>
	<div>
		<button onclick="fnRemove()">삭제</button>
		<button onclick="fnUpdate()">수정</button>
	</div>
</body>
</html>
<script>
	function fnRemove(){
		let stuId = <%= stuId %>;
		location.href="stu-delete.jsp?stuId=" + stuId;	
	}
	function fnUpdate(){
		location.href="stu-update.jsp?stuId="+ <%= stuId %>;
	}
</script>
