/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.java;

import java.util.*;

/**
 *
 * @author nana
 */
abstract class Human {
    
    abstract public Integer open(Integer o);
    abstract public ArrayList setCard(ArrayList <Integer> myCards);
    abstract public boolean checkSum(Integer c);
    public ArrayList <Integer> myCards = new ArrayList <Integer> ();
    
}

    
    
