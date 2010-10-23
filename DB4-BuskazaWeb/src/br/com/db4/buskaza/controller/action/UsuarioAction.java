package br.com.db4.buskaza.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import br.com.db4.buskaza.controller.exception.ValidacaoFormException;
import br.com.db4.buskaza.controller.form.UsuarioForm;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.entity.Usuario;

public class UsuarioAction extends DispatchAction {
	
	public ActionForward formIncluirUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		
		return new ActionForward("/locador.do?act=formIncluirLocador");
	}
		
	public ActionForward incluirUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
//		
//		String idioma= request.getParameter("idioma");
//		String pais= request.getParameter("pais");
//		
//		if(idioma!= null && pais!= null){
//			setLocale(request, new Locale(idioma, pais));			
//		}
		return mapping.findForward(Constants.FORWARD_SAIDA);
	};

	
	
	
	private Usuario popularUsuario(UsuarioForm form) throws ValidacaoFormException {
		
		Usuario usuario = form.getUsuarioEntity();	
		
		
		
		return usuario;
	}
}
