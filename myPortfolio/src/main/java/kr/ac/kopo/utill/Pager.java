package kr.ac.kopo.utill;

public class Pager {
	//페이지당 보여줄 개수
	int perPage = 10; 
	//총 게시물 수
	float total = 0; 
	//db에 입력되는 page번호(소수로 입력할 경우를 대비하여 정수로 변환 시킨값)
	int dbPage =1;
	//사용자가 요청하는 page 번호(소수로 입력할 경우를 대비하여 float으로 받는다.)
	float page = 1;//0번 페이지는 존재하지 않기 때문에 1부터 시작
	//검색 기능에 사용되는 변수들 list.jsp 의 form 태그 확인.
	String searchMode; //jsp에서 1,2,3, 이런식으로 넘겨주는 값을 받는 변수 (약간의 보안 강화를 위해)
	String search;//입력받은 숫자를 실제 컬럼으로 변환해서 저장하는 변수(db 연결용)
	String keyword;
	
	
	
	
	public String getSearchMode() {
		return searchMode;
	}
	public void setSearchMode(String searchMode) {
		this.searchMode = searchMode;
	}
	//검색
	public String getSearch() {
		return search;
	}
	//jsp 에서 받아온 값을 Board 클래스의 getSearch 메서드를 통해 비교하여 리턴된 값을 셋팅한다.
	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//아래부터 페이징
	public int getDbPage() {
		return dbPage;
	}
	
	public void setPage(float page) {
		if(page < 1)
			this.page = 1; //1보다 작으면 1페이지
		else {
			this.dbPage = (int) Math.floor(page); // 소수로 들어오는 값은 버림처리
		}
	}

	public float getPage() {
		return page;
	}
	public String getPagination() {
		String html;
		//총 페이지 수
		int maxPage = 1; 
		//페이징 블럭 처리를 위해 선언
		int startPage = 1;
		//끝 페이지의 기본 값은 총 페이지 수
		int endPage = maxPage;
		//페이지 이동시 검색결과 남이있게 해주기 위해 만든 변수
		String searchSQL = "";
		
		if(searchMode != null && keyword != null)
			searchSQL = "searchMode="+searchMode+"&keyword="+keyword+"&";
		
		
		//총 페이지 수는 총 게시글 수 나누기 보여줄 게시글 수의 값을 올림처리 한 것
		maxPage = (int) Math.ceil(total/ perPage);
		//시작 페이지는 현재 페이지 -1 한 값을 5로 나누고 그 값에 5를 곱하고 +1
		//dbPage 의 자료형이 int(정수라) 소수점 버림 처리가 되기 때문에 계산한 결과 값이 1 , 2 이런식으로 나옴..
		startPage = ((dbPage -1) / 5) * 5 + 1;
		//시작 페이지 +4 가 총 페이지 수보다 많으면 최종 페이지로 아니면 시작 페이지 +4로
		endPage = startPage + 4 > maxPage ? maxPage : startPage + 4;
		
		//문자열 타입 변수에 html 코드를 작성 하여 return 시켜준다. jsp의 el로 표현됨...
		html ="<ul>";
		html += "<li><a href='?"+searchSQL+"page=1'>처음</a></l i>";
		html += "<li><a href='?"+searchSQL+"page="+ (dbPage < 2 ? 1: dbPage - 5) +"'>이전</a></li>";
		
		//반복문을 사용하여 페이징 블럭 처리
		for(int i= startPage; i <= endPage; i++) {
			//삼항연산지를 사용해 현재 접속한 page를 확인하여 클래스 부여(css 처리)
			html +="<li class='"+ (i == dbPage ? "current-page" : "")+"'><a href='?"+searchSQL+"page="+i+"'>"+i+"</a></li>";	
		}
		
		html += "<li><a href='?"+searchSQL+"page="+ (dbPage + 5 >= maxPage ? maxPage : dbPage + 5 ) + "'>다음</a></li>";
		html += "<li><a href='?"+searchSQL+"page="+maxPage+"'>끝</a></li>";
		html +="</ul>";
		return html;
	}
	
	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

//	public void setPage(int page) {
//		//1보다 작은 정수로 접속 하였을 경우 1로 셋팅하여 출력
//		//소수로 들어왔을 경우 에러 처리가 필요함.
//		if(page < 1)
//			this.page = 1;
//		else
//			this.page = page;
//	}
	
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}


}
