package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	 private Connection conn; //커넥션은 데이터베이스에 접근하게 해주는 하나의 객체
	    private PreparedStatement pstmt;
	    private ResultSet rs; //어떠한 정보를 담을 수 있는 하나의객체
	    
	    public BbsDAO() { 
	       try {
	    	   String dbURL = "jdbc:mysql://localhost:3306/BBS";
	           String dbID="root";
	           String dbPassword="1234";
	           Class.forName("com.mysql.jdbc.Driver"); 
	           conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
	       } catch(Exception e) { 
	          e.printStackTrace();
	       } 
	    }
	    
	    public String getDate() { //현재시간을넣어줌
	    	String SQL="SELECT NOW()"; //현재시간을 불러오는 mysql문장
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		rs=pstmt.executeQuery(); //실행했을때 나오는결과 가져오기
	    		if(rs.next()) { //대화가있는경우
	    			return rs.getString(1); //현재의날짜를 반환
	    		}
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return ""; //데이터베이스오류
	    	
	    	
	    }

	    
	    public int getNext() { 
	    	String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC"; //가장 내림차순해서 제일마지막에쓰인 글번호를 가져오기
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		rs=pstmt.executeQuery(); //실행했을때 나오는결과 가져오기
	    		if(rs.next()) { //대화가있는경우 
	    			return rs.getInt(1) + 1; //나온결과에 1을더해서 그다음게시글에 적용
	    		}
	    		return 1; //첫번째 게시물인 경우 1로하기
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return -1; //데이터베이스오류	
	    }
	    
	    public int write(String bbsTitle, String userID, String bbsContent) {
	    	String SQL="INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		pstmt.setInt(1,  getNext()); //다음번에쓰이게될 게시글번호
	    		pstmt.setString(2,  bbsTitle);
	    		pstmt.setString(3,  userID);
	    		pstmt.setString(4,  getDate());
	    		pstmt.setString(5,  bbsContent);
	    		pstmt.setInt(6, 1);
	            return pstmt.executeUpdate();
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return -1; //데이터베이스오류
	    }
	    
	    public ArrayList<Bbs> getList(int pageNumber){
	    	String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
	    	ArrayList<Bbs> list = new ArrayList<Bbs>();
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		pstmt.setInt(1,  getNext() - (pageNumber -1) * 10);
	    		rs=pstmt.executeQuery(); 
	    		while (rs.next()) {
	    			Bbs bbs = new Bbs();
	    			bbs.setBbsID(rs.getInt(1));
	    			bbs.setBbsTitle(rs.getString(2));
	    			bbs.setUserID(rs.getString(3));
	    			bbs.setBbsDate(rs.getString(4));
	    			bbs.setBbsContent(rs.getString(5));
	    			bbs.setBbsAvailable(rs.getInt(6));
	    			list.add(bbs);
	    		}
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return list;
	    }
	    
	    public boolean nextPage(int pageNumber) {
	    	String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		pstmt.setInt(1,  getNext() - (pageNumber -1) * 10); //글 11개되면 페이지가 2로 늘어남
	    		rs=pstmt.executeQuery(); 
	    		if(rs.next()) {
	    			return true;
	    		}
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return false;
	    }
	    
	    
	    public Bbs getBbs(int bbsID) {
	    	String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		pstmt.setInt(1, bbsID);
	    		rs = pstmt.executeQuery();
	    		if(rs.next()) {
	    			Bbs bbs = new Bbs();
	    			bbs.setBbsID(rs.getInt(1));
	    			bbs.setBbsTitle(rs.getString(2));
	    			bbs.setUserID(rs.getString(3));
	    			bbs.setBbsDate(rs.getString(4));
	    			bbs.setBbsContent(rs.getString(5));
	    			bbs.setBbsAvailable(rs.getInt(6));
	    			return bbs;
	    		}
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return null;
	    }
	    
	    public int update(int bbsID, String bbsTitle, String bbsContent) {
	    	String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		pstmt.setString(1, bbsTitle);
	    		pstmt.setString(2,  bbsContent);
	    		pstmt.setInt(3,  bbsID);
	            return pstmt.executeUpdate();
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return -1; //데이터베이스오류
	    }
	    
	    public int delete(int bbsID) {
	    	String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		pstmt.setInt(1, bbsID);
	            return pstmt.executeUpdate();
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return -1; //데이터베이스오류
	    }
	    	
	    
	  
	    
	    
	    

	
	  
}
