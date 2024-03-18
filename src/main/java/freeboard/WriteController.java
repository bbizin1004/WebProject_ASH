package freeboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

public class WriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		JSFunction.loginCheck(req, resp);
		
		req.getRequestDispatcher("./Write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		JSFunction.loginCheck(req, resp);
		
		HttpSession session = req.getSession();
		
		
        FreeBoardDTO dto = new FreeBoardDTO(); 
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setId(session.getAttribute("id").toString());


        // DAO를 통해 DB에 게시 내용 저장
        FreeboardDAO dao = new FreeboardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        // 성공 or 실패?
        if (result == 1) {  
        	System.out.println("성공");
        	
        	// 글쓰기 성공시 목록 페이지로 이동
            resp.sendRedirect("./freeBoard.do");
        }
        else {  
        	// 글쓰기 실패시 쓰기 페이지로 이동 
        	 JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.",
                     "/WebProject_ASH/pages/freeboard/write.do");
        }
	
	}
	
}
