<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>글쓰기</p>
<form method="post" action="writePro.jsp">
	<table border="1">
		<tr>
			<td colspan="2"> 글목록</td>
		</tr>
		<tr>
			<td> 이름</td>
			<td> <input type="text" name="writer"></td>
		</tr>
		<tr>
			<td> 제목</td>
			<td> <input type="text" name="subject"></td>
		</tr>
		<tr>
			<td> 이메일</td>
			<td> <input type="text" name="email"></td>
		</tr>
		<tr>
			<td> 내용</td>
			<td> <input type="text" name="content"></td>
		</tr>
		<tr>
			<td> 비밀번호</td>
			<td> <input type="text" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="글쓰기">
			<input type="reset" name="다시작성">
			<input type="button" value="목록보기 " OnClick="window.location='list.jsp'"></td>
		</tr>
	</table>
</form>
</body>
</html>