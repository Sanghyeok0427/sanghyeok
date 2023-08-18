package edu.univ.ezen.dto;

public class ReplyVO {
	private int rno;
	private int major_board_code;
	private String replytext;
	private String replyer;
	private String userName;
	private String reg_date;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getMajor_board_code() {
		return major_board_code;
	}
	public void setMajor_board_code(int major_board_code) {
		this.major_board_code = major_board_code;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	// toString()
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", major_board_code=" + major_board_code + ", replytext=" + replytext + ", replyer=" + replyer
				+", userName=" + userName + ", reg_date=" + reg_date + "]"; 
	}
}
