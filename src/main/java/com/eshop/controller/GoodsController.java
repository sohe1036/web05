package com.eshop.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eshop.dto.GoodsDTO;
import com.eshop.service.GoodsService;
import com.eshop.util.MediaUtils;
import com.eshop.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);

	@Autowired
	GoodsService goodsService;
	
	@Autowired
	ResourceLoader rsLoader;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	/*@RequestMapping("실행경로")
	public String boardList(Model model) throws Exception {
		List<BoardDTO> boardList = boardService.boardList(); 리턴타입 변수명 = 서비스.메서드()
		model.addAttribute("boardList", boardList);
		return "리턴경로";
	}*/
	@RequestMapping("list.do")
	public String boardList( Model model) throws Exception {
			List<GoodsDTO> goodsList = goodsService.goodList();
			model.addAttribute("goodsList", goodsList);
		return "goods/goodsList";
	}
	
	@RequestMapping("typeList.do")
	public String goodsTypeList(@RequestParam String gtype, Model model) throws Exception {
		List<GoodsDTO> goodsList = goodsService.goodsTypeList(gtype);
		model.addAttribute("goodsList", goodsList);
	return "goods/goodsList";
	}
	
	@RequestMapping("shapeList.do")
	public String goodsShapeList(@RequestParam String gtype,@RequestParam String gshape,GoodsDTO gdto, Model model) throws Exception {
		GoodsDTO goods = new GoodsDTO();
		goods.setGtype(gtype);
		goods.setGshape(gshape);
		List<GoodsDTO> goodsList = goodsService.goodsShapeList(gdto);
		model.addAttribute("goodsList", goodsList);
		return "goods/goodsList";
	}	
	
	@RequestMapping(value="detail.do" ,method= RequestMethod.GET )
	public String goodsDetail(@RequestParam int gno, Model model ) throws Exception {
		GoodsDTO goods = goodsService.goodsDetail(gno);
		model.addAttribute("goods", goods);
		return "goods/goodsDetail";
	}
	//수정폼
	@RequestMapping(value="edit.do" ,method= RequestMethod.GET )
	public String goodsEdit(@RequestParam int gno, Model model ) throws Exception {
		GoodsDTO goods = goodsService.goodsDetail(gno);
		model.addAttribute("goods", goods);
		return "goods/goodsEdit";
	}
	
	@RequestMapping(value="insert.do" , method = RequestMethod.POST)
	public String goodsInsert(MultipartFile gimg1, HttpServletRequest request, Model model) throws Exception {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
		String fileName = gimg1.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		gimg1.transferTo(saveFile);
		GoodsDTO gdto = new GoodsDTO();
		gdto.setGname(request.getParameter("gname"));
		gdto.setGtype(request.getParameter("gtype"));
		gdto.setGshape(request.getParameter("gshape"));
		gdto.setGcolor(request.getParameter("gcolor"));
		gdto.setGimg1(fileName);
		gdto.setGinfo(request.getParameter("ginfo"));
		gdto.setPrice(request.getParameter("price"));
		gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));
	
		goodsService.goodsInsert(gdto);
		return "redirect:list.do";
	}
	
	//상품 추가 폼
	@RequestMapping(value="goodsAddForm.do",method= RequestMethod.GET)
	public String goodsAddForm(Model model) throws Exception {
		return "goods/goodsAddForm";
	}
	
	
	
	//수정
	@RequestMapping(value="update.do", method = RequestMethod.POST )
	public String goodsUpdate(MultipartFile gimg1, HttpServletRequest request, Model model) throws Exception {
		if(!gimg1.isEmpty()) {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
		String fileName = gimg1.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		gimg1.transferTo(saveFile);
		GoodsDTO gdto = new GoodsDTO();
		gdto.setGno(Integer.parseInt(request.getParameter("gno")));
		gdto.setGname(request.getParameter("gname"));
		gdto.setGtype(request.getParameter("gtype"));
		gdto.setGshape(request.getParameter("gshape"));
		gdto.setGcolor(request.getParameter("gcolor"));
		gdto.setGimg1(fileName);
		gdto.setGinfo(request.getParameter("ginfo"));
		gdto.setPrice(request.getParameter("price"));
		gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));
		
		goodsService.goodsUpdate(gdto);
		}else {
			GoodsDTO gdto = new GoodsDTO();
			gdto.setGno(Integer.parseInt(request.getParameter("gno")));
			gdto.setGname(request.getParameter("gname"));
			gdto.setGtype(request.getParameter("gtype"));
			gdto.setGshape(request.getParameter("gshape"));
			gdto.setGcolor(request.getParameter("gcolor"));
			gdto.setGinfo(request.getParameter("ginfo"));
			gdto.setPrice(request.getParameter("price"));
			gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));
			goodsService.goodsEidt(gdto);
		}
		return "redirect:list.do";
	}
	
	//삭제
	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String goodsDelete(@RequestParam int gno ,Model model ) throws Exception {
		goodsService.goodsDelete(gno);
		return "redirect:list.do";
	}
	
	/*
	//Get 방식으로 업로드 폼 열기
		@RequestMapping(value = "uploadForm.do", method = RequestMethod.GET)
		public String uploadFormGET() {
			return "goods/uploadForm";
		}
		
		//Post 방식으로 업로드 폼 열기
		@RequestMapping("uploadForm.do")  
		public String uploadFormPOST(MultipartFile file, Model model) throws Exception {
			logger.info("uploadFormPost");
			if(file != null) {
				logger.info("originalName:" + file.getOriginalFilename());
				logger.info("size:" + file.getSize());
				logger.info("ContentType:" + file.getContentType());
			}
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
			model.addAttribute("savedName", savedName);
			model.addAttribute("uploadFile", savedName);
			return "goods/uploadForm";
		}
		
		//업로드된 파일 저장 함수
		private String uploadFile(String originalName, byte[] fileDate) throws IOException {
			UUID uid = UUID.randomUUID();
			String savedName = uid.toString() + "_" + originalName;
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(fileDate, target);		
			return savedName;
		}
	
	//Ajax 파일 업로드
		@RequestMapping(value="uploadAjax.do", method = RequestMethod.GET)
		public String uploadAjaxGET() {
			return "goods/uploadAjax";
		}
		
		//Ajax로 한글 파일이름이나 데이터를 받아서 처리
		@ResponseBody
		@RequestMapping(value="uploadAjax.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
		public ResponseEntity<String> uploadAjaxPOST(MultipartFile file, Model model) throws Exception {
			log.info("originalName:" + file.getOriginalFilename());
			log.info("size:" + file.getSize());
			log.info("contentType:" + file.getContentType());
			model.addAttribute("uploadFile", file.getOriginalFilename());
			return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
		}
		
		//화면에 저장된 파일을 보여주는 컨트롤러 /년/월/일/파일명 형태
		@ResponseBody
		@RequestMapping(value="displayFile.do", method = RequestMethod.GET)
		public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;		
			log.info("File name: " + fileName);
			try {
				String formatName = fileName.substring(fileName.lastIndexOf(".")+1);			
				MediaType mType = MediaUtils.getMediaType(formatName);
				HttpHeaders headers = new HttpHeaders();
				in = new FileInputStream(uploadPath + fileName);		
				if(mType != null) {
					headers.setContentType(mType);
				}else {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
				}
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);			
			} catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				in.close();
			}
			return entity;
		}
		
		@ResponseBody
		@RequestMapping(value="deleteFile.do", method = RequestMethod.POST)
		public ResponseEntity<String> deleteFile(String fileName) throws Exception {
			log.info("delete file:" + fileName);		
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);		
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
			}//if
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();	
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
	
	*/
	
	
}
