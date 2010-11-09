package br.com.db4.buskaza.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import br.com.db4.buskaza.controller.exception.ValidacaoFormException;
import br.com.db4.buskaza.controller.form.ImovelForm;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.equipamento.ejb.EquipamentoBeanLocal;
import br.com.db4.buskaza.model.estado.ejb.EstadoBeanLocal;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.pais.ejb.PaisBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class ImovelAction extends DispatchAction {

	public ActionForward formIncluirImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		
		carregaListas(request);		
		return mapping.findForward(Constants.FORWARD_ENTRADA);
	}
	
	public ActionForward incluirImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		try {
			
			ImovelForm imovelForm = (ImovelForm)form;			
			Imovel imovel = popularImovel(imovelForm);			
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			
			imovelEjb.incluirImovel(imovel);
			
		} catch (Exception e) {
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirImovel(mapping, form, request, response);
		}
		
		return mapping.findForward(Constants.FORWARD_SAIDA);
	}
	
	private void carregaListas(HttpServletRequest request) {

		try {
						
			EquipamentoBeanLocal equipamentoEjb = (EquipamentoBeanLocal) ServiceLocator.getInstance().locateEJB(EquipamentoBeanLocal.LOCAL);
			EstadoBeanLocal estadoEjb = (EstadoBeanLocal) ServiceLocator.getInstance().locateEJB(EstadoBeanLocal.LOCAL);
			PaisBeanLocal paisEjb = (PaisBeanLocal) ServiceLocator.getInstance().locateEJB(PaisBeanLocal.LOCAL);		
			
			request.setAttribute("equipamentos", equipamentoEjb.listarEquipamentos());
			request.setAttribute("estados", estadoEjb.listarEstados());			
			request.setAttribute("paises", paisEjb.listarPaises());	
		
		} catch (Exception e) {
			
		}
		
	}
	
	private Imovel popularImovel(ImovelForm form) throws ValidacaoFormException {
		
		Imovel imovel = form.getImovelEntity();	
		
		return imovel;
	}
}
