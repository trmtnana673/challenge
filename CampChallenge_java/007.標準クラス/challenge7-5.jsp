<%-- 
    Document   : challenge7-5
    Created on : 2017/04/18, 15:34:34
    Author     : nana
--%>

<%@page import="java.nio.charset.Charset"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String name = "寺本奈々";
          
          out.print("名前は、" + name + "です<br>");
          out.print("UTF-8だとバイト数は、" + name.getBytes(Charset.forName("UTF-8")).length + "です<br>");
          out.print("Shift_JISだとバイト数は、" + name.getBytes(Charset.forName("Shift_JIS")).length + "です<br>");
           out.print("文字数は、" + name.length() + "です<br>");
        %>
    </body>
</html>
