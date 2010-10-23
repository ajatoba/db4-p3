package br.com.db4.buskaza.controller.action;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.usuario.ejb.UsuarioBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class TesteAction extends Action {
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		
		
		Usuario usuario = new Usuario();		
		//usuario.setNome("Fabio");
		
		UsuarioBeanLocal ejb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
		ejb.incluirUsuario(usuario);
		
		String idioma= request.getParameter("idioma");
		String pais= request.getParameter("pais");
		
		if(idioma!= null && pais!= null){
			setLocale(request, new Locale(idioma, pais));			
		}
		return mapping.findForward("teste");
	};

}
