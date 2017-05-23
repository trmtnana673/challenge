<%@page import="jums.JumsHelper" 
        import="jums.UserDataDTO" 
        import="jums.UserDataBeans"%>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    //<UserDataBeansはUserIDを持ち歩けないのでセッション"resultDetail"から取得>
    UserDataDTO udd = (UserDataDTO)session.getAttribute("resultDetail");
    //<UserID以外の情報はUserDataBeansより取得>
    UserDataBeans udb = (UserDataBeans)request.getAttribute("update");
%>
<%-- 修正箇所：5箇所 --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS変更画面</title>
    </head>
    <body>
    <%-- 初期値に変更するデータの登録情報にするように修正しました --%>
    <form action="UpdateResult" method="POST">
        名前:
        <input type="text" name="name" value="<%=udb.getName()%>">
        <br><br>

        生年月日:　
        <select name="year">
            <option value="">----</option>
            <% for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>" <% if(udb.getYear()== i){out.print("selected = \"selected\"");} %>><%=i%></option>
            <% } %>
        </select>年
        <select name="month">
            <option value="">--</option>
            <% for(int i = 1; i<=12; i++){ %>
            <option value="<%=i%>" <% if(udb.getMonth()== i){out.print("selected = \"selected\"");} %>><%=i%></option>
            <% } %>
        </select>月
        <select name="day">
            <option value="">--</option>
            <% for(int i = 1; i<=31; i++){ %>
            <option value="<%=i%>" <% if(udb.getDay()== i){out.print("selected = \"selected\"");} %>><%=i%></option>
            <% } %>
        </select>日
        <br><br>

        種別:
        <br>
            <% for(int i = 1; i<=3; i++){ %>
            <input type="radio" name="type" value="<%=i%>" <% if(udb.getType()== i){out.print("checked = \"checked\"");} %>><%=jh.exTypenum(i)%><br>
            <% } %>
        <br>

        電話番号:
        <input type="text" name="tell" value="<%=udb.getTell()%>">
        <br><br>

        自己紹介文
        <br>
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%=udb.getComment()%></textarea><br><br>
        
        <%-- 直リンク防止処理を追加しました --%>
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <%-- セッションではなくリクエストパラメーターを利用してページ遷移するよう追加しました --%>
        <button type="button" name="back" value="戻る" style="width:110px" 
                onclick="location.href='ResultDetail?id=<%= udd.getUserID()%>&ac=<%=hs.getAttribute("ac")%>'">詳細画面に戻る</button>
        <br>
        <%=jh.home()%>
    </body>
</html>
