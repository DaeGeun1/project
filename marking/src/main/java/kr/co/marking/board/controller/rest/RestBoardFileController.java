package kr.co.marking.board.controller.rest;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.marking.board.domain.BoardFileDTO;
import kr.co.marking.board.service.IBoardFileService;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@RestController
@RequestMapping("/board")
@Log4j
public class RestBoardFileController {
	
	private String uploadPath = "D:\\workspace\\STSWorksapce\\marking\\src\\main\\webapp\\resources\\images\\board";
	
	
	@Autowired
	private IBoardFileService boardFileService;
	
	//년월일 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //날짜 포맷팅
			
		Date date = new Date();         //오늘 날짜 가져오기
		String str = sdf.format(date);  // 위에 형태로 포맷팅 
			
		return str.replace("-", File.separator);   // '-' 별로 구별하여 파일 생성
	}
	
	//이미지 파일인지 체크
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
				
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return false;
	}
	
	// 게시판 파일 업로드 기능
	@PostMapping(value = "/BoardFileAdd",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<BoardFileDTO> BoardFileAddPost (MultipartFile[] uploadFile) {
		
		log.info("==================== restController BoardFileAdd POST ====================");
		
		List<BoardFileDTO> boardFileList = new ArrayList<>();
		
		String uploadFolderPath = getFolder();
		log.info("uploadFolderPath: " + uploadFolderPath);
		
		File uploadFolder = new File(uploadPath, getFolder()); // 업로드 패스 안에 날짜별로 폴더 생성
		log.info("uploadFolder path: " + uploadFolder);
		
		if (uploadFolder.exists() == false) {                  // 파일이 존재하지 않으면 생성
			uploadFolder.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {             //foreach문
			log.info("-----------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			log.info("Upload File ContentType : " + multipartFile.getContentType());
			
			BoardFileDTO bFDto = new BoardFileDTO();
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			bFDto.setBoard_file_name(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				
				File saveFile = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveFile);   // transferTo() 를 이용하면 () 안에 java.io.File 를 넣어주면 자동으로 파일 생성
				
				bFDto.setBoard_file_uuid(uuid.toString());          // db에 넣을 uuid 값 셋팅
				bFDto.setBoard_file_uploadpath(uploadFolderPath);   // db에 넣을 저장경로 셋팅
				
				if (checkImageType(saveFile)) {  //등록되는 파일이 이미지인지 아닌지 체크
					bFDto.setBoard_file_image("Y");
					
					File thumbnail = new File(uploadFolder, "s_" + uploadFileName);  // S_ 라는 섬네일로 파일 저장
					Thumbnails.of(saveFile).size(100, 100).toFile(thumbnail);		 // 이미지 용량 축소
				
				} else {
					bFDto.setBoard_file_image("N");
				}
				
				boardFileList.add(bFDto);
				
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
			
		}
		
		
		return boardFileList;
	}
	
	
	//썸네일 이미지 보여주기
	@GetMapping("/BoardFileDisplay")
	public byte[] BoardFileDisplayGet(String fileName) {
		
		log.info("==================== restController BoardFileDisplayGet ====================");
		log.info("fileName : " + fileName);
		
		File file = new File(uploadPath + "\\" + fileName);
		log.info("file : " + file);
		
		byte[] result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = FileCopyUtils.copyToByteArray(file);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	/*
	//다운로드
	@GetMapping(value = "/BoardFileDownload",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> BoardFileDownloadGet(@RequestHeader("User-Agent") String userAgent,
													String fileName){
		
		log.info("==================== restController BoardFileDownloadGet ====================");
		
		Resource resource = new FileSystemResource(uploadPath + "\\" + fileName);
		
		if (resource.exists() == false) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);
			
			String downloadName = null;
			
			if (checkIE) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replace("\\+", "");
			}else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	*/
	//파일 삭제
	@PostMapping("/BoardFileDelete")
	public ResponseEntity<String> ajaxBoardFileDeletePost(String fileName, String type){
		
		
		log.info("==================== restController BoardFileDeletePost ====================");
		log.info("deleteFile : " + fileName);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=UTF-8");
		
		File file;
		
		try {
			file = new File(uploadPath + "\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName : " + largeFileName);
				
				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", headers, HttpStatus.OK);
	}
	
	//파일 출력
	@GetMapping(value = "/BoardFileList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<BoardFileDTO> BoardFileListGet(String board_no){
		
		log.info("==================== restController BoardFileListGet ====================");
		
		return boardFileService.selectBoardFileList(board_no);
	}
	
	
	
}
