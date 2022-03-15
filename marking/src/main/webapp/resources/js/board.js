var token = $("meta[name='_csrf']").attr("content");
 
var header = $("meta[name='_csrf_header']").attr("content");




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
	
//화면 진입시 파일이 있을경우 뿌려줌     boardRead.jsp / boardModify.jsp	
var board_no = '<c:out value="${boardInfo.board_no}"/>';
$.getJSON("${contextPath}/board/ajaxBoardFileList", {board_no : board_no}, function(arr) {

str = "";

$(arr).each(function(i, boardFileDTO) {
	
	if(boardFileDTO.board_file_image == 'Y') {
		var fileCallPath = encodeURIComponent(boardFileDTO.board_file_uploadpath+ "/s_" + boardFileDTO.board_file_uuid + "_" + boardFileDTO.board_file_name);
		
		str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
		str += "data-path='" + boardFileDTO.board_file_uploadpath + "' data-uuid='" + boardFileDTO.board_file_uuid + "' data-filename='" + boardFileDTO.board_file_name + "' data-type='" + boardFileDTO.board_file_image + "' >"
		str += "<img src='${contextPath}/board/ajaxBoardFileDisplay?fileName=" + fileCallPath + "' class='img-thumbnail' alt='...' style='width: 150px; heigth:auto'>"
		str += "<button type='button' class='btn-close top-5 position-absolute' "
		str += "data-file=\'" + fileCallPath + "\' data-type='image'></button>"
		str += "</div>"
	} else {
		var fileCallPath = encodeURIComponent(boardFileDTO.board_file_uploadpath+ "/s_" + boardFileDTO.board_file_uuid + "_" + boardFileDTO.board_file_name);
		var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			
		str += "<div class='col-xs-3 col-sm-3  text-center my-2 position-relative' "
		str += "data-path='" + boardFileDTO.board_file_uploadpath + "' data-uuid='" + boardFileDTO.board_file_uuid + "' data-filename='" + boardFileDTO.board_file_name + "' data-type='" + boardFileDTO.board_file_image + "' >"
		str += "<img src='/resources/images/board/file.png' class='img-thumbnail' alt='...' style='width: 220px; heigth:auto'>"
		str += "<button type='button' class='btn-close top-5 position-absolute' "
		str += "data-file=\'" + fileCallPath + "\' data-type='image'></button>"
		str += "</div>"
	}
	
});
	$("#picture-computer-board").append(str);
	$("#picture-mobile-board").append(str);

});
	
