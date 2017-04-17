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

import org.mypackage.java.*;

/**
 *
 * @author nana
 */
public class BlackJack extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlackJack</title>");            
            out.println("</head>");
            out.println("<body>");
            
            Dealer d = new Dealer();
            User u = new User();
            
            Integer U1 = u.setCard(d.deal()).get(0);
            Integer U2 = u.setCard(d.deal()).get(1);
            Integer U3 = d.hit().get(0);
            Integer U = U1 + U2 ;
            
            out.println("Userの合計値：" + U);
            
            Integer D1 = d.setCard(d.deal()).get(0);
            Integer D2 = d.setCard(d.deal()).get(1);
            Integer D3 = d.hit().get(0);
            
            Integer D = D1 + D2 ;
            
            if (u.checkSum(U) == false){ 
              u.open(U);
              out.println("<br>ブラックジャック!!Userの勝ちです");
            } else if (U > 21){
              u.open(U);
              out.println("<br>バスト!!Userの負けです");
            } else {
              U += U3;
              out.println("<br>hitしました<br>Userの合計値：" + U);
                
                if (u.checkSum(U) == false){
                  u.open(U);
                  out.println("<br>ブラックジャック!!Userの勝ちです");
                }else if (U > 21){
                  u.open(U);
                  out.println("<br>バスト!!Userの負けです");
                } else {
                  u.open(U);
                  out.println("<br>Dealerの合計値：" + D);
                     
                  if (d.checkSum(D) == false){
                    d.open(D);
                    out.println("<br>ブラックジャック!!Userの負けです");
                  } else if (D > 21) {
                    d.open(D);
                    out.print("<br>バスト!!Userの勝ちです");
                  } else { //1回目20以下のとき
                    D += D3;
                    out.println("<br>hitしました<br>Dealerの合計値：" +D);
                
                    if(d.checkSum(D) == false){
                      d.open(D);
                      out.println("<br>ブラックジャック!!Userの負けです");
                    }else if (D > 21) {
                      d.open(D);
                      out.print("<br>バスト!!Userの勝ちです");
                    }else {
                      d.open(D); 
                    }
                       
                    if (D > U && D < 21) {
                      out.println("<br>Userの負けです");
                    } else if (D == U){
                      out.println("<br>引き分けです");
                    } else  if (D < U && U < 21){
                      out.println("<br>Userの勝ちです");
                    }
                  }
                }
            }
            
            out.println("</body>");
            out.println("</html>");
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
