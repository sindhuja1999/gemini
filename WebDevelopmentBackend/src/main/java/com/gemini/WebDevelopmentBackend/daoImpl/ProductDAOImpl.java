package com.gemini.WebDevelopmentBackend.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gemini.WebDevelopmentBackend.dao.ProductDAO;
import com.gemini.WebDevelopmentBackend.model.Product;

@Transactional
@Repository("productDAO")
public class ProductDAOImpl  implements ProductDAO{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Product> list() {
		
		return sessionFactory.getCurrentSession().createQuery("FROM Product",Product.class).getResultList();
	}

	@Override
	public Product get(int productId) {
		try {
		return sessionFactory.getCurrentSession().get(Product.class, Integer.valueOf(productId)) ;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean add(Product product) {
		try
		{
			sessionFactory.getCurrentSession().persist(product);
			return true;
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(Product product) {
		try
		{
			sessionFactory.getCurrentSession().update(product);
			return true;
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		return false;
	}

	@Override
	public boolean delete(Product product) {
		try
		{
			product.setActive(false);
			return this.update(product);
			
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		return false;
	}

	@Override
	public List<Product> listActiveProducts() {
		
		String activeProducts="FROM Product where active =: active";

		return sessionFactory.getCurrentSession().createQuery(activeProducts,Product.class)
				.setParameter("active", true).getResultList();
		
		
	}

	@Override
	public List<Product> listActiveProductByCategory(int categoryId) {
		
		String activeProductByCategory="FROM Product where active =: active AND categoryId=:categoryId ";
		
		return sessionFactory.getCurrentSession().createQuery(activeProductByCategory,Product.class)
				.setParameter("active", true)
				.setParameter("categoryId", categoryId)
				.getResultList();
	}

	@Override
	public List<Product> getLatestActiveProducts(int count) {
		
		String LatestActiveProducts="FROM Product WHERE active =: active ORDER BY id ";
		
		return sessionFactory.getCurrentSession().createQuery(LatestActiveProducts,Product.class)
				.setParameter("active", true)
				.setFirstResult(0)
				.setMaxResults(count)
				.getResultList();
	}
	
	

}
