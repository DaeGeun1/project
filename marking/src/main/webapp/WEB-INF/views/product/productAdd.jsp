<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%-- 헤더 시작 --%>
	<%-- ======================================================== --%>
	<%@ include file="../common/adminHeader.jsp"%>
	<%-- ======================================================== --%>
	<%-- 헤더 끝 --%>


	<%-- 바디 시작 --%>
	<%-- ======================================================== --%>
	
	
	<div class="container border  p-5 mt-5">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4 text-center">상품 등록</h1>
  	<form action="${contextPath}/product/admin/add" method="post" id="form-product-add" name="frm">
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  	
	    <!-- Portfolio Item Row -->
	    <div class="row">
	      <div class="col-md-4 border" style="height: 450px">
	      	<label class="badge bg-dark fs-6 mt-3 p-2" for="main-file">메인사진 첨부</label>
	      	<input class="form-control" type="file" id="main-file" name="filename" style="display: none;">
	         <div class="drop-zone mt-1 text-center align-middle main-image-div" id="main-image-div" style="height: 350px;">
	           
	           <%-- 들어오는 형태
	            <div>
	            	<img alt="..." class="img-fluid" src="/resources/images/logo11.PNG" style="width: 100%; height: 350px">
	            	<button type="button" class="btn-close float-start" aria-label="Close"></button>
	            </div>
	            --%> 
	            파일 선택 또는 <br>
	            이곳에 파일을 드래그해주세요
	            <%-- 메인사진 들어오는곳 --%>
	        </div>
	      </div>
	  		
	  	  <div class="col-md-1"></div>
	  	  
	      <div class="col-md-6">
	      	<div class="mb-2">
				 <label class="form-label fs-6" for="newField">대분류</label>
	             <select class="form-select" id="big_category" name="big_category" aria-label="New Field">
	                <option data-level="0" data-kind="0" data-step="0" value="N">선택해주세요</option>
	                <option data-level="1" data-kind="1" data-step="0" value="01">마네킹</option>
	                <option data-level="1" data-kind="2" data-step="0" value="02">옷걸이</option>
	                <option data-level="1" data-kind="3" data-step="0" value="03">행거</option>
	                <option data-level="1" data-kind="4" data-step="0" value="04">매장용품</option>
	                
	            </select>
			</div>
			<div class="mb-2">
				 <label class="form-label fs-6" for="newField">중분류</label>
	            <select class="form-select" id="middle_category" name="middle_category" aria-label="New Field">
	                <option data-level="0" data-kind="0" data-step="0" value="N">선택해주세요</option>
	                
	            </select>
			</div>
			<div class="mb-2">
				 <label class="form-label fs-6" for="newField">소분류</label>
	            <select class="form-select" id="small_category" name="small_category" aria-label="New Field">
	                <option data-level="0" data-kind="0" data-step="0" value="N">선택해주세요</option>
	            </select>
			</div>
	        <div class="form-floating mb-2">
				<input type="text" class="form-control" id="product_title" name="product_title" placeholder="text" maxlength="33"> 
				<label for="product_title">상품 제목</label>
			</div>
			<div class="form-floating mb-2">
				<input type="text" class="form-control" id="product_saleprice" name="product_saleprice" placeholder="text" maxlength="10"> 
				<label for="product_saleprice">상품 원 판매가</label>
			</div>
			<div class="form-floating mb-2">
				<input type="text" class="form-control" id="product_dispercent" name="product_dispercent" placeholder="text" maxlength="3"> 
				<label for="product_dispercent">상품 할인율 (0~100%)</label>
			</div>
			<div class="form-floating mb-2">
				<input type="text" class="form-control" id="product_costprice" name="product_costprice" placeholder="text" maxlength="10"> 
				<label for="product_costprice">상품 원가</label>
			</div>
			<div class="form-floating mb-2">
				<input type="text" class="form-control pe-none bg-white" id="product_realprice" name="product_realprice" placeholder="text" maxlength="10" readonly="readonly"> 
				<label for="product_realprice">상품 실제 판매가</label>
			</div>
			<div class="form-floating mb-2">
				<input type="text" class="form-control" id="product_stock" name="product_stock" placeholder="text" maxlength="10"> 
				<label for="product_stock">상품 재고량</label>
			</div>
	      </div>
			 <label for="product_contents" class="col-sm-2 col-form-label align-middle fw-bolder mt-5" >상품 내용</label>
	  	  <div class="form-group row mb-3 ">
			 <div class="col-sm-12">
			 <textarea class="form-control" id="product_contents"  name="product_contents" rows="10" style="resize: none;" maxlength="1300"></textarea>
			</div>
		  </div>	
		  	<span>
		  	<label class="badge bg-dark fs-6 mt-3 p-2 float-end" for="sub-file">사진 첨부</label>
		  	
		  	</span>
	  	  
	  	  <div class="form-group row mb-3 ">
			 <div class="col-sm-12">
	      	 <input class="form-control" type="file" id="sub-file" name="filename" style="display: none;" multiple>
			</div>
		  </div>		
	   </div>
	   
	   	<div class="form-group row mb-3">
			 <div class="col-sm-12 border border-2">
				<div class="container">
					<div class="row sub-image-div" id="sub-image-div">
						<%--서브 사진 들어오는곳 --%>				       
					</div>
				</div>
			</div>
		 </div>
	    <!-- /.row -->
	  	<div class="hstack gap-3 w-50 ms-auto" id="btn-product-add">
			<input type="submit" value="글 등록" class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-50" id="btn-computer-board-add">
			<a href="#" class="w-50">
				<input type="button" value="취소" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
			</a>
		</div>
		
		
	    <!-- Related Projects Row -->
  		
  	</form>
    
  
  </div>
  <!-- /.container -->

	<%-- ======================================================== --%>
	<%-- 바디 끝 --%>


	<%-- 푸터 시작 --%>
	<%-- ======================================================== --%>
	
	<%-- ======================================================== --%>
	<%-- 푸터 끝 --%>
	
	 <script defer type="text/javascript">
	 	
	 
	 <%-- ================================================================= --%>
	 <%-- 대분류 중분류 소분류 db에서 꺼내오는 동작들	 --%> 
	 
		<%-- 대분류 선택시 중분류 변경 로직 --%>
	 	$("#big_category").on("change",function(){
	 		
	 		var level = $("#big_category option:selected").data("level");
	 		var kind = $("#big_category option:selected").data("kind");
	 		var step = $("#big_category option:selected").data("step");
	 		$.ajax({
	 			url : "${contextPath}/product/categoryList",
	 			data : { level : level , kind : kind , step : step },
	 			dataType : "json",
	 			type : "GET",
	 			success : function(result ) {
	 				showMiddleCategory(result);  <%-- 중분류 변경 --%>
	 			},
	 			fail : function(result) {
	 				alert("실패");
	 			},
	 			error : function(request, error) {
	 				alert("에러");
	 				alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	 			}
	 			
	 		});
	 	});
	 	
	 	<%-- 중분류 선택시 소분류 변경 로직 --%>
		$("#middle_category").on("change",function(){
	 		
	 		var level = $("#middle_category option:selected").data("level");
	 		var kind = $("#middle_category option:selected").data("kind");
	 		var step = $("#middle_category option:selected").data("step");
	 		$.ajax({
	 			url : "${contextPath}/product/categoryList",
	 			data : { level : level , kind : kind , step : step },
	 			dataType : "json",
	 			type : "GET",
	 			success : function(result ) {
	 				showSmallCategory(result); <%--  소분류 변경 --%>
	 				
	 			},
	 			fail : function(result) {
	 				alert("실패");
	 			},
	 			error : function(request, error) {
	 				alert("에러");
	 				alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	 			}
	 			
	 		});
	 	});
	 	
		<%-- 대분류 선택시 중분류 선택하는 로직 --%>
	 	function showMiddleCategory(arr) {
	 		
	 		var str = ""
	 		str += "<option data-level='0' data-kind='0' data-step='0' value='N'>선택해주세요</option>";
	 		
	 		<%-- 값이 없으면 선택하시요만 출력   대분류 선택하시오 선택시 작동 --%>
	 		if(!arr || arr.length == 0) { 
	 			$("#middle_category").html(str);  <%-- 중분류 초기화 --%>
	 			$("#small_category").html(str);   <%-- 소분류 초기화 --%>
	 			return false;
		    }
	 		
	 		<%--  대분류 선택시 자동으로 소분류 초기화 --%>
	 		$("#small_category").html(str);
	 		
	 		$(arr).each(function(i, arr){
	 			
	 			str +="<option data-level='" + arr.category_level + "' data-kind='" + arr.category_kind +  "' data-step='" + arr.category_step + "' value='" + arr.category_number + "'>" + arr.category_name + "</option>";                                  
	 			
	 		}); <%-- each --%>
	 		
	 		<%--  대분류 선택시 해당하는 중분류 카테고리 출력 --%>
	 		$("#middle_category").html(str);
	 	}
	 	
	 	<%-- 중분류 선택시 소분류 선택하는 로직 --%>
		function showSmallCategory(arr) {
	 		
	 		var str = ""
	 		str += "<option data-level='0' data-kind='0' data-step='0' value='N'>선택해주세요</option>";
			
	 		<%-- 값이 없으면 선택하시요만 출력   중분류 선택하시오 선택시 작동 --%>
	 		if(!arr || arr.length == 0) { 
	 			$("#small_category").html(str); <%-- 소분류 초기화 --%>
	 			return false;
		    }
	 		
	 		
	 		$(arr).each(function(i, arr){
	 			
	 			str +="<option data-level='" + arr.category_level + "' data-kind='" + arr.category_kind +  "' data-step='" + arr.category_step + "' value='" + arr.category_number + "'>" + arr.category_name + "</option>";                                  
	 			
	 		}); <%-- each --%>
	 		$("#small_category").html(str);
	 	}
	 
		<%-- 일종의 확인용도
		$("#small_category").on("change",function(){
			var step1 = $("#big_category option:selected").val();
			var step2 = $("#middle_category option:selected").val();
			var step3 = $("#small_category option:selected").val();
			
			
			alert(step1 + step2 + step3);
		});
		 --%>
		<%-- =================================================================== --%>
		
		var num_reg  = /^[0-9]*$/;           <%--  숫자만 --%>
			
		<%-- 실제 판매가 구하는 로직 --%>
		$("#product_saleprice").on("blur",function(){
			var saleprice = $(this).val();
			var dispercent = $("#product_dispercent").val();
			
			if(!num_reg.test(saleprice)) {
				fnModal("원 판매가는 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_saleprice").val("");           <%-- 원 판매가 초기화 --%>
				$("#product_realprice").val("");           <%-- 실제 판매가 초기화 --%>
				return false;
			} else if(!num_reg.test(dispercent)) {
				fnModal("할인률은 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_dispercent").val("");          <%-- 할인율 초기화 --%>
				$("#product_realprice").val("");           <%-- 실제 판매가 초기화  --%>
				return false;
			} else if(dispercent < 0 || dispercent > 100) {
				fnModal("0~100(%)값을 입력해주세요.");
				$("#product_dispercent").val("");          <%-- 할인율 초기화 --%>
				$("#product_realprice").val("");           <%-- 실제 판매가 초기화  --%>
				return false;
			}
			
			
			if(dispercent != "") {
				var realprice = Math.ceil(saleprice * (1- dispercent / 100));
				$("#product_realprice").val(realprice);
			}
			
		});	
		
		<%-- 실제 판매가 구하는 로직 --%>
		$("#product_dispercent").on("blur",function(){
			var saleprice = $("#product_saleprice").val();
			var dispercent = $(this).val();
			
			if(!num_reg.test(saleprice)) {
				fnModal("원 판매가는 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_saleprice").val("");           <%-- 원 판매가 초기화 --%>
				$("#product_realprice").val("");           <%-- 실제 판매가 초기화 --%>
				return false;
			} else if(!num_reg.test(dispercent)) {
				fnModal("할인률은 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_dispercent").val("");          <%-- 할인율 초기화 --%>
				$("#product_realprice").val("");           <%-- 실제 판매가 초기화  --%>
				return false;
			} else if(dispercent < 0 || dispercent > 100) {
				fnModal("할인율은 0~100(%)값만 입력해주세요.");
				$("#product_dispercent").val("");          <%-- 할인율 초기화 --%>
				$("#product_realprice").val("");           <%-- 실제 판매가 초기화  --%>
				return false;
			}
			
			if(saleprice != "") {
				var realprice = Math.ceil(saleprice * (1- dispercent / 100));
				$("#product_realprice").val(realprice);
			}
		});	
		
		
		<%-- ===========================================================
			
		<%-- 모달창 기능 --%>
		function fnModal(e) {
			
			$(".modal-body").html(e);
			if(e != "") {
				$("#myModal").modal("show");
			}
		};	
		
		
		var num_reg  = /^[0-9]*$/;           <%--  숫자만 --%>
			
		<%-- 상품 등록 유효성 체크 --%>
		$("#btn-product-add").on("click", function(e){
			e.preventDefault;
			
			var big_category = $("#big_category option:selected").val();
			var middle_category = $("#middle_category option:selected").val();
			var small_category = $("#small_category option:selected").val();
			var title = $("#product_title").val();
			var saleprice = $("#product_saleprice").val();
			var dispercent = $("#product_dispercent").val();
			var costprice = $("#product_costprice").val();
			var realprice = $("#product_realprice").val();
			var stock = $("#product_stock").val();
			var contents = $("#product_contents").val();
			var main_image = $("#main-file").val();
			
			
			if(big_category == "N") {
				fnModal("대분류를 선택해주세요.");
				return false;
			} else if(middle_category == "N") {
				fnModal("중분류를 선택해주세요.");
				return false;
			} else if(small_category == "N") {
				fnModal("소분류를 선택해주세요.");
				return false;
			} else if(title == "") {
				fnModal("상품 제목을 입력해주세요.");
				return false;
			} else if(saleprice == "") {
				fnModal("원 판매가를 입력해주세요.");
				return false;
			} else if(!num_reg.test(saleprice)) {
				fnModal("원 판매가는 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_saleprice").val("");
				return false;
			} else if(dispercent == "") {
				fnModal("할인률을 입력해주세요.");
				return false;
			} else if(!num_reg.test(dispercent)) {
				fnModal("할인률은 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_dispercent").val("");
				return false;
			} else if(dispercent < 0 || dispercent > 100) {
				fnModal("할인율은 0~100(%)값만 입력해주세요.");
				$("#product_dispercent").val("");          
				return false;
			} else if(costprice == "") {
				fnModal("상품 원가를 입력해주세요.");
				return false;
			} else if(!num_reg.test(costprice)) {
				fnModal("상품 원가는 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_costprice").val("");
				return false;
			} else if(realprice == "") {
				fnModal("원 판매가 또는 할인율을 다시 입력해주세요.");
				return false;
			} else if(stock == "") {
				fnModal("재고량을 입력해주세요.");
				return false;
			} else if(!num_reg.test(stock)) {
				fnModal("재고량은 숫자만 입력가능합니다.(소수점x/음수x)");
				$("#product_stock").val("");
				return false;
			} else if(contents == "") {
				fnModal("상품내용을 입력해주세요.");
				return false;
			}
			
			fileAdd(e);
			
			
		});
		
		
		<%-- ===============================================
		<%-- 상품등록	 --%>
		function fileAdd(e){
			e.preventDefault();
		
			var str = "";
		
			$("#main-image-div div").each(function(i, obj){
				var jobj = $(obj);
				str += "<input type='hidden' name='productMainFileList["+i+"].product_file_name' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='productMainFileList["+i+"].product_file_uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='productMainFileList["+i+"].product_file_uploadpath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='productMainFileList["+i+"].product_file_main' value='"+ jobj.data("main")+"'>";
			
			});
			
			$("#sub-image-div div").each(function(i, obj){
				var jobj = $(obj);
				str += "<input type='hidden' name='productSubFileList["+i+"].product_file_name' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='productSubFileList["+i+"].product_file_uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='productSubFileList["+i+"].product_file_uploadpath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='productSubFileList["+i+"].product_file_main' value='"+ jobj.data("main")+"'>";
			});
			
			$("#form-product-add").append(str).submit();
		}
		
		<%-- =============================================================== --%>
		<%-- 드래그 앤 드랍 (메인 이미지) --%>
			
		var csrf_headername = "${_csrf.headerName}"; 
		var csrf_token = "${_csrf.token}";
			
			
		(function() {
            
            var mainFile = document.getElementById("main-file") <%-- input file value값 --%>
            var dropZone = document.querySelector(".drop-zone")  <%-- img가 뿌려질 공간 --%>

            var toggleClass = function(className) {
                
                console.log("current event: " + className)

                var list = ["dragenter", "dragleave", "dragover", "drop"]

                for (var i = 0; i < list.length; i++) {
                    if (className === list[i]) {
                        dropZone.classList.add("drop-zone-" + list[i])
                    } else {
                        dropZone.classList.remove("drop-zone-" + list[i])
                    }
                }
            }
           

            <%-- 드래그한 파일이 최초로 진입했을 때 --%>
            dropZone.addEventListener("dragenter", function(e) {
                e.stopPropagation()
                e.preventDefault()

                toggleClass("dragenter")

            })

           <%-- 드래그한 파일이 dropZone 영역을 벗어났을 때 --%>
            dropZone.addEventListener("dragleave", function(e) {
                e.stopPropagation()
                e.preventDefault()

                toggleClass("dragleave")

            })

            <%-- 드래그한 파일이 dropZone 영역에 머물러 있을 때 --%>
            dropZone.addEventListener("dragover", function(e) {
                e.stopPropagation()
                e.preventDefault()

                toggleClass("dragover")

            })
            
			<%-- 파일첨부를 직접하였을때 --%>
            mainFile.addEventListener("change", function(e) {
                
            	mainImageUpload(e.target.files);
            })
            
            <%-- 드래그한 파일이 드랍되었을 때 --%>
            dropZone.addEventListener("drop", function(e) {
                e.preventDefault()

                toggleClass("drop")

                var files = e.dataTransfer && e.dataTransfer.files

                if ( files.length > 1){  <%-- 메인이미지는 하나만 --%>
                	fnModal("메인사진은 하나만 등록이 가능합니다.");
                	return false;
                }
                   
                mainFile.files = files; <%-- 이곳이 input파일 value 변경해주는 것  --%>  
               	
               	mainImageUpload(files);
       		})

        })();
		
		<%-- 메인 이미지 업로드 --%>
		function mainImageUpload(e) {
			var formData = new FormData();
       		
       		var inputFile = $("#main-file");
       		
       		var inputFiles = inputFile[0].files;
       		
       		for(var i = 0 ; i < inputFiles.length; i++) {
       			
       			if(!imageCheck(inputFiles[i])){  <%-- 메인이미지 유효성 검사 --%>
    				return false;
    			}
       			
       			formData.append("uploadFile", inputFiles[i]);
       		}
           	
       		$.ajax({
       			url: "${contextPath}/product/productFileAdd",
       			processData: false, 
       			contentType: false,
       			data: formData,
       			type: "POST",
       			dataType:"json",
       			beforeSend : function(xhr) {
       				xhr.setRequestHeader(csrf_headername, csrf_token);
       			},
       			success: function(result){
       				showMainImage(result)
  				return;
       			}
       		}); 
           	
           	
             return;
		}
		
		
		<%-- 메인 이미지 유효성 체크 --%>
		function imageCheck(e) {
			var maxSize = 5242880; <%-- 5MB --%>
			
			if (e != null) {
                
			    if (!e.type.match(/image.*/)) {
                    fnModal("이미지 파일만 업로드 가능합니다.");
                    return false;
                } else if (e.size > maxSize) {
                    fnModal("5mb이상의 용량은 업로드할 수 없습니다.");
                    return false;
                }
			}
			
			return true;
		}
		
		
		<%-- 메인이미지 보여주기 --%>
		function showMainImage(e){
			
			if(!e || e.length == 0) { 
		    	return false;
		    }
			
			var str = "";
			
			$(e).each(function(i, obj) {
					
				<%-- 글 등록시에 썸네일 이미지는 생성하되 뿌리는건 본 이미지 사진깨짐 --%>
				var fileCallPath = encodeURIComponent(obj.product_file_uploadpath+ "/" + obj.product_file_uuid + "_" + obj.product_file_name);
				var deletePath = encodeURIComponent(obj.product_file_uploadpath+ "/s_" + obj.product_file_uuid + "_" + obj.product_file_name);
				
				str += "<div"
				str += " data-path='" + obj.product_file_uploadpath + "' data-uuid='" + obj.product_file_uuid + "' data-filename='" + obj.product_file_name + "' data-main='Y' >"
				str += "<img src='${contextPath}/product/productImageShow?fileName=" + fileCallPath + "' class='img-thumbnail' alt='...' style='width: 100%; height:350px'>"
				str += "<button type='button' class='btn-close float-start' "
				str += "data-file=\'" + deletePath + "\'></button>"
				str += "</div>"
				
			});
			
			$("#main-image-div").html(str);  
		}
		
		
		<%-- 메인 사진 삭제 기능 --%>
		$("#main-image-div").on("click", "button", function(e) {
		    
			console.log("delete file");
			      
			var targetFile = $(this).data("file");
			var targetdiv = $(this).closest("div");   <%--  가장 가까운 div --%>
			    
			$.ajax({
				url: "${contextPath}/product/productFileDelete",
				data: {fileName: targetFile},
				dataType:"text",
				type: "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success: function(result){
					targetdiv.remove();
					$("#main-image-div").html("파일 선택 또는 <br> 이곳에 파일을 드래그해주세요");
				}
			}); 
		});
		
		
		
		<%-- ======================================================================================== --%>
		<%-- 서브 이미지 --%>
		
		
		$("#sub-file").on("change",function(e){
			
			subImageUpload(e)
			
		});
		
		
		<%-- 서브 이미지 업로드 --%>
		function subImageUpload(e) {
			var formData = new FormData();
       		
       		var inputFile = $("#sub-file");
       		
       		var inputFiles = inputFile[0].files;
       		
       		for(var i = 0 ; i < inputFiles.length; i++) {
       			
       			if(!imageCheck(inputFiles[i])){
    				return false;
    			}
       			
       			formData.append("uploadFile", inputFiles[i]);
       		}
           	
           	
       		$.ajax({
       			url: "${contextPath}/product/productFileAdd",
       			processData: false, 
       			contentType: false,
       			data: formData,
       			type: "POST",
       			dataType:"json",
       			beforeSend : function(xhr) {
       				xhr.setRequestHeader(csrf_headername, csrf_token);
       			},
       			success: function(result){
       				showSubImage(result)
  				return;
       			}
       		}); 
           	
             return;
		}
		
		
		<%-- 서브이미지 보여주기 --%>
		function showSubImage(e){
			
			if(!e || e.length == 0) { 
		    	return false;
		    }
			
			var str = "";
			
			$(e).each(function(i, obj) {
					
				var fileCallPath = encodeURIComponent(obj.product_file_uploadpath+ "/s_" + obj.product_file_uuid + "_" + obj.product_file_name);
				
				str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative'"
				str += " data-path='" + obj.product_file_uploadpath + "' data-uuid='" + obj.product_file_uuid + "' data-filename='" + obj.product_file_name + "' data-main='N' >"
				str += "<img src='${contextPath}/product/productImageShow?fileName=" + fileCallPath + "' class='img-thumbnail' alt='...' style='width: 200px; height:200px'>"
				str += "<button type='button' class='btn-close top-5 position-absolute' "
				str += "data-file=\'" + fileCallPath + "\'></button>"
				str += "</div>"
				
			});
				$("#sub-image-div").append(str);  
		}
		
		
		<%--서브 사진 삭제 기능--%>
		$("#sub-image-div").on("click", "button", function(e) {
		    
			<%--console.log("delete file");  디버깅용--%>
			      
			var targetFile = $(this).data("file");
			var targetdiv = $(this).closest("div");   
			    
			$.ajax({
				url: "${contextPath}/product/productFileDelete",
				data: {fileName: targetFile},
				dataType:"text",
				type: "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrf_headername, csrf_token);
				},
				success: function(result){
					targetdiv.remove();
				}
			}); 
		});
		

		
		
	 </script>
	
</body>
</html>