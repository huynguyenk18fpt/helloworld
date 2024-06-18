<%-- 
    Document   : list.jsp
    Created on : 02-Jun-2024, 22:40:08
    Author     : nguyenhhce181330
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $('#table1').DataTable();
            });
        </script>
    </head>
    <body>
        <a href="create">Create</a>
        <%
            if (session.getAttribute("adminlogin") == null || session.getAttribute("adminlogin").equals("")) {
                response.sendRedirect("index.jsp");
            }

        %>
        <hr>

        <div class="container"> 

            <div class="row">

                <div class="header">
                    <h1>ACCOUNT DATA</h1><!-- comment -->
                    <div class="hello"> 
                        <%                             
                            // Retrieve the full name from the session
                            String fullname = (String) session.getAttribute("fullname");
                            out.print("Hello, " + fullname + "! ");
                        %>
                        <div class="out"><a href="signout.jsp">(Sign Out)</a></div>
                    </div>

                </div>
                <table id="table1" border="1" padding="0">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Fullname</th>
                            <th>Gender</th>
                            <th>Birthday</th>
                            <th>Department</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                    CustomerDAO dao = new CustomerDAO();
                            ResultSet rs = dao.getAll();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("username")%></td>
                            <td><%= rs.getString("password")%></td>
                            <td><%= rs.getString("fullname")%></td>
                            <td><%= rs.getString("gender")%></td>
                            <td><%= rs.getDate("birthday")%></td>
                            <td><%= rs.getString("department")%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>      
    </body>
</html>

