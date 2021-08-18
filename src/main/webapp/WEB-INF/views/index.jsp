<%@page import="com.phonebook.vo.PhoneBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<PhoneBookVO> list = (List<PhoneBookVO>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 Servlet</title>
</head>
<body>
<h1>주소록 Servlet</h1>
<h3>목록</h3>

<form action="<%request.getContextPath(); %>/?a=search" method="POST">
<label for="search">검색어</label>
<input type="text" name="search" id="search" />
<input type="submit" value="검색">
</form>

<table style="align-content: center;">
<tr style="background-color: 333333F">
<th>이름</th>
<th>휴대전화</th>
<th>전화번호</th>
<th>도구</th>
<tr>
</table>

</body>
</html>