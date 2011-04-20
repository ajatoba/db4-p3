package br.com.db4.buskaza.controller.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.MessageResources;

import br.com.db4.buskaza.controller.exception.PessoaExistenteException;
import br.com.db4.buskaza.controller.exception.ValidacaoFormException;
import br.com.db4.buskaza.controller.form.UsuarioForm;
import br.com.db4.buskaza.controller.util.*;
import br.com.db4.buskaza.model.banco.ejb.BancoBeanLocal;
import br.com.db4.buskaza.model.entity.Perfil;
import br.com.db4.buskaza.model.entity.Pessoa;
import br.com.db4.buskaza.model.entity.Telefone;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.estado.ejb.EstadoBeanLocal;
import br.com.db4.buskaza.model.pais.ejb.PaisBeanLocal;
import br.com.db4.buskaza.model.usuario.ejb.UsuarioBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class UsuarioAction extends DispatchAction {
	
	public ActionForward formIncluirUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		carregaListas(request);
		return mapping.findForward(Constants.FORWARD_ENTRADA);
	}
		
	public ActionForward incluirUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		try {
			UsuarioForm locadorForm = (UsuarioForm) form;
			
			Usuario usuario = popularUsuario(locadorForm);	
			
			//perfil de usuario
			Perfil p = new Perfil();
			p.setCodigo(2);
			Set<Perfil> perfis = new HashSet<Perfil>();
			perfis.add(p);			
			usuario.setPerfis(perfis);
			
			//AO ACABAR DE SE CADASTRAR, O USUÁRIO AINDA ESTÁ INATIVO, AGUARDANDO CONFIRMAÇÃO POR E-MAIL
			usuario.setConfirmado(false);
			//**************************
			
			usuario.setDataCadastro(new Date());
			
			if (locadorForm.getSenhaConfirma() == null || (!locadorForm.getSenhaConfirma().equalsIgnoreCase(usuario.getSenha()))) {
				throw new ValidacaoFormException("message.erro.validacao.senha");
				
			}
			
			UsuarioBeanLocal usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
			
			
			if(usuarioEjb.existeCNPJCPF(usuario.getCpfCnpj())){
				throw new PessoaExistenteException(Constants.MENSAGEM_ERRO_CPFCNPJ_EXISTENTE);
			}
			
			if(usuarioEjb.existeLogin(usuario.getEmail())){
				throw new PessoaExistenteException(Constants.MENSAGEM_ERRO_EMAIL_EXISTENTE);
			}
			
			//ENVIANDO EMAIL DE CONFIRMAÇÃO
			MessageResources messageResources = getResources(request, "app");
			
			String assunto="",mensagem="",remetente="",destinatario="";			
			
			mensagem  		= messageResources.getMessage("mail.mensagem");
			mensagem 		= mensagem.replaceAll("<USUARIO>", usuario.getNome());
			mensagem 		= mensagem.replaceAll("<EMAIL>", usuario.getEmail());
			   
			assunto 		= messageResources.getMessage("mail.assunto");			
			remetente 		= messageResources.getMessage("mail.from");
			destinatario 	= usuario.getEmail();			
			   
			SendMail sm = new SendMail();

			sm.sendMail(remetente,destinatario,assunto,mensagem); 
			//*****************************
			
			
			usuarioEjb.incluirUsuario(usuario);				
			
		} catch ( final PessoaExistenteException e ) {
		
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);
		  
		} catch ( final ValidacaoFormException e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);
		   
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);
		 
		
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

	public ActionForward confirmaUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		String email = request.getParameter("email");
		
		UsuarioBeanLocal usuarioEjb = null;
		
		try {
			usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
			usuarioEjb.confirmaUsuario(email);
		} catch (Exception e) {
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    e.printStackTrace();
		    return mapping.findForward(Constants.FORWARD_CONFIRMA_USUARIO);
		}
		
		
		return mapping.findForward(Constants.FORWARD_CONFIRMA_USUARIO);
	}
	
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
	
	
	
	private Usuario popularUsuario(UsuarioForm form) throws ValidacaoFormException {
		
		Usuario usuario = form.getUsuarioEntity();	
		
		Set<Telefone> telefones = new HashSet<Telefone>();
		
		Telefone telefoneFixo = new Telefone();
		telefoneFixo.setPessoa(usuario);
		telefoneFixo.setDdd(form.getDddFixo());
		telefoneFixo.setNumero(form.getNumeroFixo());
		telefoneFixo.setTipoTelefone('F');
		
		Telefone telefoneCell = new Telefone();
		telefoneCell.setPessoa(usuario);
		telefoneCell.setDdd(form.getDddCelular());
		telefoneCell.setNumero(form.getNumeroCelular());
		telefoneCell.setTipoTelefone('C');
		
		telefones.add(telefoneFixo);
		telefones.add(telefoneCell);
		
		usuario.setTelefones(telefones);
		
		Calendar c = Calendar.getInstance();
		c.set(Integer.parseInt(form.getAnoNascimento()),Integer.parseInt( form.getMesNascimento()), Integer.parseInt(form.getDiaNascimento()));
		
		usuario.setNascimento(c.getTime());
		
		usuario.getEndereco().setCep(Integer.parseInt(form.getCep()));	
		
		if (form.getEmailConfirma() == null || (!form.getEmailConfirma().equalsIgnoreCase(usuario.getEmail()))) {
			throw new ValidacaoFormException("message.erro.validacao.email");
			
		}		
				
		return usuario;
	}
	
	public ActionForward autenticarUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		try{
			UsuarioForm usuarioForm = (UsuarioForm) form;	
			
			UsuarioBeanLocal usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
			Usuario usuario = usuarioEjb.autenticarUsuario(usuarioForm.getUsuarioEntity().getEmail(), usuarioForm.getUsuarioEntity().getSenha(),Constants.tipoPerfilUsuario);
			
			MessageResources messageResources = getResources(request, "app");
			
			if(usuario != null && usuario.getCodigo() >0){			
				
				if(usuario.isConfirmado()){
				
					request.getSession().setAttribute(Constants.USUARIO_SESSAO, usuario);			
				}else {
					request.setAttribute(Constants.ERRO_PARAMETER, messageResources.getMessage("message.erro.nao.ativo"));
					return mapping.findForward(Constants.LOGIN_USUARIO);
				}
				
				if (request.getSession().getAttribute("reserva") != null) {
					return new ActionForward("/usuario/reserva.do?act=formReservas");
				}
				
				return new ActionForward("/usuario/imovel.do?act=listarImoveis");
			}else{				
			    request.setAttribute(Constants.ERRO_PARAMETER, messageResources.getMessage("message.erro.login.invalido"));
				return mapping.findForward(Constants.LOGIN_USUARIO);				
			}
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);		
		}	
	}
	
	public ActionForward autenticarAdministrador(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		try{
			UsuarioForm usuarioForm = (UsuarioForm) form;	
			
			UsuarioBeanLocal usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
			Usuario usuario = usuarioEjb.autenticarUsuario(usuarioForm.getUsuarioEntity().getEmail(), usuarioForm.getUsuarioEntity().getSenha(), Constants.tipoPerfilAdministrador);
			if(usuario != null && usuario.getCodigo() >0){	
				request.getSession().setAttribute(Constants.ADMIN_SESSAO, usuario);				
				return mapping.findForward(Constants.HOME_ADMIN);
			}else{
				final ActionMessages actionErrors = new ActionMessages();
			    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( "message.erro.login.invalido"));
			    saveErrors( request, actionErrors );
				return mapping.findForward(Constants.LOGIN_ADMIN);
			}
		
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);		
		}	
	}
	
	public ActionForward logofAdministrador(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		try{
			
			request.getSession().removeAttribute(Constants.ADMIN_SESSAO);	
			
			return mapping.findForward("");
		
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);		
		}
	
	}
	
	public ActionForward logofUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		try{
			
			request.getSession().removeAttribute(Constants.USUARIO_SESSAO);	
			
			return mapping.findForward(Constants.LOGIN_USUARIO);
		
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);		
		}
	
	}
	
	public ActionForward listarTodosUsuarios(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		try{
			
			String ordenacao = request.getParameter("ordenacao");
			
			UsuarioBeanLocal usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
			List<Usuario> pessoas = usuarioEjb.listarTodosUsuarios(ordenacao);
			
			if(pessoas != null && pessoas.size() >0){			
				request.getSession().setAttribute(Constants.LISTA_PESSOAS, pessoas);				
			}else{
				final ActionMessages actionErrors = new ActionMessages();
			    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( "message.sem.pessoas"));
			    saveErrors( request, actionErrors );								
			}
		} catch ( final Exception e ) {
			
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirUsuario(mapping, form, request, response);		
		}	
		
		return mapping.findForward(Constants.ADMIN_LISTAGEM_PESSOAS);
	}
}
