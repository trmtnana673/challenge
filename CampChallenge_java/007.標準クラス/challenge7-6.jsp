<%-- 
    Document   : challenge7-6
    Created on : 2017/04/18, 15:54:18
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
          String myMailAdress = "trmtnana673@gmail.com";
          
          out.print(myMailAdress.substring(11));
        %>
    </body>
</html>
