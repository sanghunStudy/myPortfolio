package kr.ac.kopo.utill;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrintAlert {
	//공통으로 사용할 화면 출력할 메서드 한번 만들어봄 효율은 모르겠음..
	public static PrintWriter printAlert(String msg,HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter writer = response.getWriter();
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		writer.println("<script>");
		writer.println("alert('"+msg+"')");
		writer.println("location.href='"+request.getContextPath()+"/'");//메인으로 이동 매개변수 받아서 다른 맵핑타도 될듯
		writer.println("</script>");
		writer.flush();
		writer.close();
		return writer;
	}
}
