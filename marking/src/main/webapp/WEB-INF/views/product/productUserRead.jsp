<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/header.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>
	
	
	<div class="container border-0 shadow rounded-3  p-5 mt-5">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4 text-center">상품 상세페이지</h1>
    <br><br>
  	
  	
	    <!-- Portfolio Item Row -->
	    <div class="row mx-auto">
	     <div class="col-md-1"></div>
	      <div class="col-md-4 border mx-auto mb-5 p-0" style="height: 400px">
	           <img src="${contextPath}/product/productImageShow?product_no=${productInfo.product_no}&product_file_main=Y" class="card-img-top" alt="..." style="width: 100%; height: 100%;">
	         	<%--메인 사진 들어오는곳 --%>	
	      </div>
	  		
	  	  <div class="col-md-1"></div>
	  	  
	      <div class="col-md-5 mx-auto mb-5" >
	      	<c:if test="${productInfo.product_new eq 'Y'}">
				<span class="badge bg-success text-white" style="top: 0.5rem; right: 0.5rem">new</span>
			</c:if>
		
			<c:if test="${productInfo.product_best eq 'Y'}">
				<span class="badge bg-primary text-white" style="top: 0.5rem; right: 0.5rem">best</span>
			</c:if>
			
			<c:if test="${productInfo.product_sale eq 'Y'}">
				<span class="badge bg-info text-white" style="top: 0.5rem; right: 0.5rem">Sale</span>
			</c:if>
			
			<c:if test="${productInfo.product_stock > 0 && productInfo.product_stock <= 10}">
				<span class="badge bg-warning text-white" style="top: 0.5rem; right: 0.5rem">품절임박</span>
			</c:if>		

			<c:if test="${productInfo.product_salestate eq 'N'}">
				<span class="badge bg-danger text-white" style="top: 0.5rem; right: 0.5rem">품절</span>
			</c:if>
			
			
		<form action="" id="frm" name="frm">
  			
	      	
	      	<p class="fs-4 m-0">${productInfo.product_title}</p>
	      	<hr style="border : 1px solid black; margin: 8px 0;">
	      	
	      	<p class="fs-6 my-3">
	      		<b>배송방법</b>
	      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      		택배배송
	      	</p>
	      	<p class="fs-6 my-3">
	      		<b>배송비</b>
	      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      		3000원
	      	</p>
	      	<p class="fs-6 my-3">
	      		<b>판매가</b>
	      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      		<c:choose>
											
					<c:when test="${productInfo.product_sale eq 'N'}">
						<span class="card-text">${productInfo.product_realprice}원</span><br>
					</c:when>
											
					<c:otherwise>
						<span class="card-text text-decoration-line-through">${productInfo.product_saleprice}</span>&nbsp;&nbsp;
						<span class="card-text">${productInfo.product_realprice}원</span><br>
					</c:otherwise>
											
				</c:choose>
	      	</p>
	      	
	      	<div class="hstack gap-3">
				<p class="fs-6 my-3">
		      		<b>수량</b>
		      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      	</p>
		      	<input class="form-control w-25 m-0" type="number" id="product_amount" name="product_amount" step="1" min="1" max="${productInfo.product_stock}" value="0">
		      	
		      	<c:if test="${productInfo.product_stock >= 100}">
					(100개 이상 남음)
				</c:if>	
				
				<c:if test="${productInfo.product_stock < 100}">
					(${productInfo.product_stock}개 남음)
				</c:if>	
				
			</div>
			
			<hr style="border : 1px solid black; margin: 8px 0;">
			<p class="fs-6 my-3">
		      		<b>총 상품금액</b>
		      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    		<span id="total-price">0</span>원 (배송비포함)
		    		
		    </p>
		    
		    <div class="hstack gap-3">
				<button class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-50 mt-3" id="btn-order" type="submit">
					구매하기
				</button>
				<button class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-50 mt-3" id="btn-basket" type="submit">
					장바구니
				</button>
			</div>
		  </form>  
		    
		    
	      </div>
	      
	      <div class="col-md-1"></div>
	      <!--========================================================================  -->
	  	  <div class="form-group row mb-3 ">
	  	  	<div class="col-md-1"></div> 
			 <div class="col-sm-10 mx-auto">
			 <textarea class="form-control" id="product_contents"  name="product_contents" rows="10" style="resize: none;" maxlength="1300">${productInfo.product_contents}</textarea>
			</div>
			<div class="col-md-1"></div>
		  </div>	
		  	
	  	  
	  	  
	   
	   	<div class="form-group row mb-3">
	   		<div class="col-md-1"></div>
			 <div class="col-sm-10 border">
				<div class="container">
					<div class="row sub-image-div" id="sub-image-div">
						<%--서브 사진 들어오는곳 --%>	
						
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		 </div>
	     
	     <%-- 리뷰테이블 --%>
	     <div class="form-group row mb-3">
	   		<div class="col-md-1"></div>
			 <div class="col-sm-10 border">
				<div class="container">
					<!-- 여기 리뷰테이블? -->
				</div>
			</div>
			<div class="col-md-1"></div>
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
	 
		 var product_no = "${productInfo.product_no}";
		 
		 $.getJSON("${contextPath}/product/productSubImageList", { product_no, product_no }, function(arr){
			 
			 str = "";
			 $(arr).each(function(i, pFDto) {
				 
				 var fileCallPath = encodeURIComponent(pFDto.product_file_uploadpath+ "/" + pFDto.product_file_uuid + "_" + pFDto.product_file_name); 
				 
				 str += "<img src='${contextPath}/product/productImageShow?fileName=" + fileCallPath + "' class='card-img-top' alt='...' style='width: 100%; height: 30%;'>";
			 });
			 
			 $("#sub-image-div").append(str);
		 });
	 
	 </script>
	 
	 <script type="text/javascript">
	 	
	 	<%--총 가격 바뀌는 기능--%>
	 	$("#product_amount").on({
		 	keydown : function(){
		 		
		 		var number = $(this).val();
		 		var price = "${productInfo.product_realprice}";
		 		var total = number * price + 3000
		 		if(number == 0){
		 			$("#total-price").html("0");
		 		} else {
		 			$("#total-price").html(total);
		 		}
		 		
		 	},click :  function(){
		 		var number = $(this).val();
		 		var price = "${productInfo.product_realprice}";
		 		var total = number * price + 3000
		 		
		 		if(number == 0){
			 		$("#total-price").html("0");
		 		} else {
		 			$("#total-price").html(total);
		 		}
		 		
		 	},change :  function(){
		 		var number = $(this).val();
		 		var price = "${productInfo.product_realprice}";
		 		var total = number * price + 3000
		 		
		 		if(number == 0){
			 		$("#total-price").html("0");
		 		} else {
		 			$("#total-price").html(total);
		 		}
		 		
		 	}
	 	});
	 	
	 	var csrf_headername = "${_csrf.headerName}"; 
		var csrf_token = "${_csrf.token}";
	 	
	 	
	 	<%-- 주문하기 버튼 --%>
	 	$("#btn-order").on("click", function(e){
	 		
	 		var product_amount = parseInt($("#product_amount").val()); 
	 		var product_stock = parseInt("${productInfo.product_stock}")
	 		var member_id = "${memberInfo.member_id}"
	 		if(product_amount == 0 || isNaN(product_amount)) {
	 			fnModal("수량을 입력해주세요.");
	 			return false;
	 		} else if(product_amount > product_stock) {
	 			fnModal("현재 남아있는 재고량은 " + product_stock + "개 입니다. 다시 입력해주세요.");
				$("#product_amount").val("");
				$("#total-price").html("0");
	 			return false;
	 		} 
	 		
	 		var str = "<input type='hidden' name='product_no' value='${productInfo.product_no}'/>";
	 		
	 		$("#frm").attr("action", "${contextPath}/order");
	 		$("#frm").attr("method", "get");
	 		$("#frm").append(str).submit();
	 	});
	 	
	 	<%-- 장바구니 추가 --%>
	 	$("#btn-basket").on("click", function(e){
	 		
	 		e.preventDefault();
	 		var product_no = "${productInfo.product_no}";
	 		var product_amount = parseInt($("#product_amount").val()); 
	 		var product_stock = parseInt("${productInfo.product_stock}")
	 		var member_id = "${memberInfo.member_id}"
	 		if(product_amount == 0 || isNaN(product_amount)) {
	 			fnModal("수량을 입력해주세요.");
	 			return false;
	 		} else if(product_amount > product_stock) {
	 			fnModal("현재 남아있는 재고량은 " + product_stock + "개 입니다. 다시 입력해주세요.");
				$("#product_amount").val("");
				$("#total-price").html("0");
	 			return false;
	 		}
	 		
			$.ajax({
				
				url : "${contextPath}/basket/add",
				type : "post",
				datatype : "text",
				data : { product_no : product_no , product_amount : product_amount , member_id : member_id},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success : function(data) {
					fnModal(data)
				},
				error : function(request, error) {
					fnModal("에러");
					fnModal("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
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