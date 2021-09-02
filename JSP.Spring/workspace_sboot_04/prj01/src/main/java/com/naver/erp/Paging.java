package com.naver.erp;

import java.util.HashMap;
import java.util.Map;

public class Paging {

//	private int totCnt;				// 검색된 총 결과물의 개수
//	private int rowCntPerPage;		// 페이지 당 보여줄 행의 개수
//	private int selectPageNo;		// 선택한 페이지 번호
//	private int pageNoCntPerPage;	// 페이지 당 보여줄 페이지 번호의 개수
//	private int last_pageNo;		// 마지막 페이지 번호
//	private int min_pageNo;			// 현재 화면에 보여지는 페이지 번호의 최소 페이지 번호
//	private int max_pageNo;			// 현재 화면에 보여지는 페이지 번호의 최대 페이지 번호
	
	
	public Map<String,Integer> getPaging(int totCnt, int pageNoCntPerPage, BoardSearchDTO boardSearchDTO) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		int rowCntPerPage = boardSearchDTO.getRowCntPerPage();
		int selectPageNo = boardSearchDTO.getSelectPageNo();
		int last_pageNo = 0;
		int min_pageNo = 0;;			
		int max_pageNo = 0;
		
		if(totCnt > 0) {
			last_pageNo = totCnt/rowCntPerPage;
				if( totCnt%rowCntPerPage > 0 ) { last_pageNo++; }
				//----------------------------------------------------------------
				// 만약 선택 페이지 번호가 마지막 페이지번호보다 크다면
				// 선택 페이지 번호를 1로 변경한다
				//----------------------------------------------------------------
				if( selectPageNo > last_pageNo ) {
					selectPageNo = 1;
					//----------------------------------------------------------------
					// 완전 조심!!! boardSearchDTO에 setter 메소드 호출하여 데이터를 저장해야 한다.
					//----------------------------------------------------------------
					boardSearchDTO.setSelectPageNo(selectPageNo);	
				}
				
			min_pageNo = (selectPageNo - 1)/pageNoCntPerPage * pageNoCntPerPage + 1;
			max_pageNo = min_pageNo + pageNoCntPerPage - 1;
				if(max_pageNo > last_pageNo) { max_pageNo = last_pageNo; }
		}
		
		map.put("last_pageNo", last_pageNo);
		map.put("min_pageNo", min_pageNo);
		map.put("max_pageNo", max_pageNo);
		
		return map;
	}

}
