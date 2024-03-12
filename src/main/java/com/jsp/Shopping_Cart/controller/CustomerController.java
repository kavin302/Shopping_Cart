package com.jsp.Shopping_Cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.Shopping_Cart.dao.CustomerDao;
import com.jsp.Shopping_Cart.dao.ProductDao;
import com.jsp.Shopping_Cart.dto.Customer;
import com.jsp.Shopping_Cart.dto.Merchant;
import com.jsp.Shopping_Cart.dto.Product;


@Controller
public class CustomerController {
         @Autowired
         CustomerDao dao;
         
         @RequestMapping("/addcustomer")
         public ModelAndView addCustomer()
         {
  		  Customer c=new Customer();
      	    ModelAndView mav=new ModelAndView();
      	    mav.addObject("customerobj",c);
      	    mav.setViewName("customerform");
      	    
      	    return mav;
      	    
      	    
         }
         
         @RequestMapping("/savecustomer")
     	public ModelAndView saveCustomer(@ModelAttribute("customerobj")Customer c)
     	{
     		dao.saveCustomer(c);
     		ModelAndView mav=new ModelAndView();
     		mav.addObject("message", "data saved successfully");
     		mav.setViewName("customermenu");
     		return mav;
     	}
         
         @RequestMapping("/LoginValidation")
     	public ModelAndView login(ServletRequest req,HttpSession session)
     	{
     		String email=req.getParameter("email");
     		String password=req.getParameter("password");
     		
     		Customer c=dao.login(email, password);
     		
     		ModelAndView mav=new ModelAndView();
     		
     		if(c!=null)
     		{
     			mav.addObject("message", "successfully logged in");
     			mav.setViewName("customeroptions");
     			session.setAttribute("customerinfo", c);
     			return mav;
     		}
     		else
     		{
     			mav.addObject("message", "invalid credentials");
     			mav.setViewName("customerloginform");
     			return mav;
     		}
     		
     	}
         
}
