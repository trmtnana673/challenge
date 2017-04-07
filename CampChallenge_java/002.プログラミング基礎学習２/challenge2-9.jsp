<%-- 
    Document   : challenge2-9
    Created on : 2017/04/07, 14:51:13
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           HashMap<String,String> hMap =
             new HashMap<String,String>();
          
           hMap.put("1", "AAA");
           hMap.put("hello", "world");
           hMap.put("soeda", "33");
           hMap.put("20","20");
          
           out.print(hMap.get("1") + "<br>");
           out.print(hMap.get("hello") + "<br>");
           out.print(hMap.get("soeda") + "<br>");
           out.print(hMap.get("20") + "<br>");
          //}
          
              
        %>
    </body>
</html>
