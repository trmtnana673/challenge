<%-- 
    Document   : challenge7-9
    Created on : 2017/04/18, 16:51:46
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
          FileReader fr = new FileReader(txt);
          BufferedReader br = new BufferedReader(fr);
          
          String str;
          while((str = br.readLine()) != null){
              out.print(str + "<br>");
          }
          
          br.close();
          
        %>
    </body>
</html>
