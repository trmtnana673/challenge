<%-- 
    Document   : challenge7-4
    Created on : 2017/04/18, 15:12:15
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
          Calendar cal1 = Calendar.getInstance();
          cal1.set(2015, 0, 1, 0, 0, 0);
          Date calpast1 = cal1.getTime();
          
          Calendar cal2 = Calendar.getInstance();
          cal2.set(2015, 11, 31, 23, 59, 59);
          Date calpast2 = cal2.getTime();
          
          long ms = calpast2.getTime() - calpast1.getTime();
           
          out.print(calpast1 + "と" +calpast2 + "の差は<br>");
          out.print(ms + "ミリ秒です");
          

        %>
    </body>
</html>
