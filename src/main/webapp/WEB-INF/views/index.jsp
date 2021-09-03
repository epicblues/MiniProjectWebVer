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
	<div class="alert-primary alert-info alert-dismissable fade show">
	
	
	<form action="<%=request.getContextPath() %>/?a=search" method="POST">
		<div class="form-row row align-items-center">
			<div class= "form-group col-md-6">
				<label for="search">검색어</label>
				<input type="text" name="search" id="search" />
				<input type="submit" value="검색" class="btn-primary">
			</div>	
		</div>
	</form>
	</div>
	
	
	
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
<button class="btn-outline-primary" data-target="#insertForm" data-toggle="modal">주소 추가(modal ver)</button>
<a class="" href="<%=request.getContextPath() %>/?a=insert">새 주소 추가</a>

<div class = "modal fade" id="insertForm" tabindex="-1">
	<div class = "modal-dialog">
		<div class="modal-content">
			<div class="modal-header"> 새 주소 등록 <button class="btn-outline-warning" data-dismiss="modal">&times;</button></div>
			<div class="modal-body"> 
			<form name="insert">
				<div class="form-row row">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="name" name="name"/>
				</div>
				<div class="form-row row">
					<label for="hp">휴대전화</label>
					<input type="text" class="form-control" id="hp" name="hp"/>
				</div>
				<div class="form-row row">
					<label for="tel">집전화</label>
					<input type="text" class="form-control" id="tel" name="tel"/>
				</div>
				<br/>
				<div class="form-row row">
					<input type="submit" value="주소 등록" name="submit" class="btn btn-primary"/>
				</div>
			</form>
				
			
			</div>
		</div>
	</div>
</div>

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