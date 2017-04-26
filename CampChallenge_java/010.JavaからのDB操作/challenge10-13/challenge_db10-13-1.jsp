<%-- 
    Document   : challenge_db10-13
    Created on : 2017/04/25, 17:16:50
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.io.*,java.net.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- ログイン画面 --%>
        
            <h3>在庫管理システム</h3>
            ログイン画面<br><br>
            <%
              Object status = session.getAttribute("status");
              
              if (status != null){
                  out.println("IDかパスワードが間違っています<br>");
                  out.println("再度入力してください<br><br>");
              }
              
              session.setAttribute("status", null);
    
            %>
            
        <form action ="Challenge_db13_1" method="post">
            ID(例：1)<br>
            <input type="text" name="textUserID" value=""><br><br>
            Password(例：1234abcd)<br>
            <input type="text" name="textUserPassword" value=""><br><br>
            <input type="submit" name="btnSubmit" value="ログイン"><br><br>
        </form>
        
    </body>
</html>
