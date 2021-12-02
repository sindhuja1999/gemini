package com.gemini.WebDevelopmentBackend.dao;

import java.util.List;
import com.gemini.WebDevelopmentBackend.model.Address;
import com.gemini.WebDevelopmentBackend.model.Cart;
import com.gemini.WebDevelopmentBackend.model.User;

public interface UserDAO 
{
boolean addUser(User user);
User getEmailById(String email);
boolean addAddress(Address address);
Address getByBillingAddress(User user);
List<Address> listShippingAddress(User user);
boolean updateCart(Cart cart);
}