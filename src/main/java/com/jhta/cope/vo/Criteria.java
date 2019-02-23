package com.jhta.cope.vo;

public class Criteria {
	// 더 추가하실거 있으시면 추가하셔서 사용하세요~
	private int beginIndex; // 값의 시작이에요.
	private int endIndex; // 값의 마지막이에요.
	private String target; //
	private String keyword; // 검색어입니다.
	private String sort; // 정렬 기준이에요..
	private String searchType; // 검색 종류입니다. 제목으로 검색,날짜로 검색 등등
	private int userNo;
	private String lang;

	public Criteria() {
	}

	// cp랑 rows(보여줄 값의 개수)를 Criteria 객체를 만들 때 넣어주세요.
	// Criteria criteria = new Criteria(cp,10);
	public Criteria(int cp, int rows) {
		this.setBeginIndex((cp - 1) * rows + 1);
		this.setEndIndex(cp * rows);
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	@Override
	public String toString() {
		return "Criteria [beginIndex=" + beginIndex + ", endIndex=" + endIndex + ", target=" + target + ", keyword="
				+ keyword + ", sort=" + sort + ", searchType=" + searchType + "]";
	}

}
