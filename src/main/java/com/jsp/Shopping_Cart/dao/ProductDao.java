package com.jsp.Shopping_Cart.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.Shopping_Cart.dto.Cart;
import com.jsp.Shopping_Cart.dto.Product;

@Repository
public class ProductDao {
   @Autowired
   EntityManagerFactory emf;
   
   public void saveProduct(Product product)
   {
	   EntityManager em=emf.createEntityManager();
	   EntityTransaction et=em.getTransaction();
	   
	   et.begin();
	   em.persist(product);
	   et.commit();
   }
   
   public void updateProduct(Product product)
   {
   	EntityManager em=emf.createEntityManager();
   	EntityTransaction et=em.getTransaction();
   	
   	et.begin();
   	em.merge(product);
   	et.commit();
   }
   
   public void deleteProductById(int id)
   {
   	EntityManager em=emf.createEntityManager();
   	EntityTransaction et=em.getTransaction();
   	
   	Product product=em.find(Product.class, id);
   	
   	if(product!=null)
   	{
   		et.begin();
   		em.remove(product);
   		et.commit();
   	}
   }
   
   public Product findProductById(int id)
   {
   	EntityManager em=emf.createEntityManager();
   	EntityTransaction et=em.getTransaction();
   	
   	Product product=em.find(Product.class, id);
   	if(product!=null)
   	{
   		return product;
   		
   	}
   	else
   		return null;
   }
   
   public List<Product> fetchAllProduct()
   {
	   EntityManager em=emf.createEntityManager();
	   Query query=em.createQuery("select a from Product a");
	   
	   return query.getResultList();
   }
   
   public List<Product> findProductByBrand(String brand)
   {
	   EntityManager em=emf.createEntityManager();
	   Query query=em.createQuery("select b from Product b where b.brand=?1");
	   query.setParameter(1, brand);
	   return query.getResultList();
   }
   
   public List<Product> findProductByCategory(String category)
   {
	   EntityManager em=emf.createEntityManager();
	   Query query=em.createQuery("select s from Product s where s.category=?1");
	   query.setParameter(1, category);
	   
	   return query.getResultList();
   }
   
   public List<Product> findProductByRange(double low,double high)
   {
	   EntityManager em=emf.createEntityManager();
	   Query query=em.createQuery("select a from Product a where a.price>=?1 and a.price<=?2");
	   query.setParameter(1, low);
	   query.setParameter(2, high);
	   return query.getResultList();
   }
}
