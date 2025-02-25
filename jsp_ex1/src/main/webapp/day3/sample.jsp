<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<%@include file="../db.jsp"%>
	<%
		ResultSet rs = null;
	%>
	<form method="get" action="sample.jsp">
        <label for="si">시:</label>
        <select id="si" name="si" onchange="this.form.submit()">
            <option value="">시를 선택하세요</option>
            <% 
            
                String selectedSi = request.getParameter("si");
                String sql = "SELECT DISTINCT SI FROM AREA";
                rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    String si = rs.getString("SI");
                    String selected = si.equals(selectedSi) ? "selected" : "";
            %>
            <option value="<%= si %>" <%= selected %>><%= si %></option>
            <% } %>
        </select>

        <label for="gu">구:</label>
        <select id="gu" name="gu" onchange="this.form.submit()">
            <option value="">:: 선택 ::</option>
            <% 
                String selectedGu = request.getParameter("gu");
                if (selectedSi != null && !selectedSi.isEmpty()) {
                    // Statement 사용하여 SI에 맞는 GU 목록을 가져옴
                    String guSql = "SELECT DISTINCT GU FROM AREA WHERE SI = '" + selectedSi + "' AND GU IS NOT NULL";
                    rs = stmt.executeQuery(guSql);
                    while (rs.next()) {
                        String gu = rs.getString("GU");
                        String selected = gu.equals(selectedGu) ? "selected" : "";
                        
            %>
            <option value="<%= gu %>" <%= selected %>><%= gu %></option>
            <% 
                    }
                }
            %>
        </select>

        <label for="dong">동:</label>
        <select id="dong" name="dong">
            <option value="">::선택 ::</option>
            <% 
                String selectedDong = request.getParameter("dong");
                if (selectedGu != null && !selectedGu.isEmpty()) {
                    // Statement 사용하여 GU에 맞는 DONG 목록을 가져옴
                    String dongSql = "SELECT DISTINCT DONG FROM AREA WHERE GU = '" + selectedGu + "'";
                    rs = stmt.executeQuery(dongSql);
                    while (rs.next()) {
                        String dong = rs.getString("DONG");
                        String selected = dong.equals(selectedDong) ? "selected" : "";
            %>
            <option value="<%= dong %>" <%= selected %>><%= dong %></option>
            <% 
                    }
                }
            %>
        </select>
    </form>
</body>
</html>
<script>
</script>