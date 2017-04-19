<%-- 
    Document   : challenge7-10
    Created on : 2017/04/19, 11:56:19
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
          int num = 19890707;
            
          Date date = new Date();
          
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分ss秒");
          String sdate = sdf.format(date);//
          
          File txt = new File(application.getRealPath("log.txt"));
          FileWriter fw = new FileWriter(txt);
          BufferedWriter bw = new BufferedWriter(fw);
          
          bw.write(num + "は10進数です");
          bw.newLine();
          bw.newLine();
          
          bw.write(sdate + "　開始");
          bw.newLine();
          bw.write("10進数から2進数に変換します");
          bw.newLine();
          String N1 = Integer.toBinaryString(num);
          bw.write("結果は、" + N1 + "になりました");
          bw.newLine();
          bw.write(sdate + "　終了");
          bw.newLine();
          bw.newLine();
          
          bw.write(sdate + "　開始");
          bw.newLine();
          bw.write("10進数から8進数に変換します");
          bw.newLine();
          String N2 = Integer.toOctalString(num);
          bw.write("結果は、" + N2 + "になりました");
          bw.newLine();
          bw.write(sdate + "　終了");
          bw.newLine();
          bw.newLine();
          
          bw.write(sdate + "　開始");
          bw.newLine();
          bw.write("10進数から16進数に変換します");
          bw.newLine();
          String N3 = Integer.toHexString(num);
          bw.write("結果は、" + N3 + "になりました");
          bw.newLine();
          bw.write(sdate + "　終了");
          bw.newLine();
          bw.newLine();
          
          bw.write(sdate + "　開始");
          bw.newLine();
          bw.write("10進数から32進数に変換します");
          bw.newLine();
          String N4 = Integer.toString(num, 32);
          bw.write("結果は、" + N4 + "になりました");
          bw.newLine();
          bw.write(sdate + "　終了");
          bw.newLine();
          bw.newLine();
          
          bw.close();
          
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
