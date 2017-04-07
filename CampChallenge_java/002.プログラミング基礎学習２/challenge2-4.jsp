<%-- 
    Document   : challenge2-4
    Created on : 2017/04/07, 13:02:04
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
          for(int i = 1; i <= 30; i++){
              out.print("A");
          }
        %>
    </body>
</html>
