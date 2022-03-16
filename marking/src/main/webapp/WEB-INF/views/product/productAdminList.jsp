<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/adminHeader.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>
	
	
	<div class="container-fluid">
		<div class="card border-0 shadow rounded-3 my-5 p-5">
			<br>
			<br>
			<h2 align="center">상품관리</h2>
			<br>
			<a href="${contextPath}/product/admin/add" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover ms-auto" style="width: 12%">
				상품등록
			</a>
			<br>
			<div>
			<table class="display order-column cell-border fs-7 text-center" id="table_id" style="width: 100%" >
			    <thead>
			        <tr>
			            <th style="width: 6%">번호</th>
			            <th style="width: 10%">카테고리</th>
			            <th style="width: 10%">제목</th>
			            <th style="width: 7%">판매가</th>
			            <th style="width: 6%">할인율</th>
			            <th style="width: 7%">원가</th>
			            <th style="width: 7%">이익</th>
			            <th style="width: 6%">재고량</th>
			            <th style="width: 6%">판매여부</th>
			            <th style="width: 10%">베스트상품</th>
			            <th style="width: 6%">주문수</th>
			            <th style="width: 6%">조회수</th>
			            <th style="width: 10%">등록일</th>
			            <th style="width: 10%">제품삭제</th>
			        </tr>
			    </thead>
			    <tbody id="my-tbody">

			         <c:forEach items="${productInfo}" var="productInfo">
				        <tr>
			            	<td>${productInfo.product_rno}</td>
					       	<td>${fn:substring(productInfo.product_no,0,2) != '01' ? fn:substring(productInfo.product_no,0,2) != '02' ? fn:substring(productInfo.product_no,0,2) != '03' ? '매장용품' : '행거' : '옷걸이' : '마네킹'}</td>
					       	<td>${productInfo.product_title}</td>
					       	<td>${productInfo.product_realprice}</td>
					       	<td>${productInfo.product_dispercent}</td>
					       	<td>${productInfo.product_costprice}</td>
					       	<td>${productInfo.product_profit}</td>
					       	<td>${productInfo.product_stock}</td>
					       	<td>${productInfo.product_salestate}</td>
					       	<td>${productInfo.product_best}</td>
					       	<td>${productInfo.product_order}</td>
					       	<td>${productInfo.product_viewcount}</td>
					       	<td><fmt:formatDate value="${productInfo.product_registdate}" pattern="yyyy-MM-dd"/></td>
					       	<td><button type="button" data-no="${productInfo.product_no}" class="btn btn-danger btn-delete">삭제</button></td>
				        </tr>
			        </c:forEach> 
			    </tbody>
			</table>
			
			</div>
						
							
		</div>
	</div>
	
	
	<form action="${contextPath}/product/admin/delete" method="post" id="frm">
		<input type='hidden' name='product_no' value=''>
	</form>
	
	
	

	<%-- ======================================================== --%>
	<%-- 바디 끝 --%>


	<%-- 푸터 시작 --%>
	<%-- ======================================================== --%>
	
	<%-- ======================================================== --%>
	<%-- 푸터 끝 --%>
	
	 <script defer type="text/javascript">
	 	
	 $(document).ready( function () {
		    $('#table_id').DataTable();
		} );
	
	 </script>
	 
	 <script type="text/javascript">
	 
	 	$(document).ready(function(){
	 		<%--
	 		var csrf_headername = "${_csrf.headerName}"; 
	 		var csrf_token = "${_csrf.token}";
	 		
	 		$(".btn-delete").on("click",function(){
	 			
	 			var product_no = $(this).data("no");
	 			alert(product_no);
	 			$.ajax({
	 				url: "${contextPath}/product/admin/delete",
	 				dataType:"text",
	 				type: "post",
	 				data : { product_no : product_no },
	 				beforeSend : function(xhr) {
						xhr.setRequestHeader(csrf_headername, csrf_token);
					},
	 				success: function(result){
	 					alert(result);
	 				},
	 				fail : function(result) {
	 					alert("실패")
	 				}, 
	 				error : function(request, error) {
						alert("에러");
						alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
	 		});
	 		
	 		
	 	});
	--%>
	 $(document).on("click",".btn-delete",function(e){
		 
		 e.preventDefault();
		 
		 var product_no = $(this).data("no");
		 
		 str = "";
		 str += "<form action='${contextPath}/product/admin/delete' method='post' id='frm'>";
		 str += "<input type='hidden' name='product_no' value='" + product_no + "'>";
		 str += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />";
		 str += "</form>";
		
		 $("#table_id").append(str);
		 
		 $("#frm").submit();
		 
	 });
	 
	 	});
	 	
	 	
	 </script>
	 
	
	
</body>
</html>