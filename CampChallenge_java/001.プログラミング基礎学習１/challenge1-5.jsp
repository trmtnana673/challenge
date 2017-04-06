<%-- 
    Document   : challenge1-5
    Created on : 2017/04/06, 14:02:34
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
          int x = 2;
          
          if(x == 1){
             out.println("1です！");
          } else if (x == 2){
             out.println("プログラミングキャンプ！");
          } else {
             out.println("その他です！"); 
          }
        %>
    </body>
</html>
