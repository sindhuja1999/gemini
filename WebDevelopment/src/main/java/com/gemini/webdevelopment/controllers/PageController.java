package com.gemini.webdevelopment.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gemini.WebDevelopmentBackend.dao.CategoryDAO;
import com.gemini.WebDevelopmentBackend.dao.ProductDAO;
import com.gemini.WebDevelopmentBackend.model.Category;
import com.gemini.WebDevelopmentBackend.model.Product;

@Controller
public class PageController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	@RequestMapping(value= {"/","/home","/index"})
	public ModelAndView index()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","Home Page");
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("userClickHome",true);
		return mv;
		
	}
	@RequestMapping(value= {"/about"})
	public ModelAndView about()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","About Us Page");
		mv.addObject("userClickAbout",true);
		return mv;
		
	}
	
	@RequestMapping(value= {"/contact"})
	public ModelAndView contact()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","Contact Us Page");
		mv.addObject("userClickContact",true);
		return mv;
		
	}
	
	@RequestMapping(value= {"/show/all/products"})
	public ModelAndView showAllProducts()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","Product Page");
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("userClickAllProducts",true);
		return mv;
	}
	
	@RequestMapping(value= {"/show/category/{id}/products"})
	public ModelAndView showCategoryProducts(@PathVariable("id")int id)
	{
		ModelAndView mv=new ModelAndView("page");
		
		Category category=null;
		category=categoryDAO.get(id);
		
		mv.addObject("title",category.getName());
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("category",category);
		mv.addObject("userClickCategoryProducts",true);
		return mv;
	}

	@RequestMapping(value= {"/show/{id}/product"})
	public ModelAndView showSingleProducts(@PathVariable("id")int id) {
		ModelAndView mv=new ModelAndView("page");
		Product product=productDAO.get(id);
		product.setViews(product.getViews()+1);
		productDAO.update(product);
		mv.addObject("title",product.getName());
		mv.addObject("product",product);
		mv.addObject("userClickSingleProduct",true);
		
		return mv;
		
	}
	
	@RequestMapping(value= {"/register"})
	public ModelAndView flowRegister()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","Register Page");
		mv.addObject("userClickRegister",true);
		return mv;
		
	}
	
	
	
	
	@RequestMapping(value= {"/login"})
	public ModelAndView springlogin(@RequestParam(name="error",required=false)String error,
			@RequestParam(name="logout",required=false)String logout)
	{
		ModelAndView mv=new ModelAndView("login");
		mv.addObject("title","Login Page");
		
		if(error!=null)
		{
			mv.addObject("message","Username and Password are invalid");
		}
		
		if(logout!=null)
		{
			mv.addObject("logout","You have logged out successfully");
		}
		return mv;
		
	}
	
	@RequestMapping(value= {"/access-restricted"})
	public ModelAndView accessRestrict()
	{
		ModelAndView mv=new ModelAndView("error");
		mv.addObject("errorTitle","Sorry your access denied..");
		mv.addObject("errorDescription","Your not authorised to access this page");
		mv.addObject("title","403 access denied");
		return mv;
		
	}
	
	@RequestMapping(value= {"/logout"})
	public String doLogout(HttpServletRequest request,HttpServletResponse response)
	{
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null)
		{
			new SecurityContextLogoutHandler().logout(request,response,auth);
		}
		
		return "redirect:/login?logout";
	}	
}
