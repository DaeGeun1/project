<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/header.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-7 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2 class="card-title text-center mb-5 fw-bold fs-2">비밀번호 수정</h2>
						
						<form action="${contextPath}/member/modifyPassword" method="post" name="frm" id="frm" >
							<input type="hidden" class="form-control" id="member_id" name="member_id" value="${memberInfo.member_id}" placeholder="text">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="member_password" name="member_password" placeholder="text"> 
								<label for="member_password">기존 비밀번호</label>
								<span class="fs-6 text-danger" id="span-member-password">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="new_password" name="new_password" placeholder="text"> 
								<label for="password">새로운 비밀번호</label>
								<span class="fs-6 text-danger" id="span-new-password">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="new_password_check" name="new_password_check" placeholder="text"> 
								<label for="password">비밀번호 확인</label>
								<span class="fs-6 text-danger" id="span-new-password-check">　</span>
							</div>
							<div class="form-floating mb-2">
								<button class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-100" id="btn-modify-password" type="submit">
									비밀번호 변경
								</button>
							</div>
							<div class="form-floating mb-3">
								<a href="javascript:window.history.back();" class="w-50">
									<input type="button" value="취소" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
								</a>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	


	<%-- ======================================================== --%>
	<%-- 바디 끝 --%>


	<%-- 푸터 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/footer.jsp"%>
	<%-- ======================================================== --%>
	<%-- 푸터 끝 --%>
	

	
	
	
	
	<script type="text/javascript">
		
	$(document).ready(function(){
		
		var blank_reg = /[\s]/g;             <%-- 공백체크 --%>
		
		<%-- 비밀번호 유효성 체크   8~16자 영어 숫자 특수문자(!@#$?) 포함  --%>
		var password_reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[!@#$?])(?!.*[^a-zA-z0-9!@#$?]).{8,16}$/; 
		
		
		var password = $("#member_password").val();
		var new_password = $("#new_password").val();
		var new_password_check = $("#new_password_check").val();
		
		
		$("#member_password").on("blur", function(){
			var password = $("#member_password").val();
			
			if(password == "") {
				document.getElementById("member_password").classList.add("is-invalid");
				document.getElementById("span-member-password").innerText="비밀번호를 입력해주세요.";
			} else {
				document.getElementById("member_password").classList.remove("is-invalid");
				document.getElementById("span-member-password").innerText="　";
			}
		});
		
		$("#new_password").on("blur", function(){
			var new_password = $("#new_password").val();
			var new_password_check = $("#new_password_check").val();
			
			if(new_password == "") {                                       			 <%-- 빈칸 유효성 체크 --%>
				document.getElementById("new_password").classList.add("is-invalid");
				document.getElementById("span-new-password").innerText="비밀번호를 입력해주세요.";
			} else if (blank_reg.test(new_password)) {                      		 <%-- 공백 유효성 체크 --%>
				document.getElementById("new_password").classList.add("is-invalid");
				document.getElementById("span-new-password").innerText="공백이 존재합니다.";
			} else if (!(password_reg.test(new_password))) {                         <%-- 영어 숫자 특수문자(!@#$?) 조합 8~16자 --%>
				document.getElementById("new_password").classList.add("is-invalid");
				document.getElementById("span-new-password").innerText="영문/숫자/특수문자(!@#$?)가 포함된 8~16자로 이루어져야합니다.";
			} else if (password_reg.test(new_password)) {                            <%-- 통과 --%>
				document.getElementById("new_password").classList.remove("is-invalid");
				document.getElementById("span-new-password").innerText="　";
			} else {                                              				 <%-- 유효성 못잡은거 있을때 에러 --%>
				document.getElementById("new_password").classList.add("is-invalid");
				document.getElementById("span-new-password").innerText="에러입니다 유효성체크코드를 확인해주세요";
			}
			
			if(new_password_check != "") { <%-- 비밀번호 체크 입력후 다시 비밀번호 창에 비번 변경할때 다시 비번확인과 비교하는 로직 --%>
				
				if (new_password_check != new_password) {
					document.getElementById("new_password_check").classList.add("is-invalid");
					document.getElementById("span-new-password-check").innerText="비밀번호가 일치하지않습니다.";
				} else if (new_password_check == new_password) {                            		<%-- 통과 --%>
					document.getElementById("new_password_check").classList.remove("is-invalid");
					document.getElementById("span-new-password-check").innerText="　";
				}  else {                                              				 		<%-- 유효성 못잡은거 있을때 에러 --%>
					document.getElementById("new_password_check").classList.add("is-invalid");
					document.getElementById("span-new-password-check").innerText="에러입니다 유효성체크코드를 확인해주세요";
				}
			}
		});
		
		$("#new_password_check").on("blur", function(){
			var new_password = $("#new_password").val();
			var new_password_check = $("#new_password_check").val();
			
			if(new_password_check == "") {                                       			<%-- 빈칸 유효성 체크 --%>
				document.getElementById("new_password_check").classList.add("is-invalid");
				document.getElementById("span-new-password-check").innerText="비밀번호확인을 입력해주세요.";
			} else if (blank_reg.test(new_password_check)) {                      		     <%-- 공백 유효성 체크 --%>
				document.getElementById("new_password_check").classList.add("is-invalid");
				document.getElementById("span-new-password-check").innerText="공백이 존재합니다.";
			} else if (new_password_check != new_password) {                                  <%-- 비밀번호 비교 --%>
				document.getElementById("new_password_check").classList.add("is-invalid");
				document.getElementById("span-new-password-check").innerText="비밀번호가 일치하지않습니다.";
			} else if (new_password_check == new_password) {                            		<%-- 통과 --%>
				document.getElementById("new_password_check").classList.remove("is-invalid");
				document.getElementById("span-new-password-check").innerText="　";
			}  else {                                              				 		<%-- 유효성 못잡은거 있을때 에러 --%>
				document.getElementById("new_password_check").classList.add("is-invalid");
				document.getElementById("span-new-password-check").innerText="에러입니다 유효성체크코드를 확인해주세요";
			}
		});
		
		$("#btn-modify-password").on("click", function(e){
			
			e.preventDefault();
			
			var password = $("#member_password").val();
			var new_password = $("#new_password").val();
			var new_password_check = $("#new_password_check").val();
			
			if(password == "") {
				fnModal("비밀번호를 입력해주세요");
				$("#member_password").focus();
				return false;
			} else if (new_password == "" || !(password_reg.test(new_password))) {
				fnModal("새로운 비밀번호를 확인해주세요");
				$("#new_password").focus();
				return false;
			} else if (new_password_check == "" || new_password_check != new_password) {
				fnModal("비밀번호 확인을 확인해주세요");
				$("#new_password_check").focus();
				return false;
			} 
			
			$("#frm").submit();
			return true;
		});
		
		
		
	function fnModal(e) {
			
			$(".modal-body").html(e);
			if(e != "") {
				$("#myModal").modal("show");
			}
	}
		
		
	});

		
	</script>
</body>
</html>