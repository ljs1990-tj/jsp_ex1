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
	<form name="stu" action="stu-insert.jsp">
		아이디 : <input name="stuId"><br>
		이름 : <input name="stuName"><br>
		학과 : <input name="stuDept"><br>
		과목 : <input name="stuSubject"><br>
		점수 : <input name="stuGrade"><br>
		<input type="button" value="추가" onclick="fnInsert()">
	</form>	

</body>
</html>
<script>
	function fnInsert(){
		let stu = document.stu;
		if(stu.stuId.value.length != 4 ){
			alert("아이디는 4글자만 가능");
			return;
		}
		if(stu.stuGrade.value < 0 ||  stu.stuGrade.value > 100){
			alert("점수는 0~100 사이 값 입력");
			return;
		}
		if(stu.stuId.value == "" || stu.stuName.value == "" || stu.stuDept.value == "" || stu.stuSubject.value == "" || stu.stuGrade.value == ""){
			alert("빈값 x");
			return;
		}
		stu.submit();
	}

</script>