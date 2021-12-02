package com.gemini.WebDevelopmentBackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.gemini.WebDevelopmentBackend.dao.CategoryDAO;
import com.gemini.WebDevelopmentBackend.model.Category;

//JUNIT Testing Tools
public class CategoryTest {
	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;//buseness execution
	private static Category category;//responsible for loading the data and transferring the data
	
	@BeforeClass
	public static void init()
	{
		context =new AnnotationConfigApplicationContext();
		context.scan("com.gemini.WebDevelopmentBackend");
		context.refresh();
		categoryDAO =(CategoryDAO)context.getBean("categoryDAO");
		
	}
	
	@Ignore
	@Test
	public void testAddCategory()
	{
		
		category =new Category();
		/*category.setId(1);
		category.setName("Tablet");
		category.setDescription("This is all about tablet of Apples");
		category.setImageURL("2.jpg");*/
		
        category.setId(2);
		category.setName("Laptops");
		category.setDescription("This is a nice Laptops");
		category.setImageURL("3.jpg");
		
		assertEquals("Category is added successfully in my project",true,categoryDAO.add(category));
	}
	@Ignore
	@Test
	public void testUpdateCategory()
	{
		
		category=categoryDAO.get(0);
		category.setName("Mobiles");
		category.setDescription("It is a nice mobile phone");
		category.setImageURL("4.jpg");
		
		assertEquals("Category is updated successfully in my project",true,categoryDAO.update(category));
	}
	
	@Ignore
	@Test
	public void testDeleteCategory()
	{
		
	category=categoryDAO.get(0);
		
		assertEquals("Category is deleted successfully",true,categoryDAO.delete(category));
	}
	

	
	@Test
	public void testListCategory()
	{
		
		
		assertEquals("Category is fetched successfully",2,categoryDAO.list().size());
	}
}
