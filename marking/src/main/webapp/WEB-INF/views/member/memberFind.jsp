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
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2 class="card-title text-center mb-5 fw-bold fs-2" id="find-title">아이디 찾기</h2>
						<div class="mb-3">
							<label class="form-label d-block"></label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" id="selete-id" name="find-info" type="radio"  value="id" checked="checked" onclick="fn_findInfo();"/>
								<label class="form-check-label" for="selete-id">아이디 찾기</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" id="selete-pwd" name="find-info" type="radio" value="pwd" onclick="fn_findInfo();"/> 
								<label class="form-check-label" for="selete-pwd">비밀번호 찾기</label>
							</div>
						</div>
						<div class="" id="find-id">
							<div class="" id="find-id-email">
								<!-- 아이디 이메일 ======================================================== -->
								<form action="${contextPath}/member/findId" method="post" name="form-find-id" id="form-find-id">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="member_name" name="member_name" placeholder="text" maxlength="20"> 
										<label for="member_name" >이름</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="member_email" name="member_email" placeholder="text" maxlength="50"> 
										<label for="member_email" >이메일 (ex : marking.com)</label>
									</div>
									<div class="d-grid">
										<button class="btn btn-dark btn-login text-uppercase fw-bold main-hover" id="btn-find-id" type="submit">
											아이디 찾기
										</button>
									</div>
								</form>
							</div>
						</div>

						<div class="" id="find-pwd">
							<div class="" id="find-pwd-email">
								<!-- 비밀번호 이메일 ======================================================== -->
								<form action="${contextPath}/findPassword" method="post" name="form-find-password" id="form-find-password">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="member_id" name="member_id" placeholder="text" maxlength="20"> 
										<label for="member_id" >아이디</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="member_name" name="member_name" placeholder="text" maxlength="20" > 
										<label for="member_name" >이름</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="member_email" name="member_email" placeholder="text" maxlength="50"> 
										<label for="member_email" >이메일 (ex : marking.com)</label>
									</div>
									
									<div class="" id="find-pwd-email-check">
										
									</div>
									<div class="d-grid">
										<button class="btn btn-dark btn-login text-uppercase fw-bold main-hover" id="btn-find-password" type="submit">임시 비밀번호 전송</button>
									</div>
								</form>
							</div>
						</div>
						<!-- ======================================================== -->
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
	
	<script defer type="text/javascript">
	
	<%--모달창 기능 --%>
	function fnModal(e) {
			
		$(".modal-body").html(e);
		if(e != "") {
			$("#myModal").modal("show");
		}
	};
	
	
	<%-- 이메일 유효성 체크 --%>
	var email_reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
		
	<%--아이디 찾기 버튼 눌렀을때 --%>
		$("#btn-find-id").on("click", function(e){
			e.preventDefault;
			var name = $("#form-find-id #member_name").val();
			var email = $("#form-find-id #member_email").val();
			
			if(name == "") {
				fnModal("이름을 입력해주세요.");
				return false;
			} else if(email == "") {
				fnModal("이메일을 입력해주세요.");
				return false;
			} else if(!(email_reg.test(email))) {
				fnModal("이메일 형식으로 입력해주세요.");
				return false;
			}
			
			$("#form-find-password").submit();
			
		});
		
	
	
	
	
		<%--비번 찾기 버튼 눌렀을때 --%>
		$("#btn-find-password").on("click", function(e){
			e.preventDefault;
			
			var id = $("#form-find-password #member_id").val();
			var name = $("#form-find-password #member_name").val();
			var email = $("#form-find-password #member_email").val();
			
			if(id == "") {
				fnModal("아이디를 입력해주세요.");
				return false;
			} else if(name == "") {
				fnModal("이름을 입력해주세요.");
				return false;
			} else if(email == "") {
				fnModal("이메일을 입력해주세요.");
				return false;
			} else if(!(email_reg.test(email))) {
				fnModal("이메일 형식으로 입력해주세요.");
				return false;
			}
			
			$("#form-find-password").submit();
			
		});
	
	
	
	
	
		$("#frm1").on("click",function(e){
			e.preventDefault;
			
			fnModal("임시비밀번호가 해당 메일로 전송되었습니다.");
			
			$("#frm1").submit();
		});
	
	</script>
	
	
	
	
	
	<script type="text/javascript">
		
		<%-- 아이디 or 비번찾기 눌렀을때 변하는 form변화하는 로직 --%>
			function fn_findInfo(){
				var info_length = document.getElementsByName('find-info').length;
				var info;
				
				for (var i = 0 ; i < info_length ; i++) {
					if(document.getElementsByName('find-info')[i].checked == true) {
						info = 	document.getElementsByName('find-info')[i].value;
					}
				}
				
				if(info == 'id' ) {
					document.getElementById("find-id").style.display = "block";
					document.getElementById("find-id-email").style.display = "block";
					document.getElementById("find-pwd").style.display = "none";
					
					document.getElementById("find-title").innerText="아이디 찾기"
					
				} else if(info == 'pwd' ) {
					document.getElementById("find-pwd").style.display = "block";
					document.getElementById("find-pwd-email").style.display = "block";
					document.getElementById("find-pwd-email-check").style.display = "none";
					document.getElementById("find-id").style.display = "none";
					
					document.getElementById("find-title").innerText="비밀번호 찾기"
					
				} 
			};
			
			
		
	</script>
</body>
</html>