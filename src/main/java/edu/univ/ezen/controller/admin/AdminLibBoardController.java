package edu.univ.ezen.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.dto.LibraryBoardDTO;
import edu.univ.ezen.service.LibraryBoardMapper;
import edu.univ.ezen.service.LogMapper;

@Controller
public class AdminLibBoardController {
	
	@Autowired
	LibraryBoardMapper libraryBoardMapper;
	
	@Autowired
	LogMapper logMapper;
	
	//세션에 id라는 값이 있는지 체크하는 메소드. 있으면 true, 없으면 false를 리턴한다.
	protected boolean id_check(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("id") == null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	//공지 게시판 관리
	@RequestMapping("/admin_libboard_list.do")
	public String admin_board_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String page = req.getParameter("page");
		
		if(page == null) page = "1";
		
		List<LibraryBoardDTO> list = libraryBoardMapper.libBoard_list(Integer.parseInt(page));

		int pageCount = libraryBoardMapper.countBoard();

		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", list);

		return "admin/admin_libBoard/admin_libBoard_list";
	}
	
	//새 공지 등록 페이지
	@RequestMapping("/admin_libboard_insert.do")
	public String admin_board_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
	
		req.setAttribute("mode", "insert");
	
		return "admin/admin_libBoard/admin_libBoard_insert";
	}

	//새 공지 등록 처리
	@RequestMapping("/admin_libboard_insert_pro.do")
	public ModelAndView admin_board_insert_pro(HttpServletRequest req, 
		@ModelAttribute LibraryBoardDTO dto, BindingResult result) {
		ModelAndView mav = new ModelAndView("message");

		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
	
		LibraryBoardDTO ldto = dto;
			
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		
		MultipartFile mf2 = mr.getFile("filename");
		String filename = mf2.getOriginalFilename();
		
		MultipartFile mf1 = mr.getFile("image");
		String image = mf1.getOriginalFilename();
		
		String fileExtension = filename.substring(filename.lastIndexOf("."));
		String newFilename = UUID.randomUUID().toString() + fileExtension;
		
		String imageExtension = image.substring(image.lastIndexOf("."));
		String newImage = UUID.randomUUID().toString() + imageExtension;
		
		HttpSession session = req.getSession();
		String upPathImage = session.getServletContext().getRealPath("/resources/infoBoard_img");
		String upPathFile = session.getServletContext().getRealPath("/resources/infoBoard_file");
		File fileF = new File(upPathFile, newFilename);
		File fileI = new File(upPathImage, newImage);
						
		try {
			mf1.transferTo(fileI);
			mf2.transferTo(fileF);
			
		} catch(IllegalStateException e) {
			e.printStackTrace();
			mav.addObject("msg", "IllegalStateException! : "+ e.getMessage());
			mav.addObject("url", "index_admin.do");
			return mav;
		} catch(IOException e) {
			e.printStackTrace();
			mav.addObject("msg", "IOException! : "+ e.getMessage());
			mav.addObject("url", "index_admin.do");
			return mav;
		}
		ldto.setImage(newImage);
		ldto.setFilename(newFilename);
		ldto.setReadcount(0);
		ldto.setLib_board_code(0);
		
		int res = libraryBoardMapper.libBoard_insert(ldto);
		
		if(res != 0) {
			mav.addObject("msg", "공지 등록이 완료되었습니다");
			mav.addObject("url", "admin_board_list.do?page=1");
		
		
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("공지등록:"+ldto.getSubject());
			eldto.setMemo(req.getParameter("memo"));
			int elog = logMapper.insertEdit(eldto);
			
			return mav;
			
		}
		else {
			mav.addObject("msg", "공지등록에 실패했습니다");
			mav.addObject("url", "admin_board_list.do");
			return mav;
		}
	}


	//공지 삭제
	@RequestMapping("/admin_libboard_del.do")
	public ModelAndView admin_board_del(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
		
		String info_code = req.getParameter("info_code");
		LibraryBoardDTO ldto = libraryBoardMapper.libBoard_getByNum(Integer.parseInt(info_code));
		
		
		String upPath = "/resources/infoBoard_img/" + ldto.getImage();
		HttpSession session = req.getSession();
		File file = new File(session.getServletContext().getRealPath(upPath));
		int res = libraryBoardMapper.libBoard_del(Integer.parseInt(info_code));
		boolean killF = file.delete();
		
		if(res != 0) {
			if(killF) {
				mav.addObject("msg", "공지도 파일도 삭제되었습니다");
				mav.addObject("url", "admin_board_list.do?page=1");
				
				//수정내역 로그 남기기
				EditLogDTO eldto = new EditLogDTO();
				eldto.setId((String)session.getAttribute("id"));
				eldto.setContent("공지삭제:"+ldto.getSubject());
				eldto.setMemo("공지삭제");
				int elog = logMapper.insertEdit(eldto);
			}
			else {
				mav.addObject("msg", "공지글은 삭제되었으나, 파일은 삭제되지 않았습니다");
				mav.addObject("url", "admin_board_list.do?page=1");
			}
		}
		else {
			mav.addObject("msg", "공지도 파일도 삭제에 실패했습니다");
			mav.addObject("url", "admin_board_list.do?page=1");
		}		
		return mav;
	}
	
	//공지정보 수정
	@RequestMapping("/admin_libboard_edit.do")
	public String admin_board_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String info_code =req.getParameter("info_code");
		LibraryBoardDTO ldto = libraryBoardMapper.libBoard_getByNum(Integer.parseInt(info_code));
		
		req.setAttribute("ldto", ldto);
		req.setAttribute("mode", "edit");
		
		return "admin/admin_board/admin_board_insert";
	}
	
	//공지 수정 처리
	@RequestMapping("/admin_libboard_edit_pro.do")
	public ModelAndView admin_board_edit_pro(MultipartHttpServletRequest req, 
			@ModelAttribute LibraryBoardDTO dto, BindingResult result) {
		ModelAndView mav = new ModelAndView("message");
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
		
		String lib_board_code = req.getParameter("lib_board_code");
		
		LibraryBoardDTO idto = libraryBoardMapper.libBoard_getByNum(Integer.parseInt(lib_board_code));
		
		String iUpPath = "resources/libBoard_file/"+idto.getImage();
		HttpSession session = req.getSession();
		File ifile = new File(session.getServletContext().getRealPath(iUpPath));
		boolean killF = ifile.delete();
		
		LibraryBoardDTO ldto = dto;
				
		MultipartFile mf1 = req.getFile("image");
		String image = mf1.getOriginalFilename();
		
		MultipartFile mf2 = req.getFile("filename");
		String filename = mf2.getOriginalFilename();
		
		String fileExtension = filename.substring(filename.lastIndexOf("."));
		String newFilename = UUID.randomUUID().toString() + fileExtension;
		
		String imageExtension = image.substring(image.lastIndexOf("."));
		String newImage = UUID.randomUUID().toString() + imageExtension;
		
		String upPathImage = session.getServletContext().getRealPath("/resources/infoBoard_img");
		String upPathFile = session.getServletContext().getRealPath("/resources/infoBoard_file");
		
		File fileF = new File(upPathFile, newFilename);
		File fileI = new File(upPathImage, newImage);
		
		try {
			mf1.transferTo(fileI);
			mf2.transferTo(fileF);
		} catch(IllegalStateException e) {
			e.printStackTrace();
			mav.addObject("msg", "IllegalStateException! : "+ e.getMessage());
			mav.addObject("url", "index_admin.do");
			return mav;
		} catch(IOException e) {
			e.printStackTrace();
			mav.addObject("msg", "IOException! : "+ e.getMessage());
			mav.addObject("url", "index_admin.do");
			return mav;
		}
		ldto.setImage(newImage);
		ldto.setFilename(newFilename);
		
		int res = libraryBoardMapper.libBoard_update(dto);
		
		if(res != 0) {
			mav.addObject("msg", "공지가 수정되었습니다");
			mav.addObject("url", "admin_board_list.do?page=1");
			
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("공지수정:"+ldto.getSubject());
			eldto.setMemo(req.getParameter("memo"));
			int elog = logMapper.insertEdit(eldto);
		}
		else {
			mav.addObject("msg", "공지 수정에 실패했습니다");
			mav.addObject("url", "admin_board_list.do?page=1");
		}
		return mav;				
	}
	
	//공지 상세보기
	@RequestMapping("/admin_libboard_view.do")
	public String admin_board_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String info_code = req.getParameter("info_code");
		LibraryBoardDTO idto = libraryBoardMapper.libBoard_getByNum(Integer.parseInt(info_code));
		
		req.setAttribute("ldto", idto);
		
		return "admin/admin_board/admin_board_view";
		
	}
}							
			
					
				
				