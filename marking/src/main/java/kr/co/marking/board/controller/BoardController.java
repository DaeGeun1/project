package kr.co.marking.board.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.marking.board.domain.BoardDTO;
import kr.co.marking.board.service.IBoardFileService;
import kr.co.marking.board.service.IBoardService;
import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.IMemberService;
import kr.co.marking.util.domain.Criteria;
import kr.co.marking.util.domain.PageDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	IBoardService boardService;

	@Autowired
	IMemberService memberService;
	
	@Autowired
	IBoardFileService boardFileService;
	
	//게시판 이동
	@GetMapping("/list")
	public String boardListGet(BoardDTO bDto, Criteria criteria, String amount, Model model) {
		
		log.info("==================== controller boardListGet ====================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bDto", bDto);
		map.put("criteria", criteria);
		
		int total = boardService.selectBordTotalCount(map);
		
		map.put("total", total);
		List<BoardDTO> boardList = boardService.selectBoardList(map);
		
		
		PageDTO realEnd = new PageDTO(criteria, total);
		
		model.addAttribute("boardList", boardList);

		model.addAttribute("board_kind", bDto.getBoard_kind());

		model.addAttribute("criteria", criteria);
		
		model.addAttribute("pageMaker", new PageDTO(criteria, total));

		return "/board/boardList";
		
	}
	
	//게시판 글등록 이동
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/add")
	public String boardAddGet(BoardDTO bDto, Principal principal, Criteria criteria, Model model) {
		
		log.info("==================== controller boardAddGet ====================");
		
		MemberDTO memberInfo = memberService.selectMemberInfo(principal.getName());
		
		model.addAttribute("memberInfo", memberInfo);
		
		model.addAttribute("board_kind", bDto.getBoard_kind());

		model.addAttribute("criteria", criteria);
		
		return "/board/boardAdd";
		
	} 
	
	//게시판 글등록 기능 
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/add")
	public String boardAddPost(BoardDTO bDto, Criteria criteria, RedirectAttributes rttr) {
		
		log.info("==================== controller boardAddPost ====================");
		
		boardService.insertBoard(bDto);
		
		rttr.addFlashAttribute("successMessage", "게시글이 성공적으로 등록되었습니다.");
		
		return "redirect:/board/list?board_kind=" + bDto.getBoard_kind() ;
		
	} 
	
	// 상세 게시판 이동
	@PreAuthorize("isAuthenticated()")
	@Transactional
	@GetMapping("/read")
	public String boardReadGet(Principal principal,BoardDTO bDto, Model model, Criteria criteria) {
		
		log.info("==================== controller boardReadGet ====================");
		BoardDTO boardInfo =  boardService.selectBoardOne(bDto.getBoard_no());
		boardService.updateBoardViewCount(bDto.getBoard_no());
		
		MemberDTO memberInfo = null;
		
		if(principal != null) {
			memberInfo = memberService.selectMemberInfo(principal.getName());
		}
		
		model.addAttribute("boardInfo", boardInfo);
		
		model.addAttribute("memberInfo", memberInfo);
		
		model.addAttribute("criteria", criteria);
		
		return "/board/boardRead";
		
	}
	
	//게시판 수정 이동
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modify")
	public String boardModifyGet(BoardDTO bDto, Criteria criteria, Model model) {
		
		log.info("==================== controller boardModifyGet ====================");
		BoardDTO boardInfo =  boardService.selectBoardOne(bDto.getBoard_no());
		
		model.addAttribute("boardInfo", boardInfo);
		
		model.addAttribute("criteria", criteria);
		
		return "board/boardModify";
		
	}
	
	//게시판 수정 기능
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String boardModifyPost(BoardDTO bDto, Criteria criteria, RedirectAttributes rttr) {
		
		log.info("==================== controller boardModifyPost ====================");
		
		boardService.updateBoard(bDto);
		
		rttr.addFlashAttribute("successMessage", "게시글이 성공적으로 수정되었습니다.");
		
		return "redirect:/board/read" + criteria.getListLink()  + "&board_no=" + bDto.getBoard_no() + "&board_kind=" + bDto.getBoard_kind();
		
	}
	
	//게시판 삭제 기능
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/delete")
	public String boardDeletePost(BoardDTO bDto, Criteria criteria, RedirectAttributes rttr) {
		
		log.info("==================== controller boardDeletePost ====================");
		
		boardService.deleteBoard(bDto.getBoard_no());
		
		rttr.addFlashAttribute("successMessage", "게시글이 성공적으로 삭제되었습니다.");
		
		return "redirect:/board/list" + criteria.getListLink()  + "&board_kind=" + bDto.getBoard_kind() ;
	}
	
	
	
	
	
	
	
}
