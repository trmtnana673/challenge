/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.sample;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.Serializable;
import java.util.Date;


/**
 *
 * @author nana
 */
public class ResultData implements Serializable {
    private Date d;
    private String luck;
    
    public ResultData() {}
    
    public Date getD () {
        return d;
    }
    
    public void setD (Date d){
        this.d = d;
    }
    
    public String getLuck () {
        return luck;
    }
    
    public void setLuck (String luck){
        this.luck = luck;
    }

}
