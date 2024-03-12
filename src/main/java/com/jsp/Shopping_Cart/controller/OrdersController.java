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
import com.jsp.Shopping_Cart.dao.OrderDao;
import com.jsp.Shopping_Cart.dao.ProductDao;
import com.jsp.Shopping_Cart.dto.Cart;
import com.jsp.Shopping_Cart.dto.Customer;
import com.jsp.Shopping_Cart.dto.Item;
import com.jsp.Shopping_Cart.dto.Orders;
import com.jsp.Shopping_Cart.dto.Product;

@Controller
public class OrdersController {
	@Autowired
	OrderDao dao;

	@Autowired
	ItemDao idao;

	@Autowired
	CartDao cdao;

	@Autowired
	ProductDao pdao;

	@Autowired
	CustomerDao cusdao;

	@RequestMapping("/addOrder")
	public ModelAndView addOrder() {
		Orders o = new Orders();

		ModelAndView mav = new ModelAndView();
		mav.addObject("orderobj", o);

		mav.setViewName("addorder");
		return mav;
	}

	@RequestMapping("/placeorder")
	public ModelAndView placeOrder(@ModelAttribute("orderobj") Orders o, HttpSession ses) {
		Customer cus = (Customer) ses.getAttribute("customerinfo");
		Customer customer = cusdao.findCustomerById(cus.getId());
		Cart c = customer.getCart();

		List<Item> items = c.getItem();

		
		List<Item> itemslist = new ArrayList<Item>();
		
		List<Item> itemswithgreaterquantity=new ArrayList<Item>();

		for (Item i : items) {
			Product p = pdao.findProductById(i.getP_Id());
			if (i.getQuantity() < p.getStock()) {
				itemslist.add(i);
				p.setStock(p.getStock() - i.getQuantity());
				pdao.updateProduct(p);
			}
			else
			{
				itemswithgreaterquantity.add(i);
			}
		}
		o.setItem(itemslist);
		double totalpriceoforder=0;
		for(Item it:itemslist)
		{
			totalpriceoforder+=it.getPrice();
		}
		o.setTotalPrice(totalpriceoforder);
		c.setItem(itemswithgreaterquantity);
		
		double totalprice=0;
		
		for(Item item:itemswithgreaterquantity)
		{
			totalprice+=item.getPrice();
		}
		c.setTotalprice(totalprice);
		
		List<Orders> orders = customer.getOrder();
		if(orders.size()>0)
		{
			orders.add(o);
			customer.setOrder(orders);
		}
		else
		{
			List<Orders> orders1=new ArrayList<Orders>();
			orders1.add(o);
			customer.setOrder(orders1);
		}
        
		
	    customer.setCart(c);
	    cdao.updateCart(c);
		dao.saveOrder(o);
		cusdao.updateCustomer(customer);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "order Placed Successfully");
		mav.addObject("orderdetails", o);
		mav.setViewName("customerbill");
		return mav;

	}
}
