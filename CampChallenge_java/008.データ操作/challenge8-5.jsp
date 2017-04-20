<%-- 
    Document   : challenge8-5
    Created on : 2017/04/20, 13:18:19
    Author     : nana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.servlet.http.Cookie,java.util.*,java.io.*,java.net.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String bn = "";
            String bs = "男性";
            String bh = "";
            
            request.setCharacterEncoding("UTF-8");
          
          String name = request.getParameter("textName");
//            //if ( name == null){　ここでnullの処理をするとフォームが表示されないので書かない!!
//            //    return;
//            //}
          String sex = request.getParameter("rdoSex");
//            //if ( sex == null){
//            //    return;
//            //}
          String hobby = request.getParameter("mulHobby");
//            //if ( sex == null){
//            //   return;
//            //}

          if ( name != null) 
          {
            String key = "";
            String cKey1 = "";
            String cKey2 = "";
            String cKey3 = "";
            
            String value = "";
            String cValue1 = "";
            String cValue2 = "";
            String cValue3 = "";
            
            if(name != null){
            cKey1 = URLEncoder.encode("LastName","UTF-8");
            cValue1 = URLEncoder.encode(name,"UTF-8");
            }
            
            cKey2 = URLEncoder.encode("LastSex","UTF-8");
            cValue2 = URLEncoder.encode(sex,"UTF-8");
            
            if(hobby != null){
            cKey3 = URLEncoder.encode("LastHobby","UTF-8");
            cValue3 = URLEncoder.encode(hobby,"UTF-8");
            }
            
            Cookie c1 = new Cookie(cKey1, cValue1);
            Cookie c2 = new Cookie(cKey2, cValue2);
            Cookie c3 = new Cookie(cKey3, cValue3);
           
            response.addCookie(c1);
            response.addCookie(c2);
            response.addCookie(c3);
            
            Cookie cs[] = request.getCookies();
            
           
            
            if (cs != null){
              for (int i=0; i<cs.length; i++){
                  Cookie c = cs[i];
                  key = URLDecoder.decode(c.getName(),"UTF-8");
                  value = URLDecoder.decode(c.getValue(),"UTF-8");
                  if(key.equals("LastName")){
                      
                      bn = value;
                  }
                  if(key.equals("LastSex")){
                      
                      bs = value;
                  }
                  if(key.equals("LastHobby")){
                      
                      bh = value;
                  }
              }
            }
           }  
           
              
        %>
            <form action ="./challenge8-5.jsp" method="post">
            名前:<input type="text" name="textName" value="<%=bn%>"><br><br>
            性別：<input type="radio" name="rdoSex" value="男性" <%if(bs.equals("男性")){out.print("checked");}%>>男性
            　　　<input type="radio" name="rdoSex" value="女性" <%if(bs.equals("女性")){out.print("checked");}%>>女性<br><br>
            趣味：<textarea name="mulHobby"><%=bh%></textarea><br><br>
            <input type="submit" name="btnSubmit" value="表示！！"><br><br>
        </form>
        
    </body>
</html>
