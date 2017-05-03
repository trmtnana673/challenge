<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 修正箇所
修正全体：1箇所--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>error</title>
    </head>
    <body>
        エラーが発生しました。以下の項目を確認してください。<br>
        <%-- 修正全体：DBに接続できない場合の処理を追加しました --%>
        <%if(request.getAttribute("error") == null){
            out.println("データベースに接続できません");
        }else{%>
        <%=request.getAttribute("error")%>
        <%}%>
    </body>
</html>
