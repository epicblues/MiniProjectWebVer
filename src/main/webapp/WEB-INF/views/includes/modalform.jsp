<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class = "modal fade" id="insertForm" tabindex="-1">
	<div class = "modal-dialog">
		<div class="modal-content">
			<div class="modal-header"> 새 주소 등록 <button class="btn-outline-warning close" data-dismiss="modal">&times;</button></div>
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