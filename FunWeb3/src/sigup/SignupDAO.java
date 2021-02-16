package sigup;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberBean;
import member.MemberDAO;

public class SignupDAO {
	
private static SignupDAO instance;
	
	
	public static SignupDAO getInstance(){
		if(instance==null)
			instance=new SignupDAO();
		return instance;
	}
	//디비연결 메서드()
	public Connection getConnection() throws Exception{
//		//1단계 드라이버 불러오기
//		Class.forName("com.mysql.jdbc.Driver");
//		// 2단계 디비연결
//		String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
//		String dbUser="jspid";
//		String dbPass="jsppass";
//		Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//		return con;
		Context init=new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	}
	
	// insertBoard(bb)
	public void insertBoard(SignupBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// 1단계 드라이버 불러오기// 2단계 데이터베이스 연결
			con=getConnection();
			
			// num 게시판 글번호 구하기=> 게시판 글번호 중에 가장 큰번호를 구해와서+1
			//  select * from board;  Empty set (0.00 sec)
			// select num from board;  Empty set (0.00 sec)
			// select max(num) from board;  
			// max(num) 
			// +----------+
			// |     NULL
			int num=0;
			// 3단계 max(num) sql
			String sql="select max(num) from sign";
			pstmt=con.prepareStatement(sql);
			// 4단계 실행
			rs=pstmt.executeQuery();
			// 5단계  첫행(다음행)으로 이동 데이터 있으면  rs에서 max(num) +1 가져와서 num저장
			if(rs.next()){
				num=rs.getInt("max(num)")+1;
			}
			// 3단계 sql insert
			// 데이터베이스 board file 열 추가
			sql="insert into sign(num,name,content,readcount,date) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			// ?값 넣기    set형(물음표 순서,값)
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, bb.getReadcount());
			pstmt.setTimestamp(5, bb.getDate());
			
			
			
