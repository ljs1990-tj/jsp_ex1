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
	<%@include file="../db.jsp" %>
	<form>
	<%
		// 학번, 이름, 학과, 학년, 시험 점수
		String deptNo = request.getParameter("deptNo");
		ResultSet rs = stmt.executeQuery(
			"SELECT * "
			+ "FROM EMP "
			+ "WHERE DEPTNO = "
			+ "'" + deptNo+ "'"
		);
		
		while(rs.next()){
	%>
		<input hidden class="ename" value="<%= rs.getString("ENAME") %>">
		<input hidden class="sal" value="<%= rs.getString("SAL") %>">
	<%		
		}
	%>
	<div id="chart"></div>
	</form>
</body>
</html>
<script>
	let ename = document.querySelectorAll(".ename");
	let sal = document.querySelectorAll(".sal");
	
	let enameList = [];
	for(let i=0; i<ename.length; i++){
		enameList.push(ename[i].value);
	}
	let salList = [];
	for(let i=0; i<sal.length; i++){
		salList.push(sal[i].value);
	}
	options = {
           series: [{
               data: salList
           }],
           chart: {
               type: 'bar',
               height: 350
           },
           plotOptions: {
               bar: {
                   borderRadius: 4,
                   borderRadiusApplication: 'end',
                   horizontal: true,
               }
           },
           dataLabels: {
               enabled: false
           },
           title: {
               text: '급여 차트',
               align: 'center'
           },
           xaxis: {
               categories: enameList,
           }
       }
	
	var chart = new ApexCharts(document.querySelector("#chart"), this.options);
    chart.render();
	
</script>