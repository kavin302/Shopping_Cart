<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Range Search</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .search-container {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        input[type="text"] {
            width: calc(50% - 10px);
            padding: 10px;
            margin: 10px 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin: 10px auto;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
                 <div class="search-container">
    <form action="displaybyrange" >
        <label for="lowprice">Enter Minimum Price:</label>
        <input type="text" name="lowprice" id="lowprice" placeholder="Minimum Price">
        
        <label for="highprice">Enter Maximum Price:</label>
        <input type="text" name="highprice" id="highprice" placeholder="Maximum Price">
        
        <input type="submit" value="Search">
    </form>
</div>
</body>
</html>