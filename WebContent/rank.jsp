<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
    <tr>
        <td>학생 ID</td>
        <td>평균 점수</td>
        <td>총점</td>
        <td>순위</td>
    </tr>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_6", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(" SELECT STUDENT_ID, SUM(POINT) AS TOTAL_POINT, AVG(POINT) AS AVG_POINT FROM POINT  GROUP BY student_id order by ROUND(avg(point)) desc");
    
    
    int rank = 0;
    while (rs.next()) {
        rank += 1;
        %>
            <tr>
                <td><%=rs.getInt(1) %></td>
                <td><%=rs.getInt(3) %></td>
                <td><%=rs.getInt(2) %></td>
                <td><%=rank %></td>
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
</body>
</html>