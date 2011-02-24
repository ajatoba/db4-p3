package br.com.db4.buskaza.controller.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

import br.com.db4.buskaza.controller.form.ImovelForm;
import br.com.db4.buskaza.controller.form.ReservaForm;
import br.com.db4.buskaza.controller.util.Calendario;
import br.com.db4.buskaza.controller.util.CalendarioUtil;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.controller.util.SendMail;
import br.com.db4.buskaza.model.anuncio.ejb.AnuncioBeanLocal;
import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Reserva;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.reserva.ejb.ReservaBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class ReservaAction extends DispatchAction {

public ActionForward formReservas(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		try{		
				HttpSession session = request.getSession();
				
				Usuario locatario = (Usuario)request.getSession().getAttribute(Constants.USUARIO_SESSAO);
				
				ReservaForm rform = (ReservaForm) form; 
			
				Reserva reserva = popularReserva(rform);
				
				reserva.setLocatario(locatario);
				
				session.setAttribute("reserva", reserva);
				
				// MONTANDO CALENDÁRIO DE DISPONIBILIDADE
				
				String codigoImovel=String.valueOf(reserva.getImovel().getCodigo()), ano=request.getParameter("ano"), mes=request.getParameter("mes");
				int imovelId=0, anoCalendario=0, mesCalendario=0;
				
				if (codigoImovel != null && !codigoImovel.equals("")) {
					imovelId = Integer.parseInt(codigoImovel);
				}
				
				if (ano != null && !ano.equals("")) {
					anoCalendario = Integer.parseInt(ano);
				}else{
					anoCalendario = (reserva.getPeriodoInicial().getYear())+ 1900;
				}
				
				if (mes != null && !mes.equals("")) {
					mesCalendario = Integer.parseInt(mes);
				}else{
					mesCalendario = (reserva.getPeriodoInicial().getMonth())+ 1;
				}
				
				AnuncioBeanLocal anuncioEJB = (AnuncioBeanLocal) ServiceLocator.getInstance().locateEJB(AnuncioBeanLocal.LOCAL);			
				List<Anuncio> anuncios = anuncioEJB.listarAnunciosImovel(reserva.getImovel().getCodigo(), mesCalendario, anoCalendario);
				
				//CAREGANDO CALENDÁRIO DE ANÚNCIOS
				Map<String,Calendario> calendarioAnuncio = CalendarioUtil.getInstance().montaCalendarioAnuncio(mesCalendario, anoCalendario, anuncios);
				
				request.setAttribute("calendarioAnuncio", calendarioAnuncio );
				
				//
				
				
				return mapping.findForward(Constants.FORWARD_SAIDA_INCLUIR_RESERVA);
				
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    
		    return mapping.findForward(Constants.FORWARD_SAIDA_INCLUIR_RESERVA);
		}
	}
	

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
	
	public ActionForward listarReservasImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		List<Reserva> reservas = null;
		
		Integer codigoImovel = Integer.parseInt(request.getParameter("ci"));
		
		int status = Integer.parseInt(request.getParameter("status"));
		
		try {					
			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(ReservaBeanLocal.LOCAL);			
			
			
			reservas = reservaEjb.listarReservasImovel(codigoImovel, status);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return null;
		    
		}
			
		if(reservas != null && !reservas.isEmpty()){
			request.setAttribute("reservasImovel", reservas);	
		}
		
		return mapping.findForward(Constants.FORWARD_SAIDA_RESERVAS_IMOVEL);
	}
	
	private Reserva popularReserva(ReservaForm form) {
		
		Reserva reserva = new Reserva();//form.getReservaEntity();	
		
		reserva.setValor(form.getValor());
		
		reserva.setDataReserva(new Date());
		
		int diaInicial=0, mesInicial=0, anoInicial=0;
		int diaFinal=0, mesFinal=0, anoFinal=0;
		
		diaInicial = form.getDiaPeriodoInicial();
		mesInicial = form.getMesPeriodoInicial();
		anoInicial = form.getAnoPeriodoInicial();		
		
		reserva.setPeriodoInicial(new Date(anoInicial-1900, mesInicial-1,diaInicial));
		
		diaFinal = form.getDiaPeriodoFinal();
		mesFinal = form.getMesPeriodoFinal();
		anoFinal = form.getAnoPeriodoFinal();		
		
		reserva.setPeriodoFinal(new Date(anoFinal-1900, mesFinal-1,diaFinal));
		
		
		//Setando IMÓVEL
		Imovel imovel = null;
		try {
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			imovel = imovelEjb.getImovel(form.getCodigoImovel());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		reserva.setImovel(imovel);
		//**************
		
		return reserva;
	}

	public ActionForward incluirReserva(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Reserva reserva = null;
		
		Integer codigoReserva = 0;
		
		try {
			reserva = (Reserva)session.getAttribute("reserva");
			
			reserva.setValor(Double.parseDouble(request.getParameter("valor")));
			
			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(ReservaBeanLocal.LOCAL);
			codigoReserva = reservaEjb.incluirReserva(reserva);
			
			//ENVIANDO EMAIL AO PROPRIETÁRIO			
			MessageResources messageResources = getResources(request, "app");
			
			String assunto="",mensagem="",remetente="",destinatario="";			
			
			mensagem  		= messageResources.getMessage("reserva.mensagem");
			mensagem 		= mensagem.replaceAll("<PROPRIETARIO>", reserva.getImovel().getUsuarioProprietario().getNome());
			mensagem 		= mensagem.replaceAll("<CODIGO_IMOVEL>", String.valueOf(reserva.getImovel().getCodigo()));
			   
			assunto 		= messageResources.getMessage("reserva.assunto");			
			remetente 		= messageResources.getMessage("mail.from");
			
			destinatario 	= reserva.getImovel().getUsuarioProprietario().getEmail();			
			   
			SendMail sm = new SendMail();

			sm.sendMail(remetente,destinatario,assunto,mensagem);			
			//******************************
			
			//ENVIANDO EMAIL AO LOCATÁRIO
			String assuntoLoc="",mensagemLoc="",remetenteLoc="",destinatarioLoc="";			
			
			mensagemLoc 	= messageResources.getMessage("detalhesReserva.mensagem");
			mensagemLoc 	= mensagemLoc.replaceAll("<USUARIO>", reserva.getLocatario().getNome());
			mensagemLoc 	= mensagemLoc.replaceAll("<VALOR>", String.valueOf(reserva.getValor()));
			mensagemLoc 	= mensagemLoc.replaceAll("<CODIGO_RESERVA>", String.valueOf(reserva.getCodigo()));
			mensagemLoc 	= mensagemLoc.replaceAll("<PERIODO>", reserva.getPeriodoInicial().getDate()+ "/" + (reserva.getPeriodoInicial().getMonth() + 1) + "/" + (reserva.getPeriodoInicial().getYear() + 1900) + " a " + reserva.getPeriodoFinal().getDate()+ "/" + (reserva.getPeriodoFinal().getMonth() + 1) + "/" + (reserva.getPeriodoFinal().getYear() + 1900));
			   
			assuntoLoc 		= messageResources.getMessage("detalhesReserva.assunto");			
			remetenteLoc	= messageResources.getMessage("mail.from");
			
			destinatarioLoc	= reserva.getLocatario().getEmail();			
			   
			SendMail smLoc = new SendMail();

			smLoc.sendMail(remetenteLoc,destinatarioLoc,assuntoLoc,mensagemLoc);
			//******************************		
			
		} catch (Exception e) {
			e.printStackTrace();
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return formReservas(mapping, form, request, response);
		}
		
		return mapping.findForward(Constants.RESERVA_CONFIRMADA);
	}
	
	public ActionForward aprovarReserva(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		ReservaForm rForm = (ReservaForm)form;
		
		int codigoReserva = Integer.parseInt(request.getParameter("codigo"));
		
		Reserva reserva = null;
		
		try {
			
			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(ReservaBeanLocal.LOCAL);
			
			reserva = reservaEjb.getReserva(codigoReserva);
			
			reserva.setStatus(rForm.getStatus());
			
			codigoReserva = reservaEjb.aprovarReserva(reserva);
			
			//ENVIANDO EMAIL AO LOCATÁRIO			
			
			MessageResources messageResources = getResources(request, "app");
			
			String assunto="",mensagem="",remetente="",destinatario="";			
			
			mensagem  		= messageResources.getMessage("aprovacaoReserva.mensagem");
			mensagem 		= mensagem.replaceAll("<CODIGO_RESERVA>", String.valueOf(reserva.getCodigo()));
			   
			assunto 		= messageResources.getMessage("aprovacaoReserva.assunto");			
			remetente 		= messageResources.getMessage("mail.from");
			
			destinatario 	= reserva.getLocatario().getEmail();			
			   
			SendMail sm = new SendMail();
			
			sm.sendMail(remetente,destinatario,assunto,mensagem);
						
			//******************************
				
			
		} catch (Exception e) {
			e.printStackTrace();
		    final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return mapping.findForward(Constants.RESERVA_APROVADA);
		}
		
		return mapping.findForward(Constants.RESERVA_APROVADA);
	}

	public ActionForward formPagarReserva(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		try{
			
			HttpSession session = request.getSession();
			
			Integer codigoReserva = Integer.parseInt(request.getParameter("cr"));
			
			Reserva reserva = null;
			
			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(ReservaBeanLocal.LOCAL);
			reserva = reservaEjb.getReserva(codigoReserva);
			
			if(reserva != null){
				if(reserva.getStatus() == 1){
					//SÓ É POSSÍVEL PAGAR RESERVA COM STATUS "APROVADA", OU SEJA, 1
				
					session.setAttribute(Constants.OBJETO_PAGAR_RESERVA, reserva);
					
				}else {
					request.setAttribute("erroReserva", "Você deve pagar apenas reservas aprovadas.<br>Essa reserva não foi aprovada pelo proprietário.");
					return mapping.findForward(Constants.PAGAR_RESERVA_ERRO);
				}
			}else {
				request.setAttribute("erroReserva", "Ocorreu um erro inesperado");
				return mapping.findForward(Constants.PAGAR_RESERVA_ERRO);
			}
			
			return mapping.findForward(Constants.FORM_PAGAR_RESERVA);
				
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    
		    return mapping.findForward(Constants.PAGAR_RESERVA_ERRO);
		}
	}
	

	
}
