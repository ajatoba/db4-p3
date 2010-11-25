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

import br.com.db4.buskaza.controller.exception.ValidacaoFormException;
import br.com.db4.buskaza.controller.form.ImovelForm;
import br.com.db4.buskaza.controller.helper.ImageHelper;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Foto;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Usuario;
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
	
	public ActionForward formBuscarImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response)  {
		
		carregaListas(request);		
		return mapping.findForward(Constants.FORWARD_ENTRADA_BUSCA_AVANCADA_IMOVEIS);
	}
	
	public ActionForward incluirImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		try {
			
			ImovelForm imovelForm = (ImovelForm)form;			
			
			Imovel imovel = popularImovel(imovelForm);			
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
			
			Imovel imovel = popularImovel(imovelForm);			
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			
			imoveis = imovelEjb.buscarImovel(imovel);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formBuscarImovel(mapping, form, request, response);
		    
		}
		
		request.setAttribute("imoveis", imoveis);
		request.setAttribute("resultado", imoveis.size());
		
		return mapping.findForward(Constants.FORWARD_SAIDA_BUSCA_AVANCADA_IMOVEIS);
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
			e.printStackTrace();
		}
		
	}
	
	private Imovel popularImovel(ImovelForm form) throws ValidacaoFormException, FileNotFoundException, IOException {
		
		Imovel imovel = form.getImovelEntity();	
		
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
		
		if(form.getCondicoes()!= null )
			imovel.setCondicoes(form.getCondicoes());
		
		if(form.getDiarista() >0  )
			imovel.setDiarista(form.getDiarista());
		
		if(form.getDistanciaCentro() > 0 )
			imovel.setDistanciaCentro(form.getDistanciaCentro());
		
		if(form.getEnergia() > 0 )
			imovel.setEnergia(form.getEnergia());
		
		if(form.getIdiomas()!= null )
			imovel.setIdiomas(form.getIdiomas());
		
		if(form.getInternet()> 0 )
			imovel.setInternet(form.getInternet());
		
		if(form.getLinkGoogleMaps()!= null )
			imovel.setLinkGoogleMaps(form.getLinkGoogleMaps());
		
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
		
		if(form.getTarifaDiaria() > 0 )
			imovel.setTarifaDiaria(form.getTarifaDiaria());
		
		if(form.getTarifaEspecialDescricao()!= null )
			imovel.setTarifaEspecialDescricao(form.getTarifaEspecialDescricao());
		
		if(form.getTarifaEspecialValor()> 0 )
			imovel.setTarifaEspecialValor(form.getTarifaEspecialValor());
		
		if(form.getTarifaMensal() > 0 )
			imovel.setTarifaMensal(form.getTarifaMensal());
		
		if(form.getTarifaQuinzenal() > 0 )
			imovel.setTarifaQuinzenal(form.getTarifaQuinzenal());
		
		if(form.getTarifaSemanal() > 0 )
			imovel.setTarifaSemanal(form.getTarifaSemanal());
		
		if(form.getTelefone()!= null )
			imovel.setTelefone(form.getTelefone());
		
		if(form.isTransportePublico() )
			imovel.setTransportePublico(form.isTransportePublico());
		
		
		Usuario proprietario = new Usuario();
		//TODO tirar o usu�rio hardcode e adicionar usuario logado.
		proprietario.setCodigo(1);
		
		imovel.setUsuarioProprietario(proprietario);
		
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
		return imovel;
	}
}
