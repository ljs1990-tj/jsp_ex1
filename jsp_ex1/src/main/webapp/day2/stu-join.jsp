<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 학번, 이름, 학과, 성별 -->
	<!-- stu-join-result.jsp 로 전달-->
	<form name="stu" action="stu-join-result.jsp">
		<div>
			학번 : <input name="stuNo"> 
			<input type="button" value="중복체크" onclick="fnCheck()">
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			성별 : 
			<input type="radio" name="gender" value="M" checked> 남자
			<input type="radio" name="gender" value="F"> 여자
		</div>
		<div>
			<input type="button" value="저장" onclick="fnStuInsert()">
			<!-- <button onclick="fnStuInsert(); return false;">test</button> -->
		</div>
	</form>
</body>
</html>
<script>
	let checkFlg = false;
	function fnStuInsert(){
		let stu = document.stu;
		
		if(!checkFlg){
			alert("중복체크 하셈");
			return;
		}
		
		if(stu.stuNo.value.length != 8){
			alert("학번은 8글자 해야 됨");
			return;
		}
		if(stu.stuName.value == "" || stu.stuDept.value == ""){
			alert("모든 값을 채워주세요.");
			return;
		}
		stu.stuNo.disabled = false;
		stu.submit();
	}

	function fnCheck(){
		let stu = document.stu;
		if(stu.stuNo.value.length != 8){
			alert("학번은 8글자 해야 됨");
			return;
		}
		window.open(
			"id-check.jsp?stuNo=" + stu.stuNo.value, 
			"check", 
			"width=300, height=300"
		);
	}
	
	function getReturn(flg){
		if(flg == "N"){
			let obj = document.stu.stuNo;
			checkFlg = true;
			obj.disabled = true;
		}
	}
	
	
	
</script>