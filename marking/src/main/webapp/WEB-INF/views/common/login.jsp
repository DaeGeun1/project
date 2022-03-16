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
            <h2 class="card-title text-center mb-5 fw-bold fs-2">로그인 </h2>
            <form action="${contextPath}/login" method="post" name="frm" id="form-login">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="member_id" name="member_id" placeholder="text" value="${cookie.id.value}" maxlength="20">
                <label for="member_id">아이디</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="member_password" name="member_password" placeholder="Password" value="" maxlength="20">
                <label for="member_password">비밀번호(문자,숫자,특수문자 조합 8~15자)</label>
              </div>

              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox"  id="remember_id" name="remember_id" ${empty cookie.id.value ? "" : "checked"}>
                <label class="form-check-label" for="rememberId">
                  아이디 기억하기
                </label>
              </div>
              <div class="d-grid">
                <button class="btn btn-dark btn-login text-uppercase fw-bold main-hover" id="btn-login"type="submit">
                	로그인
                </button>
              </div>
            </form>
              <hr class="my-4">
               <div class="d-grid mb-2">
                <a href="${contextPath}/member/join" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover">회원가입</a>
               </div>
               <div class="d-grid">
                <a href="${contextPath}/member/find" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover">아이디 / 비밀번호 찾기</a>
              </div>
              <hr class="my-4">
              <div class="d-grid mb-2">
                <button class="btn btn-google btn-login text-uppercase fw-bold" type="submit">
                  <i class="fab fa-google me-2"></i> 구글 로그인
                </button>
              </div>
              <div class="d-grid">
                <button class="btn btn-facebook btn-login text-uppercase fw-bold" type="submit">
                  <i class="fab fa-facebook-f me-2"></i> 페이스북 로그인
                </button>
              </div>
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
 	
	var csrf_headername = "${_csrf.headerName}"; 
	var csrf_token = "${_csrf.token}";
	
	var kor1_reg  = /^[ㄱ-ㅎ가-힣]+$/;
 	
 	$("#btn-login").on("click", function(e){
 		
 		e.preventDefault();
 		
 		var member_id = $("#member_id").val();
 		var member_password = $("#member_password").val();
 		var remember_id = $("#remember_id").is(":checked");
 		if(member_id == "") {
 			fnModal("아이디를 입력해주세요");
 			return false;
 		}  else if (kor1_reg.test(member_id)){
 			fnModal("한글은 입력할 수 없습니다.");
 			return false;
 		} else if (member_password ==""){
 			fnModal("비밀번호를 입력해주세요");
 			return false;
 		}
 		
 		$.ajax({
 			
 			url : "${contextPath}/remeberId",
 			data : { member_id : member_id , remember_id : remember_id},
 			datatype : "json",
 			method : "post",
 			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrf_headername, csrf_token);
			},
			success : function(result) {
				$("#form-login").submit();
			}, 
			fail : function(data) {
				alert("실패");
			}, 
			error : function(request, error) {
				alert("에러");
				alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
			
			
		});
 			
 			
 			
 	});
	
	
 	
 	function fnModal(e) {
		
		$(".modal-body").html(e);
		if(e != "") {
			$("#myModal").modal("show");
		}
	}	

</script>
	
	
</body>
</html>