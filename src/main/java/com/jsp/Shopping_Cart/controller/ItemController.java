package com.jsp.Shopping_Cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.Shopping_Cart.dao.CartDao;
import com.jsp.Shopping_Cart.dao.CustomerDao;
import com.jsp.Shopping_Cart.dao.ItemDao;
import com.jsp.Shopping_Cart.dao.ProductDao;
import com.jsp.Shopping_Cart.dto.Cart;
import com.jsp.Shopping_Cart.dto.Customer;
import com.jsp.Shopping_Cart.dto.Item;
import com.jsp.Shopping_Cart.dto.Product;

@Controller
public class ItemController {
	@Autowired
	ItemDao idao;
	@Autowired
	ProductDao pdao;
	@Autowired
	CartDao cdao;
	@Autowired
	CustomerDao cusdao;
	
	@RequestMapping("/Addtocart")
    public ModelAndView addToCart(@RequestParam("id" )int id)
    {
   	Product p= pdao.findProductById(id);
   	 ModelAndView mav=new ModelAndView();
   	 mav.addObject("product", p);
   	 mav.setViewName("itemform");
   	 return mav;
    }
	
	@RequestMapping("/additemtocart")
	public ModelAndView addItemToCart(ServletRequest req,HttpSession session)
	{
		int pid=Integer.parseInt(req.getParameter("id"));
		String brand=req.getParameter("brand");
		double price=Double.parseDouble(req.getParameter("price"));
		String model=req.getParameter("model");
		String category=req.getParameter("category");
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		
		Item i=new Item();
		i.setBrand(brand);
		i.setCategory(category);
		i.setP_Id(pid);
		i.setQuantity(quantity);
		i.setPrice(price*quantity);
		i.setModel(model);
		
	Customer c=(Customer)session.getAttribute("customerinfo");
	Cart cart=c.getCart();
	
	if(cart==null)
	{
		
		Cart cart1=new Cart();
		
		List<Item> items=new ArrayList<Item>();
		items.add(i);
		cart1.setItem(items);
		cart1.setName(c.getName());
		cart1.setTotalprice(price);
		cart1.setTotalprice(i.getPrice());
		
		c.setCart(cart1);
		
		idao.saveItem(i);
		
		cdao.saveCart(cart1);
		
		cusdao.updateCustomer(c);
	}
	else
	{
		List<Item> item2=cart.getItem();
		if(item2.size()>0)
		{
			item2.add(i);
			cart.setItem(item2);
			double totalprice1=0;
			for(Item i1:item2)
			{
				totalprice1+=i1.getPrice();
			}
			
			cart.setTotalprice(totalprice1);
			idao.saveItem(i);
			cdao.updateCart(cart);
			cusdao.updateCustomer(c);
		}
		else
		{
			List<Item> itemlist=new ArrayList<Item>();
			itemlist.add(i);
			cart.setItem(itemlist);
			cart.setTotalprice(i.getPrice());
			
			idao.saveItem(i);
			cdao.updateCart(cart);
			cusdao.updateCustomer(c);
		}
	}
	
	ModelAndView mav=new ModelAndView();
	//mav.addObject(category, i);
	mav.setViewName("redirect://Displayallproduct");
	return mav;
	}
}
										
