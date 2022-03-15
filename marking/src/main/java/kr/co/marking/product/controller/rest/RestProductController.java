package kr.co.marking.product.controller.rest;

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

import kr.co.marking.product.domain.CategoryDTO;
import kr.co.marking.product.domain.ProductFileDTO;
import kr.co.marking.product.service.ICategoryService;
import kr.co.marking.product.service.IProductFileService;
import kr.co.marking.product.service.IProductService;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@RestController
@RequestMapping("/product")
@Log4j
public class RestProductController {

private String uploadPath = "D:\\workspace\\STSWorksapce\\marking\\src\\main\\webapp\\resources\\images\\product";
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IProductFileService productFileService;
	
	@Autowired
	private ICategoryService categoryService;
	
	
	

	//년월일 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //날짜 포맷팅
			
		Date date = new Date();         //오늘 날짜 가져오기
		String str = sdf.format(date);  // 위에 형태로 포맷팅 
			
		return str.replace("-", File.separator);   // '-' 별로 구별하여 파일 생성
	}
	
	
	
	// 게시판 파일 업로드 기능
	@PostMapping(value = "/productFileAdd",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<ProductFileDTO> productFileAddPost (MultipartFile[] uploadFile) {
		
		log.info("==================== restController productFileAdd POST ====================");
		
		List<ProductFileDTO> productFileList = new ArrayList<>();
		
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
			
			ProductFileDTO pFDto = new ProductFileDTO();
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			pFDto.setProduct_file_name(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				
				File saveFile = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveFile);   // transferTo() 를 이용하면 () 안에 java.io.File 를 넣어주면 자동으로 파일 생성
				
				pFDto.setProduct_file_uuid(uuid.toString());          // db에 넣을 uuid 값 셋팅
				pFDto.setProduct_file_uploadpath(uploadFolderPath);   // db에 넣을 저장경로 셋팅
				
				
					
				File thumbnail = new File(uploadFolder, "s_" + uploadFileName);  // S_ 라는 섬네일로 파일 저장
				Thumbnails.of(saveFile).size(100, 100).toFile(thumbnail);		 // 이미지 용량 축소
				
				
				
				productFileList.add(pFDto);
				
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
			
		}
		
		
		return productFileList;
	}
	
	//상품 이미지 뿌리는 기능
	@GetMapping("/productImageShow")
	public byte[] productImageShowGet(String fileName, String product_no, String product_file_main) {
		
		log.info("==================== restController productImageShowGet ====================");
		
		
		
		//메인파일인 경우
		if(fileName == null) {
			
			fileName = "";
			
			ProductFileDTO pDto = new ProductFileDTO();
			
			pDto.setProduct_no(product_no);
			pDto.setProduct_file_main(product_file_main);
			
			
			List<ProductFileDTO> productFileList = productFileService.selectProductFileList(pDto);
			
			//메인사진은 1개이고 거기에 맞는 fileName 셋팅 //썸네일은 보여주지않음
			System.out.println(productFileList.size());
			for (int i = 0; i < productFileList.size(); i++) {
				fileName = productFileList.get(i).getProduct_file_uploadpath() + "/" + productFileList.get(i).getProduct_file_uuid() + "_" + productFileList.get(i).getProduct_file_name();
			}
		}
		
		//메인 이미지가 아닌경우 바로 이쪽으로
		File file = new File(uploadPath + "\\" + fileName);
		
		log.info("file : " + file);
		
		
		byte[] result = null;
		
		try {
			
			result = FileCopyUtils.copyToByteArray(file);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
		
	
	//저장소에 있는 파일 삭제
	@PostMapping("/productFileDelete")
	public ResponseEntity<String> ProductFileDeletePost(String fileName, String type){
		
		
		log.info("==================== restController ProductFileDeletePost ====================");
		log.info("deleteFile : " + fileName);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=UTF-8");
		
		File file;
		
		try {
			file = new File(uploadPath + "\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName : " + largeFileName);
				
				file = new File(largeFileName);
				file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", headers, HttpStatus.OK);
	}
	
	//서브 이미지 정보 가져오기
	@GetMapping(value = "/productSubImageList")
	public List<ProductFileDTO> productSubImageListGet(String product_no){
		
		log.info("==================== restController productSubImageListGet ====================");
		
		ProductFileDTO pfDto = new ProductFileDTO();
		
		pfDto.setProduct_no(product_no);
		pfDto.setProduct_file_main("N");
		
		return productFileService.selectProductFileList(pfDto);
	}
	
	// 대분류 중분류 소분류 리스트 뽑아오기 상품등록의 삼중 셀릭트박스
	@GetMapping(value = "/categoryList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CategoryDTO> categoryListGet(String level, String kind, String step) {
		
		log.info("==================== restController categoryListGet ====================");
		
		CategoryDTO cDto = new CategoryDTO();
		
		if("0".equals(level)) {  // 선택하시오 선택시
			return new ArrayList<CategoryDTO>();
		}
		
		cDto.setCategory_level(level);
		cDto.setCategory_kind(kind);
		cDto.setCategory_step(step);
		log.info(cDto);
		return categoryService.selectCategory(cDto);
		
	}
	
	
}




















