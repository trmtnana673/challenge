package jums;

import java.io.IOException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hayashi-s
 */

//<修正箇所：2箇所>
public class Update extends HttpServlet {

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
            
        try{
            //<<update.jspにて初期値に現在登録している個人データを使用する為入力フォームに表示されるようにUserDataBeansに変換するように処理しました>>
            HttpSession hs = request.getSession();
            
            request.setCharacterEncoding("UTF-8");
            
            //<<直リンク防止処理を追加しました>>
            String accesschk = request.getParameter("ac");
            if(accesschk ==null || (Integer)hs.getAttribute("ac")!=Integer.parseInt(accesschk)){
                throw new Exception("不正なアクセスです");
            }
            
            UserDataDTO dto = (UserDataDTO)hs.getAttribute("resultDetail");
            UserDataBeans udb = new UserDataBeans();
            
            udb.setName(dto.getName());
            Calendar cal = Calendar.getInstance();
            cal.setTime(dto.getBirthday());
            udb.setYear(String.valueOf(cal.get(Calendar.YEAR)));
            udb.setMonth(String.valueOf(cal.get(Calendar.MONTH)+1));
            udb.setDay(String.valueOf(cal.get(Calendar.DATE)));
            udb.setTell(dto.getTell());
            udb.setType(String.valueOf(dto.getType()));
            udb.setComment(dto.getComment());
            
            //<変換したUserDataBeansをリクエストスコープに保存>
            request.setAttribute("update", udb);
            
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        }catch(Exception e){
            //何らかの理由で失敗したらエラーページにエラー文を渡して表示。想定は不正なアクセスとDBエラー
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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
