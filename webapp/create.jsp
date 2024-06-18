<%-- 
    Document   : create
    Created on : 05-Jun-2024, 17:27:42
    Author     : nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add New Customer!</h1>
        <form method="post" action="CustomerController">
            ID: <input type="text" name="txtID"/>
            <br/>
            Full Name: <input type="text" name="txtFullName"/>
            <br/>
            Address: <input type="text" name="txtAddress"/>
            
        </form>
    </body>
</html>
