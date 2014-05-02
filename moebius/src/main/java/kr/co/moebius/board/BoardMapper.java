package kr.co.moebius.board;

import java.util.List;

public interface BoardMapper {

	List<BoardVO> getBoardList(Pagination p) throws Exception;

	BoardInfoVO getBoardInfo(int bno) throws Exception;

}
