package com.gemini.WebDevelopmentBackend.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.gemini.WebDevelopmentBackend.dao.CategoryDAO;
import com.gemini.WebDevelopmentBackend.model.Category;
@Transactional
@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> list() {
		
		String listCategory="FROM Category where active =: active";
		Query query=sessionFactory.getCurrentSession().createQuery(listCategory);
		query.setParameter("active", true);
		return query.getResultList();
	}

	// don't use any java file directly in daoImpl take it's.class file to access
	// the model

	@Override
	public Category get(int id) {
		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
	}

	
	@Override
	public boolean add(Category category) {
		try {

			sessionFactory.getCurrentSession().persist(category);

			return true;
		}

		catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(Category category) {
		try {

			sessionFactory.getCurrentSession().update(category);

			return true;
		}

		catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	

	@Override
	public boolean delete(Category category) {

		category.setActive(false);
		try {

			sessionFactory.getCurrentSession().update(category);

			return true;
		}

		catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

}
