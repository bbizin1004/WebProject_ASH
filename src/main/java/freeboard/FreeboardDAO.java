package freeboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import jakarta.servlet.http.HttpSession;

public class FreeboardDAO extends DBConnPool {
	
	public FreeboardDAO() {
		super();
	}
	
	//게시물 갯수 확인
	public int selectCount(Map<String, Object> map) {
		int totalCount=0;
		String query = "SELECT COUNT(*) FROM freeboard";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }
        catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }
        return totalCount;
	}
	
	//게시물 인출
	public List<FreeBoardDTO> selectListPage(Map<String,Object> map) {
    	
    	List<FreeBoardDTO> freeboard = new Vector<FreeBoardDTO>();
    	
        String query = "SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM freeboard ";

        if (map.get("searchWord") != null)
        {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += "        ORDER BY num DESC "
               + "    ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while (rs.next()) {
            	FreeBoardDTO dto = new FreeBoardDTO();
            	
                dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString(3));
                dto.setId(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setVisitcount(rs.getInt(6));

                freeboard.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return freeboard;
    }
	
	//글쓰기
	public int insertWrite(FreeBoardDTO dto) {
        int result = 0;
        try {
        	
        	
            String query = "INSERT INTO freeboard ( "
				 + " num, title, content, id,visitcount) "
				 + " VALUES ( "
				 + " seq_board_num.NEXTVAL,?,?,?,0)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getId());
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }    
	
    //내용보기 
    public FreeBoardDTO selectView(String num) {    	
    	FreeBoardDTO dto = new FreeBoardDTO();  
        //일련번호와 일치하는 게시물 1개 인출 
        String query = "SELECT * FROM freeboard WHERE num=?";  
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);  
            rs = psmt.executeQuery();  

            if (rs.next()) {  
                dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString(3));
                dto.setId(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setVisitcount(rs.getInt(6));
            }
        }
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        return dto;  
    }
    
    //조회수 증가 
    public void updateVisitCount(String num) {
        String query = "UPDATE freeboard SET "
                     + " visitcount=visitcount+1 "
                     + " WHERE num=?"; 
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            psmt.executeQuery();
        }
        catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    
    
    //게시물 수정
    public int updatePost(FreeBoardDTO dto) {
        int result = 0;
        try {
            String query = "UPDATE freeboard"
            	+ " SET title=? content=? "
            	+ " WHERE num=? ";
            
            // 쿼리문의 인파라미터 설정 
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());

            // 쿼리문 실행
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
    
    
    //게시물 삭제 
    public int deletePost(String num) {
        int result = 0;
        try {
            String query = "DELETE FROM freeboard WHERE num=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
    
    
    
}
