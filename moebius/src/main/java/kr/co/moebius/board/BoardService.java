package kr.co.moebius.board;

import java.util.List;

public interface BoardService {

	List<BoardVO> getBoardList(Pagination p) throws Exception;

	BoardInfoVO getBoardInfo(int bno) throws Exception;

	void insertBoard(BoardVO boardVO) throws Exception;

	BoardVO getDetail(int no) throws Exception;

	void updateBoard(BoardVO boardVO) throws Exception;

	void deleteBoard(BoardVO boardVO) throws Exception;

	void updateCount(int board_no) throws Exception;


}
