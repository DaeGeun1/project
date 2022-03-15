<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 시작 -->
<!-- ======================================================== -->
<%@ include file="../common/header.jsp" %>
<!-- ======================================================== -->
<!-- 헤더 끝 -->


<!-- 바디 시작 -->
<!-- ======================================================== -->
	<div class="board-computer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
					<div class="card border-0 shadow rounded-3 my-5">
						<div class="card-body p-0 p-sm-5">
							<h2 class="card-title text-center mb-5 fw-bold fs-2">${boardInfo.board_kind != "1" ? boardInfo.board_kind != "2" ? "이벤트 게시판 수정하기" : "FAQ 수정하기" : "공지사항 수정하기"}</h2>
							
								<form action="${contextPath}/board/modify" method="post" name="" id="form-computer-board-modify">
									<input type="hidden"  class="form-control" id="" name="board_no" value="${boardInfo.board_no}" >
									<input type="hidden"  class="form-control" id="" name="board_kind" value="${boardInfo.board_kind}">
									<input type="hidden"  class="form-control" id="" name="member_id" value="${boardInfo.member_id}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="pageNum" value="${criteria.pageNum}" />
									<input type="hidden" name="amount" value="${criteria.amount}" />
									<input type="hidden" name="type" value="${criteria.type}" />
									<input type="hidden" name="keyword" value="${criteria.keyword}" />
								    <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label text-center fw-bolder">글 제목</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white" id="computer-board-title" name="board_title" value="${boardInfo.board_title}" maxlength="30">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="member_name" class="col-sm-2 col-form-label text-center fw-bolder">작성자</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="member_name" value="${boardInfo.member_name}" readonly="readonly">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="board_contents" class="col-sm-2 col-form-label text-center align-middle fw-bolder" >글 내용</label>
								      <div class="col-sm-10">
								        <textarea class="form-control bg-white" id="computer-board-contents"  name="board_contents" rows="10" style="resize: none;" maxlength="1300">${boardInfo.board_contents}</textarea>
								      </div>
								    </div>
								    
								    <div class="form-group row mb-3">
								      <div class="col-sm-2"></div>
								      <div class="col-sm-10">
									    <label class="badge bg-dark fs-6 p-2 m-1 float-end" for="file-computer-board-modify">파일첨부</label>
		      							<input class="form-control" type="file" id="file-computer-board-modify" name="filename" style="display: none;" multiple>
								      </div>
								    </div>
								    
								    <div class="form-group row mb-3">
								      <div class="col-sm-2"></div>
								      <div class="col-sm-10 border border-2">
										 <div class="container">
										    <div class="row" id="picture-computer-board-modify">
										       		<%-- 파일 이미지가 뿌려지는 공간 --%>
										    </div>
										  </div>
								      </div>
								    </div>
									    <div class="hstack gap-3 w-50 ms-auto">
									    
								    <sec:authorize access="isAuthenticated()">
									  	 
									  	 <c:choose>
									  	 
									  	 	<c:when test="${principal.username eq boardInfo.member_id}">
								  	 			
								  	 				<input type="submit" value="글 수정" class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-50" id="btn-computer-board-modify">
													
													<a href="${contextPath}/board/read?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_no=${boardInfo.board_no}&board_kind=${boardInfo.board_kind}" class="w-50">
														<input type="button" value="취소" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
													</a>
									  	 	
									  	 	</c:when>
									  	 
									  	 </c:choose>
									  	 
									</sec:authorize>
									    
									    
									    
									    
									    
										
										</div>
								</form>
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
							<h2 class="card-title text-center mb-5 fw-bold fs-2">${boardInfo.board_kind != "1" ? boardInfo.board_kind != "2" ? "이벤트 게시판 수정하기" : "FAQ 수정하기" : "공지사항 수정하기"}</h2>
							
								<form action="${contextPath}/board/modify" method="post" name="" id="form-mobile-board-modify">
									<input type="hidden"  class="form-control" id="" name="board_no" value="${boardInfo.board_no}" >
									<input type="hidden"  class="form-control" id="" name="board_kind" value="${boardInfo.board_kind}">
									<input type="hidden"  class="form-control" id="" name="member_id" value="${boardInfo.member_id}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name="pageNum" value="${criteria.pageNum}" />
									<input type="hidden" name="amount" value="${criteria.amount}" />
									<input type="hidden" name="type" value="${criteria.type}" />
									<input type="hidden" name="keyword" value="${criteria.keyword}" />
								    <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label fw-bolder">글 제목</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white" id="" name="board_title" value="${boardInfo.board_title}" maxlength="30" >
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="member_name" class="col-sm-2 col-form-label fw-bolder">작성자</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="member_name" value="${boardInfo.member_name}" readonly="readonly">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="board_contents" class="col-sm-2 col-form-label align-middle fw-bolder" >글 내용</label>
								      <div class="col-sm-10">
								        <textarea class="form-control bg-white" id=""  name="board_contents" rows="10" style="resize: none;" maxlength="1300">${boardInfo.board_contents}</textarea>
								      </div>
								    </div>
								    
								    <div class="form-group row mb-3">
								      <div class="col-sm-2"></div>
								      <div class="col-sm-10">
									    <label class="badge bg-dark fs-6 p-2 m-1 float-end" for="file-computer-board-modify">파일첨부</label>
		      							<input class="form-control" type="file" id="file-computer-board-modify" name="filename" style="display: none;" multiple>
								      </div>
								    </div>
								    
								    <div class="form-group row mb-3">
								      <div class="col-sm-2"></div>
								      <div class="col-sm-10 border border-2">
										 <div class="container">
										    <div class="row" id="picture-mobile-board-modify">
										       		<%-- 파일 이미지가 뿌려지는 공간 --%>
										    </div>
										  </div>
								      </div>
								    </div>
								    
								    
								    <div class="hstack gap-3 w-50 ms-auto">
								    
								    	    <sec:authorize access="isAuthenticated()">
									  	 
											  	 <c:choose>
											  	 
											  	 	<c:when test="${principal.username eq boardInfo.member_id}">
										  	 			
										  	 			<input type="submit" value="글 수정" class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-50" id="btn-mobile-board-modify">
														<a href="${contextPath}/board/read?pageNum=${criteria.pageNum}&amount=${criteria.amount}&type=${criteria.type}&keyword=${criteria.keyword}&board_no=${boardInfo.board_no}&board_kind=${boardInfo.board_kind}" class="w-50">
															<input type="button" value="취소" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
														</a>
											  	 	
											  	 	</c:when>
											  	 
											  	 </c:choose>
											  	 
											</sec:authorize>
								    
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
<!-- ======================================================== -->
<!-- 바디 끝 -->


