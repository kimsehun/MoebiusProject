package kr.co.moebius.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getBoardList(Pagination p) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getBoardList(p);
	}

	@Override
	public BoardInfoVO getBoardInfo(int bno) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getBoardInfo(bno);
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.insertBoard(boardVO);
	}
	
}
