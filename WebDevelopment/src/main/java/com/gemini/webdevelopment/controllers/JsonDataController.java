package com.gemini.webdevelopment.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gemini.WebDevelopmentBackend.dao.ProductDAO;
import com.gemini.WebDevelopmentBackend.model.Product;

@Controller
@RequestMapping("/json/data")
public class JsonDataController 
{
	@Autowired
	private ProductDAO productDAO;

	/* Response Body will convert the retrieved data in JSON format */
	@RequestMapping("/all/products")
	@ResponseBody
	public List<Product> getAllProducts() {
		return productDAO.listActiveProducts();

	}

	@RequestMapping("/category/{id}/products")
	@ResponseBody
	public List<Product> getProductByCategoryValue(@PathVariable int id) {
		return productDAO.listActiveProductByCategory(id);

	}

	@RequestMapping("/admin/all/products")
	@ResponseBody
	public List<Product> getProductForAdmin() {
		return productDAO.list();

	}

}
