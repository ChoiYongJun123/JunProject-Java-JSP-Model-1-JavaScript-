package jsp.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO 
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static BoardDAO instance;
	
	private BoardDAO(){}
	public static BoardDAO getInstance(){
		if(instance==null)
			instance=new BoardDAO();
		return instance;
	}
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
	public BoardBean getDetail(int boardNum)
	{			Connection con = null;

		BoardBean board = null;
		
		try {
			con=getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * from BOARD where NUM = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNum);
			
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				board = new BoardBean();
				board.setNum(boardNum);
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("SUBJECT"));
				board.setContent(rs.getString("CONTENT"));
				board.setFile(rs.getString("FILE"));
				board.setReadcount(rs.getInt("READCOUNT"));
				board.setDate(rs.getTimestamp("DATE"));
			}
			
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		return board;
	} // end getDetail()
	
	// ��ȸ�� ����
	public boolean updateCount(int boardNum)
	{		Connection con = null;

		boolean result = false;
		
		try {
			con=getConnection();
			
			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("update BOARD set COUNT = COUNT+1 ");
			sql.append("where NUM = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNum);
			
			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				conn.commit(); 
			}	
		} catch (Exception e) {
			try {
				conn.rollback(); // ������ �ѹ�
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		}
		
		return result;
	} // end updateCount
	
	
	
}
