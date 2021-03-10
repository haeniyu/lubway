package com.lubway.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Paging {
	public static final int PAGE_SCALE = 10; // 페이지당 게시물 수
	public static final int BLOCK_SCALE = 10; // 화면당 페이지 수
	
	private int curPage; // 현재 페이지
	private int prevPage; // 이전 페이지
	private int nextPage; // 다음 페이지
	private int totPage; // 전체 페이지 갯수
	private int totBlock; // 전체 페이지 블록 갯수
	private int curBlock; // 현재 블록
	private int prevBlock; // 이전 블록
	private int nextBlock; // 다음 블록
	private int pageBegin; // #{start} 변수에 전달될 값
	private int pageEnd; // #{end} 변수에 전달될 값
	private int blockBegin; // 블록의 시작 페이지 번호
	private int blockEnd; // 블록의 끝 페이지 번호
	
	// 생성자
	// Paging(레코드 객수, 출력할 페이지 번호)
	public Paging(int count, int curPage) {
		curBlock = 1; // 현재 블록 번호
		this.curPage = curPage; // 현재 페이지 번호
		setTotPage(count); // 전체 페이지 갯수 계산
		setPageRange(count); // #{start}, #{end} 값 계산하는 메소드
		setTotBlock(); // 전체 블록 갯수 계산
		setBlockRange(); // 블록의 시작,끝 번호 계산
	}
	
	public void setBlockRange() {
		// 원하는 페이지가 몇 번째 블록에 속하는지 계산
		curBlock = (curPage-1)/BLOCK_SCALE + 1;
		
		// 블록의 시작페이지, 끝 페이지 번호 계산
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		blockEnd = blockBegin+BLOCK_SCALE-1;
		
		// 마지막 블록 번호가 범위를 초과하지 않도록 처리
		if(blockEnd > totPage) {
			blockEnd = totPage;
		}
		
		// 이전, 다음 눌렀을 때 이동할 페이지 번호
		prevPage = (curBlock==1) ? 1 : (curBlock-1)*BLOCK_SCALE;
		nextPage = curBlock>totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		
		// 마지막 페이지가 범위를 초과하지 않도록 처리
		if(nextPage >= totPage) {
			nextPage = totPage;
		}
	}
	
	// 페이지 블록의 총 갯수 계산(총 100페이지라면 10개의 블록임)
	public void setTotBlock() {
		totBlock = (int)Math.ceil(totPage*1.0 / BLOCK_SCALE);
	}
	
	public void setPageRange(int count) {
		// 시작번호 = (현재페이지-1) * 페이지당 게시물 수 + 1
		// 끝번호 = 시작번호 + 페이지당 게시물 수 -1
		pageBegin = (curPage-1) * PAGE_SCALE + 1;
		pageEnd = pageBegin + PAGE_SCALE - 1;
	}
	
}
