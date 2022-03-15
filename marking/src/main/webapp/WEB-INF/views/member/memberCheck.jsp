<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- 헤더 시작 -->
	<!-- ======================================================== -->
	<%@ include file="../common/header.jsp"%>
	<!-- ======================================================== -->
	<!-- 헤더 끝 -->


	<!-- 바디 시작 -->
	<!-- ======================================================== -->

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-7 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2 class="card-title text-center mb-5 fw-bold fs-2">회원정보 확인</h2>
						
						<form action="${contextPath}/member/check" method="post" name="frm" >
							<input type="hidden" class="form-control" id="member_id" name="member_id" value="${memberInfo.member_id}" placeholder="text">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<div class="form-floating mb-3">
					           <p><b>"${memberInfo.member_name}"</b>님의 정보보호를 위하여 <br>비밀번호를 입력해주세요.</p>
					        </div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="member_password" name="member_password" placeholder="text" > 
								<label for="">비밀번호</label>
							</div>
							<div class="hstack gap-3 mb-3">
								<button class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-100" type="submit">
									비밀번호 확인
								</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- ======================================================== -->
	<!-- 바디 끝 -->


	<!-- 푸터 시작 -->
	<!-- ======================================================== -->
	<%@ include file="../common/footer.jsp"%>
	<!-- ======================================================== -->
	<!-- 푸터 끝 -->
	
	
</body>
</html>