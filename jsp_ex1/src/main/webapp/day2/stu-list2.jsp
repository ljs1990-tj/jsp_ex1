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
			<th>선택</th>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>성별</th>
		</tr>
		
	<%
		ResultSet rs = null;	
		try{
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			// 학번, 이름, 학과, 성별(남자, 여자)
			while(rs.next()){
				String stuNo = rs.getString("STU_NO");
	%>
			<tr>
				<td><input type="radio" name="student" value="<%= stuNo %>"></td>
				<td><%= stuNo %></td>
				<td>
					<a href="stu-view.jsp?stuNo=<%= stuNo %>"><%= rs.getString("STU_NAME") %></a>
				</td>
				<td><%= rs.getString("STU_DEPT") %></td>
				<td><%= rs.getString("STU_GENDER").equals("M") ? "남자" : "여자"  %></td>
			</tr>
	<%			
			}
		} catch(SQLException e){
			out.println("오류 발생!");
		}
	
	%>
	</table>
	<div>
		<button onclick="fnStuRemove()">삭제</button>
	</div>
	
</body>
</html>
<script>
	function fnStuRemove(){
		if(!confirm("정말삭제?")){
			return;
		}
		let select = document.querySelector("input[name='student']:checked");
		// stu-delete.jsp 페이지로 이동
		// 학번을 같이 넘기기
		location.href="stu-delete.jsp?stuNo="+select.value;
	}
</script>













