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

import com.jsp.Shopping_Cart.dao.MerchantDao;
import com.jsp.Shopping_Cart.dao.ProductDao;
import com.jsp.Shopping_Cart.dto.Merchant;
import com.jsp.Shopping_Cart.dto.Product;



@Controller
public class ProductController {
	         @Autowired
	         ProductDao dao;
	           @Autowired
	           MerchantDao dao1;
	
           @RequestMapping("/addproduct")
           public ModelAndView addProduct()
           {
        	   Product p=new Product();
        	   
        	   ModelAndView mav=new ModelAndView();
        	   mav.addObject("productobj", p);
        	   mav.setViewName("productform");
        	   return mav;
           }
           
           @RequestMapping("/saveproduct")
           public ModelAndView saveProduct(@ModelAttribute("productobj")Product p,HttpSession session)
           {
        	 Merchant m=  (Merchant) session.getAttribute("merchantinfo");
        	List<Product> products= m.getProduct();
        	 if(products.size()>0)
        	 {
        		 products.add(p);
        	 }
        	 else
        	 {
        		 List<Product> product=new ArrayList<Product>();
        		 product.add(p);
        		 m.setProduct(product);
        	 }
        	 
        	   dao.saveProduct(p);
        	   dao1.updateMerchant(m);
        	   ModelAndView mav=new ModelAndView();
        	   mav.addObject("message", "data saved successfully");
        	   mav.setViewName("merchantoptions");
        	   return mav;
           }
           
           @RequestMapping("/deleteproduct")
           public ModelAndView deleteProduct(@RequestParam("id") int id,HttpSession session)
           {
        	   Merchant m=(Merchant) session.getAttribute("merchantinfo");
        	 Merchant merchant=  dao1.deleteProductFromMerchant(m.getId(), id);
        	 dao1.updateMerchant(merchant);
        	   dao.deleteProductById(id);
        	   
        	   session.setAttribute("merchantinfo", merchant);
        	   
        	   
        	   ModelAndView mav=new ModelAndView();
        	   mav.setViewName("viewallproduct");
        	   return mav;
           }
           
           @RequestMapping("/updateproduct")
           public ModelAndView updaterequest(@RequestParam("id")int id)
           {
        	   
        	   Product p=dao.findProductById(id);
        	   ModelAndView mav=new ModelAndView();
        	   mav.addObject("productob", p);
        	   mav.setViewName("updateProduct");
        	   return mav;
           }
           
           @RequestMapping("/UpdateProduct")
           public ModelAndView updateProduct(ServletRequest req,HttpSession ses)
           {
        	   String id=req.getParameter("id");
        	   String brand=req.getParameter("brand");
        	   String category=req.getParameter("category");
        	   String model=req.getParameter("model");
        	   String price=req.getParameter("price");
        	   String stock=req.getParameter("stock");
        	   
        	   Product p=new Product();
        	   p.setId(Integer.parseInt(id));
        	   p.setBrand(brand);
        	   p.setCategory(category);
        	   p.setModel(model);
        	   p.setPrice(Double.parseDouble(price));
        	   p.setStock(Integer.parseInt(stock));
        	   
        	   dao.updateProduct(p);
   
        	   Merchant m=(Merchant) ses.getAttribute("merchantinfo");
        	   Merchant mer=dao1.findMerchantById(m.getId());
        	   ses.setAttribute("merchantinfo", mer);
        	   
        	   ModelAndView mav=new ModelAndView();
        			   mav.setViewName("/viewallproduct");
        			   return mav;
           }
           
           @RequestMapping("/Displayallproduct")
           public ModelAndView displayAllProduct()
           {
          	 List<Product> p=dao.fetchAllProduct();
          	 ModelAndView mav=new ModelAndView();
          	
          	mav.addObject("productobj", p);
          	 mav.setViewName("displayallproduct");
          	 return mav;
           }
           
           
           
           @RequestMapping("/displaybybrand")
           public ModelAndView displayProductByBrand(ServletRequest req)
           {
          	 String brand=req.getParameter("brand");
          	 List<Product> p=dao.findProductByBrand(brand);
          	 ModelAndView mav=new ModelAndView();
          	 mav.addObject("productobj", p);
          	 mav.setViewName("displayallproduct");
          	 return mav;
           }
           
           @RequestMapping("/displaybycategory")
           public ModelAndView displayProductByCategory(ServletRequest req)
           {
          	 String category=req.getParameter("category");
          	 List<Product> p=dao.findProductByCategory(category);
          	 ModelAndView mav=new ModelAndView();
          	 mav.addObject("productobj", p);
          	 mav.setViewName("displayallproduct");
          	 return mav;
           }
           
           @RequestMapping("/displaybyrange")
           public ModelAndView displayProductByRange(ServletRequest req)
           {
          	 String lowprice=req.getParameter("lowprice");
          	 String highprice=req.getParameter("highprice");
          	 List<Product> p=dao.findProductByRange(Double.parseDouble(lowprice),Double.parseDouble(highprice));
          	 ModelAndView mav=new ModelAndView();
          	 mav.addObject("productobj", p);
          	 mav.setViewName("displayallproduct");
          	 return mav;
           }
}
