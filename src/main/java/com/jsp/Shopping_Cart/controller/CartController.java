package com.jsp.Shopping_Cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.Shopping_Cart.dao.CartDao;
import com.jsp.Shopping_Cart.dao.CustomerDao;
import com.jsp.Shopping_Cart.dto.Cart;
import com.jsp.Shopping_Cart.dto.Customer;
import com.jsp.Shopping_Cart.dto.Item;

@Controller
public class CartController {
       @Autowired
       CartDao dao;
       
       @Autowired
       CustomerDao cusdao;
       
       
       @RequestMapping("/displayitemsfromcart")
       public ModelAndView displayItemsFromCart(HttpSession ses)
       {
    	  Customer customer= (Customer) ses.getAttribute("customerinfo");
    	  Customer c= cusdao.findCustomerById(customer.getId());
    	  
    	  Cart cart=c.getCart();
    	  
    	  List<Item> items=cart.getItem();
    	   
    	   ModelAndView mav=new ModelAndView();
    	   mav.addObject("itemlist", items);
    	   mav.addObject("totalprice", cart.getTotalprice());
    	   mav.setViewName("displaycart");
    	   return mav;
       }
}
