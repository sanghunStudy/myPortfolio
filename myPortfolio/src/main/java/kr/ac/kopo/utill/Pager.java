package kr.ac.kopo.utill;

public class Pager {
	int page = 1;//0번 페이지는 존재하지 않기 때문에 1부터 시작
	int perPage = 4; //페이지당 보여줄 개수
	float total = 0;
	public String getPagination() {
		String html;
		int maxPage = 1;
		
		maxPage = (int) Math.ceil(total/ perPage);
		
		html ="<ul>";
		for(int i=1; i <= maxPage; i++) {
			html +="<li><a href='list?page="+i+"'>"+i+"</a></li>";	
		}
		html +="</ul>";
		return html;
	}
	
	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getPage() {
		return page;
	}
//	public void setPage(int page) {
//		//1보다 작은 정수로 접속 하였을 경우 1로 셋팅하여 출력
//		//소수로 들어왔을 경우 에러 처리가 필요함.
//		if(page < 1)
//			this.page = 1;
//		else
//			this.page = page;
//	}
	
	
	public void setPage(int inPage) {
//1보다 작은 정수로 접속 하였을 경우 1로 셋팅하여 출력
//		소수로 들어왔을 경우 에러 처리가 필요함.
		if(page < 1)
			this.page = 1;
		else
			this.page = (int) Math.floor(inPage);
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}


}
