<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.javaex.vo.PersonVo"%>

<%
	//형변환 잊지 말기
	PersonVo pVo = (PersonVo)request.getAttribute("pVo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.hidden {
	display: none;
}
</style>
</head>
<body>
	<h1>[Phonebook1]</h1>

	<h2>전화번호 수정폼</h2>

	<p>전화번호 수정폼입니다. 수정을 원하는 항목을 새로 기입해주세요.</p>

	<!-- value: input 요소의 초기값 -->
	<form action="/phonebook2/pbc" method="get">
		이름(name): <input type="text" name="name"
			value="<%=pVo.getName()%>"> <br>
		핸드폰(hp): <input type="text" name="hp"
			value="<%=pVo.getHp()%>"> <br>
		회사(company): <input type="text" name="company"
			value="<%=pVo.getCompany()%>"> <br>
		<div class="hidden">코드(id):</div>
		<input type="hidden" name="id"
			value="<%=pVo.getPersonId()%>"> <br>
			<input type="hidden" name="action" value="update">
		<button type="submit">수정</button>
	</form>
</body>
</html>