			// 4단계 실행 
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
			
		}
	}
	
	// getBoardList()
	public List<SignupBean> getBoardList(int startRow,int pageSize) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//제네릭 사용
		List<SignupBean> boardList=new ArrayList();
		try {
			con=getConnection();
			// 3단계 sql select 게시판 모든 글 가져오기 (num 기준으로 내림차순) 
//			String sql="select * from board order by num desc";
//			String sql="select * from board order by num desc limit 시작행-1,개수";
			String sql="select * from sign order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			// 4단계  ResultSet rs = 실행 결과 저장
			rs=pstmt.executeQuery();
			//5
			while(rs.next()) {
				SignupBean bb=new SignupBean();
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				// 배열 한칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
		}
		return boardList;
	}
	
	// getBoardList()
	
	public List<SignupBean> getBoardList(int startRow,int pageSize, String search) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//제네릭 사용
		List<SignupBean> boardList=new ArrayList();
		try {
			con=getConnection();
			// 3단계 sql select 게시판 모든 글 가져오기 (num 기준으로 내림차순) 
//			String sql="select * from board order by num desc";
//			String sql="select * from board order by num desc limit 시작행-1,개수";
//			String sql="select * from board where subject like '%검색어%' order by num desc limit ?,?";
			String sql="select * from sign where subject like ? order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			// 4단계  ResultSet rs = 실행 결과 저장
			rs=pstmt.executeQuery();
			//5
			while(rs.next()) {
				SignupBean bb=new SignupBean();
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				// 배열 한칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
		}
		return boardList;
	}


	
	// updateReadcount(num)
	public void updateReadcount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// 1,2단계 디비연결 메서드호출 
			con=getConnection();
			// 3단계 조회수 +1증가 update readcount= readcount+1 조건
			String sql="update sign set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
		}
	}
	
	// getBoard(num)
	public SignupBean getBoard(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		SignupBean bb=null;
		try {
			// 1,2단계 디비연결 메서드호출 
			con=getConnection();
			// 3단계 sql select  where num=?
			String sql="select * from sign where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 rs = 실행 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 rs 다음행 이동  num readcount name date subject content
			if(rs.next()){
				bb=new SignupBean();
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				// file
				bb.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
		}
		return bb;
	}
	
	// numCheck(bb)
	public int numCheck(SignupBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//신호값 정하기 1 : num 비밀번호 일치,  0 : 비밀번호 틀림, -1 : num없음  
		int check=-1;
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			String sql="select * from sign where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			// 4단계 실행 결과 => ResultSet rs 
			rs=pstmt.executeQuery();
			// 5단계 rs에 저장된 데이터 있는 확인 .next() 다음행으로 이동 데이터 있으면 True
//			                         // num있음
//			                         없으면 False
//			                         // num 없음
			if(rs.next()){
//				out.println("num있음");
				// if 폼에서 가져온 비밀번호 디비에서 가져온 비밀번호 비교  .equals()
				//  맞으면 "비밀번호 맞음" 틀리면 "비밀번호 틀림"
				if(bb.getPass().equals(rs.getString("pass"))){
//					out.println("비밀번호 맞음");
					check=1;
				}else{
//					out.println("비밀번호 틀림");
					check=0;
				}
			}else{
//				out.println("num없음");
				check=-1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			System.out.println("기억장소 정리하는 마무리 작업");
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
		}
		return check;
	}
	
	// updateBoard(bb)
	public void updateBoard(SignupBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1단계 드라이버 불러오기	// 2단계 디비연결
			con=getConnection();
			// 3단계 sql update만들고 실행할수 있는 객체생성
			String sql="update sign set subject=?,content=? where num=?";
			pstmt=con.prepareStatement(sql);
//			pstmt.setString(1, bb.getName());
			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setInt(3, bb.getNum());
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(rs!=null) try { rs.close();} catch (SQLException ex) {}
			if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
			if(con!=null) try { con.close();} catch (SQLException ex) {}
		}
	}
	
	// deleteBoard(bb)
		public void deleteBoard(SignupBean bb) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1단계 드라이버 불러오기	// 2단계 디비연결
				con=getConnection();
				// 3단계 sql update만들고 실행할수 있는 객체생성
				String sql="delete from sign where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				// 4단계 실행
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				System.out.println("기억장소 정리하는 마무리 작업");
				if(rs!=null) try { rs.close();} catch (SQLException ex) {}
				if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
				if(con!=null) try { con.close();} catch (SQLException ex) {}
			}
		}
		// getBoardCount()
				public int getBoardCount() {
					Connection con=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					int count=0;
					try {
						//1단계 드라이버 불러오기	// 2단계 디비연결
						con=getConnection();
						//3단계 sql
						String sql="select count(*) from sign";
						pstmt=con.prepareStatement(sql);
						// 4단계 실행
						rs=pstmt.executeQuery();
						// 5단계  첫행(다음행)으로 이동 데이터 있으면  rs에서 max(num) +1 가져와서 num저장
						if(rs.next()){
							count=rs.getInt("count(*)");
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						System.out.println("기억장소 정리하는 마무리 작업");
						if(rs!=null) try { rs.close();} catch (SQLException ex) {}
						if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
						if(con!=null) try { con.close();} catch (SQLException ex) {}
					}
					return count;
				}
				

		// search
		public int getBoardCount(String search) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				//1단계 드라이버 불러오기	// 2단계 디비연결
				con=getConnection();
				//3단계 sql
//				String sql="select count(*) from board where subject like '%검색어%'";
				String sql="select count(*) from sign where subject like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				// 4단계 실행
				rs=pstmt.executeQuery();
				// 5단계  첫행(다음행)으로 이동 데이터 있으면  rs에서 max(num) +1 가져와서 num저장
				if(rs.next()){
					count=rs.getInt("count(*)");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				System.out.println("기억장소 정리하는 마무리 작업");
				if(rs!=null) try { rs.close();} catch (SQLException ex) {}
				if(pstmt!=null) try { pstmt.close();} catch (SQLException ex) {}
				if(con!=null) try { con.close();} catch (SQLException ex) {}
			}
			return count;
		}

		
}
