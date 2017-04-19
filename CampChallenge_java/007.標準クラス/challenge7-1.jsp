<%-- 
    Document   : challenge7-1
    Created on : 2017/04/18, 14:37:27
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
           cal.set(2016, 0, 1, 0, 0, 0);
           Date calpast = cal.getTime();
           
           out.print(calpast.getTime());
          
        %>
    </body>
</html>
