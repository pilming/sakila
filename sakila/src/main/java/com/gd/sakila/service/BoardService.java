package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Page;

@Service
@Transactional
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
	
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	public Map<String, Object> getBoardOne(int boardId) {
		return boardMapper.selectBoardOne(boardId);
	}
	
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		//1
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // searchWord
		/*
		int lastPage = boardTotal / rowPerPage;
		if(boardTotal % rowPerPage != 0) {
			lastPage++;
		}
		*/
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