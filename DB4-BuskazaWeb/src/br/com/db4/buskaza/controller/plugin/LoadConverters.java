package br.com.db4.buskaza.controller.plugin;

import javax.servlet.ServletException;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;

/**
 * Carrega conversores de valores para garantir que valores sejam convertidos
 * corretamente em todos os action forms
 * 
 * @author vacavitoria software www.vacavitoria.com
 * @since 2011-jul-26
 * 
 */
public class LoadConverters implements PlugIn {

	public void destroy() {

	}

	public void init(ActionServlet servlet, ModuleConfig config) throws ServletException {
		System.out.println("--- loadconverters");

		ConvertUtils.register(DoubleConverterBR.getInstance(), Double.class);
		ConvertUtils.register(DoubleConverterBR.getInstance(), double.class);

	}

}
