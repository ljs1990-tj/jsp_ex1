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
		try{
			String query = 
				"SELECT E.EMPNO, E.ENAME, E.SAL, GRADE, E2.ENAME AS TNAME, DNAME, D.DEPTNO "
				+ "FROM EMP E "
				+ "INNER JOIN EMP E2 ON E.MGR = E2.EMPNO "
				+ "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
				+ "INNER JOIN SALGRADE S ON E.SAL BETWEEN LOSAL AND HISAL "
				+ "ORDER BY GRADE DESC";
			
			rs = stmt.executeQuery(query);
			// 학번, 이름, 학과, 성별(남자, 여자)
			while(rs.next()){
				String empNo = rs.getString("EMPNO");
	%>
			<tr>
				<td><%= rs.getString("EMPNO") %></td>
				<td><%= rs.getString("ENAME") %></td>
				<td><%= rs.getString("SAL") %></td>
				<td><%= rs.getString("GRADE") %></td>
				<td><%= rs.getString("TNAME") %></td>
				<td><a href="emp-d-chart.jsp?deptNo=<%= rs.getString("DEPTNO") %>"><%= rs.getString("DNAME") %></a></td>
			</tr>
	<%			
			}
		} catch(SQLException e){
			out.println("오류 발생!");
		}
	
	%>
	</table>
	
</body>
</html>













