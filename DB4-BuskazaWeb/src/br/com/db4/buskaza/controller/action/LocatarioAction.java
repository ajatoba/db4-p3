package br.com.db4.buskaza.controller.action;

import java.util.ArrayList;
import java.util.Calendar;
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
import br.com.db4.buskaza.controller.form.LocatarioForm;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.banco.ejb.BancoBeanLocal;
import br.com.db4.buskaza.model.entity.Locatario;
import br.com.db4.buskaza.model.entity.Telefone;
import br.com.db4.buskaza.model.estado.ejb.EstadoBeanLocal;
import br.com.db4.buskaza.model.locatario.ejb.LocatarioBeanLocal;
import br.com.db4.buskaza.model.pais.ejb.PaisBeanLocal;
import br.com.db4.buskaza.model.usuario.ejb.UsuarioBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class LocatarioAction extends DispatchAction {
	
	public ActionForward formIncluirLocatario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		carregaListas(request);
		return mapping.findForward(Constants.FORWARD_ENTRADA);
	}
		
	public ActionForward incluirLocatario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
					
		try {
			LocatarioForm locatarioForm = (LocatarioForm) form;
			
			Locatario locatario = popularLocatario(locatarioForm);	
			
			if (locatarioForm.getSenhaConfirma() == null || (!locatarioForm.getSenhaConfirma().equalsIgnoreCase(locatario.getSenha()))) {
				throw new ValidacaoFormException("message.erro.validacao.senha");
				
			}
			
			UsuarioBeanLocal usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
			LocatarioBeanLocal locatarioEjb = (LocatarioBeanLocal) ServiceLocator.getInstance().locateEJB(LocatarioBeanLocal.LOCAL);
			
			
			if(usuarioEjb.existeLogin(locatario.getEmail())){
				throw new PessoaExistenteException(Constants.MENSAGEM_ERRO_EMAIL_EXISTENTE);
			}
			
			locatarioEjb.incluirLocatario(locatario);				
			
		} catch ( final PessoaExistenteException e ) {
		
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirLocatario(mapping, form, request, response);
		  
		} catch ( final ValidacaoFormException e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirLocatario(mapping, form, request, response);
		   
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirLocatario(mapping, form, request, response);
		 
		
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
	
	
	private Locatario popularLocatario(LocatarioForm form) throws ValidacaoFormException {
		
		Locatario locatario = form.getLocatarioEntity();	
		
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
		
		locatario.setTelefones(telefones);
		
		Calendar c = Calendar.getInstance();
		c.set(Integer.parseInt(form.getAnoNascimento()),Integer.parseInt( form.getMesNascimento()), Integer.parseInt(form.getDiaNascimento()));
		
		locatario.setNascimento(c.getTime());
		
		locatario.getEndereco().setCep(Integer.parseInt(form.getCep()));	
		
		if (form.getEmailConfirma() == null || (!form.getEmailConfirma().equalsIgnoreCase(locatario.getEmail()))) {
			throw new ValidacaoFormException("message.erro.validacao.email");
			
		}		
		
		return locatario;
	}
}
