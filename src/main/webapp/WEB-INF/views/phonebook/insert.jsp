<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/includes/header.jsp">
<jsp:param value="새 주소 등록" name="message"/>
</jsp:include>




<form style = "border: thick;"action ="<%=request.getContextPath() %>/?a=insert" method="post">
<div class = "form-row row">
	<div class= "form group col">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" />
	</div>
	
	<div class= "form group col">
	<label for="hp">휴대전화</label>
<input type="text" name="hp" id="hp" /></div>
	<div class= "form group col">
	<label for="">집전화</label>
<input type="text" name="tel" id="tel" /></div>
	<div class= "form group col">
	<input type="submit" value="주소 등록"/></div>



</div>
</form>


<br/>
<a href=<%=request.getContextPath() %>>목록 보기</a>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
</body>
</html>