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
public class Challenge_db13_1 extends HttpServlet {
  /** ログイン処理 */  
     
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
        String url;
        
        request.setCharacterEncoding("UTF-8");
        String gUserID = request.getParameter("textUserID");
        String gUserPassword = request.getParameter("textUserPassword");
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Challenge_db13_1</title>");            
            out.println("</head>");
            out.println("<body>");
            
             try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/challenge_db3","challenger3","tera1012");
              out.println("接続しました<br><br>");
              
              db_st = db_con.prepareStatement("select * from user where userID = ? and userPassword = ?");
              db_st.setInt(1, Integer.parseInt(gUserID));
              db_st.setString(2, gUserPassword);
              
               db_data = db_st.executeQuery();
               if(db_data.next() == true){
                  session.setAttribute("login", "OK");
                  url = "/challenge_db10-13-2.jsp";
               } else {
                  session.setAttribute("status", "Not");
                  url = "/challenge_db10-13-1.jsp";
               }
                  
                this.getServletContext().getRequestDispatcher(url).forward(request, response);
              
              db_data.close();
              db_st.close();
              db_con.close();
            
            } catch (SQLException e_sql){
              out.println("接続時にエラーが発生しました" + e_sql.toString());
            } catch (Exception e){
              session.setAttribute("status", "Not");
              this.getServletContext().getRequestDispatcher("/challenge_db10-13-1.jsp").forward(request, response);
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
