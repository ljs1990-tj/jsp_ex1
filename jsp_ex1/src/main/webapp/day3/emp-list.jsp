<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	 text-align: center;
	}
</style>
</head>
<body>
	<%@include file="../db.jsp" %>
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>급여</th>
			<th>급여등급</th>
			<th>팀장(사수)</th>
			<th>부서명</th>
		</tr>
		
	<%
		ResultSet rs = null;	
		String query = 
			"SELECT "
			+ "E.EMPNO, E.ENAME, E.SAL, GRADE, " 
			+ "NVL(E2.ENAME, ' ') AS TNAME, DNAME, E.DEPTNO "
			+ "FROM EMP E "
			+ "LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO "
			+ "INNER JOIN SALGRADE S ON E.SAL BETWEEN LOSAL AND HISAL "
			+ "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
			+ "ORDER BY GRADE DESC";
		rs = stmt.executeQuery(query);
		while(rs.next()){
	%>
			<tr>
				<td><%= rs.getString("EMPNO") %></td>
				<td><%= rs.getString("ENAME") %></td>
				<td><%= rs.getString("SAL") %></td>
				<td><%= rs.getString("GRADE") %></td>
				<td><%= rs.getString("TNAME") %></td>
				<td><a href="emp-d-chart2.jsp?deptNo=<%= rs.getString("DEPTNO") %>"><%= rs.getString("DNAME") %></a></td>
			</tr>
	<%		
		}
	%>
	</table>
	
</body>
</html>













