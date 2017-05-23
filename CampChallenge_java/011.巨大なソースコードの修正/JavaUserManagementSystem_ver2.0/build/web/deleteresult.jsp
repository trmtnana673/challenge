<%@page import="jums.JumsHelper"%>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
%>
<%-- 修正箇所：4箇所 --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>削除結果画面</title>
    </head>
    <body>
    <h1>削除確認</h1>
    削除しました。<br><br><%-- brタグを追加しました --%>
    <%-- 検索結果画面に戻るボタンを追加しました --%>
    <%-- 直リンク防止処理を追加しました --%>
    <button type="button" name="back" value="戻る" style="width:110px" 
            onclick="location.href='SearchResult?ac=<%=hs.getAttribute("ac")%>'">検索結果画面に戻る</button>
    </body>
    <%-- トップページに戻れるように修正しました --%>
     <br>
        <%=jh.home()%>
</html>
