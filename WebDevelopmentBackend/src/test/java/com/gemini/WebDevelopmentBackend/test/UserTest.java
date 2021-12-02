package com.gemini.WebDevelopmentBackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.gemini.WebDevelopmentBackend.dao.UserDAO;
import com.gemini.WebDevelopmentBackend.model.Address;
import com.gemini.WebDevelopmentBackend.model.Cart;
import com.gemini.WebDevelopmentBackend.model.User;

public class UserTest {
	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.gemini.WebDevelopmentBackend");
		context.refresh();
		userDAO = (UserDAO) context.getBean("userDAO");

	}
   
	@Ignore
	@Test
	public void testAddUser() 
    {
		user = new User();
		user.setFirstName("Sowmya");
		user.setLastName("Pinni");
		user.setEmail("sowmya123@gmail.com");
		user.setContactNo("9878623332");
		user.setEnabled(true);
		user.setRole("USER");
		user.setPassword("password");

		address = new Address();
		address.setAddressLineOne("Surya Nagar Colony");
		address.setAddressLineTwo("Near Transformer");
		address.setCity("hyderabad");
		address.setState("Telangana");
		address.setPostalCode("500010");
		address.setCountry("India");
		address.setBilling(true);

		cart = new Cart();
		address.setUser(user);
		user.setCart(cart);

		assertEquals("failed to add this users !!", true, userDAO.addUser(user));
		assertEquals("failed to add billing address !!", true, userDAO.addAddress(address));

		address = new Address();
		address.setAddressLineOne("Mytri Nagar");
		address.setAddressLineTwo("Near Alekya Towers");
		address.setCity("hyderabad");
		address.setState("Telangana");
		address.setPostalCode("500079");
		address.setCountry("India");
		address.setShipping(true);
		address.setUser(user);
		assertEquals("failed to add shipping address !!", true, userDAO.addAddress(address));

	}

	
	@Test
	public void testAddAddress() 
	{
		user = userDAO.getEmailById("sowmya123@gmail.com");
		address = new Address();
		address.setAddressLineOne("Chandra Nagar Colony");
		address.setAddressLineTwo("Near IceCream Shop");
		address.setCity("hyderabad");
		address.setState("Telangana");
		address.setPostalCode("500010");
		address.setCountry("India");

		address.setUser(user);

		assertEquals("failed to add address !!", true, userDAO.addAddress(address));

	}

}