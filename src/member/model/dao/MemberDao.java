package member.model.dao;

import static common.JDBCTemplate.close;


import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;

import member.model.vo.Member;
import myBatis.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class MemberDao {
	public MemberDao() {
		// TODO Auto-generated constructor stub
	}

	//로그인 확인 처리용.
	public Member selectMember(Member member) {
		Member m= null;
		SqlSession session=null;
		try {
			
/*마이 바티스 컨피스 설정파일 읽어서  db에 연결하고 statement객체생성과 동일한의미를 가진 코드*/
session=new SqlSessionFactoryBuilder().build(
Resources.getResourceAsStream("myBatis/mybatis-config.xml")).openSession(false);
//메퍼 파일안에 작성된 쿼리 문을 실행시키고, 결과를 받음
	m=session.selectOne("member.selectMember",member);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	return m;
	}
	
	
public int insertMember(Member member) {
	int result=0;
	SqlSession session=null;
	try {
	session=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("myBatis/mybatis-config.xml")).openSession(false);
	result=session.selectOne("member.insertMember",member);
	} catch (Exception e) {
	e.printStackTrace();
	}finally {
		session.close();
	}

	
	return result;

}
public int updateMember(Member member) {
	int result=0;
	SqlSession session=null;
	try {
		session=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("myBatis/mybatis-config.xml")).openSession(false);
		result=session.selectOne("member.updateMember",member);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		session.close();
	}
	
	return result;
}
public int deleteMember(Member member) {
	int result=0;
	SqlSession session=null;
	try {
		session=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("myBatis/mybatis-config.xml")).openSession(false);
		result=session.selectOne("member.deleteMember",member);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		session.close();
	}
	
	return result;
}
public ArrayList<Member> selectList() {
	int result=0;
	List<Member> al=new ArrayList<Member>();
	SqlSession session=null;
	try {
		session=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("myBatis/mybatis-config.xml")).openSession(false);
		al=session.selectList("member.selectList");
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		session.close();
	}
	
	return (ArrayList<Member>)al;
}
public int selectCheckId(Member member) {
	int result=0;
	SqlSession session=null;
	try {
		session=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("myBatis/mybatis-config.xml")).openSession(false);
		result=session.selectOne("member.selectCheckId",member);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		session.close();
	}
	
	return result;
}
public Member loginCheck(Member member) {
	Member m=new Member();
	SqlSession session=null;
	try {
		session=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("myBatis/mybatis-config.xml")).openSession(false);
		m=session.selectOne("member.loginMember",member);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		
	}
	
	return m;
}
}
	
	
//	private Properties prop;
//	public MemberDao() {
//		prop = new Properties();
//		
//		try {
//			prop.load(new FileReader(
//					MemberDao.class.getResource(
//						"/dbresource/member.properties").getPath()));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public Member loginMember(Connection con, 
//			String userId, String userPwd) {
//		
//		Member loginUser = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		/*String query = "select * from member where userid= ? "
//				+ "and userpwd = ?";*/
//		
//		try {
//			//pstmt = con.prepareStatement(query);
//			pstmt = con.prepareStatement(
//					prop.getProperty("loginMember"));
//			pstmt.setString(1, userId);
//			pstmt.setString(2, userPwd);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				loginUser = new Member();
//				
//				loginUser.setUserId(rset.getString("userid"));
//				loginUser.setUserPwd(rset.getString("userpwd"));
//				loginUser.setUserName(rset.getString("username"));
//				loginUser.setGender(rset.getString("gender"));
//				loginUser.setAge(rset.getInt("age"));
//				loginUser.setPhone(rset.getString("phone"));
//				loginUser.setEmail(rset.getString("email"));
//				loginUser.setHobby(rset.getString("hobby"));
//				loginUser.setEtc(rset.getString("etc"));
//				loginUser.setEnroll(rset.getDate("enroll_date"));
//				loginUser.setLastModified(rset.getDate("lastmodified"));
//			}
//			
//			//System.out.println("dao : " + loginUser);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return loginUser;		
//	}
//
//	public int insertMember(Connection con, Member member) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//		
//		//String query = "insert into member values (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
//		
//		 try {
//			 
//			//pstmt = con.prepareStatement(query);
//			pstmt = con.prepareStatement(prop.getProperty("insertMember"));
//			pstmt.setString(1, member.getUserId());
//			pstmt.setString(2, member.getUserPwd());
//			pstmt.setString(3, member.getUserName());
//			pstmt.setString(4, member.getGender());
//			pstmt.setInt(5, member.getAge());
//			pstmt.setString(6, member.getPhone());
//			pstmt.setString(7, member.getEmail());
//			pstmt.setString(8, member.getHobby());
//			pstmt.setString(9, member.getEtc());
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}
//
//	public int updateMember(Connection con, Member member) {
//		int result = 0;
//		PreparedStatement pstmt = null;		
//		/*String query = "update member set userpwd = ?, age = ?, "
//				+ "phone = ?, email = ?, hobby = ?, etc = ?, "
//				+ "lastmodified = sysdate where userid = ?";
//		*/
//		try {
//			//pstmt = con.prepareStatement(query);
//			pstmt = con.prepareStatement(prop.getProperty("updateMember"));
//			
//			pstmt.setString(1, member.getUserPwd());			
//			pstmt.setInt(2, member.getAge());
//			pstmt.setString(3, member.getPhone());
//			pstmt.setString(4, member.getEmail());
//			pstmt.setString(5, member.getHobby());
//			pstmt.setString(6, member.getEtc());
//			pstmt.setString(7, member.getUserId());
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}		
//		return result;
//	}
//	public int deleteMember(Connection con, String userId) {
//		int result = 0;	
//		PreparedStatement pstmt = null;
//		
//		//String query = "delete from member where userid = ?";
//		
//		try {
//			//pstmt = con.prepareStatement(query);
//			pstmt= con.prepareStatement(prop.getProperty("deleteMember"));
//			
//			pstmt.setString(1, userId);
//			
//			result = pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}
//
//	public Member selectMember(Connection con, String userId) {
//		Member member = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		//String query = "select * from member where userid = ?";
//		
//		try {
//			//pstmt = con.prepareStatement(query);
//			pstmt = con.prepareStatement(prop.getProperty("selectMember"));
//			
//			pstmt.setString(1, userId);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				member = new Member();
//				member.setUserId(userId);
//				member.setUserPwd(rset.getString("userpwd"));
//				member.setUserName(rset.getString("username"));
//				member.setGender(rset.getString("gender"));
//				member.setAge(rset.getInt("age"));
//				member.setPhone(rset.getString("phone"));
//				member.setEmail(rset.getString("email"));
//				member.setHobby(rset.getString("hobby"));
//				member.setEtc(rset.getString("etc"));
//				member.setEnroll(rset.getDate("enroll_date"));
//				member.setLastModified(rset.getDate("lastmodified"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//				
//		return member;
//	}
//
//	public ArrayList<Member> selectList(Connection con) {
//		ArrayList<Member> list = new ArrayList<Member>();
//		
//		Statement stmt = null;
//		ResultSet rset = null;
//		
//		//String query = "select * from member";
//		
//		try {
//			stmt = con.createStatement();
//			//rset = stmt.executeQuery(query);
//			rset = stmt.executeQuery(prop.getProperty("selectList"));
//			
//			while(rset.next()) {
//				Member m = new Member();
//				m.setUserId(rset.getString("userid"));
//				m.setUserPwd(rset.getString("userpwd"));
//				m.setUserName(rset.getString("username"));
//				m.setGender(rset.getString("gender"));
//				m.setAge(rset.getInt("age"));
//				m.setPhone(rset.getString("phone"));
//				m.setEmail(rset.getString("email"));
//				m.setHobby(rset.getString("hobby"));
//				m.setEtc(rset.getString("etc"));
//				m.setEnroll(rset.getDate("enroll_date"));
//				m.setLastModified(rset.getDate("lastmodified"));
//				
//				list.add(m);								
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(stmt);
//			close(rset);
//		}
//		
//		return list;
//	}
//
//	public int selectCheckId(Connection con, String userId) {
//		int idCount = -1;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		/*String query = "select count(userid) from member "
//				+ "where userid = ?";*/
//		
//		try {
//			//pstmt = con.prepareStatement(query);
//			pstmt = con.prepareStatement(
//					prop.getProperty("selectCheckId"));
//			pstmt.setString(1, userId);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				idCount = rset.getInt(1);
//				//System.out.println("아이디 갯수 : " + idCount);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return idCount;
//	}
	
	
	

