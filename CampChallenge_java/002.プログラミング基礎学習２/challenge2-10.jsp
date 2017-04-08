<%-- 
    Document   : challenge2-10
    Created on : 2017/04/07, 16:29:29
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String number1 = request.getParameter("number");
            if (number1 == null) return;
          
          int number2 = Integer.parseInt(number1);
            //素因数分解は「正の整数を素数の積の形で表すこと(Wikipediaより引用)」なので正の整数のみ値を受け取る
            if (number2 <= 0) return;
          
          out.println("元の値：" + number2 + "<br>");
          out.println("素因数分解の結果：");
          
          int nArr[] = {2,3,5,7};
          int ans = number2;
          
          if(number2 == 1) {
            out.println(number2 + "<br>");
          }
          
          for(int val: nArr) {
            while(ans % val == 0){
              ans /= val;
              out.println(val);
                
              if(ans == 1){
                out.println("<br>");
              } else {
                out.println("*");
              }
            }
          }
          
          if (ans > 10){
            out.println("その他" + "<br>");
          }
        %>
    </body>
</html>
