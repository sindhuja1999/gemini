package com.gemini.webdevelopment.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gemin.webdevelopment.util.FileUtility;
import com.gemini.WebDevelopmentBackend.dao.CategoryDAO;
import com.gemini.WebDevelopmentBackend.dao.ProductDAO;
import com.gemini.WebDevelopmentBackend.model.Category;
import com.gemini.WebDevelopmentBackend.model.Product;
import com.gemini.webdevelopment.validator.ProductValidator;

@Controller
@RequestMapping("/manage")
public class ManagementController 
{
	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView showmanageProducts(@RequestParam(name = "operation", required = false) String operation) 
	{
		
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Manage Products");
		mv.addObject("userClickManageProduct", true);
		Product nproduct = new Product();
		nproduct.setSupplierId(1);
		nproduct.setActive(true);
		mv.addObject("product", nproduct);
		
		if (operation != null) 
		{
			if (operation.equals("product"))
			{
				mv.addObject("message", "Product added Successfully..!!");
			}
		} 
		
		return mv;
	}


	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String showSubmitProducts(@Valid @ModelAttribute("product") Product mproduct,BindingResult results,Model model
			,HttpServletRequest request) 
	{
		if(mproduct.getId()==0)
		{
			new ProductValidator().validate(mproduct,results);
		}
		else
		{
			if(!mproduct.getFile().getOriginalFilename().equals(""))
			{
				new ProductValidator().validate(mproduct,results);
			}
			
		}
		if(results.hasErrors())
		{
			model.addAttribute("title", "Manage Products");
			model.addAttribute("userClickManageProduct", true);
			model.addAttribute("message","Validation Failed");
			return "page";
		}
		
		if(!mproduct.getFile().getOriginalFilename().equals(""))
		{
			FileUtility.uploadFile(request,mproduct.getFile(),mproduct.getCode());
		}
		
		if(mproduct.getId()==0)
		{
			productDAO.add(mproduct);
		}
		else
		{
		productDAO.update(mproduct);
		}
		return "redirect:/manage/products?operation=product";
	}
	
	@RequestMapping(value = "/product/{id}/activation", method = RequestMethod.POST)
	@ResponseBody
	public String activateProducts(@PathVariable int id) 
	{
		Product product=productDAO.get(id);
		boolean isActive=product.isActive();
		product.setActive(!product.isActive());
		
		productDAO.update(product);
		return (isActive)?"Product deactivated Successfully"+product.getName():
			"Product activated Successfully"+product.getName();
		
	}

	@ModelAttribute("categories")
	public List<Category> getCategories() 
	{
		return categoryDAO.list();
	}
	
	@RequestMapping(value="/{id}/product",method=RequestMethod.GET)
	public ModelAndView editProducts(@PathVariable int id)
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","Manage Products");
		mv.addObject("userClickManageProduct",true);
		
		Product nproduct=productDAO.get(id);
		mv.addObject("product",nproduct);
		return mv;
	}

}
