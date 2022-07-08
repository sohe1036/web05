package com.eshop.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eshop.dto.DatabankDTO;
import com.eshop.service.FileService;

@Controller
@RequestMapping("/file/")
public class FileController {

	@Autowired
	ResourceLoader rsLoader;
	
	@RequestMapping(value="/uploadForm.do" ,method= RequestMethod.GET)	//파일 업로드 폼 로딩
	public String uplasdForm() {
		return "uploadFile";
	}
	
	//단일 파일 업로드
	@RequestMapping(value="/fileUpload.do",method= RequestMethod.POST)	//파일 업로드 처리
	public String fileUpload(MultipartFile myfile) throws UnsupportedEncodingException, Exception {
		String filename = myfile.getOriginalFilename();
		System.out.println("업로드 파일 이름 "+filename);
		
		filename = new String(filename.getBytes("8859_1"),"utf-8");		//인코팅처리
		
		//Resource resource = rsLoader.getResource("/WEB-INF/view/upload");		
		myfile.transferTo(new File("D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload2"+"/"+filename));  //절대경로
		//System.out.println("파일 업로드 위치 "+resource.getFile().getCanonicalPath());

		System.out.println("파일 저장 성공");
		
		return "redirect:/";
	}
	

	
	
	//다수 파일 업로드
	@RequestMapping(value="/uploadMulti.do", method = RequestMethod.GET)	
	public String uploadMulti() {
		return "uploadMulti";
		
	}
	
	@RequestMapping(value="/multiFileUpload.do", method = RequestMethod.POST)
	public String multiFileUpload(MultipartFile[] files) {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload2";
		
		for(MultipartFile file :files) {
			String fileName = file.getOriginalFilename();
			System.out.println("업로드 파일 이름 "+fileName);
			System.out.println("업로드 파일 크기 "+file.getSize());
			
			File saveFile = new File(uploadFolder,fileName );		//경로,이름
			try {
				file.transferTo(saveFile);	//파일전송
			}catch(Exception e) {
				System.out.println("파일 처리 오류");
				e.printStackTrace();
			}
		}
		return "redirect:/";
	}
	
	
	
	
	//자료등록 폼 로딩
	@RequestMapping(value="/databankForm.do", method = RequestMethod.GET)
	public String databankForm() {
		return "databankForm";
	}
	
	@Autowired
	FileService fileService;
	//자료등록 
	@RequestMapping(value="/databankInsert.do", method = RequestMethod.POST)
	public String databankInsert(MultipartFile fileurl, HttpServletRequest request, Model model) throws UnsupportedEncodingException, Exception {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		String fileName = fileurl.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		fileurl.transferTo(saveFile);
		DatabankDTO databank = new DatabankDTO();
		databank.setTitle(request.getParameter("title"));
		databank.setAuthor(request.getParameter("author"));
		databank.setFileurl(fileName);
		
		fileService.databankInsert(databank);
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/databankList.do",method = RequestMethod.GET)
	public String databankList (DatabankDTO databank, Model model) throws Exception {
		List<DatabankDTO> databankList = fileService.databankList();
		model.addAttribute("databankList",databankList);
		return "databankList";
	}
	
	
	
	//Ajax 방식 파일 업로드
	
	@RequestMapping(value="/upload.do", method = RequestMethod.GET)
	public String uploadAjax() {
		return "uploadAjax";
	}

	
	@ResponseBody
	@RequestMapping(value="/uploadAjax.do", method = RequestMethod.POST)
	public String uploadAjax(MultipartFile[] uploadFile, Model model) throws UnsupportedEncodingException, Exception {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		String result="";
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);	//서브스티링에서 마지막 \\뒤에것만 가져온게 이름
			
			File saveFile = new File(uploadFolder, uploadFileName);		
			
			try {
				multipartFile.transferTo(saveFile);
				result = "파일업로드 성공";
			}catch(Exception e) {
				e.printStackTrace();
				result = "파일업로드 실패";
			}
			System.out.println(result);
		}
		return result;
	}
	
	
}
