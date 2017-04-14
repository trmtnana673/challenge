/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.java;

import java.io.PrintWriter;

/**
 *
 * @author nana
 */
public class Person {
    public String name = "teramoto";
    public Integer age = 27;
    
    public void setPerson (String n, Integer a){
         name = n;
         age = a;
    }
    
    public void showPerson (PrintWriter out){
        out.println(name);
        out.print(age);
    }
    
}
