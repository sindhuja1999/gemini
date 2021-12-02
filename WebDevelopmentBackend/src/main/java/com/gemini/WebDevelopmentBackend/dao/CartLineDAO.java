package com.gemini.WebDevelopmentBackend.dao;

import java.util.List;

import com.gemini.WebDevelopmentBackend.model.Cart;
import com.gemini.WebDevelopmentBackend.model.CartLine;

public interface CartLineDAO 
{
	public List<CartLine> list(int cartId);
	public CartLine get(int id);
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	
	public CartLine getByCartAndProduct(int cartId,int productId);
	
	boolean updateCart(Cart cart);
	
	public List<CartLine> listAvailable(int cartId);

}
