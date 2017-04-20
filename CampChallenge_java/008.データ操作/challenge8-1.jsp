<%-- 
    Document   : challenge8-1-1
    Created on : 2017/04/19, 17:25:25
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
        <form action ="./challenge8-2.jsp" method="post">
            名前:<input type="text" name="textName"><br><br>
            性別：<input type="radio" name="rdoSex" value="男性" checked="checked">男性
            　　　<input type="radio" name="rdoSex" value="女性">女性<br><br>
            趣味：<textarea name="mulHobby"></textarea><br><br>
            <input type="submit" name="btnSubmit" value="表示！！"><br><br>
        </form>
    </body>
</html>
