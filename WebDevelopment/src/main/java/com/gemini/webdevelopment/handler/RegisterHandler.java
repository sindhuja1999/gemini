package com.gemini.webdevelopment.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.gemini.WebDevelopmentBackend.dao.UserDAO;
import com.gemini.WebDevelopmentBackend.model.Address;
import com.gemini.WebDevelopmentBackend.model.Cart;
import com.gemini.WebDevelopmentBackend.model.User;
import com.gemini.webdevelopment.model.RegisterModel;

@Component
public class RegisterHandler 
{
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public RegisterModel init()
	{
		return new RegisterModel();
	}
	
	public void addUser(RegisterModel registerModel,User user)
	{
		registerModel.setUser(user);
	}
	
	public void addBilling(RegisterModel registerModel,Address billing)
	{
		registerModel.setBilling(billing);
	}
	
	public String saveAll(RegisterModel registerModel)
	{
		String transitionValue="success";
		User user=registerModel.getUser();
		if(user.getRole().equals("USER"))
		{
			Cart cart=new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userDAO.addUser(user);
		
		Address billing=registerModel.getBilling();
		billing.setUser(user);
		billing.setBilling(true);
		userDAO.addAddress(billing);
		
		return transitionValue;
	}
	public String validateUser(User user,MessageContext error)
	{
		String transitionValue="success";
		if(!user.getPassword().equals(user.getConfirmPassword()))
		{
			error.addMessage(new MessageBuilder()
					.error()
					.source("confirmPassword")
					.defaultText("Please give correct password").build());
		transitionValue="failure";
		
		}
		
		if(userDAO.getEmailById(user.getEmail())!=null)
		{
			error.addMessage(new MessageBuilder().error()
					.source("email").
					defaultText("Email is already taken please use different email id").build());
			transitionValue="failure";
		}
		
		return transitionValue;
	}
}
