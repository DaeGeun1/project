<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/header.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>

		<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img src="resources/images/main/main1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="resources/images/main/main2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="resources/images/main/main3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		 

		


	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-0 p-sm-5">
						<br>
						<br>
						<h2 align="center">베스트 상품</h2>
						<br>
						<br>
						<div class="row row-cols-2 row-cols-md-4">
						
						<c:choose>
						
							<c:when test="${empty bestProductList}">
							
							<div class="text-center"style="height: 300px; width: 100%; vertical-align: middle;" >
								<br><br><br><br><br>
								<h2>현재 준비된 상품이 없습니다.</h2>
							</div>
							
							</c:when>
							
							<c:otherwise>
							
								<c:forEach items="${bestProductList}" var="bestProductList">
								<div class="col ps-3 pe-3" style="margin-bottom: 20px;">
									<div class="card">
										<a href="${contextPath}/product/user/read?product_no=${bestProductList.product_no}"> 
											<img src="${contextPath}/product/productImageShow?product_no=${bestProductList.product_no}&product_file_main=Y" class="card-img-top " alt="..." style=" height: 300px;">
										</a>
										<div class="card-body">
											<div class="dropdown-divider mt-0"></div>
											<h5 class="card-title text-truncate" style="text-overflow: ellipsis;">${bestProductList.product_title}</h5>
											
											<c:choose>
											
												<c:when test="${bestProductList.product_salestate eq 'Y'}">
												
													<span class="card-text text-decoration-line-through">${bestProductList.product_saleprice}원</span>
													<span>${bestProductList.product_realprice}원</span>
												
												</c:when>
												
												<c:otherwise>
												
													<span class="card-text">${bestProductList.product_realprice}원</span>
												
												</c:otherwise>
												
											</c:choose>
											<br>
											<c:if test="${bestProductList.product_new eq 'Y'}">
												<span class="badge bg-success text-white" style="top: 0.5rem; right: 0.5rem">new</span>
											</c:if>
											
											<c:if test="${bestProductList.product_best eq 'Y'}">
												<span class="badge bg-primary text-white" style="top: 0.5rem; right: 0.5rem">best</span>
											</c:if>
											
											<c:if test="${bestProductList.product_sale eq 'Y'}">
												<span class="badge bg-info text-white" style="top: 0.5rem; right: 0.5rem">Sale</span>
											</c:if>
											
											<c:if test="${bestProductList.product_stock > 0 && bestProductList.product_stock <= 10}">
												<span class="badge bg-warning text-white" style="top: 0.5rem; right: 0.5rem">품절임박</span>
											</c:if>
											<c:if test="${bestProductList.product_salestate eq 'N'}">
												<span class="badge bg-danger text-white" style="top: 0.5rem; right: 0.5rem">품절</span>
											</c:if>
											
										</div>
									</div>
								</div>
								</c:forEach>
								
							</c:otherwise>
						
						</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-0 p-sm-5">
						<br>
						<br>
						<h2 align="center">신상품</h2>
						<br>
						<br>
						<div class="row row-cols-2 row-cols-md-4">
						
						<c:choose>
						
							<c:when test="${empty newProductList}">
							
							<div class="text-center"style="height: 300px; width: 100%; vertical-align: middle;" >
								<br><br><br><br><br>
								<h2>현재 준비된 상품이 없습니다.</h2>
							</div>
							
							</c:when>
							
							<c:otherwise>
							
								<c:forEach items="${newProductList}" var="newProductList">
								<div class="col ps-3 pe-3" style="margin-bottom: 20px;">
									<div class="card">
										<a href="${contextPath}/product/user/read?product_no=${newProductList.product_no}"> 
											<img src="${contextPath}/product/productImageShow?product_no=${newProductList.product_no}&product_file_main=Y" class="card-img-top " alt="..." style=" height: 300px;">
										</a>
										<div class="card-body">
											<div class="dropdown-divider mt-0"></div>
											<h5 class="card-title text-truncate" style="text-overflow: ellipsis;">${newProductList.product_title}</h5>
											
											<c:choose>
											
												<c:when test="${newProductList.product_salestate eq 'Y'}">
												
													<span class="card-text text-decoration-line-through">${newProductList.product_saleprice}원</span>
													<span>${newProductList.product_realprice}원</span>
												
												</c:when>
												
												<c:otherwise>
												
													<span class="card-text">${newProductList.product_realprice}원</span>
												
												</c:otherwise>
												
											</c:choose>
											<br>
											<c:if test="${newProductList.product_new eq 'Y'}">
												<span class="badge bg-success text-white" style="top: 0.5rem; right: 0.5rem">new</span>
											</c:if>
											
											<c:if test="${newProductList.product_best eq 'Y'}">
												<span class="badge bg-primary text-white" style="top: 0.5rem; right: 0.5rem">best</span>
											</c:if>
											
											<c:if test="${newProductList.product_sale eq 'Y'}">
												<span class="badge bg-info text-white" style="top: 0.5rem; right: 0.5rem">Sale</span>
											</c:if>
											
											<c:if test="${newProductList.product_stock > 0 && newProductList.product_stock <= 10}">
												<span class="badge bg-warning text-white" style="top: 0.5rem; right: 0.5rem">품절임박</span>
											</c:if>
											<c:if test="${newProductList.product_salestate eq 'N'}">
												<span class="badge bg-danger text-white" style="top: 0.5rem; right: 0.5rem">품절</span>
											</c:if>
											
										</div>
									</div>
								</div>
								</c:forEach>
								
							</c:otherwise>
						
						</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-0 p-sm-5">
						<br>
						<br>
						<h2 align="center">세일상품</h2>
						<br>
						<br>
						<div class="row row-cols-2 row-cols-md-4">
						
						<c:choose>
						
							<c:when test="${empty saleProductList}">
							
							<div class="text-center"style="height: 300px; width: 100%; vertical-align: middle;" >
								<br><br><br><br><br>
								<h2>현재 준비된 상품이 없습니다.</h2>
							</div>
							
							</c:when>
							
							<c:otherwise>
							
								<c:forEach items="${saleProductList}" var="saleProductList">
								<div class="col ps-3 pe-3" style="margin-bottom: 20px;">
									<div class="card">
										<a href="${contextPath}/product/user/read?product_no=${saleProductList.product_no}"> 
											<img src="${contextPath}/product/productImageShow?product_no=${saleProductList.product_no}&product_file_main=Y" class="card-img-top " alt="..." style=" height: 300px;">
										</a>
										<div class="card-body">
											<div class="dropdown-divider mt-0"></div>
											<h5 class="card-title text-truncate" style="text-overflow: ellipsis;">${saleProductList.product_title}</h5>
											
											<c:choose>
											
												<c:when test="${saleProductList.product_salestate eq 'Y'}">
												
													<span class="card-text text-decoration-line-through">${saleProductList.product_saleprice}원</span>
													<span>${saleProductList.product_realprice}원</span>
												
												</c:when>
												
												<c:otherwise>
												
													<span class="card-text">${saleProductList.product_realprice}원</span>
												
												</c:otherwise>
												
											</c:choose>
											<br>
											<c:if test="${saleProductList.product_new eq 'Y'}">
												<span class="badge bg-success text-white" style="top: 0.5rem; right: 0.5rem">new</span>
											</c:if>
											
											<c:if test="${saleProductList.product_best eq 'Y'}">
												<span class="badge bg-primary text-white" style="top: 0.5rem; right: 0.5rem">best</span>
											</c:if>
											
											<c:if test="${saleProductList.product_sale eq 'Y'}">
												<span class="badge bg-info text-white" style="top: 0.5rem; right: 0.5rem">Sale</span>
											</c:if>
											
											<c:if test="${saleProductList.product_stock > 0 && saleProductList.product_stock <= 10}">
												<span class="badge bg-warning text-white" style="top: 0.5rem; right: 0.5rem">품절임박</span>
											</c:if>
											<c:if test="${saleProductList.product_salestate eq 'N'}">
												<span class="badge bg-danger text-white" style="top: 0.5rem; right: 0.5rem">품절</span>
											</c:if>
											
										</div>
									</div>
								</div>
								</c:forEach>
								
							</c:otherwise>
						
						</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	

	<%--
					<div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                 --%>


	<%-- ======================================================== --%>
	<%-- 바디 끝 --%>


	<%-- 푸터 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/footer.jsp"%>
	<%-- ======================================================== --%>
	<%-- 푸터 끝 --%>


</body>
</html>