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
import br.com.db4.buskaza.model.entity.Reserva;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.reserva.ejb.ReservaBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class ReservaAction extends DispatchAction {
	
public ActionForward listarReservas(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		List<Reserva> reservas = null;
		
		try {					
			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(ReservaBeanLocal.LOCAL);			
			
			Usuario usuario = (Usuario)request.getSession().getAttribute(Constants.USUARIO_SESSAO);
			reservas = reservaEjb.listarReservas(usuario.getCodigo());
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return null;
		    
		}
			
		if(reservas != null && !reservas.isEmpty()){
			request.setAttribute("reservas", reservas);	
		}
		
		return mapping.findForward(Constants.FORWARD_SAIDA_RESERVA_PROPRIETARIO);
	}

}
