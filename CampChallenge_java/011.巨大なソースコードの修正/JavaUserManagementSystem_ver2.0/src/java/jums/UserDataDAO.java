package jums;

import base.DBManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 * ユーザー情報を格納するテーブルに対しての操作処理を包括する
 * DB接続系はDBManagerクラスに一任
 * 基本的にはやりたい1種類の動作に対して1メソッド
 * @author hayashi-s
 */

//<修正箇所：5箇所>

public class UserDataDAO {
    
    //インスタンスオブジェクトを返却させてコードの簡略化
    public static UserDataDAO getInstance(){
        return new UserDataDAO();
    }
    
    /**
     * データの挿入処理を行う。現在時刻は挿入直前に生成
     * @param ud 対応したデータを保持しているJavaBeans
     * @throws SQLException 呼び出し元にcatchさせるためにスロー 
     */
    public void insert(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st =  con.prepareStatement("INSERT INTO user_t(name,birthday,tell,type,comment,newDate) VALUES(?,?,?,?,?,?)");
            st.setString(1, ud.getName());
            st.setDate(2, new java.sql.Date(ud.getBirthday().getTime()));//指定のタイムスタンプ値からSQL格納用のDATE型に変更
            st.setString(3, ud.getTell());
            st.setInt(4, ud.getType());
            st.setString(5, ud.getComment());
            st.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            st.executeUpdate();
            System.out.println("insert completed");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }
        }

    }
    
    /**
     * データの検索処理を行う。
     * @param ud 対応したデータを保持しているJavaBeans
     * @throws SQLException 呼び出し元にcatchさせるためにスロー 
     * @return 検索結果
     */
    
    //<<複数の検索結果を持ちまわるよう型をArrayListに変更致しました>>
    public ArrayList search(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        ArrayList resultUd = new ArrayList();
        try{
            con = DBManager.getConnection();
            
            String sql = "SELECT * FROM user_t";
            boolean flag = false;
            
            int flagNum1 = 0;
            int flagNum2 = 0;
            int flagNum3 = 0;
            
            if (!ud.getName().equals("")) {
                sql += " WHERE name like ?";
                flag = true;
                flagNum1 = 1;
            }
            if (ud.getBirthday()!=null) {
                if(!flag){
                    sql += " WHERE birthday like ?";
                    flag = true;
                    flagNum2 = 1;
                }else{
                    sql += " AND birthday like ?";
                    flagNum2 = 2;
                }
            }
            if (ud.getType()!=0) {
                if(!flag){
                    sql += " WHERE type like ?";
                    flagNum3 = 1;
                }else{
                    sql += " AND type like ?";
                    flagNum3 = 2;
                }
            }
            
            st =  con.prepareStatement(sql);
            
            //<sqlの値が変化すると"?"の順番も変化するので対応した処理を実行させる>
            if(flagNum1 == 1) {
                st.setString(1, "%"+ud.getName()+"%");
            }
            
            if(flagNum2 == 1) {
                st.setString(1, "%"+ new SimpleDateFormat("yyyy").format(ud.getBirthday())+"%");
            } else if (flagNum2 == 2){
                st.setString(2, "%"+ new SimpleDateFormat("yyyy").format(ud.getBirthday())+"%");
            }
            
            if (flagNum3 == 1) {
                st.setInt(1, ud.getType());
            } else if (flagNum3 == 2){
                st.setInt(2, ud.getType());
            } else if (flagNum3 == 3){
                st.setInt(3, ud.getType());
            }
            
            ResultSet rs = st.executeQuery();
            
            //<DBから受け取ったデータのまとまりである各DTOを配列に格納して返り値にします>
            while(rs.next()){
            UserDataDTO setRud = new UserDataDTO();
            setRud.setUserID(rs.getInt(1));
            setRud.setName(rs.getString(2));
            setRud.setBirthday(rs.getDate(3));
            setRud.setTell(rs.getString(4));
            setRud.setType(rs.getInt(5));
            setRud.setComment(rs.getString(6));
            setRud.setNewDate(rs.getTimestamp(7));
            
            resultUd.add(setRud);
            }
            
            System.out.println("search completed");
            
            return resultUd;
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }
        }

    }
    
    /**
     * ユーザーIDによる1件のデータの検索処理を行う。
     * @param ud 対応したデータを保持しているJavaBeans
     * @throws SQLException 呼び出し元にcatchさせるためにスロー 
     * @return 検索結果
     */
    public UserDataDTO searchByID(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            
            String sql = "SELECT * FROM user_t WHERE userID = ?";
            
            st =  con.prepareStatement(sql);
            st.setInt(1, ud.getUserID());
            
            ResultSet rs = st.executeQuery();
            rs.next();
            UserDataDTO resultUd = new UserDataDTO();
            resultUd.setUserID(rs.getInt(1));
            resultUd.setName(rs.getString(2));
            resultUd.setBirthday(rs.getDate(3));
            resultUd.setTell(rs.getString(4));
            resultUd.setType(rs.getInt(5));
            resultUd.setComment(rs.getString(6));
            resultUd.setNewDate(rs.getTimestamp(7));
            
            System.out.println("searchByID completed");

            return resultUd;
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }
        }

    }
    
    //<<指定した個人データを更新するメソッドを作成しました>>
    public void update(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st =  con.prepareStatement("UPDATE user_t SET name=?,birthday=?,tell=?,type=?,comment=?,newDate=? WHERE userID=?");
            st.setString(1, ud.getName());
            st.setDate(2, new java.sql.Date(ud.getBirthday().getTime()));
            st.setString(3, ud.getTell());
            st.setInt(4, ud.getType());
            st.setString(5, ud.getComment());
            st.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            st.setInt(7,ud.getUserID());
            st.executeUpdate();
            System.out.println("update completed");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }
        }

    }
    
    //<<指定した個人データを削除するメソッドを作成しました>>
     public void delete(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st =  con.prepareStatement("DELETE  FROM user_t WHERE userID=?");
            st.setInt(1,ud.getUserID());
            st.executeUpdate();
            System.out.println("delete completed");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }
        }

    }
}
