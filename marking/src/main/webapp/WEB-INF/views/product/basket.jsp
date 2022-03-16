<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/header.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>
	
	<div class="container-fluid border-0 shadow rounded-3  p-5 mt-5">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4 text-center">장바구니</h1>
    					
    <br><br>
    
    	<table class="table table-bordered text-center table-hover table-sm fs-7 align-middle m-5 mx-auto" >
			<thead class="bg-light">
				<tr>
					<th scope="col" style="width: 15%">이미지</th>
					<th scope="col" style="width: 25%">내용</th>
					<th scope="col" style="width: 15%">판매가</th>
					<th scope="col" style="width: 15%">수량</th>
					<th scope="col" style="width: 15%">합계</th>
					<th scope="col" style="width: 15%">선택</th>
				</tr>
			</thead>
			<tbody>
				
				<c:choose>
				
					<c:when test="${empty basketInfo}">
					
						<tr>
							<td colspan="6" style="height: 500px">현재 등록된 상품이 없습니다.</td>
						</tr>
					
					</c:when>
					
					<c:otherwise>
					
						<c:forEach items="${basketInfo}" var="basketInfo">
							<tr>
								<td>
									<img src="${contextPath}/product/productImageShow?product_no=${basketInfo.product_no}&product_file_main=Y" class="card-img-top" alt="..." style="width: 85%; height: 150px;">
								</td>
								<td>${basketInfo.product_title}</td>
								<td>${basketInfo.product_realprice}</td>
								<td>
									<span id="amount" data-amount="${basketInfo.basket_no}">${basketInfo.product_amount}</span><br>
									<input class="btn btn-dark h-50 plus" data-no="${basketInfo.basket_no}" data-amount="${basketInfo.product_amount}" data-stock="${basketInfo.product_stock}" type="button" value="+">
									<input class="btn btn-dark h-50 minus" data-no="${basketInfo.basket_no}" data-amount="${basketInfo.product_amount}" data-stock="${basketInfo.product_stock}" type="button" value="-">
								</td>
								<td class="price">
									<span id="price-span" data-price="${basketInfo.basket_no}">${basketInfo.product_realprice * basketInfo.product_amount}</span></td>
								<td>
									<input class="btn btn-dark h-50 btn-delete sub-hover" data-no="${basketInfo.basket_no}" type="button" id="btn-delete" name="btn-delete" value="삭제"><br>
								</td>
							</tr>
						</c:forEach>
							<tr class="bg-light">
								<td colspan="6" style="text-align: right; padding-right: 50px; font-size: 18px"><strong>상품 총 구매 금액 : <span id="total-price-span"></span>원 (배송비 3000원 포함)</strong> </td>	
							</tr>
					</c:otherwise>
				
				</c:choose>
				
				
			</tbody>
			
		</table>  
		
		<c:if test="${!empty basketInfo}">
			<a href="${contextPath}/order">
				<button type="button" class="btn btn-dark float-end btn-total-order">전체상품 주문하기</button>
			</a>
				
		</c:if>		
			
		
    
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
	
	
		totalPrice();
		
		
		<%-- 총 합계 구하기--%>
		function totalPrice() {
			
			var total_price = 3000;
			
			$("tbody .price").each(function(i, obj){
			
				var jobj = $(obj)
				
				total_price += parseInt(jobj.text());
				
			});
		
			$("#total-price-span").html(total_price);
		}
		
		
		<%-- 증가버튼 --%>
		$(document).on("click",".plus",function(e){
			e.preventDefault();
			var button = $(this);
			var no = $(this).data("no");
			var stock = $(this).data("stock");
			var amount = $(this).data("amount") + 1;
			
			if(amount > stock) {
				fnModal("현재 남아있는 재고량은 " + stock + "개 입니다.")
				return false;
			}
			
			str = "";
			
			$.ajax({
				url : "${contextPath}/basket/update",
				data : { basket_no : no , product_amount : amount},
				datatype : "json",
				method : "post",
				context: this,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success : function(obj) {
						
						jobj = JSON.parse(obj);
						
						$(jobj).each(function(i, jobj){
							
							str += "<td>";
							str += "<img src='${contextPath}/product/productImageShow?product_no=" + jobj.product_no + "&product_file_main=Y class='card-img-top' alt='...' style='width: 85%; height: 150px;'>";
							str += "</td>";
							str += "<td>"+ jobj.product_title + "</td>";
							str += "<td>"+ jobj.product_realprice + "</td>";
							str += "<td>";
							str += "<span id='amount' data-amount='" + jobj.basket_no + "'>" +jobj.product_amount + "</span><br>";
							str += "<input class='btn btn-dark h-50 plus' data-no='" + jobj.basket_no + "' data-amount='" + jobj.product_amount + "' data-stock='" + jobj.product_stock + "' type='button' value='+'>";
							str += "&nbsp;";
							str += "<input class='btn btn-dark h-50 minus' data-no='" + jobj.basket_no + "' data-amount='" + jobj.product_amount + "' data-stock='" + jobj.product_stock + "' type='button' value='-'>";
							str += "</td>";
							str += "<td class='price'>";
							str += "<span id='price-span' data-price='" + jobj.basket_no + "'>" + jobj.product_realprice * jobj.product_amount + "</span>";
							str += "</td>";
							str += "<td>";
							str += "<input class='btn btn-dark h-50 btn-delete sub-hover' data-no='" + jobj.basket_no + "' type='button' id='btn-delete' name='btn-delete' value='삭제'><br>";
							str += "<td>";
							button.closest("tr").html(str);
							totalPrice();
							
						});
						
				},
				fail : function() {
					fnModal("실패");
					return false;
				},
				error : function(request, error) {
					fnModal("에러");
					fnModal("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					return false;
				},
				
			});
			
		});
			
		<%-- 감소버튼 --%>
		$(document).on("click",".minus",function(e){
			var button = $(this);
			var no = $(this).data("no");
			var amount = $(this).data("amount") -1;
			
			if(amount <= 0 ) {
				fnModal("최소 갯수는 1개입니다.");
				return false;
			}
			
			str = "";
				
			$.ajax({
				url : "${contextPath}/basket/update",
				data : { basket_no : no , product_amount : amount},
				datatype : "json",
				method : "post",
				context: this,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success : function(obj) {
						
						jobj = JSON.parse(obj);
						
						$(jobj).each(function(i, jobj){
							
							str += "<td>";
							str += "<img src='${contextPath}/product/productImageShow?product_no=" + jobj.product_no + "&product_file_main=Y class='card-img-top' alt='...' style='width: 85%; height: 150px;'>";
							str += "</td>";
							str += "<td>"+ jobj.product_title + "</td>";
							str += "<td>"+ jobj.product_realprice + "</td>";
							str += "<td>";
							str += "<span id='amount' data-amount='" + jobj.basket_no + "'>" +jobj.product_amount + "</span><br>";
							str += "<input class='btn btn-dark h-50 plus' data-no='" + jobj.basket_no + "' data-amount='" + jobj.product_amount + "' data-stock='" + jobj.product_stock + "' type='button' value='+'>";
							str += "&nbsp;";
							str += "<input class='btn btn-dark h-50 minus' data-no='" + jobj.basket_no + "' data-amount='" + jobj.product_amount + "' data-stock='" + jobj.product_stock + "' type='button' value='-'>";
							str += "</td>";
							str += "<td class='price'>";
							str += "<span id='price-span' data-price='" + jobj.basket_no + "'>" + jobj.product_realprice * jobj.product_amount + "</span>";
							str += "</td>";
							str += "<td>";
							str += "<input class='btn btn-dark h-50 btn-delete sub-hover' data-no='" + jobj.basket_no + "' type='button' id='btn-delete' name='btn-delete' value='삭제'><br>";
							str += "<td>";
							button.closest("tr").html(str);
							totalPrice();
							
						});
						
				},
				fail : function() {
					fnModal("실패");
					return false;
				},
				error : function(request, error) {
					fnModal("에러");
					fnModal("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					return false;
				},
				
			});
			
		});
		
		

		<%-- 삭제버튼 --%>
		$(document).on("click",".btn-delete",function(e){
			e.preventDefault();
			
			var basket_no = $(this).data("no");
			
			$.ajax({
				
				url : "${contextPath}/basket/delete",
				data : { basket_no : basket_no},
				datatype : "text",
				method : "post",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success : function() {
					fnModal("삭제되었습니다.");
				},
				fail : function() {
					fnModal("실패");
					return false;
				},
				error : function(request, error) {
					fnModal("에러");
					fnModal("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					return false;
				}
				
			});
			
			$(this).closest("tr").remove();
			totalPrice();
			check();
		});
		
		
		<%-- 현재 상품이 존재하는지 체크 --%>
		function check(){
			
			var num = 0;
			var str = "";
			
			$("tbody tr").each(function(i, obj){
				num += 1;
			});
			
			
			str += "<tr>";
			str += "<td colspan='6' style='height: 500px'>현재 등록된 상품이 없습니다.</td>";
			str += "</tr>";
			
			if(num == 1) {
				
				var str = "";
				str += "<tr>";
				str += "<td colspan='6' style='height: 500px'>현재 등록된 상품이 없습니다.</td>";
				str += "</tr>";
				
				$("tbody").html(str);
				$(".btn-total-order").remove();
			}
		}
		
		
	function fnModal(e) {
			
			$(".modal-body").html(e);
			if(e != "") {
				$("#myModal").modal("show");
			}
	}
	
	</script> 
	 
	
	
</body>
</html>