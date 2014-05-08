package kr.co.moebius.board;

import java.util.List;

public interface BoardMapper {

	List<BoardVO> getBoardList(Pagination p) throws Exception;

	BoardInfoVO getBoardInfo(int bno) throws Exception;

	void insertBoard(BoardVO boardVO) throws Exception;

	BoardVO getDetail(int no) throws Exception;

	int updateBoard(BoardVO boardVO) throws Exception;

	int deleteBoard(BoardVO boardVO) throws Exception;

	void updateCount(int board_no) throws Exception;

}
