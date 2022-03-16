<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/header.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>
<div class="container-fluid">
		<div class="row">
			<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-0 p-sm-5">
						<br>
						<br>
						<h2 align="center">
						
							<c:choose>
							
								<c:when test="${!empty criteria.keyword}">
									
									"${criteria.keyword}"의 검색결과
								
								</c:when>
								
								<c:otherwise>
								
									${cate_title}
								
								</c:otherwise>
							</c:choose>
						
						</h2>
						
						<br>
						　<%-- 여기 ㄱ한자잇음 --%>
						<div class="float-end">
							<a href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${criteria.pageNum}&sort=1&keyword=${criteria.keyword}" class="btn btn-outline-secondary p-1">신상품</a>
							<a href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${criteria.pageNum}&sort=2&keyword=${criteria.keyword}" class="btn btn-outline-secondary p-1">낮은가격</a>
							<a href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${criteria.pageNum}&sort=3&keyword=${criteria.keyword}" class="btn btn-outline-secondary p-1">높은가격</a>
							<a href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${criteria.pageNum}&sort=4&keyword=${criteria.keyword}" class="btn btn-outline-secondary p-1">조회수</a>
							<a href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${criteria.pageNum}&sort=5&keyword=${criteria.keyword}" class="btn btn-outline-secondary p-1">주문수</a>
						</div>
						<hr class="dropdown-divider mb-5 mt-3" />
						<div class="row row-cols-2 row-cols-md-4">
						<br>
							
							<c:if test="${empty productList}">
								
								<div class="text-center"style="height: 700px; width: 100%; vertical-align: middle;" >
									<br><br><br><br><br><br><br><br><br><br><br>
									<h2>현재 준비된 상품이 없습니다.</h2>
								</div>
								
							</c:if>
							
							
							<c:forEach items="${productList}" var="productList">
								<div class="col pb-5 " style="margin-bottom: 20px;">
									<div class="card mx-auto" id="image-div" style="width:80%">
									
										<a href="${contextPath}/product/user/read?product_no=${productList.product_no}"> 
											<img src="${contextPath}/product/productImageShow?product_no=${productList.product_no}&product_file_main=Y" class="card-img-top " alt="..." style=" height: 250px;">
										</a>
										<div class="card-body">
											<div class="dropdown-divider mt-0"></div>
											<h5 class="card-title text-truncate" style="text-overflow: ellipsis;">${productList.product_title}</h5>
										
										<c:choose>
											
											<c:when test="${productList.product_sale eq 'N'}">
												<span class="card-text">${productList.product_realprice}원</span><br>
											</c:when>
											
											<c:otherwise>
												<span class="card-text text-decoration-line-through">${productList.product_saleprice}원</span>&nbsp;
												<span class="card-text">${productList.product_realprice}원</span><br>
											</c:otherwise>
											
										</c:choose>
										
										<c:if test="${productList.product_new eq 'Y'}">
											<span class="badge bg-success text-white" style="top: 0.5rem; right: 0.5rem">new</span>
										</c:if>
										
										<c:if test="${productList.product_best eq 'Y'}">
											<span class="badge bg-primary text-white" style="top: 0.5rem; right: 0.5rem">best</span>
										</c:if>
										
										<c:if test="${productList.product_sale eq 'Y'}">
											<span class="badge bg-info text-white" style="top: 0.5rem; right: 0.5rem">Sale</span>
										</c:if>
										
										<c:if test="${productList.product_stock > 0 && productList.product_stock <= 10}">
											<span class="badge bg-warning text-white" style="top: 0.5rem; right: 0.5rem">품절임박</span>
										</c:if>

										<c:if test="${productList.product_salestate eq 'N'}">
											<span class="badge bg-danger text-white" style="top: 0.5rem; right: 0.5rem">품절</span>
										</c:if>
										
										
										</div>
									</div>
								</div>
							</c:forEach>
							
							
							<%-- 
							
							<div class="col pb-5 " style="margin-bottom: 20px;">
								<div class="card mx-auto" style="width:80%">
									<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
									<a href="#"> <img src="/resources/images/P1.PNG" class="card-img-top " alt="..." style=" height: 250px;">
									</a>
									<div class="card-body">
										<div class="dropdown-divider mt-0"></div>
										<h5 class="card-title text-truncate" style="text-overflow: ellipsis;">콘콘콘콘콘콘콘콘콘콘콘콘콘콘콘</h5>
										<p class="card-text">1000원</p>
										<span class="badge bg-success text-white" style="top: 0.5rem; right: 0.5rem">new</span>
										<span class="badge bg-primary text-white" style="top: 0.5rem; right: 0.5rem">best</span>
										<span class="badge bg-info text-white" style="top: 0.5rem; right: 0.5rem">Sale</span>
										<span class="badge bg-danger text-white" style="top: 0.5rem; right: 0.5rem">품절</span>
										<span class="badge bg-warning text-white" style="top: 0.5rem; right: 0.5rem">품절임박</span>
									</div>
								</div>
							</div>
							--%>
						</div>
						<div class="row row-cols-2 row-cols-md-4 float-end">
							<div class="col px-4 pb-5">
	                           <ul class="pagination">
	                           <c:if test="${pageMaker.prev}">
	                           	<li class="page-item">
							      <a class="page-link btn-secondary" href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=1&sort=${sort}&keyword=${criteria.keyword}">
							      	<i class="bi bi-chevron-double-left"></i>
							      </a>
							    </li>
							    <li class="page-item">
							      <a class="page-link btn-secondary" href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${pageMaker.startPage - 1}&sort=${sort}&keyword=${criteria.keyword}">
									<i class="bi bi-chevron-left"></i>
								  </a>
							    </li>
	                           </c:if>	
	                           <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                           	<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }">
	                           		<a class="page-link" href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${num}&sort=${sort}&keyword=${criteria.keyword}">${num}</a>
	                           	</li>
	                           </c:forEach>	
	                           <c:if test="${pageMaker.next}">
	                           	<li class="page-item">
							      <a class="page-link" href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${pageMaker.endPage + 1}&sort=${sort}&keyword=${criteria.keyword}">
									<i class="bi bi-chevron-right"></i>
								  </a>
							    </li>
							    <li class="page-item">
							      <a class="page-link" href="${contextPath}/product/list?cate_no=${cate_no}&cate_title=${cate_title}&pageNum=${pageMaker.realEnd}&sort=${sort}&keyword=${criteria.keyword}">
									<i class="bi bi-chevron-double-right"></i>
								  </a>
							    </li>
	                           </c:if>	
	                           </ul>
                           	</div>
						</div>
							
							<%--
							
							<div class="row row-cols-2 row-cols-md-4 float-end">
								<div class="col px-4 pb-5">
									<ul class="pagination ">
									    <li class="page-item">
									      <a class="page-link btn-secondary" href="#">
									      	<i class="bi bi-chevron-double-left"></i>
									      </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link btn-secondary" href="#">
											<i class="bi bi-chevron-left"></i>
										  </a>
									    </li>
									    <li class="page-item active">
									      <a class="page-link btn-secondary" href="#">1</a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="#">2</a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="#">3</a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="#">4</a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="#">5</a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="#">
											<i class="bi bi-chevron-right"></i>
										  </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="#">
											<i class="bi bi-chevron-double-right"></i>
										  </a>
									    </li>
									  </ul>
									</div>
								</div>
							--%>
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
		
	
	</script>

</body>
</html>