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
	시 : <select onchange="fnSelectSi(this.value)">
		<option>:: 선택 ::</option>
	<%
		String paramSi = request.getParameter("paramSi");
		String query = "SELECT DISTINCT SI FROM AREA";
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			String si = rs.getString("SI");
			String selected = si.equals(paramSi) ? "selected" : "";
	%>
		<option value="<%= si %>" <%= selected %>><%= si %></option>		
	<%
		}
	%>
	</select>
	
	
	구 : <select onchange="fnSelectGu(this.value, '<%= paramSi %>')">
		<option>:: 선택 ::</option>
	<%
		String paramGu = request.getParameter("paramGu");
		query = "SELECT DISTINCT GU FROM AREA WHERE SI='" + paramSi + "' AND GU IS NOT NULL";
		rs = stmt.executeQuery(query);
		while(rs.next()){
			String gu = rs.getString("GU");
	%>
		<option value="<%= gu %>" ><%= gu %></option>		
	<%
		}
	%>
	</select>
	
	
	구 : <select>
		<option>:: 선택 ::</option>
	<%
		
		query = "SELECT DONG FROM AREA WHERE SI='" + paramSi + "' AND DONG IS NOT NULL";
		rs = stmt.executeQuery(query);
		while(rs.next()){
			String dong = rs.getString("DONG");
	%>
		<option value="<%= dong %>" ><%= dong %></option>		
	<%
		}
	%>
	</select>
	
</body>
</html>
<script>
	function fnSelectSi(value){
		location.href="?paramSi=" + value;
	}
	
	function fnSelectGu(value, paramSi){
		location.href="?paramGu=" + value + "&paramSi=" + paramSi;
	}

</script>