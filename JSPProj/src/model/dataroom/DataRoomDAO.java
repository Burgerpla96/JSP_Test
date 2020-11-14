package model.dataroom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import model.PBKDF2;

public class DataRoomDAO {
	//field
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	//tomcat이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기
	public DataRoomDAO(ServletContext context) {
		//데이타 베이스 연결하기 - 커넥션 풀이용
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/jsp");
			conn = source.getConnection();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}/////////DataRoomDAO
	

	//자원 반납용
	public void close() {
		try {
			//메모리 해제
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			//메모리 반납 (커넥션 풀의 이용으로 해제가 아님!)
			if(conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}/////////close

	
	
	/*
	 * 페이징 순서
	 * 1. 전체 목록용 쿼리를 구간쿼리로 변경
	 * 2. 전체 레코드수 얻기용 메서드 추가
	 * 3. 페이징 로직을 리스트 컨트롤러에 추가
	 * 4. 리스트.jsp페이지에 결과값 풀력
	 */
	public List<DataRoomDTO> selectList(Map map) {
		List<DataRoomDTO> list = new Vector<DataRoomDTO>();
		//페이징 적용전 쿼리
		//String sql = "SELECT * FROM dataroom ORDER BY no DESC";
		
		//구간 처리
		String sql = "SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT * FROM dataroom ORDER BY no DESC) T) WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			//시작 및 끝 행번호 설정
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				DataRoomDTO dto = new DataRoomDTO();
				dto.setAttachFile(rs.getString(6));
				dto.setContent(rs.getString(4));
				dto.setDownCount(rs.getString(7));
				dto.setName(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPassword(rs.getString(8));
				dto.setPostDate(rs.getDate(5));
				dto.setTitle(rs.getString(3));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}/////////////selectList


	//입력용
	public int insert(DataRoomDTO dto) {
		int affected = 0;
		String sql = "INSERT INTO dataroom(no,name,title,password,content,attachFile) VALUES(SEQ_DATAROOM.NEXTVAL,?,?,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getPassword());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getAttachFile());
			affected = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}/////////////////insert
	
	
	
	
	//전체 레코드 수 얻기용
	public int getTotalRecordCount() {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM dataroom";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}///////////getTotalRecordCount
	
	
	
	
	
	
	
	
	
	//상세보기용
	public DataRoomDTO selectOne(String no) {
		DataRoomDTO dto = new DataRoomDTO();
		//페이징 적용전 쿼리
		String sql = "SELECT * FROM dataroom WHERE no= ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setAttachFile(rs.getString(6));
				dto.setContent(rs.getString(4).replace("\r\n", "<br/>"));
				dto.setDownCount(rs.getString(7));
				dto.setName(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPassword(rs.getString(8));
				dto.setPostDate(rs.getDate(5));
				dto.setTitle(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}/////////////selectOne

	
	
	//비밀번호 확인용
	public boolean isCorrectPassword(String no, String password) {
		String sql = "SELECT password FROM dataroom WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				//if(!rs.getString(1).equals(password)) return false;
				
				//암호화용 비교
				String goodHash = rs.getString(1);
				if(!PBKDF2.validatePassword(password, goodHash)) {
					return false;
				}
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}/////////////////isCorrectPassword

	
	//삭제용 
	public int delete(String no) {
		String sql = "DELETE dataroom WHERE no=?";
		int affected = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	
	//수정용
	public int update(DataRoomDTO dto) {
		int affected = 0;
		String sql = "UPDATE dataroom SET name=?, title=?, content =?, attachFile =? WHERE no=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachFile());
			psmt.setString(5, dto.getNo());
			affected = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	
	//다운로드 수 증가용
	public void updateDownCount(String no) {
		
		String sql = "UPDATE dataroom SET downcount=downcount+1 WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}//////////////updateDownCount
	
	
	
	
}
