package com.gemini.WebDevelopmentBackend.dao;

import java.util.List;

import com.gemini.WebDevelopmentBackend.model.Category;

public interface CategoryDAO {
	
	List<Category> list();
	
	Category get(int id);
	
	boolean add(Category category);
	
	boolean update(Category category);
	
	boolean delete(Category category);
	

}
