<%-- 
    Document   : challenge_db10-13-2
    Created on : 2017/04/25, 17:24:12
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
        <%-- メニュー画面 --%>
        
            <h3>在庫管理システム</h3>
            メニュー画面<br><br>
            商品情報登録<br>
             <form method="post">
             <input type="button" value="登録フォームへ移動" onclick="location.href='http://localhost:8080/object/challenge_db10-13-3.jsp'"><br><br>
             </form>
            商品一覧<br>
             <form method="post">
             <input type="button" value="一覧ページへ移動" onclick="location.href='http://localhost:8080/object/Challenge_db13_3'"><br><br>
             </form>
            <br>
            <br>
             <form method="post">
                 <input type="button" value="ログアウト" onclick="location.href='http://localhost:8080/object/Challenge_db13_4'"><br><br>
             </form>
        
        
    </body>
</html>
