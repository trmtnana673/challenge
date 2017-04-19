<%-- 
    Document   : challenge7-8
    Created on : 2017/04/18, 16:40:43
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.text.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          //File txt = new File("c:\\Users\\nana\\Documents\\NetBeansProjects\\challenge1\\build\\web\\test.txt"); 絶対パス
          File txt = new File(application.getRealPath("test.txt")); //相対パス
          FileWriter fw = new FileWriter(txt);
          BufferedWriter bw = new BufferedWriter(fw);
          
          bw.write("私の名前は寺本奈々です");
          bw.newLine();
          bw.write("年齢は27歳です");
          bw.newLine();
          bw.write("生年月日は1989年7月7日です");
          bw.newLine();
          bw.close();
        %>
    </body>
</html>
