<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<title>Insert title here</title>
</head>
<body>
<body>
	<%@include file="../db.jsp"%>
	<%
	String deptNo = request.getParameter("deptNo");
	String query = "SELECT * " + "FROM EMP E " + "INNER JOIN ( " + "SELECT MGR, COUNT(MGR) AS CNT " + "FROM EMP "
			+ "WHERE MGR IS NOT NULL " + "GROUP BY MGR " + ") T ON E.EMPNO = T.MGR";
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
	%>
	<input hidden class="ename" value="<%=rs.getString("ENAME")%>">
	<input hidden class="cnt" value="<%=rs.getString("CNT")%>">
	<%
	}
	%>
	<div id="chart"></div>
</body>
</body>
</html>
<script>
	let ename = document.querySelectorAll(".ename");
	let cnt = document.querySelectorAll(".cnt");

	let enameList = [];
	let cntList = [];
	for (let i = 0; i < ename.length; i++) {
		enameList.push(ename[i].value);
		cntList.push(parseInt(cnt[i].value));
	}
	console.log(cntList);
	var options = {
		series : cntList,
		chart : {
			width : 380,
			type : 'pie',
		},
		labels : enameList,
		responsive : [ {
			breakpoint : 480,
			options : {
				chart : {
					width : 200
				},
				legend : {
					position : 'bottom'
				}
			}
		} ]
	};

	var chart = new ApexCharts(document.querySelector("#chart"), options);
	chart.render();
</script>