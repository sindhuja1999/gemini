package com.gemini.WebDevelopmentBackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.gemini.WebDevelopmentBackend.dao.ProductDAO;
import com.gemini.WebDevelopmentBackend.model.Product;

public class ProductTest {

	
	private static AnnotationConfigApplicationContext context;
	private static ProductDAO productDAO;
	private static Product product;
	
	@BeforeClass
	public static void init()
	{
		context =new AnnotationConfigApplicationContext();
		context.scan("com.gemini.WebDevelopmentBackend");
		context.refresh();
		productDAO =(ProductDAO)context.getBean("productDAO");
		
	}
	
	@Test
	public void TestAddproduct()
	{
		product=new Product();
		product.setName("MI notebook pro");
		product.setBrand("MI");
		product.setDescription("It's a nice laptop designed by MI");
		product.setUnitPrice(40000);
		product.setActive(true);
		product.setCategoryId(0);
		product.setSupplierId(2);
		
		assertEquals("Product added successfully",true,productDAO.add(product));
		
	}
	@Ignore
	@Test
	public void TestListActiveproductByCategory()
	{
		
		assertEquals("active products by category is fetched successfully",1,productDAO.listActiveProductByCategory(1).size());
	}
	@Ignore
	@Test
	public void TestlatestActiveproducts()
	{
		
		assertEquals("latest active products  is fetched successfully",4,productDAO.getLatestActiveProducts(4).size());
	}
	
}
