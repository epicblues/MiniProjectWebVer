<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String message = (String)request.getParameter("message");
	String search = (request.getParameter("search")==null)?" ":"(검색어: "+request.getParameter("search")+")";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 Servlet</title>
</head>
<body>
<h1>주소록 Servlet</h1>
<h3><%=message + " " + search %></h3>