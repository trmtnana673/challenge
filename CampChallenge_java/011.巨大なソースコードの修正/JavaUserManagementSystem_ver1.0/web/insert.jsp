<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%@page import="jums.*;" %>
<%-- 修正箇所
修正全体：1箇所
修正1-5：8箇所 --%>
<%
    HttpSession hs = request.getSession();
    //修正1-5-1：各項目の初期値を設定
    //作成したJavaBeansからインスタンスを生成
    UserDataBeans udb = new UserDataBeans();
    udb.setUDB(hs);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body>
        <form action="insertconfirm" method="POST">
        名前:
        <%-- 修正1-5-2：再入力の場合前回の値を保持します --%>
        <input type="text" name="name" value="<%=udb.getName()%>">
        <br><br>

        生年月日:
        <select name="year">
        <%-- 修正1-5-3：再入力の場合前回の値を保持します --%>
            <% if(udb.getYear().equals("")){ %>
              <option value="">----</option>
              <%
              for(int i=1950; i<=2010; i++){ %>
              <option value="<%=i%>"> <%=i%> </option>
            <% }}else{ %>
              <option value="">----</option>
              <%
              for(int i=1950; i<=2010; i++){%>
              <option value="<%=i%>" <%if(i == Integer.parseInt(udb.getYear())){%>selected<%}%>><%=i%></option>
              <% } %>
            <% } %>
        </select>年
        <select name="month">
        <%-- 修正1-5-4：再入力の場合前回の値を保持します --%>
            <% if(udb.getMonth().equals("")){ %>
              <option value="">--</option>
              <%
              for(int i = 1; i<=12; i++){ %>
              <option value="<%=i%>"><%=i%></option>
            <% }}else{ %>
              <option value="">--</option>
              <%
              for(int i = 1; i<=12; i++){ %>
              <option value="<%=i%>" <%if(i == Integer.parseInt(udb.getMonth())){%>selected<%}%>><%=i%></option>
              <% } %>
            <% } %>
        </select>月
        <select name="day">
        <%-- 修正1-5-5：再入力の場合前回の値を保持します --%>
            <% if(udb.getDay().equals("")){ %>
              <option value="">--</option>
              <%
              for(int i = 1; i<=31; i++){ %>
              <option value="<%=i%>"><%=i%></option>
            <% }}else{ %>
              <option value="">--</option>
              <%
              for(int i = 1; i<=31; i++){ %>
              <option value="<%=i%>"<%if(i == Integer.parseInt(udb.getDay())){%>selected<%}%>><%=i%></option>
              <% } %>
            <% } %>
        </select>日
        <br><br>

        種別:
        <br>
        <%-- 修正全体：checkedの前が全角スペースとなっていた為半角スペースに修正 --%>
        <%-- 修正1-5-6：再入力の場合前回の値を保持します --%>
        <%if(udb.getType() == null){%>
        <input type="radio" name="type" value="1" checked>エンジニア<br>
        <input type="radio" name="type" value="2" >営業<br>
        <input type="radio" name="type" value="3" >その他<br>
        <%}else{%>
        <input type="radio" name="type" value="1" <%if(udb.getType().equals("1")){%>checked<%}%>>エンジニア<br>
        <input type="radio" name="type" value="2" <%if(udb.getType().equals("2")){%>checked<%}%>>営業<br>
        <input type="radio" name="type" value="3" <%if(udb.getType().equals("3")){%>checked<%}%>>その他<br>
        <%}%>
        <br>

        電話番号:
        <%-- 修正1-5-7：再入力の場合前回の値を保持します --%>
        <input type="text" name="tell" value="<%=udb.getTell()%>">
        <br><br>

        自己紹介文
        <br>
        <%-- 修正1-5-8：再入力の場合前回の値を保持します --%>
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%=udb.getComment()%></textarea><br><br>
        
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
