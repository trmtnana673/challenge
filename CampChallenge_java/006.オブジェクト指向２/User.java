/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.java;

import java.util.ArrayList;

/**
 *
 * @author nana
 */
public class User extends Human {
    public ArrayList <Integer> setCard(ArrayList <Integer> s){
        myCards.add(s.get(0));
        myCards.add(s.get(1));
        return myCards;
    }
    
    public boolean checkSum(Integer i){
        if (i != 21){
            return true;
        } else {
            return false;
        }
    }
         
    public Integer open(Integer a){
        return a;
    }
    
}
