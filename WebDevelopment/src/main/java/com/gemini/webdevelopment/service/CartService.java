package com.gemini.webdevelopment.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gemini.WebDevelopmentBackend.dao.CartLineDAO;
import com.gemini.WebDevelopmentBackend.dao.ProductDAO;
import com.gemini.WebDevelopmentBackend.model.Cart;
import com.gemini.WebDevelopmentBackend.model.CartLine;
import com.gemini.WebDevelopmentBackend.model.Product;
import com.gemini.webdevelopment.model.UserModel;

@Service("cartService")
public class CartService 
{
	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession session;
	
	Cart cart=null;
	
	public List<CartLine> getCartLines()
	{
		return cartLineDAO.list(getCart().getId());
	}
	
	private Cart getCart()
	{
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}

	public String manageCartLine(int cartLineId, int count)
	{
		CartLine cartLine=cartLineDAO.get(cartLineId);
		
		double oldTotal=cartLine.getTotal();
		
		Product product=cartLine.getProduct();
		
		if(product.getQuantity()<count)
		{
			return "result=unavailable";
		}
		cartLine.setProductCount(count);
		cartLine.setBuyingPrice(product.getUnitPrice());
		cartLine.setTotal(product.getUnitPrice()*count);
		cartLineDAO.update(cartLine);
		
		Cart cart=this.getCart();
		cart.setGrandTotal(cart.getGrandTotal()-oldTotal+cartLine.getTotal());
		cartLineDAO.updateCart(cart);
		return "result=updated";
		}

	public String removeCartLine(int cartLineId) 
	{
		CartLine cartLine=cartLineDAO.get(cartLineId);
		
		Cart cart=this.getCart();
		cart.setGrandTotal(cart.getGrandTotal()-cartLine.getTotal());
		cart.setCartLines(cart.getCartLines()-1);
		cartLineDAO.updateCart(cart);
		cartLineDAO.delete(cartLine);
		return "result=deleted";
	}

	public String addCartLine(int productId) 
	{
		Cart cart=this.getCart();
		String response=null;
		CartLine cartLine=cartLineDAO.getByCartAndProduct(cart.getId(),productId);
	
			if(cartLine==null)
			{
			cartLine=new CartLine();
			Product product=productDAO.get(productId);
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(product);
			cartLine.setProductCount(1);
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setTotal(product.getUnitPrice());
			cartLineDAO.add(cartLine);
			
			cart.setGrandTotal(cart.getGrandTotal()+cartLine.getTotal());
			cart.setCartLines(cart.getCartLines() +1);
			cartLineDAO.updateCart(cart);
		
			response= "result=added";
			}
			
			else
			{
				if(cartLine.getProductCount()<4)
				{
					response=this.manageCartLine(cartLine.getId(),cartLine.getProductCount()+1);
				}
				
				else
				{
					response="result=maximum";
				}
			}
			return response;
	}
}
