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
	}
	a:visited, a:link{
		color : black;
		text-decoration: none;
		font-weight : bold;
	}
	.pagination {
		margin: 20px 0;
	}
	.pagination a {
		padding: 5px 10px;
		margin: 0 2px;
		border: 1px solid black;
		text-decoration: none;
	}
	.pagination a.active {
		background-color: #ccc;
	}
</style>
</head>
<body>
	<div><button onclick="location.href='login.jsp'">로그아웃</button></div>
	<%@include file="../db.jsp"%>	

	<%
	// 페이징 설정
	int pageSize = 5; // 화면에 보여주고 싶은 게시글 개수
	int currentPage = 1; // 현재 페이지 번호

	// 페이지 누른 번호로 현재페이지 변경
	if (request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}

	// 현재 페이지에 따라 어디까지 보여줄지 오프셋 지정
	int offset = (currentPage - 1) * pageSize;

	ResultSet rs = null;
	try {
		// 전체 게시물 수를 구하는 쿼리 
		// 하단에 몇번까지 출력할지 정하기 위해)
		// ex) 10개씩 출력할건데 전체 게시글이 35개일 경우
		//     1~4번까지 하단에 출력
		String countQuery = "SELECT COUNT(*) AS total FROM BOARD";
		ResultSet coun_rs = stmt.executeQuery(countQuery);
		int total = 0;
		if (coun_rs.next()) {
			total = coun_rs.getInt("total");
		}
		coun_rs.close();

		// 페이지 수 계산
		// 35개일 경우 3.5를 올림해야 4페이지까지 되기 때문에 아래처럼...
		int totalPages = (int) Math.ceil((double) total / pageSize);
		
		// 페이징 쿼리
		String querytext = 
				  "SELECT "
			      + "B.BOARDNO, TITLE, USERNAME, B.USERID, "
			      +    "CNT, TO_CHAR(B.CDATETIME, 'YYYY-MM-DD') AS CDATETIME, " 
			      +    "NVL(COMMENTCNT, 0) AS COMMENTCNT  " 
			      +    "FROM BOARD B  "
			      +    "INNER JOIN MEMBER M ON B.USERID = M.USERID " 
			      +    "LEFT JOIN ("
			      +    "SELECT BOARDNO, COUNT(*) AS COMMENTCNT "
			      +    "FROM BOARD_COMMENT "
			      +    "GROUP BY BOARDNO "
			      +    ") C ON B.BOARDNO = C.BOARDNO "
				+ "OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
		System.out.println(querytext);
		rs = stmt.executeQuery(querytext);
	%>
		<table>
		<tr>
			<th> 번호 </th>
			<th> 제목 </th>
			<th> 작성자 </th>
			<th> 조회수 </th>
			<th> 작성일 </th>
		</tr>			
	<%
	while (rs.next()) {
		String commentCnt = "";
		if(rs.getString("COMMENTCNT") != null){
			commentCnt = "(" + rs.getString("COMMENTCNT") + ")";
		} 
	%>
		<tr>
			<td> <%= rs.getString("BOARDNO") %></td>
			<td> 
				<a href="#" onclick="fnView('<%= rs.getString("BOARDNO") %>')">
					<%= rs.getString("TITLE") %> <%= commentCnt %>
				</a>
			</td>
			<td> <a href="javascript:;" onclick="fnInfo('<%= rs.getString("USERID") %>')"> <%= rs.getString("USERNAME") %></a></td>
			<td> <%= rs.getString("CNT") %></td>
			<td> <%= rs.getString("CDATETIME") %></td>
		</tr>
	<%
	}
	%>
	
	</table>
	<button onclick="location.href='insert.jsp'">글쓰기</button>

	<!-- 페이지 네비게이션 -->
	<div class="pagination">
		<%
		if (currentPage > 1) {
			int prevPage = currentPage - 1;
			out.print("<a href=?page=" + prevPage + ">이전</a>");
		}
		for (int i = 1; i <= totalPages; i++) {
			if (i == currentPage) {
				out.print("<a href=?page=" + i + " class=active>" + i + "</a>");
			} else {
				out.print("<a href=?page=" + i + ">" + i + "</a>");
			}
		}
		if (currentPage < totalPages) {
			int nextPage = currentPage + 1;
			System.out.println("<a href=?page=" + nextPage + ">다음</a>");
			out.print("<a href=?page=" + nextPage + ">다음</a>");
		}
		%>
	</div>

	<%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>
</body>
</html>
<script>
	function fnView(boardNo){
		location.href="board-view.jsp?boardNo="+boardNo;
	}
	
	function fnInfo(userId){
		location.href="user-info.jsp?userId="+userId;
	}
</script>