<%-- 
    Document   : challenge_db10-12
    Created on : 2017/04/25, 14:20:58
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
        
        <form action ="Challenge_db12" method="post">
            検索フォーム<br><br>
            名前(例：山田　太郎)<br>
            <input type="text" name="textName" value=""><br><br>
            年齢(例：20)<br>
            <input type="text" name="textAge" value=""><br><br>
            生年月日(例；2000-04-01)<br>
            <input type="text" name="textBirthday" value=""><br><br>
            <input type="submit" name="btnSubmit" value="検索"><br><br>
        </form>
        
    </body>
</html>
