<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String message = (String)request.getParameter("message");
	String search = (request.getParameter("search")==null)?" ":"(검색어: "+request.getParameter("search")+")";
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<title>주소록 Servlet</title>

</head>


<body>

<header>
	<nav class="navbar navbar-expand-lg bg-dark">
		<div class="row"><span class="text-light">주소록 Servlet</span></div>
		<div class="row-6 text-light"><%=message + " " + search %></div>
	</nav>
	
		
	
</header>
