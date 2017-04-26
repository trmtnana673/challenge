/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.ob;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nana
 */
public class Challenge_db13_2 extends HttpServlet {
    /** 商品登録処理 */

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        
        Connection db_con = null;
        PreparedStatement db_st = null;
        ResultSet db_data = null;
        int a;
        
        request.setCharacterEncoding("UTF-8");
        String gStockID = request.getParameter("textStockID");
        String gStockName = request.getParameter("textStockName");
        String gStockPrice = request.getParameter("textStockPrice");
        String gStockNum = request.getParameter("textStockNum");
        String gStockMaker = request.getParameter("textStockMaker");
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Challenge_db13_2</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/challenge_db3","challenger3","tera1012");
              out.println("接続しました<br><br>");
              
              db_st = db_con.prepareStatement("insert into stock values(?, ?, ?, ?, ?)");
              db_st.setInt(1, Integer.parseInt(gStockID));
              db_st.setString(2, gStockName);
              db_st.setInt(3, Integer.parseInt(gStockPrice));
              db_st.setInt(4, Integer.parseInt(gStockNum));
              db_st.setString(5, gStockMaker);
              
              a = db_st.executeUpdate();
              
              db_st = db_con.prepareStatement("select * from stock where stockID= ?");
              db_st.setInt(1, Integer.parseInt(gStockID));
              
              db_data = db_st.executeQuery();
              
              request.setAttribute("rs", db_data);
                  
              this.getServletContext().getRequestDispatcher("/challenge_db10-13-4.jsp").forward(request, response);
              
              db_data.close();
              db_st.close();
              db_con.close();
              
              } catch (SQLException e_sql){
              out.println("接続時にエラーが発生しました" + e_sql.toString());
              } catch (Exception e){
              session.setAttribute("stock", "Not");
              this.getServletContext().getRequestDispatcher("/challenge_db10-13-3.jsp").forward(request, response);
              out.println("接続時にエラーが発生しました" + e.toString());
              }finally{
              if(db_con != null) {
                try {
                  db_con.close();
                } catch (Exception e_con){
                  out.println(e_con.getMessage());
                }
              }
            }
            
            
         
            out.println("</body>");
            out.println("</html>");
        } finally {
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
