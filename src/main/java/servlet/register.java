package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;
import utils.JSFunction;

public class register extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/pages/member/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("pass"));
		dto.setName(req.getParameter("name"));
		dto.setTel(req.getParameter("tel"));
		dto.setEmail(req.getParameter("email"));

		MemberDAO dao = new MemberDAO();
		int result = dao.registerDTO(dto);
		dao.close();
		
        if (result == 1) {  
        	
           resp.sendRedirect("./login.do");
        }
        else {  
        	// 가입 실패시 회원가입 페이지로 이동 
        	 JSFunction.alertLocation(resp, "회원가입에 실패했습니다.",
                     "/pages/member/register.do");
        }
		
	}

}
