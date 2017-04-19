<%-- 
    Document   : challenge7-2
    Created on : 2017/04/18, 14:52:52
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Date date = new Date();
          
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分ss秒");
          String sdate = sdf.format(date);
          
          out.print(sdate);
        %>
    </body>
</html>
