<%-- 
    Document   : challenge8-3
    Created on : 2017/04/20, 10:49:40
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.servlet.http.Cookie,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Date time = new Date();
          Cookie c = new Cookie("LastLogin",time.toString());
          response.addCookie(c);
          
          out.print("今回のアクセス日時は、" + time + "です<br>");
          
          Cookie cs[] = request.getCookies();
          if (cs != null){
              for (int i=0; i<cs.length; i++){
                  if(cs[i].getName().equals("LastLogin")){
                      out.print("前回のアクセス日時は、" + cs[i].getValue() + "です<br>");
                      break;
                  }
              }
          }
        %>
    </body>
</html>
