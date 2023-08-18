package edu.univ.ezen.controller.notlog;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.InfoBoardDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.InfoBoardMapper;

@Controller
public class NotlogController {
	
	@Autowired
	AccMapper accMapper;
	
	@Autowired
	InfoBoardMapper infoBoardMapper;
	
	//비로그인 메인화면
	@RequestMapping("/main.do")
	public String main() {
		return "/notlog/main";
	}
	
	//비로그인 비전
	@RequestMapping("/notlog_vision.do")
	public String notlog_vision() {
		return "/notlog/notlog_vision";
	}
	
	//비로그인 입학
	@RequestMapping("/notlog_enroll.do")
	public String notlog_enroll() {
		return "/notlog/notlog_enroll";
	}
	
	//비로그인 학사일정
	@RequestMapping("/notlog_schoolCalender.do")
	public String notlog_schoolCalender() {
		return "/notlog/notlog_schoolCalender";
	}
	
	//비로그인 탑 검색
	@RequestMapping("/topFind.do")
	public String topFind() {
		return "/notlog/topFind";
	}
	
	//비로그인 공지게시판
	@RequestMapping("/notlog_infoBoardList.do")
	public String notlog_infoBoardList() {
		return "/notlog/notlog_infoBoardList";
	}
	
	//비로그인 Q&A게시판
	@RequestMapping("/notlog_qnaBoardList.do")
	public String notlog_qnaBoardList() {
		return "/notlog/notlog_qnaBoardList";
	}
	
	//비로그인 재학생 메뉴
	@RequestMapping("/studentList.do")
	public String studentList() {
		return "/notlog/studentList";
	}
	
	//비로그인 교직원 메뉴
	@RequestMapping("/staffList.do")
	public String staffList() {
		return "/notlog/staffList";
	}
	
	//비로그인 예비이젠인 메뉴
	@RequestMapping("/preEzenList.do")
	public String preEzenList() {
		return "/notlog/preEzenList";
	}
	
	//비로그인 로그인 포털 이동
	@RequestMapping("/login_main.do")
	public String login_main(HttpServletRequest req) {
		
		String mode = req.getParameter("mode");
		
		if(mode != null && mode.equals("logout")) {
			HttpSession session = req.getSession();
			session.invalidate();
		}
		
		return "/loginPortal/login_main";
	}
		
	//로그인 처리 폼
	@RequestMapping("/login_main_pro.do")
	public String login_main_pro(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String type = req.getParameter("type");
		
		HttpSession session = req.getSession();
		
		if(type == null) {
			req.setAttribute("msg", "로그인 타입을 체크해주세요");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		if(type.equals("교직원") && accMapper.getStaff(id) != null) {
			if(!accMapper.getStaff(id).getStaff_pw().equals(pw)) {
				req.setAttribute("msg", "패스워드가 틀립니다");
				req.setAttribute("url", "login_main.do");
				return "message";
			}
		}
		else if(type.equals("교수") && accMapper.getTeacher(id) != null) {
			if(!accMapper.getTeacher(id).getTeacher_pw().equals(pw)) {
				req.setAttribute("msg", "패스워드가 틀립니다");
				req.setAttribute("url", "login_main.do");
				return "message";
			}
		}
		else if(type.equals("학생") && accMapper.getStudent(id) != null) {
			if(!accMapper.getStudent(id).getStudent_pw().equals(pw)) {
				req.setAttribute("msg", "패스워드가 틀립니다");
				req.setAttribute("url", "login_main.do");
				return "message";
			}
		}
		else {
			req.setAttribute("msg", "존재하지 않는 아이디입니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		session.setAttribute("id", id);
		session.setAttribute("type", type);
		
		return "/loginPortal/login_main";
	}
	
	//비로그인 캠퍼스 가이드
	@RequestMapping("/notlog_campusGuide.do")
	public String notlog_campusGuide() {
		return "/notlog/notlog_campusGuide";
	}
	
	//비로그인 장학정보
	@RequestMapping("/schoolScholarship.do")
	public String schoolScholarship() {
		return "/notlog/schoolScholarship";
	}
	
	//비로그인 졸업
	@RequestMapping("/graduationRequirement.do")
	public String graduationRequirement() {
		return "/notlog/graduationRequirement";
	}
	
	//비로그인 전공
	@RequestMapping("/majorRelated.do")
	public String majorRelated() {
		return "/notlog/majorRelated";
	}
	
	//휴학
	@RequestMapping("/hyuhak.do")
	public String hyuhak() {
		return "/notlog/hyuhak";
	}
	
	//복학
		@RequestMapping("/returnSchool.do")
		public String returnSchool() {
			return "/notlog/returnSchool";
		}
	
	//비로그인 입학정보 게시판
	@RequestMapping("/administrationBoard.do")
	public String administrationBoard() {
		return "/notlog/administrationBoard";
	}
	
	//비로그인 장학게시판
	@RequestMapping("/scholarBoard.do")
	public String scholarBoard(HttpServletRequest req) {
		
		
		String page = req.getParameter("page");
		List<InfoBoardDTO> list = infoBoardMapper.infoBoard_list(Integer.parseInt(page));
		
		int pageCount = infoBoardMapper.countBoard();
		req.setAttribute("totalPosts", pageCount);
		
		if(pageCount < 11) pageCount = 1;
	      else {
	         if(pageCount%10 == 0) pageCount = (pageCount/10);
	         else pageCount = (pageCount/10)+1;
	      }
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("notlog_listBoard", list);
		return "/notlog/scholarBoard";
	}
	
	//비로그인 커뮤니티 서비스
	@RequestMapping("/communityService.do")
	public String communityService() {
		return "/notlog/communityService";
	}
	
	//비로그인 도서관
	@RequestMapping("/libraryBoard.do")
	public String libraryBoard() {
		return "/notlog/libraryBoard";
	}
	
	//비로그인 오프캠퍼스 장학
	@RequestMapping("/off_CampusScholarship.do")
	public String off_CampusScholarship() {
		return "/notlog/off_CampusScholarship";
	}
	
	//장학공지 상세보기
	@RequestMapping("/scholarBoard_Content.do")
	
	public String scholarBoard_Content(HttpServletRequest req) {
		
		
		String info_code = req.getParameter("info_code");
		
		int dto = infoBoardMapper.plusReadCount(Integer.parseInt(info_code));
		InfoBoardDTO ldto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(info_code));
		req.setAttribute("InfoBoard", ldto);
		 
		
		return "/notlog/scholarBoard_Content";
	}
	
	
	
	
}
