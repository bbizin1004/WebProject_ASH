package freeboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/pages/freeboard/delete.do")
public class DeleteController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		JSFunction.loginCheck(req, resp);
		
		// 게시물 번호 가져옴
        String num = req.getParameter("num");
        
        FreeboardDAO dao = new FreeboardDAO();
        
        //번호에 맞는 게시물 가져옴
        FreeBoardDTO dto = dao.selectView(num);
        
        HttpSession session = req.getSession();
        String sessionId = (String)session.getAttribute("id");
        
        //아이디와 작성자가 본인인지 확인
        if (sessionId.equals(dto.getId())) { 
            int result = dao.deletePost(num);
            dao.close();

            if (result == 1) {
            	//게시물이 삭제되면 목록으로 이동한다. 
            	JSFunction.alertLocation(resp, "삭제되었습니다.", 
                		"./freeBoard.do"); 
            } 
            else {
            	//실패하면 뒤로 이동한다. 
            	 JSFunction.alertBack(resp, "삭제에 실패했습니다.");
            } 
        } 
        else {
            JSFunction.alertBack(resp,"본인만 삭제할 수 있습니다.");
            return;
        }
        
        
	}

}
