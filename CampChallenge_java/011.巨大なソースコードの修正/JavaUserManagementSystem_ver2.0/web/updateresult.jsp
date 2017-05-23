<%@page import="jums.JumsHelper" 
        import="jums.UserDataDTO"
        import="java.text.SimpleDateFormat"%>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    //<リクエストスコープから"update"を取得するように追加>
    UserDataDTO udd = (UserDataDTO)request.getAttribute("update");
    //<DTOとしてデータを受け取っているのでgetBirthdayを生年月日に変換>
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
    String birthday = sdf.format(udd.getBirthday());
%>
<%-- 修正箇所：4箇所 --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS更新結果画面</title>
    </head>
    <body>
        <%-- 変更結果を表示するように修正しました --%>
        <h1>変更結果</h1><br>
        名前:<%=udd.getName()%><br>
        生年月日:<%=birthday%><br>
        種別:<%= jh.exTypenum(udd.getType())%><br>
        電話番号:<%= udd.getTell()%><br>
        自己紹介:<%= udd.getComment()%><br>
        以上の内容で登録しました。<br>
    </body>
    <br>
    <%-- セッションを切っているのでリクエストパラメーターにて任意の詳細画面を表示 --%>
    <%-- 直リンク防止処理を追加しました --%>
    <button type="button" name="back" value="戻る" style="width:110px" 
            onclick="location.href='ResultDetail?id=<%= udd.getUserID()%>&ac=<%=hs.getAttribute("ac")%>'">詳細画面に戻る</button>
    <br>
    <%=jh.home()%>
    </body>
</html>
