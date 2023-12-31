package edu.univ.ezen.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.ClassDTO;
import edu.univ.ezen.dto.FileDepositoryDTO;
import edu.univ.ezen.dto.MajorQnaBoardDTO;
import edu.univ.ezen.service.AccAdminMapper;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.ClassMapper;
import edu.univ.ezen.service.FileDepositoryMapper;
import edu.univ.ezen.service.MajorQnaBoardMapper;

@Controller
public class AdminMajorQnaBoardController {
	
	@Autowired
	private FileDepositoryMapper fileDepositoryMapper;
	@Autowired
	private ClassMapper classMapper;
	@Autowired
	private AccAdminMapper accAdminMapper;
	@Autowired
	private MajorQnaBoardMapper majorQnaBoardMapper;
	
	protected boolean isLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping("admin_qna_selectLecture.do")
	public String admin_selLecture(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			return "admin/admin_login";
		}
		HttpSession session = req.getSession();
		String authority = (String) session.getAttribute("authority_level");
		if (authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			List<ClassDTO> list = classMapper.listClassAll();
			req.setAttribute("list", list);
		}
		return "admin/admin_qnaBoard/admin_lecture";
	}

	@RequestMapping("admin_qna_classCheck.do")
	public ModelAndView admin_classCheck(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			return new ModelAndView("admin/admin_login");
		}
		HttpSession session = req.getSession();
		String class_code = null;
		String authority = (String) session.getAttribute("authority_level");
		if (authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			String lecture = req.getParameter("lecture");
			ClassDTO dto = classMapper.getClassName(lecture);
			class_code = dto.getClass_code();
			session.setAttribute("class_code", class_code);
			req.setAttribute("getClass", dto);
		}
		return new ModelAndView("redirect:admin_qnaBoard.do?class_code=" + class_code);
	}

	// QNA게시판 이동
	@RequestMapping("admin_qnaBoard.do")
	public ModelAndView qnaBoard(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return new ModelAndView("message");
		}
		HttpSession session = req.getSession();
		String class_code = (String) session.getAttribute("class_code");
		req.setAttribute("path", "resources/qna_board_img");
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = majorQnaBoardMapper.getCount(class_code);
		if (endRow > count)
			endRow = count;
		List<MajorQnaBoardDTO> list = null;
		if (count > 0) {
			Map<String, Object> params = new HashMap<>();
			params.put("class_code", class_code);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			list = majorQnaBoardMapper.majorQnaBoard_list(params);
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		req.setAttribute("rowNum", rowNum);
		req.setAttribute("count", count);
		return new ModelAndView("admin/admin_qnaBoard/admin_qnaBoard", "listQnaBoard", list);
	}

	// QnA 게시판 글 쓰기 폼 이동
	@RequestMapping(value = "admin_write_qna_board.do", method = RequestMethod.GET)
	public String writeQnaBoard(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		int major_qna_board_code = 0, re_step = 0, re_level = 0;
		String code = req.getParameter("major_qna_board_code");
		if (code != null) {
			major_qna_board_code = Integer.parseInt(code);
			MajorQnaBoardDTO dto = majorQnaBoardMapper.majorQnaBoard_getByNum(major_qna_board_code, "update");
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
		}
		req.setAttribute("major_qna_board_code", major_qna_board_code);
		req.setAttribute("re_step", re_step);
		req.setAttribute("re_level", re_level);
		return "admin/admin_qnaBoard/admin_writeBoard";
	}

	// QnA 게시판 글 작성 처리
	@RequestMapping(value = "admin_write_qna_board.do", method = RequestMethod.POST)
	public String writeQnaProBoard(HttpServletRequest req,
			@RequestParam("original_name") List<MultipartFile> multiFileList, MajorQnaBoardDTO dto,
			BindingResult result) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		String secret = req.getParameter("secret");
		if (secret == null)
			secret = "off";
		if (secret.equals("on"))
			dto.setSecret(true);
		else
			dto.setSecret(false);
		HttpSession session = req.getSession();
		if (result.hasErrors()) {
			dto.setImage("");
		}
		FileDepositoryDTO dto2 = new FileDepositoryDTO();
		int major_qna_board_code = 0, re_step = 0, re_level = 0;
		String code = req.getParameter("major_qna_board_code");
		if (code != null) {
			major_qna_board_code = Integer.parseInt(code);
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));
		}
		String path = req.getSession().getServletContext().getRealPath("resources/qna_board_img");
		req.setAttribute("path", "resources/qna_board_img");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("image");
		if (mf.getOriginalFilename() == null || mf.getOriginalFilename().equals("")) {
			dto.setImage("image");
		} else {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			dto.setImage(newFilename);
			File file = new File(path, newFilename);
			try {
				mf.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		String class_code = (String) session.getAttribute("class_code");
		dto.setIp(req.getRemoteAddr());
		dto.setWriter_id((String) session.getAttribute("id"));
		dto.setWriter(accAdminMapper.getAdmin((String) session.getAttribute("id")).getName());
		dto.setClass_code(class_code);
		dto.setTeacher_id(accAdminMapper.getAdmin((String)session.getAttribute("id")).getAdmin_id());
		if (dto.getMajor_qna_board_code() != 0) {
			dto = majorQnaBoardMapper.majorQnaBoard_getByNum(major_qna_board_code, "get");
			int max = majorQnaBoardMapper.selectReStepMax(dto.getRe_group());
			dto.setRe_step(max + 1);
			dto.setRe_level(1);
		}
		int res = majorQnaBoardMapper.majorQnaBoard_insert(dto);
		if (res > 0) {
			MultipartFile file2 = mr.getFile("original_name");
			if (file2.getOriginalFilename() == null || file2.getOriginalFilename() != "") {
				File fileCheck = new File(path);
				if (!fileCheck.exists())
					fileCheck.mkdirs();
				List<Map<String, String>> fileList = new ArrayList<>();
				for (int i = 0; i < multiFileList.size(); i++) {
					String originFile = multiFileList.get(i).getOriginalFilename();
					int filesize = (int) multiFileList.get(i).getSize();
					String ext = originFile.substring(originFile.lastIndexOf("."));
					String changeFile = UUID.randomUUID().toString() + ext;
					dto2.setBoard("qnaBoard");
					dto2.setOriginal_name(originFile);
					dto2.setSave_name(changeFile);
					dto2.setFilesize(filesize);
					int max = Integer.parseInt(majorQnaBoardMapper.selectMax());
					dto2.setCode(max);
					fileDepositoryMapper.fileInsert(dto2);
					Map<String, String> map = new HashMap<>();
					map.put("originFile", originFile);
					map.put("changeFile", changeFile);

					fileList.add(map);
				}

				// 파일 업로드
				try {
					for (int i = 0; i < multiFileList.size(); i++) {
						File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
						multiFileList.get(i).transferTo(uploadFile);
					}
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중파일 업로드 실패 ㅠㅠ");
					for (int i = 0; i < multiFileList.size(); i++) {
						new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					e.printStackTrace();
				}
				req.setAttribute("msg", "게시글 등록 성공(사진, 이미지도 등록 성공!!) 글목록 페이지로 이동합니다.");
				req.setAttribute("url", "admin_qnaBoard.do");
			} else {

			}
			req.setAttribute("msg", "게시글 등록 성공!! 글목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_qnaBoard.do");
		} else {
			req.setAttribute("msg", "게시글 등록 실패!! 글 등록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_write_qna_board.do");
		}
		return "message";
	}

	// QnA 게시판 글 내용 보기
	@RequestMapping("admin_content_qna_board.do")
	public String contentQnaBaord(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		int major_qna_board_code = Integer.parseInt(req.getParameter("major_qna_board_code"));
		MajorQnaBoardDTO dto = majorQnaBoardMapper.majorQnaBoard_getByNum(major_qna_board_code, "content");
		Map<String, Object> params = new HashMap<>();
		int code = major_qna_board_code;
		String board = "qnaBoard";
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		req.setAttribute("listFile", list);
		req.setAttribute("path", "resources/qna_board_img");
		req.setAttribute("getBoard", dto);
		return "admin/admin_qnaBoard/admin_contentBoard";
	}

	// QNA 게시판 파일 다운로드
	@RequestMapping("admin_majorQnaBoard_download.do")
	public String qnaDownload(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam int major_qna_board_code) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		Map<String, Object> params = new HashMap<>();
		int code = major_qna_board_code;
		String board = "qnaBoard";
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		String name = req.getParameter("name");
		try {
			String original_name = null;
			String save_name = null;
			for (FileDepositoryDTO fdto : list) {
				if (fdto.getSave_name().equals(name)) {
					original_name = fdto.getOriginal_name();
					save_name = fdto.getSave_name();
				}
			}
			original_name = new String(original_name.getBytes("UTF-8"), "iso-8859-1");
			File file = new File(
					req.getSession().getServletContext().getRealPath("/resources/qna_board_img/" + save_name));
			FileInputStream fis = new FileInputStream(file);
			ServletOutputStream sos = resp.getOutputStream();
			resp.setContentType("application/octet-stream");
			resp.setContentLength((int) file.length());
			resp.setHeader("Content-Dispostion", "attachment;filename=\"" + original_name + "\"");
			byte[] buffer = new byte[4096];
			int bytesRead;
			while ((bytesRead = fis.read(buffer)) != -1) {
				sos.write(buffer, 0, bytesRead);
			}
			fis.close();
			sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "admin/admin_qnaBoard/admin_contentBoard";
	}

	// QnA 게시판 글 삭제 처리
	@RequestMapping("admin_delete_qna_board.do")
	public String deleteQnaBoard(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		int major_qna_board_code = Integer.parseInt(req.getParameter("major_qna_board_code"));
		String image = req.getParameter("image");
		Map<String, Object> params = new HashMap<>();
		int code = major_qna_board_code;
		String board = "qnaBoard";
		params.put("board", board);
		params.put("code", code);
		int res = majorQnaBoardMapper.majorQnaBoard_del(major_qna_board_code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		if (res > 0) {
			String path = req.getSession().getServletContext().getRealPath("resources/qna_board_img");
			req.setAttribute("path", "resources/qna_board_img");
			File file = new File(path, image);
			if (file.exists()) {
				file.delete();
				for (FileDepositoryDTO dto : list) {
					fileDepositoryMapper.fileDelete(dto.getNum());
					File file2 = new File(path + "\\" + dto.getSave_name());
					if (file2.exists()) {
						file2.delete();
					} else {
						req.setAttribute("msg", "글삭제 성공!(파일은 삭제 실패) 게시판 목록으로 이동");
						req.setAttribute("url", "admin_qnaBoard.do");
						return "message";
					}
				}
				req.setAttribute("msg", "글 삭제 성공!(이미지도 삭제 성공) QnA게시판 목록 페이지로 이동");
				req.setAttribute("url", "admin_qnaBoard.do");
				return "message";
			} else {
				req.setAttribute("msg", "글 삭제 성공!(이미지는 삭제 실패) QnA게시판 목록 페이지로 이동");
				req.setAttribute("url", "admin_qnaBoard.do");
				return "message";
			}
		} else {
			req.setAttribute("msg", "이미지 삭제 실패!! QnA게시판 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_qnaBoard.do");
			return "message";
		}
	}

	// QnA게시판 수정 폼 이동
	@RequestMapping(value = "admin_update_qna_board.do", method = RequestMethod.GET)
	public String updateQnaBoard(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		int major_qna_board_code = Integer.parseInt(req.getParameter("major_qna_board_code"));
		MajorQnaBoardDTO dto = majorQnaBoardMapper.majorQnaBoard_getByNum(major_qna_board_code, "update");
		req.setAttribute("path", "resources/qna_board_img");
		req.setAttribute("getBoard", dto);
		return "admin/admin_qnaBoard/admin_updateBoard";
	}

	// QnA게시판 글 수정 처리
	@RequestMapping(value = "admin_update_qna_board.do", method = RequestMethod.POST)
	public String updateProBoard(HttpServletRequest req,
			@RequestParam("original_name") List<MultipartFile> multiFileList, @ModelAttribute MajorQnaBoardDTO dto,
			BindingResult result) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		if (result.hasErrors()) {
			dto.setImage("");
		}
		FileDepositoryDTO dto2 = new FileDepositoryDTO();
		HttpSession session = req.getSession();
		String path = req.getSession().getServletContext().getRealPath("resources/qna_board_img");
		req.setAttribute("path", "resources/qna_board_img");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("image");
		if (mf.getOriginalFilename() == null || mf.getOriginalFilename().equals("")) {
			dto.setImage("image");
		} else {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			dto.setImage(newFilename);
			File file = new File(path, newFilename);
			try {
				mf.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		String class_code = (String) session.getAttribute("class_code");
		dto.setClass_code(class_code);
		dto.setIp(req.getRemoteAddr());
		dto.setWriter_id(accAdminMapper.getAdmin((String)session.getAttribute("id")).getAdmin_id());
		dto.setWriter(accAdminMapper.getAdmin((String)session.getAttribute("id")).getName());
		int res = majorQnaBoardMapper.majorQnaBoard_update(dto);
		if (res > 0) {
			File fileCheck = new File(path);
			if (!fileCheck.exists())
				fileCheck.mkdirs();
			if (multiFileList == null || multiFileList.get(0).getOriginalFilename().equals("")) {
				req.setAttribute("msg", "글 수정 성공(혹시 파일에 손댔어?) 글 목록 페이지로 이동");
				req.setAttribute("url", "admin_qnaBoard.do");
				return "message";
			} else if (multiFileList.get(0).getOriginalFilename() != "") {
				Map<String, Object> params = new HashMap<>();
				int code = Integer.parseInt(req.getParameter("major_qna_board_code"));
				String board = "qnaBoard";
				params.put("board", board);
				params.put("code", code);
				List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
				for (FileDepositoryDTO fdto : list) {
					fileDepositoryMapper.fileDelete(fdto.getNum());
					File file2 = new File(path + "\\" + fdto.getSave_name());
					if (file2.exists()) {
						file2.delete();
					} else {
						req.setAttribute("msg", "파일 삭제 실패!");
						req.setAttribute("url", "admin_noticeBoard.do");
						return "message";
					}
				}
			}
			MultipartFile file3 = mr.getFile("original_name");
			if (file3.getOriginalFilename() == null || file3.getOriginalFilename() != "") {
				List<Map<String, String>> fileList = new ArrayList<>();
				for (int i = 0; i < multiFileList.size(); i++) {
					String originFile = multiFileList.get(i).getOriginalFilename();
					int filesize = (int) multiFileList.get(i).getSize();
					String ext = originFile.substring(originFile.lastIndexOf("."));
					String changeFile = UUID.randomUUID().toString() + ext;
					dto2.setBoard("qnaBoard");
					dto2.setOriginal_name(originFile);
					dto2.setSave_name(changeFile);
					dto2.setFilesize(filesize);
					dto2.setCode(dto.getMajor_qna_board_code());
					fileDepositoryMapper.fileInsert(dto2);
					Map<String, String> map = new HashMap<>();
					map.put("originFile", originFile);
					map.put("changeFile", changeFile);

					fileList.add(map);
				}
				try {
					for (int i = 0; i < multiFileList.size(); ++i) {
						File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
						multiFileList.get(i).transferTo(uploadFile);
					}
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패");
					for (int i = 0; i < multiFileList.size(); ++i) {
						new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					e.printStackTrace();
				}
				req.setAttribute("msg", "글 수정 성공(사진, 파일 업로드)! 글 목록 페이지로 이동합니다.");
				req.setAttribute("url", "admin_qnaBoard.do");
			} else {
				req.setAttribute("msg", "글 수정 실패! 글 수정 페이지로 이동");
				req.setAttribute("url", "admin_update_qna_board.do?major_qna_board_code=" + dto.getMajor_qna_board_code());
			}
			req.setAttribute("msg", "글 수정 성공! 글 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_qnaBoard.do");
		} else {
			req.setAttribute("msg", "글 수정 실패 ! 글 수정 페이지로 이동");
			req.setAttribute("url", "admin_update_qna_board.do?major_qna_board_code=" + dto.getMajor_qna_board_code());
		}
		return "message";
	}

	// QnA 게시판 찾기 처리
	@RequestMapping("admin_find_major_qna_board.do")
	public ModelAndView findQnaBoard(HttpServletRequest req,
			@RequestParam(required = false) Map<String, String> params) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return new ModelAndView("message");
		}
		HttpSession session = req.getSession();
		List<MajorQnaBoardDTO> list = null;
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		String class_code = (String)session.getAttribute("class_code");
		ModelAndView mav = new ModelAndView();
		mav.addObject("path", "resources/qna_board_img");
		if (params.get("search") != null) {
			list = majorQnaBoardMapper.majorQnaBoard_findList(search, searchString, class_code);
			mav.addObject("find", list);
			mav.addObject("mode", "find");
			mav.setViewName("admin/admin_qnaBoard/admin_qnaBoard");
		} else {
			mav.addObject("find", list);
			mav.addObject("mode", "find");
			mav.setViewName("admin/admin_qnaBoard/admin_qnaBoard");
		}
		return mav;
	}
}
