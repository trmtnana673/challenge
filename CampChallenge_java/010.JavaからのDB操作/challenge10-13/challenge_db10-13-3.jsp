<%-- 
    Document   : challenge_db10-13-3
    Created on : 2017/04/25, 17:54:26
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
        <%-- 商品登録画面 --%>
        
        <h3>在庫管理システム</h3>
        商品登録画面<br><br>
        
        <%
              Object stock = session.getAttribute("stock");
              
              if (stock != null){
                  out.println("入力がない箇所がありました<br>");
                  out.println("再度入力してください<br><br>");
              }
              
              session.setAttribute("status", null);
    
            %>
        
        <form action ="Challenge_db13_2" method="post">
            
            商品ID(例：1)<br>
            <input type="text" name="textStockID" value=""><br><br>
            商品名(例：水)<br>
            <input type="text" name="textStockName" value=""><br><br>
            単価(例；100)<br>
            <input type="text" name="textStockPrice" value=""><br><br>
            個数(例；100)<br>
            <input type="text" name="textStockNum" value=""><br><br>
            メーカー(例；A社)<br>
            <input type="text" name="textStockMaker" value=""><br><br>
            <input type="submit" name="btnSubmit" value="登録"><br><br>
        </form>
        <br>
        <br>
         <form method="post">
            <input type="button" value="商品一覧へ移動" onclick="location.href='http://localhost:8080/object/Challenge_db13_3'"><br><br>
            <input type="button" value="メニュー画面に戻る" onclick="location.href='http://localhost:8080/object/challenge_db10-13-2.jsp'"><br><br>
            <input type="button" value="ログアウト" onclick="location.href='http://localhost:8080/object/Challenge_db13_4'"><br><br>
         </form>
        
        
    </body>
</html>
