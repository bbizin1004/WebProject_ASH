package freeboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/pages/freeboard/view.do")
public class ViewController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		FreeboardDAO dao = new FreeboardDAO();
        
		String num = req.getParameter("num");
        //게시물의 조회수 증가 
        dao.updateVisitCount(num);
        //내용을 출력할 게시물 인출 
        FreeBoardDTO dto = dao.selectView(num);
        dao.close();

        //웹브라우저 출력시 엔터키는 <br>태그로 변경해야 줄바꿈 처리된다.
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
        
        
        //request영역에 DTO를 저장한 후 포워드 
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/pages/freeboard/View.jsp").forward(req, resp);
    }
	
	
}
