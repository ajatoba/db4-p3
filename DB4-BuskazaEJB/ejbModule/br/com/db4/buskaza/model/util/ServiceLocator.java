package br.com.db4.buskaza.model.util;

import javax.naming.InitialContext;
import javax.naming.NamingException;


public class ServiceLocator
{
	private static InitialContext context;
	private static ServiceLocator ME;
	
	private ServiceLocator() throws NamingException {
		super();
		context = new InitialContext();
	}
	
	public static ServiceLocator getInstance() throws NamingException{
		if(ME == null){
			ME = new ServiceLocator();
		}
		return ME;
	}
	
	public Object locateEJB(String lookupName) throws NamingException
    {        
        Object manager = lookup(lookupName);        
        return manager;
    }   
        
	private Object lookup(String name) throws NamingException
    {
        return context.lookup(name);
    }
    
}
