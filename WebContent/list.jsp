<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDataBean"%>
<%@ page import = "board.BoardDBBean"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<%!
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List<BoardDataBean> articleList = null;
	
	BoardDBBean dbPro = BoardDBBean.getInstance();
	count = dbPro.getArticleCount();
	
	if(count > 0){
		articleList = dbPro.getArticles(startRow, pageSize);
	}
	number = count-(currentPage-1)*pageSize;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>글목록(전체 글:<%=count %>)</p>

<table>
	<tr>
		<td align="right">
			<a href="writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<% if (count == 0) {%>

<table>
	<tr>
		<td align="center">
			게시판에 저장된 글이 없습니다.
		</td>
</table>
<% } else { %>
<table border="1">
	<tr height="30">
		<td align="center" width="50">번 호</td>
		<td align="center" width="250">제 목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조 회</td>
	</tr>
<%
	for(int i = 0; i < articleList.size(); i++){
		BoardDataBean article = articleList.get(i);	
%>
	<tr height="30">
		<td width="50"> <%=number-- %></td>
		<td width="250" align="left">
			<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage%>">
					<%=article.getSubject() %></a>
		</td>
		<td width="100" align="left">
			<a href="mailto:<%=article.getEmail()%>">
							<%=article.getWriter() %></a>
		</td>
		<td width="150"><%=sdf.format(article.getReg_date()) %></td>
		<td width="50"><%=article.getReadcount() %></td>
	</tr>
<%} %>
</table>
<%} %>
</body>
</html>