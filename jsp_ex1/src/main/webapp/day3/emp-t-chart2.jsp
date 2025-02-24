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
	<%@include file="../db.jsp"%>
	<%
	String query = "SELECT ENAME, CNT " + "FROM EMP E " + "INNER JOIN ( " + "    SELECT MGR, COUNT(MGR) AS CNT "
			+ "    FROM EMP " + "    WHERE MGR IS NOT NULL " + "    GROUP BY MGR " + ") T ON E.EMPNO = T.MGR "
			+ "ORDER BY CNT DESC";
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
	%>
	<input hidden class="ename" value="<%=rs.getString("ENAME")%>">
	<input hidden class="cnt" value="<%=rs.getString("CNT")%>">
	<%
	}
	%>

	<div id="chart"></div>
	<br>
	<div id="chart2"></div>
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
	
    var options2 = {
      series: [{
      name: 'Inflation',
      data: cntList
    }],
      chart: {
      height: 350,
      type: 'bar',
    },
    plotOptions: {
      bar: {
        borderRadius: 10,
        dataLabels: {
          position: 'top', // top, center, bottom
        },
      }
    },
    dataLabels: {
      enabled: true,
      formatter: function (val) {
        return val + "명";
      },
      offsetY: -20,
      style: {
        fontSize: '12px',
        colors: ["#304758"]
      }
    },
    
    xaxis: {
      categories: enameList,
      position: 'top',
      axisBorder: {
        show: false
      },
      axisTicks: {
        show: false
      },
      crosshairs: {
        fill: {
          type: 'gradient',
          gradient: {
            colorFrom: '#D8E3F0',
            colorTo: '#BED1E6',
            stops: [0, 100],
            opacityFrom: 0.4,
            opacityTo: 0.5,
          }
        }
      },
      tooltip: {
        enabled: true,
      }
    },
    yaxis: {
      axisBorder: {
        show: false
      },
      axisTicks: {
        show: false,
      },
      labels: {
        show: false,
        formatter: function (val) {
          return val + "%";
        }
      }
    
    },
    title: {
      text: '부하직원 수',
      floating: true,
      offsetY: 330,
      align: 'center',
      style: {
        color: '#444'
      }
    }
    };

    var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
    chart2.render();
  
  
	
	
</script>