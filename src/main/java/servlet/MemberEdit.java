package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import membership.MemberDAO;
import membership.MemberDTO;
import utils.JSFunction;

public class MemberEdit extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       

	//회원정보 수정페이지 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");
		String pass = (String)session.getAttribute("pass");
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.getMemberDTO(id,pass);
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/pages/member/MemberEdit.jsp").forward(req, resp);
	}
	
	//수정처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        String name = req.getParameter("name");
        String tel = req.getParameter("tel");
        String email = req.getParameter("email");
        
        MemberDTO dto = new MemberDTO();
        dto.setId(id);
        dto.setPass(pass);
        dto.setName(name);
        dto.setTel(tel);
        dto.setEmail(email);
        
        MemberDAO dao = new MemberDAO();
        int result = dao.updateDTO(dto);
        dao.close();
        System.out.println(result);
        
        if (result == 1) { 
        	JSFunction.alertLocation(resp, "회원정보를 수정하였습니다.", "./login.do");
        }
        else {  
            JSFunction.alertLocation(resp, "회원 정보 수정에 실패했습니다.",
                "../../index.do");
        }
        
        
	}

}
