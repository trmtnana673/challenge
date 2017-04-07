<%-- 
    Document   : challenge2-6
    Created on : 2017/04/07, 13:41:34
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
          int i = 1000;
          while (i >= 100){
            i /= 2;
            out.print(i + "<br>");
          }
        %>
    </body>
</html>
