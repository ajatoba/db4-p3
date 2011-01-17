package br.com.db4.buskaza.controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.anuncio.ejb.AnuncioBeanLocal;
import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class AnuncioAction extends DispatchAction {
	
public ActionForward listarAnuncios(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		List<Anuncio> anuncios = null;
		
		try {					
			AnuncioBeanLocal anuncioEjb = (AnuncioBeanLocal) ServiceLocator.getInstance().locateEJB(AnuncioBeanLocal.LOCAL);			
			
			Usuario usuario = (Usuario)request.getSession().getAttribute(Constants.USUARIO_SESSAO);
			anuncios = anuncioEjb.listarAnuncios(usuario.getCodigo());
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return null;
		    
		}
		
		request.setAttribute("anuncios", anuncios);		
		if(anuncios == null || anuncios.isEmpty()){
			return mapping.findForward(Constants.FORWARD_SAIDA_IMOVEIS_PROPRIETARIO_VAZIO);
		}
		
		return mapping.findForward(Constants.FORWARD_SAIDA_IMOVEIS_PROPRIETARIO);
	}

}
