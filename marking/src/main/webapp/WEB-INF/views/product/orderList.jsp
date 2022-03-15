<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- 헤더 시작 -->
	<!-- ======================================================== -->
	<%@ include file="../common/header.jsp"%>
	<!-- ======================================================== -->
	<!-- 헤더 끝 -->


	<!-- 바디 시작 -->
	<!-- ======================================================== -->
	
	<div class="container-fluid border-0 shadow rounded-3  p-5 mt-5">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4 text-center">주문내역</h1>
    					
    <br><br>
    
    	<table class="table table-bordered text-center table-hover table-sm fs-7 align-middle m-5 mx-auto" >
			<thead class="bg-light">
				<tr>
					<th scope="col" style="width: 10%">주문번호</th>
					<th scope="col" style="width: 15%">상품</th>
					<th scope="col" style="width: 20%">상품이름</th>
					<th scope="col" style="width: 15%">주문일자</th>
					<th scope="col" style="width: 15%">주문내역</th>
					<th scope="col" style="width: 10%">주문상태</th>
					<th scope="col" style="width: 15%">비고</th>
				</tr>
			</thead>
			<tbody>
				
				<c:choose>
				
					<c:when test="${empty orderList}">
					
						<tr>
							<td colspan="6" style="height: 500px">현재 주문한 상품이 없습니다.</td>
						</tr>
					
					</c:when>
					
					<c:otherwise>
					
						<c:forEach items="${orderList}" var="orderList">
							<tr>
								<td>${orderList.order_no}</td>
								<td>
									<img src="${contextPath}/product/productImageShow?product_no=${orderList.product_no}&product_file_main=Y" class="card-img-top" alt="..." style="width: 85%; height: 150px;">
								</td>
								<td>${orderList.product_title}</td>
								<td>
									<fmt:formatDate value="${orderList.order_date}" pattern="yyyy-MM-dd"/>
								</td>
								<td>
									${orderList.product_realprice * orderList.product_amount}원<br>
									(${orderList.product_amount}개)
								</td>
								<td>
									${orderList.order_state == '0' ? '입금 대기' :
									  orderList.order_state == '1' ? '입금 완료' :
									  orderList.order_state == '2' ? '배송 준비중' :
									  orderList.order_state == '3' ? '배송중' :
									  orderList.order_state == '4' ? '배송 완료' :
									  orderList.order_state == '5' ? '교환 접수' :
									  orderList.order_state == '6' ? '교환 완료' :
									  orderList.order_state == '7' ? '취소 접수' :
									  orderList.order_state == '8' ? '취소 완료' :
									  orderList.order_state == '9' ? '환불 접수' :
									  orderList.order_state == '10' ? '환불 완료' : ''}
									  <br>
								</td>
								<td>
									<input class="btn btn-dark h-50 btn-delete sub-hover mb-2" data-no="${orderList.order_no}" type="button" id="btn-delete" name="btn-delete" value="후기작성"><br>
									<input class="btn btn-dark h-50 btn-delete sub-hover" data-no="${orderList.order_no}" type="button" id="btn-delete" name="btn-delete" value="문의">
								</td>
							</tr>
						</c:forEach>
							
					</c:otherwise>
				
				</c:choose>
				
				
			</tbody>
			
		</table>  
		
    </div>
	
 

	<!-- ======================================================== -->
	<!-- 바디 끝 -->


	<!-- 푸터 시작 -->
	<!-- ======================================================== -->
	<%@ include file="../common/footer.jsp"%>
	<!-- ======================================================== -->
	<!-- 푸터 끝 -->
	
	<script defer type="text/javascript">
		
	$("input[type=button]").on("click", function(e){
		
		e.preventDefault();
	});
	
		
		
	
	</script> 
	 
	
	
</body>
</html>