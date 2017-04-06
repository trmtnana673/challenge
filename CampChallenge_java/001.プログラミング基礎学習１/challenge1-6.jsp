<%-- 
    Document   : challenge1-6
    Created on : 2017/04/06, 18:08:46
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
          String type1 = request.getParameter("type");
          if (type1 == null) return;
          
           int type2 = Integer.parseInt(type1);
          
           out.println("①");
          
          if(type2 == 1){
              out.println("1：雑貨");
          }else if(type2 == 2){
              out.println("2：生鮮食品");
          }else if(type2 == 3){
              out.println("3：その他");
          }else{
              out.println("該当する商品番号がありません");
          }
          
        
           String amount1 = request.getParameter("amount");
            if (amount1 == null) return;
         
          int amount2 = Integer.parseInt(amount1);
          
          if(type2 ==1 | type2 == 2 | type2 == 3){
            out.println("<br>");
            out.println("②");
            out.println("総額：" + amount2 + "円" );
          }
          
          String number1 = request.getParameter("number");
            if (number1 == null) return;
          
          int number2 = Integer.parseInt(number1);
          
          int cost = amount2 / number2;
          
          out.println("、" + "1個当たりの値段：" + cost + "円");
          
          out.println("<br>");
          out.println("③");
          
          if(amount2 < 3000){
            out.println("ポイントは付きません");
          }
          
          if((amount2 >= 3000) && (amount2 < 5000) ){
            out.println("4%ポイントが付きます");
          }
          if(amount2 >= 5000){
              out.println("5%ポイントが付きます");
          }
          
        %>
    </body>
</html>
