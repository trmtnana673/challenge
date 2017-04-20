<%-- 
    Document   : challenge8-2
    Created on : 2017/04/19, 17:33:21
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
          request.setCharacterEncoding("UTF-8");
          
          String name = request.getParameter("textName");
            if ( name == null){
                return;
            }
          String sex = request.getParameter("rdoSex");
            if ( sex == null){
                return;
            }
          String hobby = request.getParameter("mulHobby");
            if ( sex == null){
                return;
            }
          
          out.print("名前は" + name + "です<br>");
          out.print("性別は" + sex + "です<br>");
          out.print("趣味は" + hobby +"です<br>");
        %>
    </body>
</html>
