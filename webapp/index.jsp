<%-- 
    Document   : index.jsp
    Created on : 02-Jun-2024, 22:38:57
    Author     : nguyenhhce181330
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="DAOs.CustomerDAO"%>
<%@page import="Models.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        
    </head>
    <body>
        <%
            // Retrieve username and password from the request
            String username = request.getParameter("txtUS");
            String password = request.getParameter("txtPWD");

            // If form is submitted
            if (username != null && password != null) {
                try {
                    // Hash the password using MD5 (or consider using SHA-256 for better security)
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    md.update(password.getBytes());
                    byte[] digest = md.digest();

                    StringBuffer sb = new StringBuffer();
                    for (byte b : digest) {
                        sb.append(String.format("%02x", b & 0xff)); // Convert byte array to hex string
                    }
                    String hashedPassword = sb.toString();

                    // Create an account object and set the username and hashed password
                    Customer acc = new Customer(username, password);
                    acc.setUsername(username);
                    acc.setPassword(hashedPassword);
                    // Use accountDAO to validate the user
                    CustomerDAO dao = new CustomerDAO();

                    if (request.getParameter("btnLogin") != null) {
                        if (dao.login(acc)) {
                            //save session, state da login
                            session.setAttribute("adminlogin", username);
                            response.sendRedirect("list.jsp");
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    }
                    boolean isValidUser = dao.login(acc);

                    if (isValidUser) {
                        // Set a cookie with the username and redirect to list.jsp
                        Cookie userCookie = new Cookie("username", username);
                        userCookie.setMaxAge(3 * 24 * 60 * 60); // 3 days
                        response.addCookie(userCookie);
                        // Set the full name in the session
                        session.setAttribute("fullname", acc.getFullname());

                        response.sendRedirect("list.jsp");
                    } else {
                        out.println("<div class='alert alert-danger mt-3'>Invalid username or password. Please try again.</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger mt-3'>An error occurred during login. Please try again.</div>");
                }

            }
        %>

        <div class="container login-container">
            <h2 class="login-title">Login</h2>
            <form method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" name="txtUS" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="txtPWD" required>
                </div>
                <button type="submit" name="btnLogin" class="btn btn-primary">Login</button>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    </body>
</html>

