<%@page import="com.jsp.Shopping_Cart.dto.Merchant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Merchant Dashboard</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            text-align: center;
            margin-top: 50px;
        }
        
        h1 a {
            color: #333;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #333;
            border-radius: 5px;
            margin: 0 10px;
        }
        
        h1 a:hover {
            background-color: #333;
            color: #fff;
        }
        
        h1.green {
            color: green;
        }
    </style>
</head>
<body>
        <%Merchant m= (Merchant)session.getAttribute("merchantinfo"); %>
        <%if(m!=null){ %>
     <h1 style=color:green>${message} </h1>
      <h1><a href="addproduct">Add Product</a></h1>
      <h1><a href="viewallproduct.jsp">View All Product</a></h1>
      <%}
        else{ %>
       <h1><a href="merchantloginform.jsp">Please Login First</a>
       </h1> 
       <%} %>
</body>
</html>