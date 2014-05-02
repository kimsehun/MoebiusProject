package kr.co.moebius.board;

import java.util.List;

public interface BoardService {

	List<BoardVO> getBoardList(Pagination p) throws Exception;

	BoardInfoVO getBoardInfo(int bno) throws Exception;

}
