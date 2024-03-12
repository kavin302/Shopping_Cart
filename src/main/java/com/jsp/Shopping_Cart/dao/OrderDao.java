package com.jsp.Shopping_Cart.dao;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.Shopping_Cart.dto.Item;
import com.jsp.Shopping_Cart.dto.Orders;

@Repository
public class OrderDao {
	@Autowired
    EntityManagerFactory emf;
    
    public void saveOrder(Orders order)
    {
    	EntityManager em=emf.createEntityManager();
    	EntityTransaction et=em.getTransaction();
    	
    	et.begin();
    	em.persist(order);
    	et.commit();
    }
    
    public void updateOrder(Orders order)
    {
    	EntityManager em=emf.createEntityManager();
    	EntityTransaction et=em.getTransaction();
    	
    	
    		et.begin();
    		em.merge(order);
    		et.commit();
    	
    }
    
    public void deleteOrderById(int id)
    {
    	EntityManager em=emf.createEntityManager();
    	EntityTransaction et=em.getTransaction();
    	
    	Orders order=em.find(Orders.class, id);
    	if(order!=null)
    	{
    		et.begin();
    		em.remove(order);
    		et.commit();
    	}
    }

    public Orders findOrderById(int id)
    {
    	EntityManager em=emf.createEntityManager();
    	EntityTransaction et=em.getTransaction();
    	
    	Orders order=em.find(Orders.class, id);
    	
    	if(order!=null)
    	{
    		return order;
    	
    	}
    	
    	else
    	{
    		return null;
    	}
    	
    }
}
