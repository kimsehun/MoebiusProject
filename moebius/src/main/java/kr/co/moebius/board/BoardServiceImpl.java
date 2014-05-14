package kr.co.moebius.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
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

	@Override
	public BoardVO getDetail(int no) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getDetail(no);
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		if(boardMapper.updateBoard(boardVO)==0){
			throw new RuntimeException("게시물을 수정할 수 없습니다.");
		}
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		if(boardMapper.deleteBoard(boardVO)==0){
			throw new RuntimeException("게시물을 삭제 할 수 없습니다.");
		}
	}
	
	
	//조회수
	@Override
	public void updateCount(int board_no) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateCount(board_no);
	}
	
	
	//전체 게시물 수
	@Override
	public int totalRecord(int bno) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.totalRecord(bno);
	}
	
}
