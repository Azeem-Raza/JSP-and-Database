<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%
    // JDBC variables
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        // JDBC setup (replace with your database credentials)
        //String jdbcUrl = "jdbc:mariadb://localhost:3306/e2101083_jsp_db";
        String jdbcUrl = "jdbc:mariadb://mariadb.vamk.fi/e2102961_Products";
        String dbUser = "e2102061";
        String dbPassword = "sSdXtSqDxnC";

        // Load the JDBC driver
        Class.forName("org.mariadb.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // SQL query to retrieve all products
        String sql = "SELECT * FROM products";
        st = conn.createStatement();
        rs = st.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Products</title>
</head>
<body>
    <h2>Product List</h2>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>ID</th>
            <th>Price</th>
        </tr>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getFloat("price") %></td>
            </tr>
        <% } %>
    </table>
    <br>
    <a href="addItem.html">Add Product</a>
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>