<%-- 
    Document   : FortuneTellingResult
    Created on : 2017/04/11, 14:33:57
    Author     : nana
--%>

<%@page import="org.mypackage.sample.ResultData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
          ResultData data = (ResultData)request.getAttribute("DATA");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          if (data != null) {
              out.println("<h1>あなたの" + data.getD() + "の運勢は・・・？<br>" + data.getLuck() + "です！</h1>");
          }
        %>
    </body>
</html>
