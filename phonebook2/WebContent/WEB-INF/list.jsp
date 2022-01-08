<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.javaex.vo.PersonVo" %>

<%
	/*WEB-INF 폴더에 list.jsp를 위치시키는 이유
	주소창에서 직접 list를 부를 수 없도록 외부에서는 주소가 인식되지 않는 WEB-INF 폴더 안에 넣는다.
	실수로 list.jsp를 직접 불러 오류가 발생하는 일을 막기 위함이다.(접근 제한 개념)
	*/

	//List에 넣기 위해 pList를 List형으로 자료형 변환한다.
	List<PersonVo> personList = (List<PersonVo>)request.getAttribute("pList");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>[phonebook2]</h1>

	<h2>전화 번호 리스트</h2>

	<p>입력한 정보 내역입니다.</p>

	<%
	for(int i=0;i<personList.size();i++){
	%>	
	<table border="1">
		<tr>
			<td>이름(name)</td>
			<td><%=personList.get(i).getName() %></td>
		</tr>
		<tr>
			<td>전화번호(hp)</td>
			<td><%=personList.get(i).getHp() %></td>
		</tr>
		<tr>
			<td>회사(company)</td>
			<td><%=personList.get(i).getCompany() %></td>
		</tr>
		<tr>
			<td><a href="./updateForm.jsp?id=<%=personList.get(i).getPersonId()%>">[수정]</a></td>
			<td><a href="./delete.jsp?id=<%=personList.get(i).getPersonId()%>">[삭제]</a></td>
		</tr>
	</table>
	<br>
	<%
	}
	%>
</body>
</html>