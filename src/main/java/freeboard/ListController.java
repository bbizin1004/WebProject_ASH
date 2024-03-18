package freeboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		FreeboardDAO dao = new FreeboardDAO();

		Map<String, Object> map = new HashMap<String, Object>();

		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map);

		ServletContext application = getServletContext();
		int pageSize = 
				Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage =
				Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);

		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);

		List<FreeBoardDTO> boardLists = dao.selectListPage(map);
		dao.close();

		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./freeBoard.do");
		map.put("pagingImg", pagingImg);// 출력할 페이지 번호
		map.put("totalCount", totalCount);// 게시물의 전체갯수
		map.put("pageSize", pageSize);// 페이지당 출력갯수
		map.put("pageNum", pageNum);// 현재 페이지 번호

		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/pages/freeboard/freeBoardList.jsp").forward(req, resp);
	}
}
