package edu.univ.ezen.service;

import java.util.List;

import javax.inject.Inject;

import edu.univ.ezen.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO replyDao;
	
	@Override
	public void delete(int rno) {
		replyDao.delete(rno);
	}

	@Override
	public List<ReplyVO> list(int bno) {
		return replyDao.list(bno);
	}

	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}

}
