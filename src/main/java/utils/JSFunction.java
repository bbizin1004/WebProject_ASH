package utils;

import java.io.PrintWriter;
import java.net.http.HttpRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.JspWriter;

public class JSFunction {

	// jsp에서 사용
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "<script>" + "    alert('" + msg + "');" + "    location.href='" + url + "';" + "</script>";
			out.println(script);
		} catch (Exception e) {
		}
	}

	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "<script>" + "    alert('" + msg + "');" + "    history.back();" + "</script>";
			out.println(script);
		} catch (Exception e) {
		}
	}

	// 여기서부터 Servlet에서 사용
	public static void alert(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();

			String script = "<script>" + "    alert('" + msg + "');" + "</script>";
			writer.println(script);
			writer.close();
		} catch (Exception e) {
		}
	}

	// 경고후 이동
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			System.out.println("oiiiiiiiiiiiiiiiiiii");
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();

			String script = "<script>" + "    alert('" + msg + "');" + "    location.href='" + url + "';" + "</script>";
			writer.println(script);
			writer.println("lllllllllllllllllllllll");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 경고후 뒤로
	public static void alertBack(HttpServletResponse resp, String msg) {
        try {
        	resp.setContentType("text/html; charset=UTF-8");
        	PrintWriter writer = resp.getWriter();
        	
            String script = "<script>"
                          + "    alert('" + msg + "');"
                          + "    history.back();"
                          + "</script>";
            writer.println(script);
        }
        catch (Exception e) {}
    }

	// 로그인 검증
	public static void loginCheck( HttpServletRequest req, HttpServletResponse resp ) {
				
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주십시오.",
				req.getContextPath()+"/pages/member/login.do");
		}
	}
    
}
