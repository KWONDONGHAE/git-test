<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	Connection con = DriverManager.getConnection(url,"smart","1234");
	Statement stmt = con.createStatement();
	ResultSet rs= null;
	String sql =null;
%>

