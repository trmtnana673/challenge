<%-- 
    Document   : challenge2-3
    Created on : 2017/04/07, 11:51:20
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
          for(int i = 1; i <= 20; i++){
              out.print(8 * i + "<br>");
          }
        %>
    </body>
</html>
