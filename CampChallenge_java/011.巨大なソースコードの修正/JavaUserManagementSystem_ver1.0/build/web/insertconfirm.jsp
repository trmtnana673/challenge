<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %><%-- 修正1-1-1：トップ画面への遷移処理を追加しました --%>
<%@page import="jums.*" %>
<%-- 修正箇所
修正1-1：2箇所
修正1-2：2箇所
修正1-4：2箇所
--%>
<%
    HttpSession hs = request.getSession();
    //修正1-4-1：作成したJavaBeansからインスタンスを生成
    UserDataBeans udb = new UserDataBeans();
    udb.setUDB(hs);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録確認画面</title>
    </head>
    <body>
    <%-- 修正1-4-1：全ての項目に入力があった場合のみ登録画面に遷移します --%>    
    <% if(!udb.getName().equals("") && !udb.getYear().equals("") && !udb.getMonth().equals("")
        && !udb.getDay().equals("") && !udb.getTell().equals("") && !udb.getComment().equals("")){ %> 
    <%-- 修正1-4-1：修正はここまで --%>
          <h1>登録確認</h1>
          名前:<%= hs.getAttribute("name")%><br>
          生年月日:<%= hs.getAttribute("year")+"年"+hs.getAttribute("month")+"月"+hs.getAttribute("day")+"日"%><br>
          種別:<%= hs.getAttribute("type")%><br>
          電話番号:<%= hs.getAttribute("tell")%><br>
          自己紹介:<%= hs.getAttribute("comment")%><br>
          上記の内容で登録します。よろしいですか？
          <form action="insertresult" method="POST">
          <%-- 修正1-2-1：直リンク防止処理を追加しました --%>
            <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
            <input type="submit" name="yes" value="はい">
          </form>
    <% }else{ %>
        <h1>入力が不完全です</h1>
        <%-- 修正1-4-2：未入力箇所を入力するように表示 --%>
        <% if((udb.getName().equals("")) && udb.getYear().equals("") && udb.getMonth().equals("")
            && udb.getDay().equals("") && udb.getTell().equals("") && udb.getComment().equals("")){ %>
          <h2>職業の種別以外の項目が未入力です</h2>
        <% }else{ %>
          <% if(udb.getName().equals("")){ %>
            <h2>名前を入力してください</h2>
          <% } %>
          <% if(udb.getYear().equals("")){ %>
            <h2>生年月日の生まれた年を選択してください</h2>
          <% } %>
          <% if(udb.getMonth().equals("")){ %>
            <h2>生年月日の生まれた月を選択してください</h2>
          <% } %>
          <% if(udb.getDay().equals("")){ %>
            <h2>生年月日の生まれた日を選択してください</h2>
          <% } %>
          <% if(udb.getTell().equals("")){ %>
           <h2>電話番号を入力してください</h2>
          <% } %>
          <% if(udb.getComment().equals("")){ %>
            <h2>自己紹介文を入力してください</h2>
          <% } %>
          <%-- 修正1-4-2：修正はここまで --%>
        <% } %>
    <% } %>
        <form action="insert" method="POST">
            <%-- 修正1-2-2：直リンク防止処理を追加しました --%>
            <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
        <br>
        <%=JumsHelper.getInstance().home()%> <%-- 修正1-1-2：トップ画面への遷移処理を追加しました --%>
    </body>
</html>
