package com.rundering.manage;

public class Criteria {
	
	private int page=1;
	private int perPageNum = 10;
	private String searchType="";
	private String keyword="";
	
	private int startRowNum=0;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<1) {
			this.page=1;
		}else {
			this.page = page;
		}
		setStartRowNum();
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}

	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	private void setStartRowNum() {
		this.startRowNum=(this.page-1)*perPageNum;		
	}
	public int getStartRowNum() {
		return this.startRowNum;
	}
	
}






