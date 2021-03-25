package _01_login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import _01_login.dto.MemberDTO;


public class MemberDAO {

	private MemberDAO() {};
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Connection getConnection() {
		
		try {
			
			Context initCtx = new InitialContext();
			// lookup 메서드를 통해 server.xml 파일에 접근하여 자바 환경 코드를 검색한다.
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			// <Context> 태그안의 <Resource>환경 설정의 name이 jdbc/pool인것을 검색한다.
			DataSource ds = (DataSource)envCtx.lookup("jdbc/pool");
			// 연결 객체를 생성한다.
			conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 1. 회원가입DAO
	public boolean joinMember(MemberDTO mdto) {
		
		boolean isJoin = false;
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID=?");
			pstmt.setString(1, mdto.getId());
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				pstmt = conn.prepareStatement("INSERT INTO MEMBER(ID,PW,NAME,TEL,EMAIL) VALUES(?,?,?,?,?)");
				pstmt.setString(1, mdto.getId());
				pstmt.setString(2, mdto.getPw());
				pstmt.setString(3, mdto.getName());
				pstmt.setString(4, mdto.getTel());
				pstmt.setString(5, mdto.getEmail());
				pstmt.executeUpdate();
				isJoin = true;
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn!=null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return isJoin;
		
	}
	
	
	// 2. 로그인
	
	public boolean loginMember(MemberDTO mdto) {
		
		boolean isLogin = false;
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID=? AND PW=?");
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isLogin = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn!=null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return isLogin;
		
		
	}
	
	
	
}
