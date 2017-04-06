<%-- 
    Document   : challenge1-4
    Created on : 2017/04/06, 13:22:40
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          int x = 10;
          final int X = 5;
          
          out.println( x + X );
          out.println("<br>");
          out.println( x - X );
          out.println("<br>");
          out.println( x * X );
          out.println("<br>");
          out.println( x / X );
          out.println("<br>");
          
        %>
    </body>
</html>
