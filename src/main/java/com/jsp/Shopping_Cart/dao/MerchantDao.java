package com.jsp.Shopping_Cart.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.Shopping_Cart.dto.Merchant;
import com.jsp.Shopping_Cart.dto.Product;

@Repository
public class MerchantDao {
	    @Autowired
         EntityManagerFactory emf;
	    @Autowired
	    ProductDao pdao;
	
	public void saveMerchant(Merchant merchant)
	{
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(merchant);
		et.commit();
				
	}
	
	public Merchant login(String email,String password)
	{
		 EntityManager em=emf.createEntityManager();
		Query query=em.createQuery("select m from Merchant m where m.email=?1 and m.password=?2 ");
		 query.setParameter(1, email);
		query.setParameter(2, password);
		try {
		Merchant merchant=(Merchant) query.getSingleResult();
		return merchant;
		}
		catch (NoResultException e) {
			return null;
		}
		
	}
	
	
	public void updateMerchant(Merchant m)
	{
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		
		
		et.begin();
		em.merge(m);
		et.commit();
		
	}
	
	public void deleteMerchantById(int id)
	{
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Merchant m=em.find(Merchant.class, id);
		if(m!=null)
		{
			et.begin();
			em.remove(m);
			et.commit();
		}
	}
	
	public Merchant findMerchantById(int id)
	{
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Merchant m=em.find(Merchant.class, id);
		
		if(m!=null)
		{
			return m;
		
		}
		
		else
		{
			return null;
		}
		
	}
	
	public Merchant deleteProductFromMerchant(int m_id,int p_id)
	{
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Merchant m=em.find(Merchant.class, m_id);
		List<Product> product=m.getProduct();
		List<Product> pro=new ArrayList<Product>();
		
		for(Product p:product)
		{
			if(p.getId()!=p_id)
			{
				pro.add(p);
			}
		}
		
		
	       
	       m.setProduct(pro);
		
		return m;
	}
	
}
