<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    //<<ResultDetailで取得した個人データをセッションから取り出すように修正しました>>
    UserDataDTO udd = (UserDataDTO)session.getAttribute("resultDetail");
%>
<%-- 修正箇所：5箇所 --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMSユーザー情報詳細画面</title>
    </head>
    <body>
        <h1>詳細情報</h1>
        名前:<%= udd.getName()%><br>
        生年月日:<%= udd.getBirthday()%><br>
        種別:<%= jh.exTypenum(udd.getType())%><br><%-- 数字ではなく種別名で表示するように処理しました --%>
        電話番号:<%= udd.getTell()%><br>
        自己紹介:<%= udd.getComment()%><br>
        登録日時:<%= udd.getNewDate()%><br>
        <%-- 直リンク防止処理を追加しました --%>
        <form action="Update" method="POST">
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="update" value="変更"style="width:100px">
        </form>
        <form action="Delete" method="POST">
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="delete" value="削除"style="width:100px">
        </form>
        <%-- SearchResultに戻るボタンを追加しました --%>
        <button type="button" name="back" value="戻る" style="width:100px" 
                onclick="location.href='SearchResult?ac=<%=hs.getAttribute("ac")%>'">戻る</button>
    </body>
    <%-- トップページに戻るように修正しました --%>
    <br>
    <%=jh.home()%>
</html>
