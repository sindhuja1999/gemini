package com.gemini.WebDevelopmentBackend.dao;

import java.util.List;

import com.gemini.WebDevelopmentBackend.model.Product;

public interface ProductDAO {
	
	List<Product> list();
	
	Product get(int productId); 
	
	boolean add(Product product);
	
	boolean update(Product product);
	
	boolean delete(Product product);
	
	List<Product> listActiveProducts();
	List<Product> listActiveProductByCategory(int categoryId);
	List<Product> getLatestActiveProducts(int count);
	
	
	

}
