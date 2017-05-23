<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO"
        import="java.util.ArrayList"%>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    //<<リクエストスコープからresultDataをArrayListとして受け取るよう修正しました>>
    ArrayList<UserDataDTO> dto = (ArrayList<UserDataDTO>)request.getAttribute("resultData");
    UserDataDTO udd = new UserDataDTO();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 修正：6箇所 --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS検索結果画面</title>
    </head>
    <body>
        <h1>検索結果</h1>
        <%-- 検索結果がない場合はメッセージを表示させるように処理をしました --%>
           <% if (dto.size() == 0){ %>
              <h2>該当するデータがありません</h2>
           <%}else{%>
            <table border=1>
            <tr>
                <th>名前</th>
                <th>生年</th>
                <th>種別</th>
                <th>登録日時</th>
            </tr>
            <%-- 複数の検索結果を表示するように修正しました --%>
            <% for(int i = 0; i < dto.size(); i++){
                 udd = dto.get(i);
            %>
            <tr>
                <%-- 直リンク防止処理を追加しました --%>
                <td><a href="ResultDetail?id=<%= udd.getUserID()%>&ac=<%=hs.getAttribute("ac")%>"><%= udd.getName()%></a></td>
                <td><%= udd.getBirthday()%></td>
                <td><%= jh.exTypenum(udd.getType())%></td><%-- 数字ではなく種別名で表示するように修正しました --%>
                <td><%= udd.getNewDate()%></td>
            </tr>
            <% } %>
        </table>
        <% } %>
    </body>
    <%-- 前のページに戻るように処理しました --%>
    <br>
    <a href="search.jsp">検索ページに戻る</a>
    <br>
    <%=jh.home()%>
</html>
