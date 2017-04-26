<%-- 
    Document   : challenge_db10-13-4
    Created on : 2017/04/26, 10:20:47
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.servlet.*,java.sql.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- 登録確認画面 --%>
        
        下記の内容で商品情報を登録しました<br><br>
        
        <%
           ResultSet rs = (ResultSet)request.getAttribute("rs");
           while(rs.next()){
                  out.println("商品ID：" + rs.getInt("stockID") + "<br>");
                  out.println("商品名：" + rs.getString("stockName") + "<br>");
                  out.println("単価：" + rs.getString("stockPrice") + "円<br>");
                  out.println("個数：" + rs.getInt("stockNum")  + "個<br>");
                  out.println("メーカー：" + rs.getString("stockMaker") + "<br><br>");
              }
        %>
        
        <form method="post">
            <input type="button" value="登録を続ける" onclick="location.href='http://localhost:8080/object/challenge_db10-13-3.jsp'"><br><br>
            <input type="button" value="商品一覧へ移動" onclick="location.href='http://localhost:8080/object/Challenge_db13_3'"><br><br>
            <input type="button" value="メニュー画面に戻る" onclick="location.href='http://localhost:8080/object/challenge_db10-13-2.jsp'"><br><br>
            <input type="button" value="ログアウト" onclick="location.href='http://localhost:8080/object/Challenge_db13_4'"><br><br>
         </form>
    </body>
</html>
