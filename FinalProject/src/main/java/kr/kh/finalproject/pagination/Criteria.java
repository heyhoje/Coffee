package kr.kh.finalproject.pagination;

import lombok.Data;

@Data
public class Criteria {
	private int page; //현재 페이지
	private int perPageNum; //한 페이지에서 컨텐츠 개수
	
	public Criteria() {
		page = 1;
		perPageNum = 10; // 사진으로 배치할 경우, 몇개씩 배치할지를 어떻게 적용할까?
						// 전체 페이지에 나오는 게시물 개수 (4로 설정하면 X한 행에 4개의 이미지X가 배치되는것! 아님. 전체페이지 개수)
	}
	
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	//게시글 리스트에서 현재 페이지에 맞는 게시글을 가져오기 위한 시작 번지 
	public int getPageStart() {
		return (page - 1) * perPageNum;
	}
	public String getUrl(int page) {
		return "?page=" + page;
	}
	public String getUrl() {
		return "?page=" + page;
	}

}