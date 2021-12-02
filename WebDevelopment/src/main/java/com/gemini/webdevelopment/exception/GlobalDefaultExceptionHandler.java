package com.gemini.webdevelopment.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice

public class GlobalDefaultExceptionHandler 
{
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView noHandlerFoundException()
	{
		ModelAndView mv=new ModelAndView("error");
		mv.addObject("errorTitle","Page not found kindly check again");
		mv.addObject("errorDescription","You have given a wrong URL,which is not present in our site");
		mv.addObject("title","404 page not found");
		
		return mv;
	}

}
