package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j //log객체 생성후 주입
@Service //스프링에서 서비스 스캔 뉴객체생성
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
	// boardUpadte( 수정 액션 )
	public int modifyBoard(Board board) {
		log.debug("modifyBoard 에서 board : "+ board.toString());
		return boardMapper.updateBoard(board);
	}
	//삭제액션
	public int removeBoard(Board board) {
		log.debug("▶▶▶▶▶▶ removeBoard() param: "+ board.toString());
		
		
		//2)게시글삭제 //fk를 지정하지않거나, fk를 delete no action으로
		int boardRow = boardMapper.deleteBoard(board);
		if(boardRow == 0) {
			return 0;
		}
		log.debug("▶▶▶▶▶▶ removeBoard() boardRow: "+ boardRow);
		
		//1)댓글삭제
		int commentRow = commentMapper.deleteCommentByBoardId(board.getBoardId());
		log.debug("▶▶▶▶▶▶ removeBoard() commentRow: "+ commentRow);
		
		
		return boardRow;
	}
	//추가액션
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	public Map<String, Object> getBoardOne(int boardId) {
      //1)상세보기
      Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
      //2)댓글 목록
      List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
      log.debug("commentList size() : "+ commentList.size());
      
      Map<String, Object> map = new HashMap<>();
      map.put("boardMap", boardMap);
      map.put("commentList", commentList);

      return map;
	}

	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		//1
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // searchWord
		int lastPage = (int)(Math.ceil((double)boardTotal / rowPerPage));
		
		//2
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		List<Board> boardList = boardMapper.selectBoardList(page); // Page
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		return map;
	}
}