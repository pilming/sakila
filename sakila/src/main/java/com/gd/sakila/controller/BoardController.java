package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	// 리턴타입 뷰이름 문자열 C -> V
	@GetMapping("/removeBoard")
	public String removeBoard(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		log.debug("▶▶▶▶▶▶ param: "+boardId);
		model.addAttribute("boardId", boardId);
		return "removeBoard";
	}
	// C -> M -> redirect(C)
	@PostMapping("/removeBoard")
	public String removeBoard(Board board) {
		int row = boardService.removeBoard(board);
		log.debug("removeBoard(): "+row);
		if(row == 0) {
			return "redirect:/getBoardOne?boardId="+board.getBoardId();
		}
		return "redirect:/getBoardList";
	}

	
	@GetMapping("/addBoard")
	public String addBoard() {
		return "addBoard";
	}
	
	@PostMapping("/addBoard")
	public String addBoard(Board board) { // 커맨드객체
		boardService.addBoard(board);
		return "redirect:/getBoardList";
	}
	
	
	@GetMapping("/getBoardOne")
	   public String getBoardOne(Model model, @RequestParam(value="boardId", required = true) int boardId) {
	      // 디버깅 코드
	      log.debug(" boardId : "+boardId); 
	      
	      Map<String, Object> map = boardService.getBoardOne(boardId);
	      
	      //디버깅 코드
	      log.debug(" map : "+map); 
	      
	      model.addAttribute("boardMap", map.get("boardMap"));
	      model.addAttribute("commentList", map.get("commentList"));
	      return "getBoardOne";
	   }

	
	@GetMapping("/getBoardList")
	public String getBoardList(Model model,
							@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
							@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
							@RequestParam(value="searchWord", required = false ) String searchWord) {
			System.out.println(currentPage+"<--currentPage");
			System.out.println(rowPerPage+"<--rowPerPage");
			System.out.println(searchWord+"<--searchWord");
		
		Map<String, Object> map = boardService.getBoardList(currentPage, rowPerPage, searchWord);	
		// model.addAttribute("map", map);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));
		
		return "getBoardList";
	}
}