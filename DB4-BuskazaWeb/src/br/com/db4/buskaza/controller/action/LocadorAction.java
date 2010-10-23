package br.com.db4.buskaza.controller.action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import br.com.db4.buskaza.controller.exception.PessoaExistenteException;
import br.com.db4.buskaza.controller.exception.ValidacaoFormException;
import br.com.db4.buskaza.controller.form.LocadorForm;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.banco.ejb.BancoBeanLocal;
import br.com.db4.buskaza.model.entity.Locador;
import br.com.db4.buskaza.model.entity.Telefone;
import br.com.db4.buskaza.model.estado.ejb.EstadoBeanLocal;
import br.com.db4.buskaza.model.locador.ejb.LocadorBeanLocal;
import br.com.db4.buskaza.model.pais.ejb.PaisBeanLocal;
import br.com.db4.buskaza.model.usuario.ejb.UsuarioBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class LocadorAction extends DispatchAction {
	
	public ActionForward formIncluirLocador(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		carregaListas(request);
		return mapping.findForward(Constants.FORWARD_ENTRADA);
	}
		
	public ActionForward incluirLocador(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
					
		try {
			LocadorForm locadorForm = (LocadorForm) form;
			
			Locador locador = popularLocador(locadorForm);	
			
			if (locadorForm.getSenhaConfirma() == null || (!locadorForm.getSenhaConfirma().equalsIgnoreCase(locador.getSenha()))) {
				throw new ValidacaoFormException("message.erro.validacao.senha");
				
			}
			
			UsuarioBeanLocal usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
			LocadorBeanLocal locadorEjb = (LocadorBeanLocal) ServiceLocator.getInstance().locateEJB(LocadorBeanLocal.LOCAL);
			
			if(locadorEjb.existeCNPJCPF(locador.getCpfCnpj())){
				throw new PessoaExistenteException(Constants.MENSAGEM_ERRO_CPFCNPJ_EXISTENTE);
			}
			
			if(usuarioEjb.existeLogin(locador.getEmail())){
				throw new PessoaExistenteException(Constants.MENSAGEM_ERRO_EMAIL_EXISTENTE);
			}
			
			locadorEjb.incluirLocador(locador);				
			
		} catch ( final PessoaExistenteException e ) {
		
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirLocador(mapping, form, request, response);
		  
		} catch ( final ValidacaoFormException e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirLocador(mapping, form, request, response);
		   
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirLocador(mapping, form, request, response);
		 
		
		}	
		
//		
//		String idioma= request.getParameter("idioma");
//		String pais= request.getParameter("pais");
//		
//		if(idioma!= null && pais!= null){
//			setLocale(request, new Locale(idioma, pais));			
//		}
		return mapping.findForward(Constants.FORWARD_SAIDA);
	};

	
	private void carregaListas(HttpServletRequest request) {

		try {
			
		
			BancoBeanLocal bancoEjb = (BancoBeanLocal) ServiceLocator.getInstance().locateEJB(BancoBeanLocal.LOCAL);
			EstadoBeanLocal estadoEjb = (EstadoBeanLocal) ServiceLocator.getInstance().locateEJB(EstadoBeanLocal.LOCAL);
			PaisBeanLocal paisEjb = (PaisBeanLocal) ServiceLocator.getInstance().locateEJB(PaisBeanLocal.LOCAL);		
			
			request.setAttribute("bancos", bancoEjb.listarBancos());
			request.setAttribute("estados", estadoEjb.listarEstados());			
			request.setAttribute("paises", paisEjb.listarPaises());	
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	private Locador popularLocador(LocadorForm form) throws ValidacaoFormException {
		
		Locador locador = form.getLocadorEntity();	
		
		Collection<Telefone> telefones = new ArrayList<Telefone>();
		
		Telefone telefoneFixo = new Telefone();
		telefoneFixo.setDdd(form.getDddFixo());
		telefoneFixo.setNumero(form.getNumeroFixo());
		telefoneFixo.setTipoTelefone('F');
		
		Telefone telefoneCell = new Telefone();
		telefoneCell.setDdd(form.getDddCelular());
		telefoneCell.setNumero(form.getNumeroCelular());
		telefoneCell.setTipoTelefone('C');
		
		telefones.add(telefoneFixo);
		telefones.add(telefoneCell);
		
		locador.setTelefones(telefones);
		
		locador.getEndereco().setCep(Integer.parseInt(form.getCep()));	
		
		if (form.getEmailConfirma() == null || (!form.getEmailConfirma().equalsIgnoreCase(locador.getEmail()))) {
			throw new ValidacaoFormException("message.erro.validacao.email");
			
		}		
		
		return locador;
	}
}
