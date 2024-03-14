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

public class login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/pages/member/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		MemberDAO dao = new MemberDAO();

		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		dao.close();

		HttpSession session = req.getSession();

		if (memberDTO.getId() != null) {
			session.setAttribute("id", memberDTO.getId());
			session.setAttribute("pass", memberDTO.getPass());
			resp.sendRedirect("../../index.jsp");
		} else {
			// 가입 실패시 로그인 페이지로 이동 
       	 JSFunction.alertLocation(resp, "로그인에 실패했습니다.",
                    "/pages/member/login.do");
			
		}

	}

}
