<%-- 
    Document   : challenge10-10
    Created on : 2017/04/25, 13:13:45
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
        
        <form action ="Challenge_db10" method="post">
            削除するIDを入力してください<br><br>
            ID(例：1)<br>
            <input type="text" name="textID" value=""><br><br>
            
            <input type="submit" name="btnSubmit" value="送信"><br><br>
        </form>
        
    </body>
</html>
