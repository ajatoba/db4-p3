package br.com.db4.buskaza.controller.action;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import br.com.db4.buskaza.controller.form.ReservaForm;
import br.com.db4.buskaza.controller.helper.ImageHelper;
import br.com.db4.buskaza.controller.util.CalendarioUtil;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.controller.util.ReservaUtil;
import br.com.db4.buskaza.controller.util.SendMail;
import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Foto;
import br.com.db4.buskaza.model.entity.Idioma;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Pais;
import br.com.db4.buskaza.model.entity.Reserva;
import br.com.db4.buskaza.model.entity.TipoAnuncio;
import br.com.db4.buskaza.model.entity.TipoImovel;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.equipamento.ejb.EquipamentoBeanLocal;
import br.com.db4.buskaza.model.estado.ejb.EstadoBeanLocal;
import br.com.db4.buskaza.model.idioma.ejb.IdiomaBeanLocal;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.pais.ejb.PaisBeanLocal;
import br.com.db4.buskaza.model.tipoImovel.ejb.TipoImovelBeanLocal;
import br.com.db4.buskaza.model.tipoPagamento.ejb.TipoPagamentoBeanLocal;
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
		
		Map<Imovel, Double> imoveisValor = null;
		
		int qtdDias = 0;
		Reserva reserva = null;
		try {
				
			ImovelForm imovelForm = (ImovelForm)form;			
			
			Imovel imovel = popularImovel(imovelForm,null);			
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			
			
			 TipoAnuncio tipoAnuncio = new TipoAnuncio();
			 
			 if(imovelForm.getTiposAnuncio() !=null){
				 tipoAnuncio.setCodigo(imovelForm.getTiposAnuncio());
			 }else{
				 tipoAnuncio.setCodigo(1);
			 }
			
			
			 
			 //Buscando pela disponibilidade do anúncio
			
			Date dataInicio = new Date(imovelForm.getAnoDataInicialAnuncio()-1900, imovelForm.getMesDataInicialAnuncio()-1, imovelForm.getDiaDataInicialAnuncio());
			Date dataFim 	= new Date(imovelForm.getAnoDataFinalAnuncio()-1900, imovelForm.getMesDataFinalAnuncio()-1, imovelForm.getDiaDataFinalAnuncio());
			
			Anuncio anuncio = new Anuncio();
			anuncio.setDataInicial(dataInicio);
			anuncio.setDataFinal(dataFim);
			anuncio.setTipoAnuncio(tipoAnuncio);
			
			//********************************************
			reserva = new Reserva();
			reserva.setPeriodoInicial(dataInicio);
			reserva.setPeriodoFinal(dataFim);
			
			imoveis = imovelEjb.buscarImovel(imovel, imovelForm.getPais(), anuncio);
			
			Iterator<Imovel> it = imoveis.iterator();
	        
			imoveisValor = new LinkedHashMap<Imovel, Double>();
			
			qtdDias = (CalendarioUtil.getInstance().getDiasPeriodoMes(dataInicio, dataFim)).size();
			
			
			
	        while (it.hasNext()) {
				Imovel imovelPreco = (Imovel) it.next();
				
				imoveisValor.put(imovelPreco, new Double(ReservaUtil.getInstance().calculaPrecoReserva(imovelPreco.getAnuncios(), reserva)));
				
				//System.out.println("PREÇO DO ANÚNCIO:" + ReservaUtil.getInstance().calculaPrecoReserva(imovelPreco.getAnuncios(), reserva) );			
			}
	        
	        request.setAttribute("tipoBusca", anuncio.getTipoAnuncio());
	        
			carregaListas(request);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formBuscarImovel(mapping, form, request, response);
		    
		}
		
		
		request.setAttribute("periodoBuscado", reserva);
		request.setAttribute("qtdDias", qtdDias);
		request.setAttribute("imoveisValor", imoveisValor);
		
		//request.setAttribute("imoveis", imoveis);
		request.setAttribute("resultado", (imoveisValor == null)?0:imoveisValor.size());
		
		return mapping.findForward(Constants.FORWARD_SAIDA_BUSCA_AVANCADA_IMOVEIS);
	}
	

	
	private void carregaListas(HttpServletRequest request) {

		try {
						
			EquipamentoBeanLocal equipamentoEjb = (EquipamentoBeanLocal) ServiceLocator.getInstance().locateEJB(EquipamentoBeanLocal.LOCAL);
			EstadoBeanLocal estadoEjb = (EstadoBeanLocal) ServiceLocator.getInstance().locateEJB(EstadoBeanLocal.LOCAL);
			PaisBeanLocal paisEjb = (PaisBeanLocal) ServiceLocator.getInstance().locateEJB(PaisBeanLocal.LOCAL);		
			TipoImovelBeanLocal tipoImovelEjb = (TipoImovelBeanLocal) ServiceLocator.getInstance().locateEJB(TipoImovelBeanLocal.LOCAL);
			IdiomaBeanLocal idiomaEjb = (IdiomaBeanLocal) ServiceLocator.getInstance().locateEJB(IdiomaBeanLocal.LOCAL);
			TipoPagamentoBeanLocal tipoPagamentoEjb = (TipoPagamentoBeanLocal) ServiceLocator.getInstance().locateEJB(TipoPagamentoBeanLocal.LOCAL);
			
			
			request.setAttribute("equipamentos", equipamentoEjb.listarEquipamentos());
			request.setAttribute("estados", estadoEjb.listarEstados());			
			request.setAttribute("paises", paisEjb.listarPaises());	
			request.setAttribute("tiposImovel", tipoImovelEjb.listarTiposImovel());
			request.setAttribute("idiomas", idiomaEjb.listarIdiomas());
			request.setAttribute("tiposPagamento", tipoPagamentoEjb.listarTiposPagamento());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private Imovel popularImovel(ImovelForm form, Usuario usuario) throws ValidacaoFormException, FileNotFoundException, IOException {
		
		Imovel imovel = form.getImovelEntity();	
				
		Date checkInEntrada=null, checkInSaida=null, checkOutEntrada=null,checkOutSaida=null,lateCheckOut=null;
		Set<Equipamento> equipamentos = null;
		Equipamento equipamento = null;
		
		Integer[] equipamentosBoxes = form.getEquipamentos();
		
		if(equipamentosBoxes != null && equipamentosBoxes.length >0){
			
			
			equipamentos = new HashSet<Equipamento>();
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
		
		/*ESSE ALGORÍTIMO FOI NECESSÁRIO POR CONTA DAS MUDANÇAS
		SOLICITADAS PELA DB4 EM 19/04/2011, QUE OBRIGAM A ENTIDADE FOTO
		A POSSIR UMA CHAVE ESTRANGEIRA DE IMÓVEL
		*/
		Set<Foto> fotosImovel2 = new HashSet<Foto>();
		if(fotosImovel!= null && fotosImovel.size() > 0){
			Iterator<Foto> it = fotosImovel.iterator();
			while (it.hasNext()) {
				Foto foto = (Foto) it.next();
				foto.setImovel(imovel);
				fotosImovel2.add(foto);
			}
			
			
			imovel.setFotos(fotosImovel2);
		}
		/****************************************/
		
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
				Imovel imovel = imovelEjb.getImovelEditar(Integer.parseInt(codigoImovel));
				
				ImovelForm imovelForm = (ImovelForm)form;	
				
				imovelForm.setImovelEntity(imovel);
				
				if(imovel.getCheckInEntrada() != null){
					imovelForm.setCheckInEntradaHora(imovel.getCheckInEntrada().getHours());
					imovelForm.setCheckInEntradaMinuto(imovel.getCheckInEntrada().getMinutes());
				}
				
				if(imovel.getCheckOutEntrada() != null){
				imovelForm.setCheckOutEntradaHora(imovel.getCheckOutEntrada().getHours());
				imovelForm.setCheckOutEntradaMinuto(imovel.getCheckOutEntrada().getMinutes());
				}
				
				if(imovel.getCheckInSaida() != null){
					imovelForm.setCheckInSaidaHora(imovel.getCheckInSaida().getHours());
					imovelForm.setCheckInSaidaMinuto(imovel.getCheckInSaida().getMinutes());
					
				}
				
				if(imovel.getCheckOutSaida() != null){					
					imovelForm.setCheckOutSaidaHora(imovel.getCheckOutSaida().getHours());
					imovelForm.setCheckOutSaidaMinuto(imovel.getCheckOutSaida().getMinutes());
				}
				
				/* CARREGANDO EQUIPAMENTOS */
				List<Integer> equipamentos = new ArrayList<Integer>();
				
				if (imovel.getEquipamentos()!=null && imovel.getEquipamentos().size() > 0) {
					Iterator<Equipamento> it = imovel.getEquipamentos().iterator();
					Integer []iArray = new Integer[imovel.getEquipamentos().size()];
					int x=0;
					while (it.hasNext()) {
						iArray[x] = it.next().getCodigo();
						x=x+1;
					}
					imovelForm.setEquipamentos(iArray);
				}
				/****************************/
				
				/* CARREGANDO IDIOMAS */
				List<Integer> idiomas = new ArrayList<Integer>();
				
				if (imovel.getIdiomas()!=null && imovel.getIdiomas().size() > 0) {
					Iterator<Idioma> itIdiomas = imovel.getIdiomas().iterator();
					Integer []iArrayIdiomas = new Integer[imovel.getIdiomas().size()];
					int xi=0;
					while (itIdiomas.hasNext()) {
						iArrayIdiomas[xi] = itIdiomas.next().getCodigo();
						xi=xi+1;
					}
					imovelForm.setIdiomas(iArrayIdiomas);
				}
				/****************************/
				
				
				
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
			
			//ENVIANDO COMUNICADO DE APROVAÇÃO AO PROPRIETÁRIO
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
		//NA VERDADE, NÃO EXCLUI. SOMENTE SETA O STATUS PRA -1
		
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
			Usuario usuario) throws ValidacaoFormException, FileNotFoundException, IOException {
		
		Imovel imovel = form.getImovelEntity();	
		
		Date checkInEntrada=null, checkInSaida=null, checkOutEntrada=null,checkOutSaida=null,lateCheckOut=null;
		
		/******  IDIOMAS *******/
		Set<Idioma> idiomas = null;
		Idioma idioma = null;
		
		Integer[] idiomasBoxes = form.getIdiomas();
		
		if(idiomasBoxes != null && idiomasBoxes.length >0){
			
			idiomas = new HashSet<Idioma>();
			for (int x=0; x < idiomasBoxes.length; x++){
				
				idioma = new Idioma();
				idioma.setCodigo(idiomasBoxes[x].intValue());
				
				idiomas.add(idioma);
			}			
		}
		
		if(idiomas != null && idiomas.size() >0)
			imovel.setIdiomas(idiomas);
		/****************************/
		

		Set<Equipamento> equipamentos = null;
		Equipamento equipamento = null;
		
		Integer[] equipamentosBoxes = form.getEquipamentos();
		
		if(equipamentosBoxes != null && equipamentosBoxes.length >0){
			
			
			equipamentos = new HashSet<Equipamento>();
			for (int x=0; x < equipamentosBoxes.length; x++){
				
				equipamento = new Equipamento();
				equipamento.setCodigo(equipamentosBoxes[x].intValue());
				
				equipamentos.add(equipamento);
			}			
		}
		
		if(equipamentos !=null && equipamentos.size()>0){
			imovel.setEquipamentos(equipamentos);
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
		
		
		imovel.setCheckInEntrada(checkInEntrada);
		imovel.setCheckInSaida(checkInSaida);
		imovel.setCheckOutEntrada(checkOutEntrada);
		imovel.setCheckOutSaida(checkOutSaida);
		imovel.setLateCheckOut(lateCheckOut);
		
		imovel.setOnibus(form.isMetro());
		imovel.setTrem(form.isTrem());
		imovel.setMetro(form.isMetro());
		
		
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
		
		/* NOVOS CAMPOS - 16-04-2011*/
		
		if(form.getDdd()!= null)
			imovel.setDdd(form.getDdd());
		
		if(form.getDdd2()!= null)
			imovel.setDdd2(form.getDdd2());
		
		if(form.getEmailCheckin() != null)
			imovel.setEmailCheckin(form.getEmailCheckin());
		
		if(form.getEmailCheckin2() != null)
			imovel.setEmailCheckin2(form.getEmailCheckin2());
		
		if(form.getTaxaAgua()> 0)
			imovel.setTaxaAgua(form.getTaxaAgua());
		
		if(form.getTaxaGas()> 0)
			imovel.setTaxaGas(form.getTaxaGas());
		
		if(form.getTaxaLateCheckout()> 0)
			imovel.setTaxaLateCheckout(form.getTaxaLateCheckout());
		
		if(form.getTaxaLateCheckin()> 0)
			imovel.setTaxaLateCheckin(form.getTaxaLateCheckin());
		
		if(form.getCalcao()> 0)
			imovel.setCalcao(form.getCalcao());
		
		if(form.getEnergia()> 0)
			imovel.setEnergia(form.getEnergia());
		
		if(form.getDiarista()> 0)
			imovel.setDiarista(form.getDiarista());
		/*****************************/
		
		return imovel;

	}
	
	public ActionForward detalheImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response){
		
		String codigoImovel = request.getParameter("ci");
		try {
			if(codigoImovel!= null)
			{
				carregaListas(request);	
				ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
				
				Imovel imovel = imovelEjb.getImovelDetalhes(Integer.valueOf(codigoImovel));
				
				request.setAttribute("imovel", imovel);
				
				request.setAttribute("valor",request.getParameter("valor"));
				
				request.setAttribute("diaInicial", request.getParameter("diaPeriodoInicial"));
				request.setAttribute("mesInicial", request.getParameter("mesPeriodoInicial"));
				request.setAttribute("anoInicial", request.getParameter("anoPeriodoInicial"));		
				
				request.setAttribute("diaFinal", request.getParameter("diaPeriodoFinal"));
				request.setAttribute("mesFinal", request.getParameter("mesPeriodoFinal"));
				request.setAttribute("anoFinal", request.getParameter("anoPeriodoFinal"));		
				
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    
		}
		
		return mapping.findForward(Constants.DETALHE_IMOVEL);
	}
	

}
