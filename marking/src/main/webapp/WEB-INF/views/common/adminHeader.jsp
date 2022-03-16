<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix ="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />
<sec:authentication property="principal" var="principal"/>
<!DOCTYPE html>
<html>
<head>

<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
 
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
	<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet" >
	
	<!-- Bootstrap ICON CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	
	<!-- 제이쿼리 3.6 -->
	<script type="text/javascript" src="${contextPath}/resources/js/jquery3.6/jquery-3.6.0.js"></script>
	
	<!-- 주소api CDN -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
	
	<!-- 메인 CSS -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/header2.css">
	
	<!-- 부트 테이블 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
  
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	
	<!-- 부트 차트 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
	<!-- 결제 api 라이브러리 -->
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
	
	<!-- 부트 스크립트 -->
	<script src="${contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	
	<style type="text/css">
		
		/* 로그인 스타일 */
		.btn-login {
		  font-size: 0.9rem;
		  letter-spacing: 0.05rem;
		  padding: 0.75rem 1rem;
		}
		
		.btn-google {
		  color: white !important;
		  background-color: #ea4335;
		}
		
		.btn-facebook {
		  color: white !important;
		  background-color: #3b5998;
		}
		
		#floatingPassword, #floatingInput {
			font-size: 10px;
			color: red;
		}
		
		.main-hover:hover {
			background-color: #0077C0;
			color: #fff;
			transition: all 0.5s ease 0s;
		}
		
		
		.sub-hover:hover {
			background-color: gray;
			color: #fff;
			transition: all 0.5s ease 0s;
		}
		
		label {
			font-size : 12px;
		}
		
		/* 회원가입*/
		#find-pwd, #find-id-tel{
			display : none;
		}
		
		
		/*boardList 쪽*/
		/*페이징 색상*/
		.page-item.active .page-link{
			  z-index: 3;
			  background-color: #cccccc;
			  border-color: #cccccc;
			  color: black;
			  z-index: 3;
		}
		
		.page-link {
			color : black
		}
		
		
		
		
		
		.board-mobile {
			display: none;
		}
		
		
		@media only screen and ( max-width :768px) {
			.pn-ProductNav_Wrapper, .board-mobile {
				display: block
			}
		}
		
		
		
		
		@media only screen and (max-width: 768px) {
		  .mainmenu , .board-computer{
		    display: none;
		  }
		}
		
		/*게시판*/
		table {
			table-layout: fixed
		}
		
		td {
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;"
		}
		
		/* 상품 등록 css */
		 #main-image-div {
        width: 100%;
        height: 50%;
        background-color: #f2f2f2;
    	}

    	.drop-zone-dragenter, .drop-zone-dragover {
        border: 4px solid blue;
   		 }
   		 
		
	</style>
	
	
<title>Marking</title>
</head>
<body>
	
	<header>
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark p-1 ">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="${contextPath}">Marking</a>
		    <button class="navbar-toggler p-1" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
			

		    <div class="collapse navbar-collapse" id="navbarColor01">
		      <ul class="navbar-nav ms-auto">
		        <%-- 로그인 안한상태 --%>
		        <sec:authorize access="isAnonymous()">
		        <li class="nav-item">
		          <a class="nav-link active" href="${contextPath}/login">로그인</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="${contextPath}/member/join">회원가입</a>
		        </li>
		        </sec:authorize>
		        
		        <%-- 로그인 상태 --%>
		        <sec:authorize access="isAuthenticated()">
		        	<li class="nav-item">
			        	<a class="nav-link active" href="javascript:logout.submit();">로그아웃</a>
			        	<div id="here"></div>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="${contextPath}/basket/list">장바구니</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="${contextPath}/order/list">주문조회</a>
			        </li>
			        
			        <%-- 일반회원 --%>
			        <c:if test="${principal.authorities eq '[ROLE_MEMBER]'}">
			        <li class="nav-item dropdown">
			          <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">나의메뉴</a>
			          <div class="dropdown-menu">
			            <a class="dropdown-item" href="${contextPath}/member/check">회원정보수정</a>
			            <a class="dropdown-item" href="#">미정</a>
			            <a class="dropdown-item" href="#">미정</a>
			            <a class="dropdown-item" href="#">미정</a>
			          </div>
			        </li>
			        </c:if>
			        
			         <%-- 관리자 --%>
			        <sec:authorize access="hasRole('ROLE_ADMIN')">
			        <li class="nav-item dropdown">
			          <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">관리자메뉴</a>
			          <div class="dropdown-menu">
			            <a class="dropdown-item" href="#">회원관리</a>
			            <a class="dropdown-item" href="${contextPath}/product/admin/list">상품관리</a>
			            <a class="dropdown-item" href="#">매출관리</a>
			            <a class="dropdown-item" href="#">관리자등록</a>
			          </div>
			        </li>
			        </sec:authorize>
			        
			        
		        </sec:authorize>

		        <li class="nav-item dropdown">
		          <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
		          <div class="dropdown-menu">
		            <a class="dropdown-item" href="${contextPath}/board/list?board_kind=1">공지사항</a>
		            <a class="dropdown-item" href="${contextPath}/board/list?board_kind=2">자주하는 문의</a>
		            <a class="dropdown-item" href="${contextPath}/board/list?board_kind=3">이벤트 게시판</a>
		            <a class="dropdown-item" href="#">1:1문의 게시판</a>
		          </div>
		        </li>
		      </ul>
		      <form class="d-flex" action="${contextPath}/product/list" method="get" id="form-search">
		        <input class="form-control me-sm-2" type="text" name="keyword" id="keyword" placeholder="Search" maxlength="10">
		        <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="btn-search">
					<i class="bi bi-search"></i>
				</button>
		      </form>
		    </div>
		  </div>
		</nav>
		
		
		
		<div style="width: 100%; height: 48px;"></div>
		
	</header>
	
	
	
<script type="text/javascript">
	$(document).ready(function() {
		$(".btn-logout").on("click", function(e){
			e.preventDefault();
			$("form").submit();
		});
	});
</script>

<!-- 로그아웃 가상돔 스크립트 -->
<script type="text/javascript">
		
	$(document).ready(function() {

		var str = "";

		str += '<form action="/logout" method="POST" name="logout">';
		str += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>';
		str += '</form>';
					
		$("#here").append(str);
		
		
		
		$("#btn-search").on("click", function(e){
			
			e.preventDefault();
			
			var keyword = $("#keyword").val();
			
			if(keyword == "") {
				fnModal("검색어를 입력해주세요.");
				return;
			}
			
			$("#form-search").submit();
		});
		
		
	function fnModal(e) {
			
			$(".modal-body").html(e);
			if(e != "") {
				$("#myModal").modal("show");
			}
	}
					
	});
</script>






