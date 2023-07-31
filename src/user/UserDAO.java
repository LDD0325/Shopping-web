package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//자바빈
//DAO는데이터베이스에 회원정보를 넣고자할때 사용한데
public class UserDAO {
   
   private Connection conn; //커넥션은 데이터베이스에 접근하게 해주는 하나의 객체
    private PreparedStatement pstmt;
    private ResultSet rs; //어떠한 정보를 담을 수 있는 하나의객체
    
    public UserDAO() { 
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
    
    public int login(String userID, String userPassword) {
       String SQL="SELECT userPassword FROM USER WHERE userID = ?"; 
       try {
          pstmt=conn.prepareStatement(SQL);
          pstmt.setString(1, userID); //해킹기법을 방어하기위한?
          rs = pstmt.executeQuery(); //결과담기
          if(rs.next()) { //결과가 존재한다면
             if(rs.getString(1).equals(userPassword)) //28줄에 입력한 정보와 패스워드가 일치한다면
                return 1; //로그인 성공 
             else 
                return 0; //비밀번호 불일치
          }
          return -1; //결과가 존재하지않는다면 //아이디가 없음
       } catch (Exception e) {
          e.printStackTrace();
       }
       return -2; //데이터베이스 오류
    }
    
    //회원가입
    
   public int join(User user) {
	   String SQL ="INSERT INTO USER VALUES (?, ?, ?, ?, ?)"; //물음표가 다섯개인이유 아이디,패스워드,이름,성별,이메일
	   try {
		   pstmt=conn.prepareStatement(SQL);
		   pstmt.setString(1,  user.getUserID());;
		   pstmt.setString(2,  user.getUserPassword());;
		   pstmt.setString(3,  user.getUserName());;
		   pstmt.setString(4,  user.getUserGender());;
		   pstmt.setString(5,  user.getUserEmail());;
		   return pstmt.executeUpdate();
	   } catch(Exception e) {
		   e.printStackTrace();
	   }
	   return -1; //데이터베이스 오류
   }
   
   

   
   
}