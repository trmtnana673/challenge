<%-- 
    Document   : challenge8-4
    Created on : 2017/04/20, 11:04:48
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.servlet.http.HttpSession,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Date time = new Date();
          HttpSession hs = request.getSession(true);
          
          out.print("今回のアクセス日時は、" + time + "です<br>");
          
          if (hs.isNew() == true){
              return;
          } else {
          Date accessedTime = new Date(hs.getLastAccessedTime());
          out.print("前回のアクセス日時は、" + accessedTime + "です<br>");
          }
         
          
        %>
    </body>
</html>
