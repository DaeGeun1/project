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
							<h2 class="card-title text-center mb-5 fw-bold fs-2">${board_kind != "1" ? board_kind != "2" ? "이벤트 게시판" : "자주하는 질문" : "공지사항"}</h2>
								<form action="${contextPath}/board/list" method="get" name="" id="computer-frm">
									<input type="hidden"  class="form-control" id="" name="board_kind" value="${board_kind}">
									
									<div class="mb-3 w-25 float-start">
							            <select class="form-select w-50 fs-6" id="computer-select" name="amount">
							                <option value="10" ${criteria.amount == "10" ? "selected='selected'" : "" }>10개</option>
							                <option value="25" ${criteria.amount == "25" ? "selected='selected'" : "" }>25개</option>
							                <option value="50" ${criteria.amount == "50" ? "selected='selected'" : "" }>50개</option>
							            </select>
							        </div>
									<div class="hstack gap-4 w-50 ms-auto">
										<div class="mb-3 w-50">
								            <select class="form-select" id="type" name="type" aria-label="">
								                <option value="T" ${criteria.type == "T" ? "selected='selected'" : "" }>제목</option>
								                <option value="C" ${criteria.type == "C" ? "selected='selected'" : "" }>내용</option>
								                <option value="W" ${criteria.type == "W" ? "selected='selected'" : "" }>작성자</option>
								                <option value="TC" ${criteria.type == "TC" ? "selected='selected'" : "" }>제목or내용</option>
								                <option value="TCW" ${criteria.type == "TCW" ? "selected='selected'" : "" }>제목or내용or작성자</option>
								            </select>
								        </div>
										<div class="mb-3 w-50">
								            <input class="form-control" id="computer-keyword" name="keyword" type="text" value="${criteria.keyword}" placeholder="검색어"/>
								        </div>		
										<button class="btn btn-dark fw-bold mb-3 main-hover" id="computer-search" type="submit">
											<i class="bi bi-search"></i>
										</button>
									</div>
								</form>
								
								
								<table class="table text-center table-bordered table-striped table-hover table-sm fs-7" >
								  <thead>
								    <tr>
								      <th scope="col" style="width: 11%">글번호</th>
								      <th scope="col" style="width: 52%">제목</th>
								      <th scope="col" style="width: 11%">작성자</th>
								      <th scope="col" style="width: 15%">등록일</th>
								      <th scope="col" style="width: 11%">조회수</th>
								    </tr>
								  </thead>
								  <tbody class="board-list">
								    	<c:choose>
								    		<c:when test="${!empty boardList}">
								    			<c:forEach items="${boardList}" var="boardList">
									    			<tr>
											    	  	<td>${boardList.board_rownum}</td>
											     	 	<td><a href="${contextPath}/board/read?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_no=${boardList.board_no}&board_kind=${board_kind}" class="text-decoration-none text-black">${boardList.board_title}</a></td>
			 								     	 	<td>${boardList.member_name}</td>
											     	 	<td><fmt:formatDate value="${boardList.board_registdate}" pattern="yyyy-MM-dd"/></td>
											     	 	<td>${boardList.board_viewcount}</td>
											    	</tr>
								    			</c:forEach>
								    		</c:when>
								    		<c:otherwise>
								    			<tr class="align-middle bg-white">
										     	 	<td class="bg-white" colspan="5" style="height: 25rem;" >현재 등록된 글이 없습니다.</td>
										    	</tr>
								    		</c:otherwise>
								    	</c:choose>
							    	
								  </tbody>
								</table>
								
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="d-grid w-50 ms-auto mb-3">
					                <a href="${contextPath}/board/add?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}" class="w-100">
										<input type="button" value="글 등록" class="btn btn-dark btn-login text-uppercase fw-bold main-hover float-end w-50">
									</a>
					            </div>
					            </sec:authorize>
					            
								<div>
	                            	<ul class="pagination justify-content-end">
	                            	<c:if test="${pageMaker.prev}">
	                            		<li class="page-item">
									      <a class="page-link btn-secondary" href="${contextPath}/board/list?pageNum=1&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
									      	<i class="bi bi-chevron-double-left"></i>
									      </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link btn-secondary" href="${contextPath}/board/list?pageNum=${pageMaker.startPage - 1}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
											<i class="bi bi-chevron-left"></i>
										  </a>
									    </li>
	                            	</c:if>	
	                            	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                            		<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }">
	                            			<a class="page-link" href="${contextPath}/board/list?pageNum=${num}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">${num}</a>
	                            		</li>
	                            	</c:forEach>	
	                            	<c:if test="${pageMaker.next}">
	                            		<li class="page-item">
									      <a class="page-link" href="${contextPath}/board/list?pageNum=${pageMaker.endPage + 1}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
											<i class="bi bi-chevron-right"></i>
										  </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="${contextPath}/board/list?pageNum=${pageMaker.realEnd}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
											<i class="bi bi-chevron-double-right"></i>
										  </a>
									    </li>
	                            	</c:if>	
	                            	</ul>
                           		 </div>
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
							<h2 class="card-title text-center mb-5 fw-bold fs-2">${board_kind != "1" ? board_kind != "2" ? "이벤트 게시판" : "자주하는 질문" : "공지사항"}</h2>
							
								<form action="" method="get" id="mobile-frm">
								<input type="hidden"  class="form-control" id="" name="board_kind" value="${board_kind}">
									<div class="hstack gap-3 ms-auto">
										<div class="mb-3 w-50">
								            <select class="form-select" id="type" name="type" aria-label="">
								                <option value="T" ${criteria.type == "T" ? "selected='selected'" : "" }>제목</option>
								                <option value="C" ${criteria.type == "C" ? "selected='selected'" : "" }>내용</option>
								                <option value="W" ${criteria.type == "W" ? "selected='selected'" : "" }>작성자</option>
								                <option value="TC" ${criteria.type == "TC" ? "selected='selected'" : "" }>제목or내용</option>
								                <option value="TCW" ${criteria.type == "TCW" ? "selected='selected'" : "" }>제목or내용or작성자</option>
								            </select>
								        </div>
										<div class="mb-3 w-50">
								            <input class="form-control" id="mobile-keyword" name="keyword" type="text" value="${criteria.keyword}" placeholder="검색어"/>
								        </div>		
										<button class="btn btn-dark fw-bold mb-3 main-hover" id="mobile-search" type="submit">
											<i class="bi bi-search"></i>
										</button>
									</div>
								</form>
							
							<table class="table text-center table-bordered table-striped table-hover table-sm fs-7"  >
							  <thead>
							    <tr>
							      <th scope="col" style="width: 15%">글번호</th>
							      <th scope="col" style="width: 55%">제목</th>
							      <th scope="col" style="width: 15%">작성자</th>
							      <th scope="col" style="width: 15%">조회수</th>
							    </tr>
							  </thead>
							  	<tbody class="board-list">
							    	<c:choose>
								    	<c:when test="${!empty boardList}">
								   			<c:forEach items="${boardList}" var="boardList">
								    			<tr>
										    	  	<td>${boardList.board_rownum}</td>
										     	 	<td><a href="${contextPath}/board/read?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_no=${boardList.board_no}&board_kind=${board_kind}" class="text-decoration-none text-black">${boardList.board_title}</a></td>
					 					     	 	<td>${boardList.member_name}</td>
											     	<td>${boardList.board_viewcount}</td>
									    		</tr>
							    			</c:forEach>
							    		</c:when>
							    		<c:otherwise>
							    			<tr class="align-middle bg-white">
									     	 	<td class="bg-white" colspan="4" style="height: 25rem;" >현재 등록된 글이 없습니다.</td>
									    	</tr>
							    		</c:otherwise>
							    	</c:choose>
							  	</tbody>
							</table>
							
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div class="d-grid w-50 ms-auto mb-3">
								<a href="${contextPath}/board/add?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}" class="w-100">	
									<input type="button" value="글 등록" class="btn btn-dark btn-login text-uppercase fw-bold main-hover float-end w-100">
								</a>
				            </div>
				            </sec:authorize>
				            
							<div>
	                            	<ul class="pagination justify-content-end">
	                            	<c:if test="${pageMaker.prev}">
	                            		<li class="page-item">
									      <a class="page-link btn-secondary" href="${contextPath}/board/list?pageNum=1&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
									      	<i class="bi bi-chevron-double-left"></i>
									      </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link btn-secondary" href="${contextPath}/board/list?pageNum=${pageMaker.startPage - 1}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
											<i class="bi bi-chevron-left"></i>
										  </a>
									    </li>
	                            	</c:if>	
	                            	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                            		<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }">
	                            			<a class="page-link" href="${contextPath}/board/list?pageNum=${num}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">${num}</a>
	                            		</li>
	                            	</c:forEach>	
	                            	<c:if test="${pageMaker.next}">
	                            		<li class="page-item">
									      <a class="page-link" href="${contextPath}/board/list?pageNum=${pageMaker.endPage + 1}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
											<i class="bi bi-chevron-right"></i>
										  </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="${contextPath}/board/list?pageNum=${pageMaker.realEnd}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_kind=${board_kind}">
											<i class="bi bi-chevron-double-right"></i>
										  </a>
									    </li>
	                            	</c:if>	
	                            	</ul>
                   	        </div>
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

	$("#computer-select").on("change",function(){
		
		$("#computer-frm").submit();
	});
	
	$("#computer-search").on("click",function(e){
		e.preventDefault();
		
		var keyword = $("#computer-keyword").val();

		if(keyword == "") {
			fnModal("검색어를 입력해주세요.")
			return false;
		}
		
		$("#computer-frm").submit();
	});
	
	$("#mobile-search").on("click",function(e){
		e.preventDefault();
		var keyword = $("#mobile-keyword").val();

		if(keyword == "") {
			fnModal("검색어를 입력해주세요.")
			return false;
		}
		
		$("#mobile-frm").submit();
	});
	
	<%-- 모달 --%>
	function fnModal(e) {
		
		$(".modal-body").html(e);
		if(e != "") {
			$("#myModal").modal("show");
		}
	}

</script>

</body>
</html>