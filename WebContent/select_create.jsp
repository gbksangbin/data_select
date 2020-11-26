<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<table border="1">
    <tr>
        <td>학생 ID</td>
        <td>성별</td>
        <td>좋아하는 과목</td>
    </tr>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_6", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(" SELECT ID, " + 
    		" CASE GENDER WHEN 'F' then '여성' else '남성' end AS GENDER, " + 
    		" CASE favorit WHEN 'KO'  THEN '국어' WHEN 'MA'  THEN '수학' ELSE '컴퓨터' END " + 
    		" AS favorit FROM STUDENT ");
    
    
    while (rs.next()) {
        %> 
            <tr>
                <td><%=rs.getInt("ID") %></td>
                <td><%=rs.getString("GENDER")%></td>
                <td><%=rs.getString("favorit") %></td>
            </tr>
        <%
    }

    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}
%>

</table>

