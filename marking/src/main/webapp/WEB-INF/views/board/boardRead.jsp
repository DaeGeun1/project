<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/header.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>
	<div class="board-computer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
					<div class="card border-0 shadow rounded-3 my-5">
						<div class="card-body p-0 p-sm-5">
							<h2 class="card-title text-center mb-5 fw-bold fs-2">${boardInfo.board_kind != "1" ? boardInfo.board_kind != "2" ? "이벤트 상세글" : "FAQ 상세글" : "공지사항 상세글"}</h2>
							
								<form action="${contextPath}/board/delete" method="post" name="" id="">
									<input type="hidden"  class="form-control" id="" name="board_no" value="${boardInfo.board_no}" >
									<input type="hidden"  class="form-control" id="" name="board_kind" value="${boardInfo.board_kind}" >
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="pageNum" value="${criteria.pageNum}" />
									<input type="hidden" name="amount" value="${criteria.amount}" />
									<input type="hidden" name="type" value="${criteria.type}" />
									<input type="hidden" name="keyword" value="${criteria.keyword}" />
								    <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label text-center fw-bolder">글 제목</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="board_title" value="${boardInfo.board_title}" readonly="readonly" maxlength="30">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="member_name" class="col-sm-2 col-form-label text-center fw-bolder">작성자</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="member_name" value="${boardInfo.member_name}" readonly="readonly">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="board_contents" class="col-sm-2 col-form-label text-center align-middle fw-bolder" >글 내용</label>
								      <div class="col-sm-10">
								        <textarea class="form-control bg-white" id=""  name="board_contents" rows="10" readonly="readonly" style="resize: none;" maxlength="1300">${boardInfo.board_contents}</textarea>
								      </div>
								    </div>
								    
								    
								    <div class="form-group row mb-3">
								      <div class="col-sm-2"></div>
								      <div class="col-sm-10 border border-2">
										 <div class="container">
										    <div class="row" id="picture-computer-board-read">
										       
										    </div>
										  </div>
								      </div>
								    </div>
								    
								    
								    <div class="hstack gap-3 w-75 ms-auto">
								     <sec:authorize access="isAuthenticated()">
									  	 
									  	 <c:choose>
									  	 
									  	 	<c:when test="${principal.username eq boardInfo.member_id}">
								  	 			<a href="${contextPath}/board/modify?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_no=${boardInfo.board_no}&board_kind=${boardInfo.board_kind}" class="w-50">
													<input type="button" value="글 수정" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
												</a>
													<input type="submit" value="글 삭제" class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-50">
												<a href="${contextPath}/board/list?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${boardInfo.board_kind}" class="w-50">
													<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100 " style="float: right;">
												</a>
									  	 	
									  	 	</c:when>
									  	 	
									  	 	<c:otherwise>
									  	 	
								  	 			<a href="${contextPath}/board/list?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${boardInfo.board_kind}" class="w-50">
													<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100 " style="margin-left: 100%;">
												</a>
									  	 	
									  	 	</c:otherwise>
									  	 
									  	 </c:choose>
									  	 
									</sec:authorize>
									<sec:authorize access=" isAnonymous()">
											
											<a href="${contextPath}/board/list?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${boardInfo.board_kind}" class="w-50">
												<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100 " style="margin-left: 100%;">
											</a>
									
									</sec:authorize>
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	
	<div class="board-mobile">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
					<div class="card border-0 shadow rounded-3 my-5">
						<div class="card-body p-0 p-sm-5">
							<h2 class="card-title text-center mb-5 fw-bold fs-2">${boardInfo.board_kind != "1" ? boardInfo.board_kind != "2" ? "이벤트 상세글" : "FAQ 상세글" : "공지사항 상세글"}</h2>
								<form action="${contextPath}/board/delete" method="post" name="" id="">
									<input type="hidden"  class="form-control" id="" name="board_no" value="${boardInfo.board_no}" >
									<input type="hidden"  class="form-control" id="" name="board_kind" value="${boardInfo.board_kind}" >
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="pageNum" value="${criteria.pageNum}" />
									<input type="hidden" name="amount" value="${criteria.amount}" />
									<input type="hidden" name="type" value="${criteria.type}" />
									<input type="hidden" name="keyword" value="${criteria.keyword}" />
								    <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label fw-bolder">글 제목</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="board_title" value="${boardInfo.board_title}" readonly="readonly" maxlength="30">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="member_name" class="col-sm-2 col-form-label fw-bolder">작성자</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="member_name" value="${boardInfo.member_name}" readonly="readonly">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="board_contents" class="col-sm-2 col-form-label align-middle fw-bolder" >글 내용</label>
								      <div class="col-sm-10">
								        <textarea class="form-control bg-white" id=""  name="board_contents" rows="10" readonly="readonly" style="resize: none;" maxlength="1300">${boardInfo.board_contents}</textarea>
								      </div>
								    </div>
								    
								    <div class="form-group row mb-3">
								      <div class="col-sm-2"></div>
								      <div class="col-sm-10 border border-2">
										 <div class="container">
										    <div class="row" id="picture-mobile-board-read">
										       
										    </div>
										  </div>
								      </div>
								    </div>
								    
								    <div class="hstack gap-3 w-75 ms-auto">
								    
								    	 <sec:authorize access="isAuthenticated()">
									  	 
									  	 <c:choose>
									  	 
									  	 	<c:when test="${principal.username eq boardInfo.member_id}">
								  	 			<a href="${contextPath}/board/modify?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_no=${boardInfo.board_no}&board_kind=${boardInfo.board_kind}" class="w-50">
													<input type="button" value="글 수정" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
												</a>
													<input type="submit" value="글 삭제" class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-50">
												<a href="${contextPath}/board/list?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${boardInfo.board_kind}" class="w-50">
													<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
												</a>
									  	 	
									  	 	</c:when>
									  	 	
									  	 	<c:otherwise>
									  	 	
								  	 			<a href="${contextPath}/board/list?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${boardInfo.board_kind}" class="w-50">
													<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100 " style="margin-left: 100%;">
												</a>
									  	 	
									  	 	</c:otherwise>
									  	 
									  	 </c:choose>
									  	 
									</sec:authorize>
									<sec:authorize access=" isAnonymous()">
											
											<a href="${contextPath}/board/list?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${boardInfo.board_kind}" class="w-50">
												<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100 " style="margin-left: 100%;">
											</a>
									
									</sec:authorize>
								    
									</div>
								</form>
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
	
	<%--================================================================================================================ --%>
	<%-- boardRead.jsp  --%> 
	
	var board_no = "${boardInfo.board_no}";
	
	
	$.getJSON("${contextPath}/board/BoardFileList", {board_no : board_no}, function(arr) {
		
		str = "";
		
		$(arr).each(function(i, boardFileDTO) {
			
			if(boardFileDTO.board_file_image == 'Y') {
				var fileCallPath = encodeURIComponent(boardFileDTO.board_file_uploadpath+ "/s_" + boardFileDTO.board_file_uuid + "_" + boardFileDTO.board_file_name);
				
				str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
				str += "data-path='" + boardFileDTO.board_file_uploadpath + "' data-uuid='" + boardFileDTO.board_file_uuid + "' data-filename='" + boardFileDTO.board_file_name + "' data-type='" + boardFileDTO.board_file_image + "' >"
				str += "<img src='${contextPath}/board/BoardFileDisplay?fileName=" + fileCallPath + "' class='img-thumbnail' alt='...' style='width: 200px; height:200px'>"
				str += "</div>"
			} else {
				var fileCallPath = encodeURIComponent(boardFileDTO.board_file_uploadpath+ "/s_" + boardFileDTO.board_file_uuid + "_" + boardFileDTO.board_file_name);
 				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
 				
 				str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
 				str += "data-path='" + boardFileDTO.board_file_uploadpath + "' data-uuid='" + boardFileDTO.board_file_uuid + "' data-filename='" + boardFileDTO.board_file_name + "' data-type='" + boardFileDTO.board_file_image + "' >"
				str += "<img src='/resources/images/board/file.png' class='img-thumbnail' alt='...' style='width: 200px; height:200px'>"
				str += "</div>"
			}
			
		});
			$("#picture-computer-board-read").append(str);
			$("#picture-mobile-board-read").append(str);
		
		
		
	});


</script>




</body>
</html>