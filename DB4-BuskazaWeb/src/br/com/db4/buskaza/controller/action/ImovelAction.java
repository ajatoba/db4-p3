package br.com.db4.buskaza.controller.action;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;
import org.apache.struts.util.MessageResources;

import br.com.db4.buskaza.controller.exception.ValidacaoFormException;
import br.com.db4.buskaza.controller.form.ImovelForm;
import br.com.db4.buskaza.controller.helper.ImageHelper;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.controller.util.SendMail;
import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Foto;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Pais;
import br.com.db4.buskaza.model.entity.TipoImovel;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.equipamento.ejb.EquipamentoBeanLocal;
import br.com.db4.buskaza.model.estado.ejb.EstadoBeanLocal;
import br.com.db4.buskaza.model.idioma.ejb.IdiomaBeanLocal;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.pais.ejb.PaisBeanLocal;
import br.com.db4.buskaza.model.tipoImovel.ejb.TipoImovelBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class ImovelAction extends DispatchAction {

	public ActionForward formIncluirImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		
		carregaListas(request);	
		return mapping.findForward(Constants.FORWARD_ENTRADA);
	}
	
	public ActionForward formAprovarImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		
		String codigoImovel = request.getParameter("ci");
		try {
			if(codigoImovel!= null)
			{
				ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
				Imovel imovel = imovelEjb.getImovel(Integer.valueOf(codigoImovel));
				ImovelForm imovelForm = (ImovelForm)form;	
				
				imovelForm.setImovelEntity(imovel);
				
				request.setAttribute("imovel", imovel);
			}
			
			return mapping.findForward(Constants.ADMIN_FORM_APROVAR_IMOVEL);
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return null;
		}
	}
	
	public ActionForward formBuscarImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		
		carregaListas(request);		
		return mapping.findForward(Constants.FORWARD_ENTRADA_BUSCA_AVANCADA_IMOVEIS);
	}
	
	public ActionForward incluirImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		try {
			Usuario usuario = (Usuario)request.getSession().getAttribute(Constants.USUARIO_SESSAO);
			
			ImovelForm imovelForm = (ImovelForm)form;			
			
			Imovel imovel = popularImovel(imovelForm, usuario);		
			
			imovel.setDataCadastro(new Date());
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			
			imovelEjb.incluirImovel(imovel);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirImovel(mapping, form, request, response);
		}
		
		return mapping.findForward(Constants.FORWARD_SAIDA);
	}
	
	public ActionForward buscarImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		List<Imovel> imoveis = null;
		
		try {
				
			ImovelForm imovelForm = (ImovelForm)form;			
			
			Imovel imovel = popularImovel(imovelForm,null);			
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			
			imoveis = imovelEjb.buscarImovel(imovel, imovelForm.getPais());
			
			carregaListas(request);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formBuscarImovel(mapping, form, request, response);
		    
		}
		
		request.setAttribute("imoveis", imoveis);
		request.setAttribute("resultado", (imoveis == null)?0:imoveis.size());
		
		return mapping.findForward(Constants.FORWARD_SAIDA_BUSCA_AVANCADA_IMOVEIS);
	}
	

	
	private void carregaListas(HttpServletRequest request) {

		try {
						
			EquipamentoBeanLocal equipamentoEjb = (EquipamentoBeanLocal) ServiceLocator.getInstance().locateEJB(EquipamentoBeanLocal.LOCAL);
			EstadoBeanLocal estadoEjb = (EstadoBeanLocal) ServiceLocator.getInstance().locateEJB(EstadoBeanLocal.LOCAL);
			PaisBeanLocal paisEjb = (PaisBeanLocal) ServiceLocator.getInstance().locateEJB(PaisBeanLocal.LOCAL);		
			TipoImovelBeanLocal tipoImovelEjb = (TipoImovelBeanLocal) ServiceLocator.getInstance().locateEJB(TipoImovelBeanLocal.LOCAL);
			IdiomaBeanLocal idiomaEjb = (IdiomaBeanLocal) ServiceLocator.getInstance().locateEJB(IdiomaBeanLocal.LOCAL);
			
			
			request.setAttribute("equipamentos", equipamentoEjb.listarEquipamentos());
			request.setAttribute("estados", estadoEjb.listarEstados());			
			request.setAttribute("paises", paisEjb.listarPaises());	
			request.setAttribute("tiposImovel", tipoImovelEjb.listarTiposImovel());
			request.setAttribute("idiomas", idiomaEjb.listarIdiomas());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private Imovel popularImovel(ImovelForm form, Usuario usuario) throws ValidacaoFormException, FileNotFoundException, IOException {
		
		Imovel imovel = form.getImovelEntity();	
		
		if(imovel == null){
			System.out.println("IMOVEL ENTITY NULO");
		}else{
			System.out.println("BAIRRO:"+imovel.getBairro());
		}
		
		Date checkInEntrada=null, checkInSaida=null, checkOutEntrada=null,checkOutSaida=null,lateCheckOut=null;
		Collection<Equipamento> equipamentos = null;
		Equipamento equipamento = null;
		
		Integer[] equipamentosBoxes = form.getEquipamentos();
		
		if(equipamentosBoxes != null && equipamentosBoxes.length >0){
			equipamentos = new ArrayList<Equipamento>();
			for (int x=0; x < equipamentosBoxes.length; x++){
				
				equipamento = new Equipamento();
				equipamento.setCodigo(equipamentosBoxes[0].intValue());
				
				equipamentos.add(equipamento);
			}			
		}
		
		if(form.getCheckInEntradaHora() != null && form.getCheckInEntradaMinuto()!= null)		
			checkInEntrada = new Date(0,0,0,form.getCheckInEntradaHora().intValue(), form.getCheckInEntradaMinuto().intValue());
		
		if(form.getCheckInSaidaHora() != null && form.getCheckInSaidaMinuto() != null)
			checkInSaida = new Date(0,0,0,form.getCheckInSaidaHora().intValue(), form.getCheckInSaidaMinuto().intValue());
		
		if (form.getCheckOutEntradaHora() != null && form.getCheckOutEntradaMinuto()!=null)
			checkOutEntrada = new Date(0,0,0,form.getCheckOutEntradaHora().intValue(), form.getCheckOutEntradaMinuto().intValue());
		
		if(form.getCheckOutSaidaHora()!=null && form.getCheckOutSaidaMinuto()!=null)
			checkOutSaida = new Date(0,0,0,form.getCheckOutSaidaHora().intValue(), form.getCheckOutSaidaMinuto().intValue());
		
		if(form.getLateCheckOutHora()!=null && form.getLateCheckOutMinuto()!=null)
			lateCheckOut = new Date(0,0,0,form.getLateCheckOutHora().intValue(), form.getLateCheckOutMinuto().intValue());
		
		imovel.setEquipamentos(equipamentos);
		imovel.setCheckInEntrada(checkInEntrada);
		imovel.setCheckInSaida(checkInSaida);
		imovel.setCheckOutEntrada(checkOutEntrada);
		imovel.setCheckOutSaida(checkOutSaida);
		imovel.setLateCheckOut(lateCheckOut);
		
		//Setando demais atributos do form
		imovel.setCalcao(form.getCalcao());
		
		if (form.getCamas() != null )
			imovel.setCamas(form.getCamas());
		
		if(form.getCapacidade() != null)
			imovel.setCapacidade(form.getCapacidade());
		
		if(form.getComplemento()!= null )
			imovel.setComplemento(form.getComplemento());
		
		if(form.getBairro()!= null )
			imovel.setBairro(form.getBairro());
		
		try {
			if(form.getNumero()!= null )
				imovel.setNumero(Integer.parseInt(form.getNumero()));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		if(form.getCondicoes()!= null )
			imovel.setCondicoes(form.getCondicoes());
		
		if(form.getDiarista() >0  )
			imovel.setDiarista(form.getDiarista());
		
		if(form.getDistanciaCentro() > 0 )
			imovel.setDistanciaCentro(form.getDistanciaCentro());
		
		if(form.getEnergia() > 0 )
			imovel.setEnergia(form.getEnergia());
		
				
		if(form.getInternet()> 0 )
			imovel.setInternet(form.getInternet());
		
		if(form.getLinkGoogleMaps()!= null ){
			imovel.setLinkGoogleMaps(form.getLinkGoogleMaps());
		}
		
		if(form.getLogradouro()!= null )
			imovel.setLogradouro(form.getLogradouro());
		
		if(form.getMetragem() > 0 )
			imovel.setMetragem(form.getMetragem());
		
		if(form.getMunicipio()!= null )
			imovel.setMunicipio(form.getMunicipio());
		
		if(form.getNomeCheckIn()!= null )
			imovel.setNomeCheckIn(form.getNomeCheckIn());
		
		if(form.getOutraTaxaExtra()!= null )
			imovel.setOutro(form.getOutraTaxaExtra());
		
		if(form.getQuartos()!= null )
			imovel.setQuartos(form.getQuartos());
		
		if(form.getRecepcionista()!= null )
			imovel.setRecepcionista(form.getRecepcionista());
		
		if(form.getTelefone()!= null )
			imovel.setTelefone(form.getTelefone());
		
		if(form.getTelefone2()!= null )
			imovel.setTelefone2(form.getTelefone2());
		
		if(form.isTransportePublico() )
			imovel.setTransportePublico(form.isTransportePublico());
		
		
		if(form.getTipoImovel() != null){
			TipoImovel ti = new TipoImovel();
			ti.setCodigo(form.getTipoImovel());
			imovel.setTipoImovel(ti);
		}
		
		if(form.getPais() != null){
			Pais p = new Pais();
			p.setCodigo(form.getPais());
			imovel.setPais(p);
		}
		
		if(form.getCep() != null)
			imovel.setCep(form.getCep());
		
		if (form.getLinkYouTube() != null)
			imovel.setLinkYouTube(form.getLinkYouTube());
		
		if (usuario !=null)
			imovel.setUsuarioProprietario(usuario);
		
		Collection<Foto> fotosImovel = new ArrayList<Foto>();
		Collection<FormFile> fotos = form.getFotos();
		for (FormFile formFile : fotos) {
			if (formFile.getFileData()!= null && formFile.getFileData().length > 0){
				fotosImovel.add(ImageHelper.gerarArquivo(formFile));
			}
		}
		
		if(fotosImovel!= null && fotosImovel.size() > 0){
			imovel.setFotos(fotosImovel);
		}
		
		if(form.getPlanta()!= null && form.getPlanta().getFileData()!= null && form.getPlanta().getFileData().length > 0){
			imovel.setPlanta(ImageHelper.gerarPlanta(form.getPlanta()));
		}
		
		
		return imovel;
	}
	
	public ActionForward listarImoveis(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		List<Imovel> imoveis = null;
		
		try {				
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);			
			
			Usuario usuario = (Usuario)request.getSession().getAttribute(Constants.USUARIO_SESSAO);
			imoveis = imovelEjb.listarImoveis(usuario.getCodigo());
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formBuscarImovel(mapping, form, request, response);
		    
		}
		
		request.setAttribute("imoveis", imoveis);		
		
		return mapping.findForward(Constants.FORWARD_SAIDA_IMOVEIS_PROPRIETARIO);
	}
	
	public ActionForward listarImoveisPorStatus(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		List<Imovel> imoveis = null;
		int status = 0;
		
		status = Integer.parseInt(request.getParameter("statusImovel"));
		try {				
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);			
			
			imoveis = imovelEjb.listarImoveisPorStatus(status);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formBuscarImovel(mapping, form, request, response);
		    
		}
		
		request.setAttribute("imoveis", imoveis);		
		
		return mapping.findForward(Constants.ADMIN_LISTAGEM_IMOVEIS);
	}
	
	public ActionForward formIncluirImovelComp(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response){
		
		String codigoImovel = request.getParameter("ci");
		try {
			if(codigoImovel!= null)
			{
				carregaListas(request);	
				ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
				Imovel imovel = imovelEjb.getImovel(Integer.valueOf(codigoImovel));
				ImovelForm imovelForm = (ImovelForm)form;	
				
				imovelForm.setImovelEntity(imovel);
				
				request.setAttribute("imovel", imovel);
			}
			
			return mapping.findForward(Constants.FORWARD_ENTRADA_COMPLEMENTO_IMOVEL);
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return null;
		}
		
	}
	
	public ActionForward alterarImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response){
		try {
			Usuario usuario = (Usuario)request.getSession().getAttribute(Constants.USUARIO_SESSAO);
			
			ImovelForm imovelForm = (ImovelForm)form;		
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			imovelForm.setImovelEntity(imovelEjb.getImovel(imovelForm.getImovelEntity().getCodigo()));
			
			Imovel imovel = popularDadosComplementoImovel(imovelForm, usuario);			
			
			imovel.setStatus(2);//2 - Completo
			imovelEjb.alterarImovel(imovel);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formIncluirImovel(mapping, form, request, response);
		}
		
		return new ActionForward("/usuario/imovel.do?act=listarImoveis");
		//return mapping.findForward(Constants.FORWARD_SAIDA_IMOVEIS_PROPRIETARIO);
	}
	
	public ActionForward aprovarImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response){
		try {
			ImovelForm imovelForm = (ImovelForm)form;		
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			imovelForm.setImovelEntity(imovelEjb.getImovel(imovelForm.getImovelEntity().getCodigo()));
			
			Imovel imovel = popularImovel(imovelForm, null);			
			
			imovel.setStatus(1);//1 - APROVADO PELO ADMIN
			imovelEjb.alterarImovel(imovel);
			
			//ENVIANDO COMUNICADO DE APROVA��O AO PROPRIET�RIO
			MessageResources messageResources = getResources(request, "app");
			
			String assunto="",mensagem="",remetente="",destinatario="";			
			
			mensagem  		= messageResources.getMessage("aprovacao.mensagem");
			mensagem 		= mensagem.replaceAll("<USUARIO>", imovel.getUsuarioProprietario().getNome());
			mensagem 		= mensagem.replaceAll("<CODIGO_IMOVEL>", String.valueOf(imovel.getCodigo()));
			   
			assunto 		= messageResources.getMessage("aprovacao.assunto");			
			remetente 		= messageResources.getMessage("mail.from");
			destinatario 	= imovel.getUsuarioProprietario().getEmail();			
			   
			SendMail sm = new SendMail();

			sm.sendMail(remetente,destinatario,assunto,mensagem); 

			
			//************************************************
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    
		}
		
		return mapping.findForward(Constants.ADMIN_IMOVEL_OUT);
	}
	
	public ActionForward excluirImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response){
		//NA VERDADE, N�O EXCLUI. SOMENTE SETA O STATUS PRA -1
		
		try {
			ImovelForm imovelForm = (ImovelForm)form;		
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			imovelForm.setImovelEntity(imovelEjb.getImovel(imovelForm.getImovelEntity().getCodigo()));
			
			Imovel imovel = popularImovel(imovelForm, null);			
			
			imovel.setStatus(-1);//-1 - EXCLUIR
			imovelEjb.alterarImovel(imovel);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    
		}
		
		return new ActionForward("/usuario/imovel.do?act=listarImoveis");
	}

	
	private Imovel popularDadosComplementoImovel(ImovelForm form,
			Usuario usuario) {
		
		Imovel imovel = form.getImovelEntity();	
		
		Date checkInEntrada=null, checkInSaida=null, checkOutEntrada=null,checkOutSaida=null,lateCheckOut=null;
		Collection<Equipamento> equipamentos = null;
		
		
		if(form.getCheckInEntradaHora() != null && form.getCheckInEntradaMinuto()!= null)		
			checkInEntrada = new Date(0,0,0,form.getCheckInEntradaHora().intValue(), form.getCheckInEntradaMinuto().intValue());
		
		if(form.getCheckInSaidaHora() != null && form.getCheckInSaidaMinuto() != null)
			checkInSaida = new Date(0,0,0,form.getCheckInSaidaHora().intValue(), form.getCheckInSaidaMinuto().intValue());
		
		if (form.getCheckOutEntradaHora() != null && form.getCheckOutEntradaMinuto()!=null)
			checkOutEntrada = new Date(0,0,0,form.getCheckOutEntradaHora().intValue(), form.getCheckOutEntradaMinuto().intValue());
		
		if(form.getCheckOutSaidaHora()!=null && form.getCheckOutSaidaMinuto()!=null)
			checkOutSaida = new Date(0,0,0,form.getCheckOutSaidaHora().intValue(), form.getCheckOutSaidaMinuto().intValue());
		
		if(form.getLateCheckOutHora()!=null && form.getLateCheckOutMinuto()!=null)
			lateCheckOut = new Date(0,0,0,form.getLateCheckOutHora().intValue(), form.getLateCheckOutMinuto().intValue());
		
		
		imovel.setCheckInEntrada(checkInEntrada);
		imovel.setCheckInSaida(checkInSaida);
		imovel.setCheckOutEntrada(checkOutEntrada);
		imovel.setCheckOutSaida(checkOutSaida);
		imovel.setLateCheckOut(lateCheckOut);
		
		
		if (form.getCamas() != null )
			imovel.setCamas(form.getCamas());
		
		if(form.getCapacidade() != null)
			imovel.setCapacidade(form.getCapacidade());
		
		if(form.getDistanciaCentro() > 0 )
			imovel.setDistanciaCentro(form.getDistanciaCentro());
			
		if(form.getMetragem() > 0 )
			imovel.setMetragem(form.getMetragem());
				
		if(form.getNomeCheckIn()!= null )
			imovel.setNomeCheckIn(form.getNomeCheckIn());
		
		
		if(form.getQuartos()!= null )
			imovel.setQuartos(form.getQuartos());
		
		if(form.getRecepcionista()!= null )
			imovel.setRecepcionista(form.getRecepcionista());		
		
		if(form.getTelefone()!= null )
			imovel.setTelefone(form.getTelefone());
		
		if(form.getTelefone2()!= null )
			imovel.setTelefone2(form.getTelefone2());
		
		if(form.isTransportePublico() )
			imovel.setTransportePublico(form.isTransportePublico());
		
		if(form.getTipoImovel() != null){
			TipoImovel ti = new TipoImovel();
			ti.setCodigo(form.getTipoImovel());
			imovel.setTipoImovel(ti);
		}		
		
		return imovel;

	}
}
