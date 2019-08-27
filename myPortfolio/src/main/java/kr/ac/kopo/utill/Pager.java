package kr.ac.kopo.utill;

public class Pager {
	int page = 1;//0번 페이지는 존재하지 않기 때문에 1부터 시작
	int perPage = 4; //페이지당 보여줄 개수
//	int perPage = 10;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		//1보다 작은 수로 접속 하였을 경우 1로 셋팅하여 출력
		if(page < 1)
			this.page = 1;
		else
			this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}


}
