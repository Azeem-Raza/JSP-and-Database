<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%!
	Connection conn;
	PreparedStatement ps;
	
	public void jspInit(){
		try{
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://mariadb.vamk.fi:3306/e2102961_Products","e2102961","sSdXtSqDxnC");
			ps = conn.prepareStatement("INSERT INTO Products (name, Product_Id, price) VALUES (?, ?, ?)");
			// SQL query to insert a new product
	       
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	public void jspDestroy(){
		try{
			ps.close();
			conn.close();
		}catch (Exception e){
			e.printStackTrace();
		}
	}
%>

<%
	String name = request.getParameter("name");
	int Product_ID = Integer.parseInt(request.getParameter("Product_ID"));
	float price = Float.parseFloat(request.getParameter("price"));
	
	ps.setString(1, name);
	ps.setInt(2, Product_ID);
	ps.setFloat(3, price);
	
	ps.executeUpdate();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product Result</title>
</head>
<body>
	<h2>Product Added Successfully!</h2>
    <a href="Product.html">Add Another Product</a>
    <br>
    <a href="ViewItem.jsp">View Products</a>

</body>
</html>







