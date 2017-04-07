<%-- 
    Document   : challenge2-8
    Created on : 2017/04/07, 14:26:07
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
          String SArr[] = {"10", "100", "soeda", "hayashi", "-20", "118", "END"};
          
          out.print(SArr[2] + "<br>");
          
          SArr[2] = "33";
          
          out.print(SArr[2] + "<br>");
        %>
    </body>
</html>
