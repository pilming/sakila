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

@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;

	
	public int removeBoard(Board board) {
		log.debug("▶▶▶▶▶▶ param: "+ board.toString());
		return boardMapper.deleteBoard(board);
	}
	
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