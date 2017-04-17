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
 public class Dealer extends Human{
    public ArrayList <Integer> cards = new ArrayList <Integer> (); {
     for(Integer num = 1; num <= 3; num++){
      cards.add(2);
      cards.add(3);
      cards.add(4);
      cards.add(5);
      cards.add(6);
      cards.add(7);
      cards.add(8);
      cards.add(9);
      cards.add(10);
      cards.add(10);
      cards.add(10);
      cards.add(10);
      cards.add(11);
     }
    }
    
    public ArrayList <Integer> deal(){
        Random rand = new Random ();
        Integer rn1 = rand.nextInt(cards.size());
        Integer rn2 = rand.nextInt(cards.size());
        Integer d1 = cards.get(rn1);
        Integer d2 = cards.get(rn2);
        cards.remove(rn1);
        cards.remove(rn2);
        
        ArrayList <Integer> dCards = new ArrayList <Integer> (); {
          dCards.add(d1);
          dCards.add(d2);
          
        return dCards;
        }
    }
        
    public ArrayList <Integer> hit(){
        Random rand = new Random ();
        Integer rn3 = rand.nextInt(cards.size());
        Integer d3 = cards.get(rn3);
        cards.remove(rn3);
        
        ArrayList <Integer> hCards = new ArrayList <Integer> (); {
         hCards.add(d3);
        }
        
        return hCards;
    }
    
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
