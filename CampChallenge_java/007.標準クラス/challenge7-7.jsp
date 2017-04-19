<%-- 
    Document   : challenge7-7
    Created on : 2017/04/18, 16:30:30
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String msg = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";
          String eng[] = { "I", "U"};
          String jpn[] = {"い", "う"};
          
          out.print(msg + "<br>文字の入れ替えを行います");
          
          for(int i = 0; i < eng.length; i++){
              msg = msg.replace(eng[i], jpn[i]);
          }
          
          out.print("<br>" + msg);
        %>
    </body>
</html>
