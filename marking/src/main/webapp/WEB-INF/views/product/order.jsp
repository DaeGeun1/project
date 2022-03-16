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
			<div class="col-sm-9 col-md-7 col-lg-7 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2 class="card-title text-center mb-5 fw-bold fs-2">주문하기</h2>

						<h4 class="card-title mb-3 fw-bold fs-4">정보 입력</h4>
						
						<form action="${contextPath}/order/add" method="post" name="frm">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="order_recipient" name="order_recipient" placeholder="text" maxlength="20"> 
								<label for="order_recipient">수령인</label>
							</div>
							
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white w-50 float-start" id="order_post" name="order_post" placeholder="text" maxlength="10" readonly> 
								<input class="btn btn-dark  btn-login fw-bold sub-hover" style="width: 45%; height: 58px; margin-left: 5%" value="주소찾기" type="button" onclick="post_zip()"/>
								<label for="order_post">우편번호</label>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white" id="order_basic_address" name="order_basic_address" placeholder="text" maxlength="33" readonly> 
								<label for="order_basic_address">기본 주소</label>
								
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="order_detail_address" name="order_detail_address" placeholder="text" maxlength="33"> 
								<label for="order_detail_address">상세 주소(선택가능)</label>
							</div>
							
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="order_tel" name="order_tel" placeholder="text" maxlength="11"> 
								<label for="order_tel">전화번호 ( - 제외한 숫자 10~11자리)</label>
							</div>
							
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="order_message" name="order_message" placeholder="text" maxlength="11"> 
								<label for="order_message">배송시 요청사항을 적어주세요</label>
							</div>
							
							<div class="form-floating mb-2">
								<div class="d-grid mb-3">
									<input type="submit" value="나의 배송지 불러오기" class="btn btn-dark btn-login text-uppercase fw-bold main-hover float-end w-50" id="load-user-info">
								</div>
							</div>
							
							<hr class="dropdown-divider my-3" />
							<h4 class="card-title mb-3 fw-bold fs-4">상품 정보</h4>
							<div>
								
								<c:if test="${!empty productInfo}">
										<input type="hidden" class="form-control" id="member_id" name="member_id" value="${memberInfo.member_id}"> 
										<input type="hidden" class="form-control product_no" id="product_no" name="product_no" value="${productInfo.product_no}"> 
										<input type="hidden" class="form-control product_amount" id="product_amount" name="product_amount" value="${amount}" > 
										<div class="row m-3 border p-1">
											<div class="col-md-5">
												<img class="img-fluid rounded mb-3 mb-md-0" src="${contextPath}/product/productImageShow?product_no=${productInfo.product_no}&product_file_main=Y" alt="" style="width : 100%;  height: 150px;">
											</div>
											<div class="col-md-7 align-middle">
											  <h4>${productInfo.product_title}</h4>
											  <p>수량 : ${amount}</p>
											  <p>가격 : <span class="product-price">${productInfo.product_realprice * amount}</span>원 </p>
											</div>
										</div>
									
								</c:if>
								
								<c:if test="${!empty basketList}">
									
									<c:forEach items="${basketList}" var="basketList">
										<input type="hidden" class="form-control" id="member_id" name="member_id" value="${memberInfo.member_id}"> 
										<input type="hidden" class="form-control product_no" id="product_no" name="product_no" value="${basketList.product_no}"> 
										<input type="hidden" class="form-control product_amount" id="product_amount" name="product_amount" value="${basketList.product_amount}" > 
										<div class="row m-3 border p-1">
											<div class="col-md-5">
												<img class="img-fluid rounded mb-3 mb-md-0 " src="${contextPath}/product/productImageShow?product_no=${basketList.product_no}&product_file_main=Y" alt="" style="width : 100%;  height: 150px;">
											</div>
											<div class="col-md-7 align-middle">
											  <h4>${basketList.product_title}</h4>
											  <p>수량 : ${basketList.product_amount}</p>
											  <p>가격 : <span class="product-price">${basketList.product_realprice * basketList.product_amount}</span>원 </p>
											</div>
										</div>
									
									</c:forEach>
									
								</c:if>
								
							</div>
							
							<%--  원본
							<div>
							   <div class="row m-3 border p-1">
							      <div class="col-md-5">
							          <img class="img-fluid rounded mb-3 mb-md-0 h-100" src="https://via.placeholder.com/700x300" alt="" style="height: 150px;">
							      </div>
							      <div class="col-md-7">
							        <h4>상품이름</h4>
							        <p>수량 : 0</p>
							        <p class="product-price">가격 : <span class="product-price">0000</span>원 </p>
							      </div>
							    </div>
							    
							    <div class="row m-3 border p-1">
							      <div class="col-md-5">
							          <img class="img-fluid rounded mb-3 mb-md-0 h-100" src="https://via.placeholder.com/700x300" alt="">
							      </div>
							      <div class="col-md-7">
							        <h4>상품이름</h4>
							        <p>수량 : 0</p>
							        <p class="product-price">가격 : <span class="product-price">0000</span>원 </p>
							      </div>
							    </div>
							 </div> 
							 --%> 
							  <div class="p-1 text-end">
							  	 <Strong>총 금액 : <span class="total-price">0000</span>원 (배송비 포함)</Strong>
							  </div>
							
							<hr class="dropdown-divider my-5" />
							
							
							
							<div class="d-grid mb-3">
								<input type="button" value="결제하기" class="btn btn-dark btn-login text-uppercase fw-bold main-hover" id="btn-login" onclick="pay()">
							</div>
							<div class="d-grid">
								<button class="btn btn-dark btn-login text-uppercase fw-bold sub-hover" type="submit">
									취소
								</button>
							</div>
						</form>
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
		
	
		totalPrice();
	
	
		var csrf_headername = "${_csrf.headerName}"; 
		var csrf_token = "${_csrf.token}";
	
		<%-- 지도 --%>
		function post_zip() {
		   	
			new daum.Postcode({
		    	oncomplete: function(data) {
			    
				    document.getElementById("order_post").value = data.zonecode; // 주소 넣기
				    document.getElementById("order_basic_address").value = data.address; // 주소 넣기
				    document.querySelector("input[name=order_detail_address]").focus(); //상세입력 포커싱
			    }
			   }).open();
		};
		
		
	
		<%-- 총 합계 구하기--%>
		function totalPrice() {
			
			var total_price = 3000;
			
			$("div .product-price").each(function(i, obj){
				var jobj = $(obj)
				
				total_price += parseInt(jobj.text());
				
			});
		
			$(".total-price").html(total_price);
		}
		
		$("#load-user-info").on("click",function(e){
			e.preventDefault();
			
			var order_recipient = "${memberInfo.member_name}";
			var order_post =  "${memberInfo.member_post}";
			var order_basic_address = "${memberInfo.member_basicaddress}";
			var order_detail_address = "${memberInfo.member_detailaddress}";
			var order_tel = "${memberInfo.member_tel}";
			
			$("#order_recipient").val(order_recipient);
			$("#order_post").val(order_post);
			$("#order_basic_address").val(order_basic_address);
			$("#order_detail_address").val(order_detail_address);
			$("#order_tel").val(order_tel);
		});
		
		
		function pay(){
			
			var member_id = $("#member_id").val();
			var order_recipient = $("#order_recipient").val();
			var order_post = $("#order_post").val();
			var order_basic_address = $("#order_basic_address").val();
			var order_detail_address = $("#order_detail_address").val();
			var order_tel = $("#order_tel").val();
			var order_message = $("#order_message").val();
			var order_delivery_fee = "3000";
			var order_total_price = $(".total-price").text();
			var product_no ="";
			
			
			if(order_recipient == "") {
				fnModal("수령인 정보를 입력해주세요");
				return false;
			} else if(order_post == "" || order_basic_address == "") {
				fnModal("배송받으실 주소를 입력해주세요");
				return false;
			} else if(order_tel == "") {
				fnModal("수령인 연락처를 입력해주세요");
				return false;
			}
			
			
			
			
			
			$(".product_no").each(function(){
				product_no += $(this).val();
				product_no += ",";
			});
			
			product_no = product_no.slice(0, -1);
			
			var product_amount ="";
			
			$(".product_amount").each(function(){
				product_amount += $(this).val();
				product_amount += ",";
			});
			
			product_amount = product_amount.slice(0, -1);
			
			var jobj = {   member_id : member_id
				          ,product_no : product_no 
				          ,product_amount : product_amount 
				          ,order_recipient : order_recipient 
				          ,order_post : order_post 
				          ,order_basic_address : order_basic_address 
				          ,order_detail_address : order_detail_address 
				          ,order_tel : order_tel 
				          ,order_message : order_message 
				          ,order_delivery_fee : order_delivery_fee 
				          ,order_total_price : order_total_price 
			}
			
			$.ajax({
				
				url : "${contextPath}/order/add",
				method : "post",
				data : jobj,
				datatype : "json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success : function(data) {
					order_no = data
					BootPay.request({
						price: order_total_price, <%--실제 결제되는 가격--%>
						application_id: "61eaaf23e38c30001f7b853b",
						name: '상품', <%--결제창에서 보여질 이름00001--%>
						pg: '',
						method: '', <%--결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.--%>
						show_agree_window: 0, <%-- 부트페이 정보 동의 창 보이기 여부--%>
						items: [
							{
								item_name: '나는 아이템', <%--상품명--%>
								qty: 1, <%--수량--%>
								unique: '123', <%--해당 상품을 구분짓는 primary key--%>
								price: 100, <%--상품 단가--%>
							}
						],
						user_info: {
							username: order_recipient,
							post: order_post,
							addr1: order_basic_address,
							addr2: order_detail_address,
							phone: order_tel
						},
						order_id: order_no, <%--고유 주문번호로, 생성하신 값을 보내주셔야 합니다.--%>
						params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
						account_expire_at: '2020-10-25', <%-- 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )--%>
						extra: {
						    start_at: '', <%-- 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급--%>
							end_at: '', <%-- 정기결제 만료일 -  기간 없음 - 무제한--%>
					        vbank_result: 1, <%-- 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)--%>
					        quota: '0,2,3', <%-- 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용,--%>
							theme: 'red', <%-- [ red, purple(기본), custom ]--%>
							custom_background: '#00a086', <%-- [ theme가 custom 일 때 background 색상 지정 가능 ]--%>
							custom_font_color: '#ffffff' <%-- [ theme가 custom 일 때 font color 색상 지정 가능 ]--%>
						}
					}).error(function (data) {
						<%--결제 진행시 에러가 발생하면 수행됩니다.--%>
						console.log("에러");
						console.log(data);
					}).cancel(function (data) {
						<%--결제가 취소되면 수행됩니다.--%>
						
						console.log("취소");
						deleteOrder(order_no);  <%--db 삭제 요청--%>
						console.log(data);
					}).ready(function (data) {
						<%-- 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.--%>
						console.log("계좌");
						console.log(data);
					}).confirm(function (data) {
						<%--결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.--%>
						<%--주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.--%>
						console.log(data);
						var enable = true; <%-- 재고 수량 관리 로직 혹은 다른 처리--%>
						if (enable) {
							BootPay.transactionConfirm(data); <%-- 조건이 맞으면 승인 처리를 한다.--%>
						} else {
							BootPay.removePaymentWindow(); <%-- 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.--%>
						}
					}).close(function (data) {
						<%-- 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)--%>
					    console.log("결제창 닫힌다");
					    console.log(data);
					}).done(function (data) {
						<%--결제가 정상적으로 완료되면 수행됩니다--%>
						<%--비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.--%>
						console.log("결제 성공");
						console.log(data);
						location.href = "${contextPath}/order/list?message=1";
					});
					
					return false;
					
				},
				fail : function() {
				 	fnModal("실패")
				},
				error : function(request, error) {
					fnModal("에러");
					fnModal("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
				
			});
			
			return false;
		}
		
		
		
		function deleteOrder(order_no) {
			
			$.ajax({
				
				url : "${contextPath}/order/delete",
				data : { order_no : order_no },
				datatype : "json",
				method : "post",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success : function(data) {
					fnModal(data)
				},
				fail : function() {
				 	fnModal("실패")
				},
				error : function(request, error) {
					fnModal("에러");
					fnModal("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
				
			});
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