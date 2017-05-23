package jums;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hayashi-s
 */

//<修正箇所：3箇所>
public class SearchResult extends HttpServlet {

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
            HttpSession hs = request.getSession();
            
            request.setCharacterEncoding("UTF-8");//リクエストパラメータの文字コードをUTF-8に変更
            
            //<<直リンク防止処理を追加しました>>
            String accesschk = request.getParameter("ac");
            if(accesschk ==null || (Integer)hs.getAttribute("ac")!=Integer.parseInt(accesschk)){
                throw new Exception("不正なアクセスです");
            }
        
            //<search.jspから遷移した場合(セッション"conditionsData"がnullかNo)はリクエストパラメーターを取得して配列"conditions"に検索条件を保存>
            //<そうでなければ配列"conditions"に保存した検索条件を取り出して再検索(ResultDetailまでページ遷移してれば"conditionsData"はYes)>
            String name;
            String year;
            String type;
            String conditionsData = (String)hs.getAttribute("conditionsData");
            
            if(conditionsData==null || conditionsData.equals("No")){
                
              name = request.getParameter("name");
              year = request.getParameter("year");
              type = request.getParameter("type");
              
              ArrayList <String> conditions1 = new <String> ArrayList();
              conditions1.add(name);
              conditions1.add(year);
              conditions1.add(type);
            
              hs.setAttribute("conditions", conditions1);
              
            }else{
              ArrayList <String> conditions2 = (ArrayList)hs.getAttribute("conditions");
              name = conditions2.get(0);
              year = conditions2.get(1);
              type = conditions2.get(2);
            }
            
            //フォームからの入力を取得して、JavaBeansに格納
            UserDataBeans udb = new UserDataBeans();
            udb.setName(name);
            udb.setYear(year);
            udb.setType(type);

            //DTOオブジェクトにマッピング。DB専用のパラメータに変換
            UserDataDTO searchData = new UserDataDTO();
            udb.UD2DTOMapping(searchData);

            //<<resultDataの型をArrayListにしてリクエストスコープに渡すよう修正しました>>
            ArrayList resultData =UserDataDAO .getInstance().search(searchData);
            request.setAttribute("resultData", resultData);
            hs.setAttribute("conditionsData", "No");
            
            request.getRequestDispatcher("/searchresult.jsp").forward(request, response);  
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
