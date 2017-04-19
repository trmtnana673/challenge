<%-- 
    Document   : challenge7-3
    Created on : 2017/04/18, 15:05:34
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
          Calendar cal = Calendar.getInstance();
          cal.set(2016, 10, 4, 10, 0, 0);
          Date calpast = cal.getTime();
           
          SimpleDateFormat sdf = new
          SimpleDateFormat("yyyy年MM月dd日HH時mm分ss秒");
          String sdate = sdf.format(calpast.getTime());
          
          out.print(sdate);
        %>
    </body>
</html>
