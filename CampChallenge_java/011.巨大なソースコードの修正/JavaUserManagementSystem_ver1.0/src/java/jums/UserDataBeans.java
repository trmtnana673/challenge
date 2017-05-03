/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jums;

import javax.servlet.http.HttpSession;
//修正箇所
//修正1-3：このJavaBeans全体

/**
 *登録情報確定前のユーザー情報を持ちまわるJavaBeans
 * @author nana
 */
public class UserDataBeans {
    //修正1-3：フォームから値を受け取り、まだ登録確定していないデータ自体を格納するJavabeansの作成
    
    private String name;
    private String year;
    private String month;
    private String day;
    private String tell;
    private String type;
    private String comment;
    
    public void setUDB(HttpSession hs){
        this.name    = (String)hs.getAttribute("name");
        this.year    = (String)hs.getAttribute("year");
        this.month   = (String)hs.getAttribute("month");
        this.day     = (String)hs.getAttribute("day");
        this.tell    = (String)hs.getAttribute("tell");
        this.type    = (String)hs.getAttribute("type");
        this.comment = (String)hs.getAttribute("comment");
    }
    
    public String getName(){
         if(this.name == null){
            this.name = "";
            return this.name;
        } else {
            return this.name;
        }
    }
    
    public String getYear(){
        if(this.year == null){
            this.year = "";
            return this.year;
        } else {
            return this.year;
        }
    }
    
    public String getMonth(){
        if(this.month == null){
            this.month = "";
            return this.month;
        } else {
            return this.month;
        }
    }
    
    public String getDay(){
         if(this.day == null){
            this.day = "";
            return this.day;
        } else {
            return this.day;
        }
    }
    
    public String getTell(){
        if(this.tell == null){
            this.tell = "";
            return this.tell;
        } else {
            return this.tell;
        }
    }
    
    public String getType(){
        return this.type;
    }
    
    public String getComment(){
        if(this.comment == null){
            this.comment = "";
            return comment;
        } else {
            return this.comment;
        }
    }
    
}
