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
		<div class="row"></div>
		<div class="form-row row" style="background-color:pink;">
			<div class= "col-4"></div>
			<div class= "form-group col" >
				<label for="search">검색어</label>
				<input type="text" name="search" id="search" />
				<input type="submit" value="검색" class="btn-primary">
			</div>	
		</div>
	</form>
	
	
	
	
<br /><br />

<div class = "container-fluid">
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
	
</div>

<br />
<br />
<div class="container">
	<button class="btn-outline-primary btn-lg" data-target="#insertForm" data-toggle="modal" style="float:right">주소 추가</button>
</div>

<jsp:include page="/WEB-INF/views/includes/modalform.jsp" />





<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous">
</script>

<script>
	const form = document.insert;
	const submitBtn = form.submit;
	const body= document.querySelector('body');
	submitBtn.onclick = () => {
		$.ajax({
			url:'?a=insert', // 기존 form 방식과 동일 동일.
			type:"POST",
			dataType:"html", // 요청이 성공적으로 수행되면 서버로부터 html 을 전송받는다.
			data:{ // 폼에 입력되어 서버에 전송될 데이터들(.name으로 접근 가능하다!)
				name : form.name.value,
				hp: form.hp.value,
				tel: form.tel.value
				},
			success:function(newHtml) {
				// ControllerServlet에 의해 db 갱신이 성공하면 html 파일을 newHtml에 전송받는다.
				console.log(newHtml);
				const container = document.querySelector('.container-fluid');
				// List를 표시하는 Container 클래스의 내부 HTML을 ajax로 받은 HTML로 바꾼다
				container.innerHTML = newHtml;
				document.querySelector('[data-dismiss="modal"]').click();
				
			},
			failure:function(data) {
				console.log(data);
			}
			
		})
		return false;
	}
</script>

</body>
</html>