package membership;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
	}

	
	
	
	public int registerDTO(MemberDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO member ( "
					+ " id, pass, name, tel, email, regidate) "
					+ " VALUES ( "
					+ " ?,?,?,?,?,sysdate)";
			psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getId());
            psmt.setString(2, dto.getPass());
            psmt.setString(3, dto.getName());
            psmt.setString(4, dto.getTel());
            psmt.setString(5, dto.getEmail());
            result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}
	
	public int updateDTO(MemberDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE member "
					+ " SET pass=?, name=?, tel=?, email=? "
	            	+ " WHERE id=? ";
			
			psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getPass());
            psmt.setString(2, dto.getName());
            psmt.setString(3, dto.getTel());
            psmt.setString(4, dto.getEmail());
            psmt.setString(5, dto.getId());
            result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public MemberDTO getMemberDTO(String uid, String upass) {

		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE id=? " + " AND pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);

			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setRegidate(rs.getDate(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}