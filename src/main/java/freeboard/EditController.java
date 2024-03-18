package freeboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/pages/freeboard/edit.do")
public class EditController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	//수정페이지 진입 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	//로그인 검증이 안된다.(오류)
    	JSFunction.loginCheck(req, resp);
    	
    	
        //일련번호에 해당하는 레코드를 읽어와서 DTO에 저장한다. 
    	String num = req.getParameter("num");
    	
        FreeboardDAO dao = new FreeboardDAO();
        FreeBoardDTO dto = dao.selectView(num);
        
    	HttpSession session = req.getSession();
    	String id = (String)session.getAttribute("id");
    	System.out.println("id="+id);
    	System.out.println("dto.getId()="+dto.getId());
    	
    	if(!id.equals(dto.getId())) {
    		JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
    	}
        
        //DTO를 리퀘스트 영역에 저장한 후 포워드한다. 
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("./Edit.jsp").forward(req, resp);
    }
    
    
    //수정처리     
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
    	
    	JSFunction.loginCheck(req, resp);
    	

        
        //폼값정리 : hidden상자에 저장된 내용 
        String num = req.getParameter("num");
        //사용자가 입력한 값 
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        //위 모든 값을 DTO에 저장한다. 
        FreeBoardDTO dto = new FreeBoardDTO();
        
        dto.setNum(num);
        dto.setTitle(title);
        dto.setContent(content);
        
        
        //DAO 인스턴스 생성
        FreeboardDAO dao = new FreeboardDAO();
        //게시물 수정을 위한 update 쿼리문 실행 
        int result = dao.updatePost(dto);
        dao.close();

        if (result == 1) { 
            resp.sendRedirect("../freeboard/view.do?num=" + num);
        }
        else {  
            JSFunction.alertLocation(resp, "수정에 실패했습니다.",
                "../freeboard/view.do?num=" + num);
        }
    }
	
}
