<%@page import="com.phonebook.vo.PhoneBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<PhoneBookVO> list = (List<PhoneBookVO>)request.getAttribute("list");
	String search = request.getParameter("search");
%>
	
	<table class = "table">
	<thead>
    <tr>
      <th scope="col">이름</th>
      <th scope="col">휴대전화</th>
      <th scope="col">전화번호</th>
      <th scope="col">도구</th>
    </tr>
  </thead>
  <tbody>
    <%for (PhoneBookVO vo : list) {%>
    <tr>
      <th scope="row"><%=vo.getName() %></th>
      <td><%=vo.getHp() %></td>
      <td><%=vo.getTel() %></td>
      <td>
		<form action="<%=request.getContextPath() %>/?a=delete" method="POST">
			<input type = "hidden" name = "id" value="<%=vo.getId() %>" />
			<input type = "submit" value ="삭제" class="btn-warning" />
		</form>
	</td>
    </tr>
    <%} %>
  </tbody>
</table>


