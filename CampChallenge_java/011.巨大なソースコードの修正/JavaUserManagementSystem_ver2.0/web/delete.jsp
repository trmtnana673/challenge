<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    //<リクエストスコープからセッションスコープに修正しました>
    UserDataDTO udd = (UserDataDTO)session.getAttribute("resultDetail");
%>
<%-- 修正箇所：6箇所 --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>削除確認</h1>
    以下の内容を削除します。よろしいですか？<br><br><%-- brタグを追加しました --%>
    名前:<%= udd.getName()%><br>
    生年月日:<%= udd.getBirthday()%><br>
    種別:<%= jh.exTypenum(udd.getType())%><br><%-- 数字ではなく種別名で表示するように修正しました --%>
    電話番号:<%= udd.getTell()%><br>
    自己紹介:<%= udd.getComment()%><br>
    登録日時:<%= udd.getNewDate()%><br>
    
    <form action="DeleteResult" method="POST">
      <%-- 直リンク防止処理を追加しました --%>
      <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
      <input type="submit" name="YES" value="はい"style="width:100px">
    </form><br>
    <%-- 戻るボタンを任意の詳細画面に戻るように修正しました --%>
    <button type="button" name="back" value="戻る" style="width:110px" 
            onclick="location.href='ResultDetail?id=<%= udd.getUserID()%>&ac=<%=hs.getAttribute("ac")%>'">詳細画面に戻る</button>
    </body>
    <%-- トップページに戻るように修正しました --%>
    <br>
    <%=jh.home()%>
</html>
