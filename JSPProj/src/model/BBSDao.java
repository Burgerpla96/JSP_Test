package model;
/*
 * DAO(Data Access Object):
 * 데이터에 접근해서 CRUD작업을 수행하는 업무처리 로직을 갖고 있는 객체
 * 
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class BBSDao {
	//맴버변수
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자
	public BBSDao(ServletContext context, String user, String password) {
		/*
		try {
			//Driver loading
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			conn = DriverManager.getConnection(
					context.getInitParameter("ORACLE_URL"),user,password);
			//System.out.println("데이터 베이스 연결 성공");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		*/
		
		//커넥션 풀 사용
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/jsp");
			conn = source.getConnection();
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		
	}//////BBSDao 생성자
	
	//회원 여부 판단용
	public boolean isMember(String user, String password) {
		String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pwd=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) return false;//회원이 아님
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}//////isMember
	
	
	
	
	//자원 반납용
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}////close
	
	
	
	
	
	//레코드를 BBSDto 넣기
	public List<BBSDto> selectList(Map map){
		List<BBSDto> list = new Vector<BBSDto>();
		//페이징 적용 전, 전체 쿼리(한 페이지에 여러개 보여주는 것)
		//String sql = "SELECT b.*,name FROM bbs b JOIN member m ON b.id = m.id ORDER BY no DESC";
		//페이징 후 구간 쿼리로
		String sql = "SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM bbs b JOIN member m ON b.id = m.id ";
		if(map.get("keyword") != null) {
			sql += " WHERE "+map.get("columnName")+" LIKE '%"+map.get("keyword")+"%' ";
		}
		sql += " ORDER BY no DESC) T) WHERE R BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum 설정
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				//쿼리 결과를 dto에 담고, list에 저장
				BBSDto dto = new BBSDto();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitcount(rs.getString(5));
				dto.setName(rs.getString(7));
				list.add(dto);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}///////selectList
	
	
	
	//총 레코드 수 얻기용
	public int getTotalRowCount(Map map) {
		int totalRowCount = 0;
		
		//String sql = "SELECT COUNT(*) FROM bbs";
		String sql = "SELECT COUNT(*) FROM bbs b JOIN member m ON m.id=b.id ";
		//검색시에는 아래 쿼리문 추가
		if(map.get("keyword") != null) {
			sql += " WHERE "+map.get("columnName")+" LIKE '%"+map.get("keyword")+"%' ";
		}
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRowCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalRowCount;
	}/////////getTotalRowCount
	
	
	
	
	
	
	
	//입력용
	public int insert(BBSDto dto) {
		int affected = 0;
		String sql = "INSERT INTO bbs(no,id,title,content) VALUES(SEQ_BBS.NEXTVAL,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}///////insert
	
	
	//상세 보기용
	public BBSDto selectOne(String no, String prevPage) {
		BBSDto dto = null;
		String sql = null;
		
		try {
			//목록에서 넘어온 경우애만 조회수 증가
			if("LIST.JSP".equals(prevPage.toUpperCase())) {
				//조회수 업데이트
				sql = "UPDATE bbs SET visitcount = visitcount+1 WHERE no=?";
				conn.setAutoCommit(false);
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, no);
				psmt.executeUpdate();
			}
			
			//레코드 하나 조회
			sql = "SELECT b.*,name FROM bbs b JOIN member m ON b.id = m.id WHERE no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				 dto = new BBSDto();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitcount(rs.getString(5));
				dto.setName(rs.getString(7));
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return dto;
	}//////selectOne
	
	
	//이전글 다음글
	public Map<String, BBSDto> prevNext(String no) {
		Map<String, BBSDto> map = new HashMap<String, BBSDto>();
		try {
			//이전글 얻기
			String sql = "SELECT no,title FROM bbs WHERE no=(SELECT MIN(no) FROM bbs WHERE no>?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {//이전글이 있는 경우
				map.put("PREV", new BBSDto(rs.getString(1), null,rs.getString(2),null,null,null));
				
			}
			//다음 글 얻기
			sql = "SELECT no,title FROM bbs WHERE no=(SELECT MAX(no) FROM bbs WHERE no<?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {//다음글이 있는 경우
				map.put("NEXT", new BBSDto(rs.getString(1), null,rs.getString(2),null,null,null));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return map;
	}////prevNext
	
	
	//내용 수정
	public int update(BBSDto dto) {
		int affected = 0;
		String sql = "UPDATE bbs SET title=?,content=? WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(3, dto.getNo());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
		
	}///update
	
	
	//내용 삭제
	public int delete(String no) {
		int affected = 0;
		String sql = "DELETE bbs WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
		
	}///update
	
	
}
