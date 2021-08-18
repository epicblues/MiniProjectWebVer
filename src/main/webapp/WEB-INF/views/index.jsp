<%@page import="com.phonebook.vo.PhoneBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<PhoneBookVO> list = (List<PhoneBookVO>)request.getAttribute("list");
	String search = request.getParameter("search");
%>
<jsp:include page="/WEB-INF/views/includes/header.jsp">
<jsp:param value="목록" name="message"/>
</jsp:include>
<br />
<form action="<%=request.getContextPath() %>/?a=search" method="POST">
<label for="search">검색어</label>
<input type="text" name="search" id="search" />
<input type="submit" value="검색">
</form>
<br /><br />

<table style="align-content: center;">
<tr style="background-color: 333333F;border-color: black;">
<th>이름</th>
<th>휴대전화</th>
<th>전화번호</th>
<th>도구</th>
<tr>
<% for (PhoneBookVO vo : list) { %>
<tr>

<th><%=vo.getName() %></th>
<th><%=vo.getHp() %></th>
<th><%=vo.getTel() %></th>
<th>
<form action="<%=request.getContextPath() %>/?a=delete" method="POST">
<input type = "hidden" name = "id" value="<%=vo.getId() %>" />
<input type = "submit" value ="삭제" />
</form>
</th>
</tr>
<%} %>
</table>
<br />
<br />
<a href="<%=request.getContextPath() %>/insert.jsp">새 주소 추가</a>
</body>
</html>