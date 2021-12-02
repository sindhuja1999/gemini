package com.gemini.webdevelopment.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gemini.webdevelopment.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController
{
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name="result",required=false)String result)
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","Shopping Cart");
		mv.addObject("userClickShowCart",true);
		mv.addObject("cartLines",cartService.getCartLines());
		
		if(result!=null)
		{
			switch(result)
			{
			case "unavailable":mv.addObject("message","Out of Stock..!!");
								break;
								
			case "updated":mv.addObject("message","Cart has been updated..!!");
							break;
							
			case "deleted":mv.addObject("message","Cart has been deleted..!!");
							break;
							
			case "added":mv.addObject("message","Product has been added..!!");
							break;
							
			case "maximum":mv.addObject("message","Sorry product quantity cannot exceed more than 4.!!");
			break;
			}
		}
		
		return mv;
	}
	
	@RequestMapping("/{cartLineId}/update")
	public String updateCart(@PathVariable int cartLineId,@RequestParam int count)
	{
		String response=cartService.manageCartLine(cartLineId,count);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/{cartLineId}/delete")
	public String deleteCart(@PathVariable int cartLineId)
	{
		String response=cartService.removeCartLine(cartLineId);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/add/{productId}/product")
	public String addCart(@PathVariable int productId)
	{
		String response=cartService.addCartLine(productId);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping(value= {"/checkout"})
	public ModelAndView checkout()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","checkout Page");
		mv.addObject("userClickcheckout",true);
		return mv;
		
	}
	
}
