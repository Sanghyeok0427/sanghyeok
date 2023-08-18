package edu.univ.ezen.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import edu.univ.ezen.dto.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public List<ReplyVO> list(int major_board_code) {
		return sqlSession.selectList("reply.listReply", major_board_code);
	}

	@Override
	public void create(ReplyVO vo) {
		sqlSession.insert("reply.insertReply", vo);
	}

	@Override
	public void update(ReplyVO vo) {
		sqlSession.update("reply.updateReply", vo);
	}

	@Override
	public void delete(int rno) {
		sqlSession.delete("reply.deleteReply", rno);
	}

}
