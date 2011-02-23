package br.com.db4.buskaza.controller.action;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.MessageResources;

import br.com.db4.buskaza.controller.exception.ValidacaoFormException;
import br.com.db4.buskaza.controller.form.AnuncioForm;
import br.com.db4.buskaza.controller.form.UsuarioForm;
import br.com.db4.buskaza.controller.util.Calendario;
import br.com.db4.buskaza.controller.util.CalendarioUtil;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.anuncio.ejb.AnuncioBeanLocal;
import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Telefone;
import br.com.db4.buskaza.model.entity.TipoAnuncio;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.tipoanuncio.ejb.TipoAnuncioBeanLocal;
import br.com.db4.buskaza.model.usuario.ejb.UsuarioBeanLocal;
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

	public ActionForward formCadastroAnuncio(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		try {
			carregaListas(request);
			
			String codigoImovel=request.getParameter("ci"), ano=request.getParameter("ano"), mes=request.getParameter("mes");
			int imovelId=0, anoCalendario=0, mesCalendario=0;
			
			if (codigoImovel != null && !codigoImovel.equals("")) {
				imovelId = Integer.parseInt(codigoImovel);
			}
			
			if (ano != null && !ano.equals("")) {
				anoCalendario = Integer.parseInt(ano);
			}else{
				anoCalendario = (new Date().getYear())+ 1900;
			}
			
			if (mes != null && !mes.equals("")) {
				mesCalendario = Integer.parseInt(mes);
			}else{
				mesCalendario = (new Date().getMonth())+ 1;
			}
			
			ImovelBeanLocal imovelEJB = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);			
			Imovel im = imovelEJB.getImovel(imovelId);
			
			AnuncioBeanLocal anuncioEJB = (AnuncioBeanLocal) ServiceLocator.getInstance().locateEJB(AnuncioBeanLocal.LOCAL);			
			List<Anuncio> anuncios = anuncioEJB.listarAnunciosImovel(im.getCodigo(), mesCalendario, anoCalendario);
			
			request.setAttribute("imovel", im );
			
			//CAREGANDO CALENDÁRIO DE ANÚNCIOS
			Map<String,Calendario> calendarioAnuncio = CalendarioUtil.getInstance().montaCalendarioAnuncio(mesCalendario, anoCalendario, anuncios);
			
			request.setAttribute("calendarioAnuncio", calendarioAnuncio );
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mapping.findForward(Constants.FORWARD_ANUNCIO_IN);
	}
	
	public ActionForward incluirAnuncio(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		String codigoImovel = request.getParameter("ci");
		
		Usuario usuario = (Usuario)request.getSession().getAttribute(Constants.USUARIO_SESSAO);
				
		try {
			AnuncioForm anuncioForm = (AnuncioForm) form;
			
			Anuncio anuncio = popularAnuncio(anuncioForm);	
			
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			
			Imovel imovel = imovelEjb.getImovel(Integer.parseInt(codigoImovel));
			
			anuncio.setImovel(imovel);
			
			if(!anuncio.isPermitirEntrada()){
				usuario.setAgencia(request.getParameter("agencia"));
				usuario.setContaCorrente(request.getParameter("conta"));
				usuario.setCodigoBanco(request.getParameter("codigoBanco"));
				usuario.setNomeTitularConta(request.getParameter("nomeTitularConta"));
				usuario.setCpfTitularConta(request.getParameter("cpfTitularConta"));
				
				UsuarioBeanLocal usuarioEjb = (UsuarioBeanLocal) ServiceLocator.getInstance().locateEJB(UsuarioBeanLocal.LOCAL);
				usuarioEjb.incluirUsuario(usuario);
			}else{
				imovel.setPermiteOpcaoPagamento(true);
				
				imovelEjb.alterarImovel(imovel);
				
			}
			
			AnuncioBeanLocal anuncioEjb = (AnuncioBeanLocal) ServiceLocator.getInstance().locateEJB(AnuncioBeanLocal.LOCAL);
			
						
			anuncioEjb.incluirAnuncio(anuncio);				
			
		} catch (Exception e ) {
			e.printStackTrace();
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formCadastroAnuncio(mapping, form, request, response);	
		}
		
		request.setAttribute(Constants.SUCESSO_PARAMETER,"Anúncio realizado com sucesso");
		request.setAttribute("ci",codigoImovel);
		//return mapping.findForward(Constants.FORWARD_ANUNCIO_IN);
		return formCadastroAnuncio(mapping, form, request, response);
		
	}
	
	public ActionForward excluirAnuncio(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		String codigoAnuncio = request.getParameter("idAnuncio");
		String codigoImovel = request.getParameter("ci");
				
		try {
			
			request.setAttribute("ci", codigoImovel);
			
			Anuncio anuncio = new Anuncio();
			AnuncioBeanLocal anuncioEjb = (AnuncioBeanLocal) ServiceLocator.getInstance().locateEJB(AnuncioBeanLocal.LOCAL);
			
			anuncio.setCodigo(Integer.parseInt(codigoAnuncio));
			anuncioEjb.excluirAnuncio(anuncio);				
			
		} catch (Exception e ) {
			e.printStackTrace();
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    
		    return formCadastroAnuncio(mapping, form, request, response);	
		}
		
		
		return formCadastroAnuncio(mapping, form, request, response);
		
	}
	
	private void carregaListas(HttpServletRequest request) throws NamingException{
		
		TipoAnuncioBeanLocal tipoAnuncioEJB = (TipoAnuncioBeanLocal) ServiceLocator.getInstance().locateEJB(TipoAnuncioBeanLocal.LOCAL);
		request.setAttribute("tiposAnuncio", tipoAnuncioEJB.listarTiposAnuncio());
		
		
	}
	
	public ActionForward listarAnunciosImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		List<Anuncio> anuncios = null;
		
		int codigoImovel = Integer.parseInt(request.getParameter("ci"));
		
		
		try {					
			AnuncioBeanLocal anuncioEjb = (AnuncioBeanLocal) ServiceLocator.getInstance().locateEJB(AnuncioBeanLocal.LOCAL);			
			
			anuncios = anuncioEjb.listarAnunciosImovel(codigoImovel, -1, -1);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return null;
		    
		}
		
		request.setAttribute("anuncios", anuncios);		
				
		return mapping.findForward(Constants.LISTAGEM_ANUNCIOS_IMOVEL);
	}


	private Anuncio popularAnuncio(AnuncioForm form) throws ValidacaoFormException {
		
		Anuncio anuncio= form.getAnuncioEntity();	
		
		//Setando data inicial do anúncio
		Date dataInicial = new Date(form.getAnoDataInicial()-1900, form.getMesDataInicial()-1,form.getDiaDataInicial());		
		anuncio.setDataInicial(dataInicial);
		
		//Setando data final do Anuncio
		Date dataFinal = new Date(form.getAnoDataFinal()-1900, form.getMesDataFinal()-1,form.getDiaDataFinal());		
		anuncio.setDataFinal(dataFinal);
		
		TipoAnuncio tipo = new TipoAnuncio();
		tipo.setCodigo(form.getTipoAnuncio());
		
		anuncio.setDataAnuncio(new Date());
		anuncio.setTipoAnuncio(tipo);
		
		anuncio.setTarifaDiaria(form.getTarifaDiaria());	
		anuncio.setTarifaSemanal(form.getTarifaSemanal());	
		anuncio.setTarifaMensal(form.getTarifaMensal());	
		anuncio.setTarifaQuinzenal(form.getTarifaQuinzenal());
		anuncio.setTarifaPacoteFechado(form.getTarifaPacoteFechado());
		
		if(form.isPermitirEntrada())
			anuncio.setPermitirEntrada(form.isPermitirEntrada());

				
		return anuncio;
	}

}
