<%-- 
    Document   : challenge2-2
    Created on : 2017/04/07, 10:39:24
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
          String word = "a";
          int s = 0;
           if (word == "A") {
               s = 1;
           }
           if (word == "あ") {
               s = 2;
           }
          
          String message = "　";
          
          switch(s){
              case 1:
                  message = "英語";
                  break;
              case 2:
                  message = "日本語";
                  break;
          }
          
          out.println(message);
        %>
    </body>
</html>
