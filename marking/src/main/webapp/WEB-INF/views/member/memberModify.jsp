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
						<h2 class="card-title text-center mb-5 fw-bold fs-2">회원정보 수정</h2>
						
						<form action="" method="post" name="frm" id="frm" >
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white" id="member_id" name="member_id" value="${memberInfo.member_id}" placeholder="text" maxlength="20" readonly="readonly"> 
								<label for="member_id">아이디</label>
								<span class="fs-6 text-danger" id="span-member-id">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="member_password" name="member_password" placeholder="text" maxlength="20"> 
								<label for="member_password">비밀번호</label>
								<span class="fs-6 text-danger" id="span-member-password">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="member_name" name="member_name" value="${memberInfo.member_name}" placeholder="text" maxlength="5"> 
								<label for="member_name">이름</label>
								<span class="fs-6 text-danger" id="span-member-name">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white w-50 float-start" id="member_post" name="member_post" value="${memberInfo.member_post}" placeholder="text" maxlength="10" readonly="readonly"> 
								<input class="btn btn-dark  btn-login fw-bold sub-hover" style="width: 45%; height: 58px; margin-left: 5%" value="주소찾기" type="button" onclick="fn_find_email_check()"/>
								<label for="member_post">우편번호</label>
								<span class="fs-6 text-danger" id="">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white" id="member_basicaddress" name="member_basicaddress" value="${memberInfo.member_basicaddress}" placeholder="text" maxlength="33" readonly="readonly"> 
								<label for="member_basicaddress">기본 주소</label>
								<span class="fs-6 text-danger" id="">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="member_detailaddress" name="member_detailaddress" value="${memberInfo.member_detailaddress}" placeholder="text" maxlength="33"> 
								<label for="member_detailaddress">상세 주소(선택가능)</label>
								<span class="fs-6 text-danger" id="">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white"  id="member_email" name="member_email" value="${memberInfo.member_email}" placeholder="text" readonly="readonly"> 
								<%--<input class="btn btn-dark  btn-login fw-bold sub-hover" style="width: 30%; height: 58px; margin-left: 5%" value="인증하기" type="button" onclick="fn_join_email_check()"/> --%>
								<label for="member_email">이메일 (ex : marking.com)</label>
								<span class="fs-6 text-danger" id="span-member-email">　</span>
							</div>
							<%-- 
								<div class="form-floating mb-3" id="join-email-check" style="display: none;">
									<input type="text" class="form-control" style="float: left; width : 65%;" id="" name="" placeholder="text"> 
									<input class="btn btn-dark  btn-login fw-bold sub-hover" style="width: 30%; height: 58px; margin-left: 5%" value="인증확인" type="button" onclick=""/>
									<label for="">인증번호</label>
								</div>
							--%>
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="member_tel" name="member_tel" value="${memberInfo.member_tel}" placeholder="text" maxlength="11"> 
								<label for="member_tel">전화번호 ( - 제외한 숫자 10~11자리)</label>
								<span class="fs-6 text-danger" id="span-member-tel">　</span>
							</div>
					         <div class="mb-3">
					            <label class="form-label d-block" style="font-size: 20px;'">sns 수신여부</label>
					            <div class="form-check form-check-inline">
					                <input class="form-check-input" id="member_selectO" type="radio"  name="member_select" data-sb-validations="" value='Y' ${memberInfo.member_select == "Y" ? "checked='checked'" : ""}/>
					                <label class="form-check-label" for="member_selectO">동의함</label>
					            </div>
					            <div class="form-check form-check-inline">
					                <input class="form-check-input" id="member_selectX" type="radio" name="member_select" data-sb-validations="" value='N' ${memberInfo.member_select == "N" ? "checked='checked'" : ""}/>
					                <label class="form-check-label" for="member_selectX">동의안함</label>
					            </div>
					        </div>
							<div class="hstack gap-3 mb-3">
								<button class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-100" id="btn-modify" type="submit">
									정보수정
								</button>
							</div>
							<div class="hstack gap-3">
								<a href="${contextPath}/member/modifyPassword" class="w-50">
									<input type="button" value="비밀번호 변경" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
								</a>
								<button class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-50" id="btn-delete" type="submit">
									회원탈퇴
								</button>
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
	
	<%-- 주소 api --%>
	function fn_find_email_check() {
	   	
		new daum.Postcode({
	    	oncomplete: function(data) {
		    
			    document.getElementById("member_post").value = data.zonecode; <%-- 주소 넣기 --%>
			    document.getElementById("member_basicaddress").value = data.address; <%-- 주소 넣기 --%>
			    document.querySelector("input[name=member_detailaddress]").focus(); <%--상세입력 포커싱 --%>
		    }
		   }).open();
	};
	
	
	<%--모달창 기능 --%>
	function fnModal(e) {
			
		$(".modal-body").html(e);
		if(e != "") {
			$("#myModal").modal("show");
		}
	};
	
	var blank_reg = /[\s]/g;              <%-- 공백체크 --%>

	var eng_reg = /^[a-zA-z]+$/;          <%-- 영어만 --%>
	
	var kor1_reg  = /^[ㄱ-ㅎ가-힣]+$/;       <%-- 한글 유효성 체크 --%>
	
	var kor2_reg  = /^[ㄱ-ㅎ]+$/;       <%-- 한글 유효성 체크 --%>
	
	var kor3_reg  = /^[가-힣]+$/;       <%-- 한글 유효성 체크 --%>
	
	var num_reg  = /^[0-9]*$/;          <%-- 숫자만 --%>

	<%--특수문자 유효성 체크 --%>
	var sc_reg = /[`~!@#$%^&*|\\\'\";:\/?]/gi;  
	
	var tel_reg = /01[016789][0-9]{3,4}[0-9]{4}/;     <%-- 핸드폰 번호 유효성 체크  --%>
	
	var name_reg = /^[가-힣]{2,5}$/;    <%-- 이름 유효성 체크 --%>  
	
	
	<%-- 이메일 유효성 체크 --%>
	var email_reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	
	
	<%--비밀번호 유효성 체크   8~16자 영어 숫자 특수문자(!@#$?) 포함  --%>
	var password_reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[!@#$?])(?!.*[^a-zA-z0-9!@#$?]).{8,16}$/; 
	
	var id_reg = /^[A-Za-z]{1}[A-Za-z0-9]{3,15}$/;   <%-- 아이디 유효성 체크 영어시작 영어숫자조합 4~16자  --%> 
	
	$("#member_name").on("blur", function(){
		
		var name = $("#member_name").val();
		
		if(name == "") {                                       					    <%-- 빈칸 유효성 체크 --%>
			document.getElementById("member_name").classList.add("is-invalid");
			document.getElementById("span-member-name").innerText="이름을 입력해주세요.";
		} else if (blank_reg.test(name)) {                      		 	 	    <%-- 공백 유효성 체크 --%>
			document.getElementById("member_name").classList.add("is-invalid");
			document.getElementById("span-member-name").innerText="공백이 존재합니다.";
		} else if (!(kor3_reg.test(name))) {                                  		<%-- 문자형식 한글 체크 --%>
			document.getElementById("member_name").classList.add("is-invalid");
			document.getElementById("span-member-name").innerText="문자형식의 한글을 입력해주세요.";
		} else if (!(name_reg.test(name))) {                                  		<%-- 문자형식 한글 체크 --%>
			document.getElementById("member_name").classList.add("is-invalid");
			document.getElementById("span-member-name").innerText="2~5자로 입력해주세요.";
		} else if (name_reg.test(name)) {                            				<%-- 통과 --%>
			document.getElementById("member_name").classList.remove("is-invalid");
			document.getElementById("member_name").classList.add("is-valid");
			document.getElementById("span-member-name").innerText="　";
		}  else {                                              				 		<%-- 유효성 못잡은거 있을때 에러 --%>
			document.getElementById("member_name").classList.add("is-invalid");
			document.getElementById("span-member-name").innerText="에러입니다 유효성체크코드를 확인해주세요";
		}
		
		
	});
	
	$("#member_tel").on("blur", function(){
		
		var tel = $("#member_tel").val();
		
		if(tel == "") {                                       						<%-- 빈칸 유효성 체크 --%>
			document.getElementById("member_tel").classList.add("is-invalid");
			document.getElementById("span-member-tel").innerText="전화번호를 입력해주세요.";
		} else if (blank_reg.test(tel)) {                      		 	 	    	<%-- 공백 유효성 체크 --%>
			document.getElementById("member_tel").classList.add("is-invalid");
			document.getElementById("span-member-tel").innerText="공백이 존재합니다.";
		} else if (!(num_reg.test(tel))) {                      		 	 	    <%-- 공백 유효성 체크 --%>
			document.getElementById("member_tel").classList.add("is-invalid");
			document.getElementById("span-member-tel").innerText="숫자만 입력해주세요";
		} else if (!(tel_reg.test(tel))) {                      		 	 	    <%-- 공백 유효성 체크 --%>
			document.getElementById("member_tel").classList.add("is-invalid");
			document.getElementById("span-member-tel").innerText="핸드폰 번호가 올바르지 않습니다.";
		} else if (tel_reg.test(tel)) {                            					<%-- 통과 --%>
			document.getElementById("member_tel").classList.remove("is-invalid");
			document.getElementById("member_tel").classList.add("is-valid");
			document.getElementById("span-member-tel").innerText="　";
		}  else {                                              				 		<%-- 유효성 못잡은거 있을때 에러 --%>
			document.getElementById("member_tel").classList.add("is-invalid");
			document.getElementById("span-member-tel").innerText="에러입니다 유효성체크코드를 확인해주세요";
		}
		
	});
	
	$("#btn-modify").on("click",function(e){
		e.preventDefault;
		
		var password = $("#member_password").val();
		var name = $("#member_name").val();
		var tel = $("#member_tel").val();
		
		if(password == "") {
			fnModal("비밀번호를 입력해주세요.");
			$("#member_password").focus();
			return false;
		} else if(name == "" || !(name_reg.test(name))) {
			fnModal("이름을 확인해주세요");
			$("#member_name").focus();
			return false;
		} else if(tel == "" || !(tel_reg.test(tel))) {
			fnModal("전화번호를 확인해주세요");
			$("#member_tel").focus();
			return false;
		} 
		
		$("#frm").attr("action","${contextPath}/member/modify").submit();
		return true;
	});
	
	$("#btn-delete").on("click",function(e){
		e.preventDefault;
		var password = $("#member_password").val();
		
		if(password == "") {
			fnModal("비밀번호를 입력해주세요.");
			document.getElementById("span-member-password").focus();
			return false;
		} else if (password != "") {
			$("#frm").attr("action","${contextPath}/member/delete").submit();
			return true;
		} else {
			fnModal("오류입니다 유효성체크를 다시 해주세요");
			return false;
		}
		
	});

		
	</script>
</body>
</html>