<!-- 푸터 시작 -->
<!-- ======================================================== -->
<%@ include file="../common/footer.jsp" %>
<!-- ======================================================== -->
<!-- 푸터 끝 -->

<script defer type="text/javascript">

//================================================================================================================
// boardModify.jsp  

	var csrf_headername = "${_csrf.headerName}"; 
	var csrf_token = "${_csrf.token}";
	
	
	//파일 유효성 검사
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	  
	function checkExtension(fileName, fileSize) {
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		    
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
	}

	//화면 진입시 현재 존재하는 파일 뿌려주기
	var board_no = "${boardInfo.board_no}";
	
	$.getJSON("${contextPath}/board/BoardFileList", {board_no : board_no}, function(arr) {
	
	str = "";
	
	$(arr).each(function(i, boardFileDTO) {
		
		if(boardFileDTO.board_file_image == 'Y') {
			var fileCallPath = encodeURIComponent(boardFileDTO.board_file_uploadpath+ "/s_" + boardFileDTO.board_file_uuid + "_" + boardFileDTO.board_file_name);
			
			str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
			str += "data-path='" + boardFileDTO.board_file_uploadpath + "' data-uuid='" + boardFileDTO.board_file_uuid + "' data-filename='" + boardFileDTO.board_file_name + "' data-type='" + boardFileDTO.board_file_image + "' >"
			str += "<img src='${contextPath}/board/BoardFileDisplay?fileName=" + fileCallPath + "' class='img-thumbnail' alt='...' style='width: 200px; height:200px'>"
			str += "<button type='button' class='btn-close top-5 position-absolute' "
			str += "data-file=\'" + fileCallPath + "\' data-type='image'></button>"
			str += "</div>"
		} else {
			var fileCallPath = encodeURIComponent(boardFileDTO.board_file_uploadpath+ "/s_" + boardFileDTO.board_file_uuid + "_" + boardFileDTO.board_file_name);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
			str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
			str += "data-path='" + boardFileDTO.board_file_uploadpath + "' data-uuid='" + boardFileDTO.board_file_uuid + "' data-filename='" + boardFileDTO.board_file_name + "' data-type='" + boardFileDTO.board_file_image + "' >"
			str += "<img src='/resources/images/board/file.png' class='img-thumbnail' alt='...' style='width: 200px; height:200px'>"
			str += "<button type='button' class='btn-close top-5 position-absolute' "
			str += "data-file=\'" + fileCallPath + "\' data-type='image'></button>"
			str += "</div>"
		}
		
	});
		$("#picture-computer-board-modify").append(str);
		$("#picture-mobile-board-modify").append(str);
	
});
	//모달창 기능
	function fnModal(e) {
			
			$(".modal-body").html(e);
			if(e != "") {
				$("#myModal").modal("show");
			}
		};
	
	
	// 컴퓨터단
	// 컴퓨터 글 등록 버튼
	$("#btn-computer-board-modify").on("click",function(e){
		e.preventDefault();
		
		var title = $(".board-computer input[name=board_title]").val();
		var contents = $(".board-computer textarea").val();
		if(title == "") {
			fnModal("제목을 입력해주세요");
			$(".board-computer input[name=board_title]").focus();
			return false;
		} else if(contents == "") {
			fnModal("내용을 입력해주세요.");
			return false;
		}
		
		
		
		var str = "";
		
		$("#picture-computer-board-modify div").each(function(i, obj){
			var jobj = $(obj);
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_name' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_uploadpath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_image' value='"+ jobj.data("type")+"'>";
		});
		$("#form-computer-board-modify").append(str).submit();
	});
	
	
	
	//컴퓨터 파일 업로드
	$("#file-computer-board-modify").on("change", function(e){
		
		var formData = new FormData();
		
		var inputFile = $("#file-computer-board-modify");
		
		var files = inputFile[0].files;
		
		for(var i = 0 ; i < files.length; i++) {
			
			if(!checkExtension(files[i].name, files[i].size) ){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: "${contextPath}/board/BoardFileAdd",
			processData: false, 
			contentType: false,
			data: formData,
			type: "POST",
			dataType:"json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrf_headername, csrf_token);
			},
			success: function(result){
				showUploadResult(result);  
			}
		}); //$.ajax
		
	});
	
	
	
	//컴퓨터 이미지 삭제
	$("#picture-computer-board-modify").on("click", "button", function(e) {
	    
		console.log("delete file");
		      
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetdiv = $(this).closest("div");   // 가장 가까운 div
		    
		$.ajax({
			url: "${contextPath}/board/BoardFileDelete",
			data: {fileName: targetFile, type:type},
			dataType:"text",
			type: "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrf_headername, csrf_token);
			},
			success: function(result){
		           
				targetdiv.remove();
			}
		}); //$.ajax
	});
	
	
	//모바일단
	//모바일 글 등록 버튼
	$("#btn-mobile-board-modify").on("click",function(e){
		e.preventDefault();
		
		var title = $(".board-mobile input[name=board_title]").val();
		var contents = $(".board-mobile textarea").val();
		if(title == "") {
			fnModal("제목을 입력해주세요");
			return false;
		} else if(contents == "") {
			fnModal("내용을 입력해주세요.");
			return false;
		}
		
		
		
		var str = "";
		
		$("#picture-mobile-board-modify div").each(function(i, BoardFileDTO){
			var bFDto = $(BoardFileDTO);
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_name' value='"+bFDto.data("filename")+"'>";
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_uuid' value='"+bFDto.data("uuid")+"'>";
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_uploadpath' value='"+bFDto.data("path")+"'>";
			str += "<input type='hidden' name='boardFileList["+i+"].board_file_image' value='"+ bFDto.data("type")+"'>";
		});
		$("#form-mobile-board-modify").append(str).submit();
	});
	
	
	//모바일 파일 업로드
	$("#file-mobile-board-modify").on("change", function(e){
		
		var formData = new FormData();
		
		var inputFile = $("#file-mobile-board-modify");
		
		var files = inputFile[0].files;
		
		for(var i = 0 ; i < files.length; i++) {
			
			if(!checkExtension(files[i].name, files[i].size) ){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: "${contextPath}/board/BoardFileAdd",
			processData: false, 
			contentType: false,
			data: formData,
			type: "POST",
			dataType:"json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrf_headername, csrf_token);
			},
			success: function(result){
				showUploadResult(result);  
			}
		}); //$.ajax
		
	});
	
	
	//모바일 이미지 삭제
	$("#picture-mobile-board-modify").on("click", "button", function(e) {
	    
		console.log("delete file");
		      
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetdiv = $(this).closest("div");   // 가장 가까운 div
		    
		$.ajax({
			url: "${contextPath}/board/BoardFileDelete",
			data: {fileName: targetFile, type:type},
			dataType:"text",
			type: "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrf_headername, csrf_token);
			},
			success: function(result){
				targetdiv.remove();
			}
		}); //$.ajax
	});
	
	
	// 모바일 컴퓨터 이미지 보여주기
	function showUploadResult(uploadResultArr) {
		
		if(!uploadResultArr || uploadResultArr.length == 0) { 
	    	return false;
	    }
		
		var str = "";
		
		
		$(uploadResultArr).each(function(i, obj) {
			
			if(obj.board_file_image == 'Y') {
				var fileCallPath = encodeURIComponent(obj.board_file_uploadpath+ "/s_" + obj.board_file_uuid + "_" + obj.board_file_name);
				
				str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
				str += "data-path='" + obj.board_file_uploadpath + "' data-uuid='" + obj.board_file_uuid + "' data-filename='" + obj.board_file_name + "' data-type='" + obj.board_file_image + "' >"
				str += "<img src='${contextPath}/board/BoardFileDisplay?fileName=" + fileCallPath + "' class='img-thumbnail' alt='...' style='width: 200px; height:200px'>"
				str += "<button type='button' class='btn-close top-5 position-absolute' "
				str += "data-file=\'" + fileCallPath + "\' data-type='image'></button>"
				str += "</div>"
			} else {
				var fileCallPath = encodeURIComponent(obj.board_file_uploadpath+ "/s_" + obj.board_file_uuid + "_" + obj.board_file_name);
 				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
 				
 				str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
 				str += "data-path='" + obj.board_file_uploadpath + "' data-uuid='" + obj.board_file_uuid + "' data-filename='" + obj.board_file_name + "' data-type='" + obj.board_file_image + "' >"
				str += "<img src='/resources/images/board/file.png' class='img-thumbnail' alt='...' style='width: 200px; height:200px'>"
				str += "<button type='button' class='btn-close top-5 position-absolute' "
				str += "data-file=\'" + fileCallPath + "\' data-type='image'></button>"
				str += "</div>"
			}
			
			
		});
			$("#picture-computer-board-modify").append(str);  // 컴퓨터단
			$("#picture-mobile-board-modify").append(str);    // 모바일단
	}
	
	
	
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