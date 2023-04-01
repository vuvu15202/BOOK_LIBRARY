/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import DAL.ProductDAO;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class CartCookies {
    private ArrayList<Cart> cartCookies;

    public CartCookies() {
        this.cartCookies = new ArrayList<>();
    }

    public ArrayList<Cart> getCartCookies() {
        return cartCookies;
    }

    public void setCartCookies(ArrayList<Cart> cartCookies) {
        this.cartCookies = cartCookies;
    }
    
    public int numberOfItem(){
        return cartCookies.size();
    }
    
    public boolean isProductInCartCookies(int id){
        for (Cart item : cartCookies) {
            if(item.getProductID()==id){
                return true;
            }
        }
        return false;
    }
    
    public int getQuantityByID(int id){
        for (Cart item : cartCookies) {
            if(item.getProductID()==id){
                return item.getQuantity();
            }
        }
        return 0;
    }
    
   
    public ArrayList<Cart> decryptionCookiesText(ArrayList<String> cookiesText){
        for (String string : cookiesText) {
            String[] arr=string.split("-");
            int productID = Integer.parseInt(arr[0]);
            int quantity=Integer.parseInt(arr[1]);
            cartCookies.add(new Cart(productID, quantity));
        }
        return cartCookies;
    }
    
    public static void main(String[] args) {
        CartCookies cartCookies = new CartCookies();
        ArrayList<String> string = new ArrayList<>();
        string.add("12-2");
        string.add("13-2");
        cartCookies.decryptionCookiesText(string);
        System.out.println(cartCookies.getCartCookies().get(0).getProductID());
    }
}
