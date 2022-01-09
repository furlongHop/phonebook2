<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>[Phonebook2]</h1>
		
		<h2>전화번호 등록폼</h2>
		
		<p>전화번호를 등록하려면 아래 항목을 기입하고 "등록" 버튼을 클릭하세요.</p>
		
		<form action="/phonebook2/pbc" method="get">
			이름(name): <input type="text" name="name" value=""> <br>
			핸드폰(hp): <input type="text" name="hp" value=""> <br>
			회사(company): <input type="text" name="company" value=""> <br>
			<!-- 데이터 이름 name을 action으로 하고 value(초기값)을 write로 준 채 pbc에 전달했으므로 pbc에서 action=write로 처리, write 과정 진행 -->
			<input type="hidden" name="action" value="write">
			<button type="submit">전송</button>
		</form>
</body>
</html>