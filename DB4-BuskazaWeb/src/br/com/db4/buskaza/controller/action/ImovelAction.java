package br.com.db4.buskaza.controller.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

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
import br.com.db4.buskaza.model.entity.Equipamento;
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
			
			System.out.println("LINK GMAPS=" + imovelForm.getLinkGoogleMaps());
			
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
	
	private Imovel popularImovel(ImovelForm form) throws ValidacaoFormException {
		
		Imovel imovel = form.getImovelEntity();	
		
		Date checkInEntrada, checkInSaida, checkOutEntrada,checkOutSaida,lateCheckOut;
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
				
		checkInEntrada = new Date(0,0,0,form.getCheckInEntradaHora().intValue(), form.getCheckInEntradaMinuto().intValue());
		checkInSaida = new Date(0,0,0,form.getCheckInSaidaHora().intValue(), form.getCheckInSaidaMinuto().intValue());
		checkOutEntrada = new Date(0,0,0,form.getCheckOutEntradaHora().intValue(), form.getCheckOutEntradaMinuto().intValue());
		checkOutSaida = new Date(0,0,0,form.getCheckOutSaidaHora().intValue(), form.getCheckOutSaidaMinuto().intValue());
		lateCheckOut = new Date(0,0,0,form.getLateCheckOutHora().intValue(), form.getLateCheckOutMinuto().intValue());
		
		imovel.setEquipamentos(equipamentos);
		imovel.setCheckInEntrada(checkInEntrada);
		imovel.setCheckInSaida(checkInSaida);
		imovel.setCheckOutEntrada(checkOutEntrada);
		imovel.setCheckOutSaida(checkOutSaida);
		imovel.setLateCheckOut(lateCheckOut);
		
		//Setando demais atributos do form
		imovel.setCalcao(form.getCalcao());
		imovel.setCamas(form.getCamas());
		imovel.setCapacidade(form.getCapacidade());
		imovel.setComplemento(form.getComplemento());
		imovel.setCondicoes(form.getCondicoes());
		imovel.setDiarista(form.getDiarista());
		imovel.setDistanciaCentro(form.getDistanciaCentro());
		imovel.setEnergia(form.getEnergia());
		imovel.setIdiomas(form.getIdiomas());
		imovel.setInternet(form.getInternet());
		imovel.setLinkGoogleMaps(form.getLinkGoogleMaps());
		imovel.setLogradouro(form.getLogradouro());
		imovel.setMetragem(form.getMetragem());
		imovel.setMunicipio(form.getMunicipio());
		imovel.setNomeCheckIn(form.getNomeCheckIn());
		imovel.setOutro(form.getOutraTaxaExtra());
		imovel.setQuartos(form.getQuartos());
		imovel.setRecepcionista(form.getRecepcionista());
		imovel.setTarifaDiaria(form.getTarifaDiaria());
		imovel.setTarifaEspecialDescricao(form.getTarifaEspecialDescricao());
		imovel.setTarifaEspecialValor(form.getTarifaEspecialValor());
		imovel.setTarifaMensal(form.getTarifaMensal());
		imovel.setTarifaQuinzenal(form.getTarifaQuinzenal());
		imovel.setTarifaSemanal(form.getTarifaSemanal());
		imovel.setTelefone(form.getTelefone());
		imovel.setTransportePublico(form.isTransportePublico());
		
		return imovel;
	}
}
