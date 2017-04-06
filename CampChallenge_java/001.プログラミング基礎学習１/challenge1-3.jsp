<%-- 
    Document   : challenge1-3
    Created on : 2017/04/06, 11:41:47
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
        <%
          String name = "寺本　奈々";
          String sex = "女性";
          String age = "27歳";
          String birthday = "7月7日";
        
          final String PROFILE = "名前："  + name + "、性別：" + sex + "、年齢：" + age + "、誕生日："+ birthday;
          
          out.println("自己紹介" + "　" + PROFILE);
        %>
    </body>
</html>
