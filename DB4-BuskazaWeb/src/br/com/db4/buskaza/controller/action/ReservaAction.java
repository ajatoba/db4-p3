package br.com.db4.buskaza.controller.action;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.security.auth.callback.ConfirmationCallback;
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

import br.com.db4.buskaza.controller.form.ReservaForm;
import br.com.db4.buskaza.controller.plugin.DoubleConverterBR;
import br.com.db4.buskaza.controller.util.CalendarioUtil;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.controller.util.SendMail;
import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Equipamento;
import br.com.db4.buskaza.model.entity.Idioma;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Reserva;
import br.com.db4.buskaza.model.entity.TipoAnuncio;
import br.com.db4.buskaza.model.entity.TipoPagamento;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.reserva.ejb.ReservaBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class ReservaAction extends DispatchAction {

	public ActionForward formReservas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			Usuario locatario = (Usuario) request.getSession().getAttribute(Constants.USUARIO_SESSAO);

			ReservaForm rform = null;
			Reserva reserva = null;
			Imovel im = null;

			if (session.getAttribute("reserva") != null) {
				reserva = (Reserva) session.getAttribute("reserva");
				session.removeAttribute("requestReserva");
			} else {

				rform = (ReservaForm) form;
				reserva = popularReserva(rform);
			}

			reserva.setLocatario(locatario);
			session.setAttribute("reserva", reserva);

			// vacavitoria.com ticket #91
			String origemRequest = (String) request.getParameter(Constants.ORIGEM_REQUEST);
			System.out.println("origem request = " + origemRequest);
			System.out.println("parameters = " + request.getParameterMap());
			
			// verifica se jah escolheu reserva da lista de reservas de pacote
			// fechado
			boolean confirmouQualReserva = false;
			if (origemRequest != null && origemRequest.equals(Constants._RESERVA)) {
				confirmouQualReserva = true;
			}

			// verifica se anuncio eh pacote fechado.
			boolean pacoteFechado = false;
			if (reserva.getImovel().getAnuncios() != null) {
				Iterator iterator = reserva.getImovel().getAnuncios().iterator();
				while (iterator.hasNext()) {
					Anuncio anuncio = (Anuncio) iterator.next();
					if (anuncio.getTipoAnuncio().getCodigo().intValue() == TipoAnuncio.PACOTE_FECHADO) {
						pacoteFechado = true;
					}
				}
			}

			if (pacoteFechado && !confirmouQualReserva) {
				return mapping.findForward(Constants.FORWARD_SAIDA_VERIFICA_PACOTE);
			} else {
				return mapping.findForward(Constants.FORWARD_SAIDA_INCLUIR_RESERVA);
			}

		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
			actionErrors.add(Constants.ERRO_PARAMETER, new ActionMessage(Constants.MENSAGEM_ERRO_INESPERADO, e
					.getMessage()));
			saveErrors(request, actionErrors);

			return mapping.findForward(Constants.FORWARD_SAIDA_INCLUIR_RESERVA);
		}
	}

//	public ActionForward formReservasPacoteFechado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
//			HttpServletResponse response) {
//		try {
//
//			HttpSession session = request.getSession();
//
//			Usuario locatario = (Usuario) request.getSession().getAttribute(Constants.USUARIO_SESSAO);
//
//			ReservaForm rform = null;
//
//			Reserva reserva = null;
//
//			Imovel im = null;
//
//			if (session.getAttribute("reserva") != null) {
//				reserva = (Reserva) session.getAttribute("reserva");
//				session.removeAttribute("requestReserva");
//			} else {
//
//				rform = (ReservaForm) form;
//				reserva = popularReserva(rform);
//			}
//
//			reserva.setLocatario(locatario);
//
//			session.setAttribute("reserva", reserva);
//
//			return mapping.findForward(Constants.FORWARD_SAIDA_VERIFICA_PACOTE);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			final ActionMessages actionErrors = new ActionMessages();
//			actionErrors.add(Constants.ERRO_PARAMETER, new ActionMessage(Constants.MENSAGEM_ERRO_INESPERADO, e
//					.getMessage()));
//			saveErrors(request, actionErrors);
//
//			return mapping.findForward(Constants.FORWARD_SAIDA_INCLUIR_RESERVA);
//		}
//	}

	public ActionForward listarReservas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		List<Reserva> reservas = null;

		try {
			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(
					ReservaBeanLocal.LOCAL);

			Usuario usuario = (Usuario) request.getSession().getAttribute(Constants.USUARIO_SESSAO);
			reservas = reservaEjb.listarReservas(usuario.getCodigo());

		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
			actionErrors.add(Constants.ERRO_PARAMETER, new ActionMessage(Constants.MENSAGEM_ERRO_INESPERADO, e
					.getMessage()));
			saveErrors(request, actionErrors);
			return null;

		}

		if (reservas != null && !reservas.isEmpty()) {
			request.setAttribute("reservas", reservas);
		}

		return mapping.findForward(Constants.FORWARD_SAIDA_RESERVA_PROPRIETARIO);
	}

	public ActionForward listarReservasImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		List<Reserva> reservas = null;

		Integer codigoImovel = Integer.parseInt(request.getParameter("ci"));

		int status = Integer.parseInt(request.getParameter("status"));
		int statusMoip = Integer.parseInt(request.getParameter("statusMoip"));

		try {
			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(
					ReservaBeanLocal.LOCAL);

			reservas = reservaEjb.listarReservasImovelConfirmar(codigoImovel, status, statusMoip);

		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
			actionErrors.add(Constants.ERRO_PARAMETER, new ActionMessage(Constants.MENSAGEM_ERRO_INESPERADO, e
					.getMessage()));
			saveErrors(request, actionErrors);
			return null;

		}

		if (reservas != null && !reservas.isEmpty()) {
			request.setAttribute("reservasImovel", reservas);
		}

		return mapping.findForward(Constants.FORWARD_SAIDA_RESERVAS_IMOVEL);
	}

	private Reserva popularReserva(ReservaForm form) {

		Reserva reserva = new Reserva();// form.getReservaEntity();

		reserva.setValor(DoubleConverterBR.getInstance().toDouble(form.getValor()));

		reserva.setDataReserva(new Date());

		int diaInicial = 0, mesInicial = 0, anoInicial = 0;
		int diaFinal = 0, mesFinal = 0, anoFinal = 0;

		diaInicial = form.getDiaPeriodoInicial();
		mesInicial = form.getMesPeriodoInicial();
		anoInicial = form.getAnoPeriodoInicial();

		reserva.setPeriodoInicial(new Date(anoInicial - 1900, mesInicial - 1, diaInicial));

		diaFinal = form.getDiaPeriodoFinal();
		mesFinal = form.getMesPeriodoFinal();
		anoFinal = form.getAnoPeriodoFinal();

		reserva.setPeriodoFinal(new Date(anoFinal - 1900, mesFinal - 1, diaFinal));

		// Setando IM�VEL
		Imovel imovel = null;
		try {
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			imovel = imovelEjb.getImovel(form.getCodigoImovel());

		} catch (Exception e) {
			e.printStackTrace();
		}
		reserva.setImovel(imovel);
		// **************

		return reserva;
	}

	public ActionForward incluirReserva(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();
		Reserva reserva = null;

		Integer codigoReserva = 0;

		try {
			reserva = (Reserva) session.getAttribute("reserva");

			reserva.setValor(Double.parseDouble(request.getParameter("valor")));

			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(
					ReservaBeanLocal.LOCAL);
			codigoReserva = reservaEjb.incluirReserva(reserva);

			session.setAttribute(Constants.OBJETO_PAGAR_RESERVA, reserva);

			// ENVIANDO EMAIL AO PROPRIET�RIO
			MessageResources messageResources = getResources(request, "app");

			String assunto = "", mensagem = "", remetente = "", destinatario = "";

			mensagem = messageResources.getMessage("reserva.mensagem");
			mensagem = mensagem.replaceAll("<PROPRIETARIO>", reserva.getImovel().getUsuarioProprietario().getNome());
			mensagem = mensagem.replaceAll("<CODIGO_IMOVEL>", String.valueOf(reserva.getImovel().getCodigo()));

			assunto = messageResources.getMessage("reserva.assunto");
			remetente = messageResources.getMessage("mail.from");

			destinatario = reserva.getImovel().getUsuarioProprietario().getEmail();

			SendMail sm = new SendMail();

			sm.sendMail(remetente, destinatario, assunto, mensagem);
			// ******************************

			// ENVIANDO EMAIL AO LOCAT�RIO
			String assuntoLoc = "", mensagemLoc = "", remetenteLoc = "", destinatarioLoc = "";

			mensagemLoc = messageResources.getMessage("detalhesReserva.mensagem");
			mensagemLoc = mensagemLoc.replaceAll("<USUARIO>", reserva.getLocatario().getNome());
			mensagemLoc = mensagemLoc.replaceAll("<VALOR>", String.valueOf(reserva.getValor()));
			mensagemLoc = mensagemLoc.replaceAll("<CODIGO_RESERVA>", String.valueOf(reserva.getCodigo()));
			mensagemLoc = mensagemLoc.replaceAll("<PERIODO>", reserva.getPeriodoInicial().getDate() + "/"
					+ (reserva.getPeriodoInicial().getMonth() + 1) + "/"
					+ (reserva.getPeriodoInicial().getYear() + 1900) + " a " + reserva.getPeriodoFinal().getDate()
					+ "/" + (reserva.getPeriodoFinal().getMonth() + 1) + "/"
					+ (reserva.getPeriodoFinal().getYear() + 1900));

			assuntoLoc = messageResources.getMessage("detalhesReserva.assunto");
			remetenteLoc = messageResources.getMessage("mail.from");

			destinatarioLoc = reserva.getLocatario().getEmail();

			SendMail smLoc = new SendMail();

			smLoc.sendMail(remetenteLoc, destinatarioLoc, assuntoLoc, mensagemLoc);
			// ******************************

		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
			actionErrors.add(Constants.ERRO_PARAMETER, new ActionMessage(Constants.MENSAGEM_ERRO_INESPERADO, e
					.getMessage()));
			saveErrors(request, actionErrors);
			return formReservas(mapping, form, request, response);
		}

		// return mapping.findForward(Constants.RESERVA_CONFIRMADA);
		return mapping.findForward(Constants.FORM_PAGAR_RESERVA);
	}

	public ActionForward aprovarReserva(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		ReservaForm rForm = (ReservaForm) form;

		int codigoReserva = Integer.parseInt(request.getParameter("codigo"));

		Reserva reserva = null;
		Imovel imoveleq = null;

		try {

			ReservaBeanLocal reservaEjb = (ReservaBeanLocal) ServiceLocator.getInstance().locateEJB(
					ReservaBeanLocal.LOCAL);

			reserva = reservaEjb.getReserva(codigoReserva);

			// Setando IM�VEL
			/*
			 * Imovel imovel = null; try { ImovelBeanLocal imovelEjb =
			 * (ImovelBeanLocal)
			 * ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			 * imovel = imovelEjb.getImovel(reserva.getImovel().getCodigo());
			 * 
			 * } catch (Exception e) { e.printStackTrace(); }
			 * reserva.setImovel(imovel);
			 */
			// **************

			reserva.setStatus(rForm.getStatus());

			if (reserva.getStatus() == Constants.STATUS_RESERVA_APROVADA) {
				reserva.setStatusMoip(9);
			} else if (reserva.getStatus() == Constants.STATUS_RESERVA_NEGADA) {
				reserva.setStatusMoip(0);
			}

			codigoReserva = reservaEjb.aprovarReserva(reserva);

			// ENVIANDO EMAIL AO LOCAT�RIO

			MessageResources messageResources = getResources(request, "app");

			String assunto = "", mensagem = "", remetente = "", destinatario = "";

			if (reserva.getStatus() == Constants.STATUS_RESERVA_APROVADA) {
				mensagem = messageResources.getMessage("aprovacaoReserva.mensagem");
				assunto = messageResources.getMessage("aprovacaoReserva.assunto");

				reserva.setStatusMoip(9);

			} else if (reserva.getStatus() == Constants.STATUS_RESERVA_NEGADA) {
				mensagem = messageResources.getMessage("negacaoReserva.mensagem");
				assunto = messageResources.getMessage("negacaoReserva.assunto");

				reserva.setStatusMoip(0);
			}

			imoveleq = reservaEjb.getImovelEquipReserva(reserva.getImovel().getCodigo());

			String lista_equip = "", lista_idioma = "", lista_tp = "";

			/* EQUIPAMENTO */
			if (imoveleq.getEquipamentos() != null && imoveleq.getEquipamentos().size() > 0) {
				Iterator<Equipamento> it = imoveleq.getEquipamentos().iterator();

				while (it.hasNext()) {
					lista_equip = lista_equip + it.next().getNome() + ", ";
				}
			}

			/* IDIOMA */
			if (imoveleq.getIdiomas() != null && imoveleq.getIdiomas().size() > 0) {
				Iterator<Idioma> it_idi = imoveleq.getIdiomas().iterator();

				while (it_idi.hasNext()) {
					lista_idioma = lista_idioma + it_idi.next().getNome() + ", ";
				}
			}

			/* TIPO DE PAGAMENTO */
			if (imoveleq.getTiposPagamento() != null && imoveleq.getTiposPagamento().size() > 0) {
				Iterator<TipoPagamento> it_tp = imoveleq.getTiposPagamento().iterator();

				while (it_tp.hasNext()) {
					lista_tp = lista_tp + it_tp.next().getNome() + ", ";
				}
			}
			mensagem = mensagem.replaceAll("<EQUIPAMENTO>", lista_equip);
			mensagem = mensagem.replaceAll("<IDIOMA>", lista_idioma);
			mensagem = mensagem.replaceAll("<FORMA_PAGAMENTO>", lista_tp);

			mensagem = mensagem.replaceAll("<USUARIO>", reserva.getLocatario().getNome());

			mensagem = mensagem.replaceAll("<CODIGO_RESERVA>", String.valueOf(reserva.getCodigo()));

			mensagem = mensagem.replaceAll("<ENDERECO>", reserva.getImovel().getLogradouro() + ", "
					+ reserva.getImovel().getNumero() + " - " + reserva.getImovel().getComplemento() + " Cep: "
					+ reserva.getImovel().getCep() + "<br>" + reserva.getImovel().getBairro() + ", "
					+ reserva.getImovel().getMunicipio() + " - " + reserva.getImovel().getEstado().getCodigo());

			mensagem = mensagem.replaceAll("<VALOR_RESERVA>", String.valueOf(Arredonda(reserva.getValor()
					+ (reserva.getValor() * 15 / 100))));
			mensagem = mensagem.replaceAll("<VALOR_TAXA_RESERVA>", String
					.valueOf(Arredonda((reserva.getValor() * 15 / 100))));
			mensagem = mensagem.replaceAll("<VALOR_SALDO_RESERVA>", String.valueOf(Arredonda(reserva.getValor())));

			Date dataInicio = new Date(reserva.getPeriodoInicial().getYear() - 1900, reserva.getPeriodoInicial()
					.getMonth() - 1, reserva.getPeriodoInicial().getDate());
			Date dataFim = new Date(reserva.getPeriodoFinal().getYear() - 1900,
					reserva.getPeriodoFinal().getMonth() - 1, reserva.getPeriodoFinal().getDate());

			int qtdDias = 0;
			qtdDias = (CalendarioUtil.getInstance().getDiasPeriodoMes(dataInicio, dataFim)).size();

			mensagem = mensagem.replaceAll("<QTD_DIAS>", String.valueOf(qtdDias));
			mensagem = mensagem.replaceAll("<DATA_IN>", reserva.getPeriodoInicial().getDate() + "/"
					+ (reserva.getPeriodoInicial().getMonth() + 1) + "/"
					+ (reserva.getPeriodoInicial().getYear() + 1900));
			mensagem = mensagem.replaceAll("<DATA_FIM>", reserva.getPeriodoFinal().getDate() + "/"
					+ (reserva.getPeriodoFinal().getMonth() + 1) + "/" + (reserva.getPeriodoFinal().getYear() + 1900));

			mensagem = mensagem.replaceAll("<CALCAO>", String.valueOf(Arredonda(reserva.getImovel().getCalcao())));
			mensagem = mensagem.replaceAll("<LUZ>", String.valueOf(Arredonda(reserva.getImovel().getEnergia())));
			mensagem = mensagem.replaceAll("<AGUA>", String.valueOf(Arredonda(reserva.getImovel().getTaxaAgua())));
			mensagem = mensagem.replaceAll("<LIMPAZA>", String.valueOf(Arredonda(reserva.getImovel().getDiarista())));
			mensagem = mensagem.replaceAll("<GAS>", String.valueOf(Arredonda(reserva.getImovel().getTaxaGas())));

			if (reserva.getImovel().isPrePagamento() == true) {

				mensagem = mensagem
						.replaceAll(
								"<PRE_PAGAMENTO>",
								"O propriet�rio desse im�vel exige "
										+ reserva.getImovel().getPrePercentual()
										+ "%, at� "
										+ reserva.getImovel().getPreCheckIn()
										+ " dias antes do Check In, e outros  "
										+ reserva.getImovel().getPrePercentual2()
										+ "%, at� "
										+ reserva.getImovel().getPreCheckIn2()
										+ " dias antes do Check In.<br />"
										+ "O pagamento dessa tarifa pode ser feita por Deposito em Conta Corrente ou PayPal<br /><br />"
										+ "Reservas efetuadas em datas com inicio igual ou superior a 3 dias, o pagamento do percentual antes do Check In, dever� ser pago 24h.<br />"
										+

										"<br>Titular: " + reserva.getImovel().getPreTitular() + "<br>Email PayPal: "
										+ reserva.getImovel().getPreEmailPayPal() + "<br>Banco: "
										+ reserva.getImovel().getPreBanco() + "<br>N�mero do Banco: "
										+ reserva.getImovel().getPreNumBanco() + "<br>Ag�ncia: "
										+ reserva.getImovel().getPreAgencia() + "<br>Conta Corrente: "
										+ reserva.getImovel().getPreContaCorrente() + "<br><br>");
			} else {

				mensagem = mensagem.replaceAll("<PRE_PAGAMENTO>",
						"O propriet�rio desse im�vel n�o exige pr� pagamento do saldo<br><br>");
			}

			mensagem = mensagem.replaceAll("<CHECK_IN>", reserva.getImovel().getCheckInEntrada().getHours() + ":"
					+ reserva.getImovel().getCheckInEntrada().getMinutes() + " at� "
					+ reserva.getImovel().getCheckOutEntrada().getHours() + ":"
					+ reserva.getImovel().getCheckOutEntrada().getMinutes());
			mensagem = mensagem.replaceAll("<TAXA_CHECK_IN>", String.valueOf(Arredonda(reserva.getImovel()
					.getTaxaLateCheckin())));

			mensagem = mensagem.replaceAll("<CHECK_OUT>", reserva.getImovel().getCheckInSaida().getHours() + ":"
					+ reserva.getImovel().getCheckInSaida().getMinutes() + " at� "
					+ reserva.getImovel().getCheckOutSaida().getHours() + ":"
					+ reserva.getImovel().getCheckOutSaida().getMinutes());
			mensagem = mensagem.replaceAll("<TAXA_CHECK_OUT>", String.valueOf(Arredonda(reserva.getImovel()
					.getTaxaLateCheckout())));

			mensagem = mensagem.replaceAll("<RESPONSAVEL>", reserva.getImovel().getNomeCheckIn());

			mensagem = mensagem.replaceAll("<TEL1>", reserva.getImovel().getDdd() + " "
					+ reserva.getImovel().getTelefone());
			mensagem = mensagem.replaceAll("<TEL2>", reserva.getImovel().getDdd2() + " "
					+ reserva.getImovel().getTelefone2());

			mensagem = mensagem.replaceAll("<CONTATO1>", reserva.getImovel().getEmailCheckin());
			mensagem = mensagem.replaceAll("<CONTATO2>", reserva.getImovel().getEmailCheckin2());

			mensagem = mensagem.replaceAll("<CONTRATO>", "Contrato, clique aqui: "
					+ "<a href='http://www.buzkaza.com.br/contrato.php?ir=" + reserva.getCodigo() + "&idu="
					+ reserva.getLocatario().getCodigo() + "'>" + "http://www.buzkaza.com.br/contrato.php?ir="
					+ reserva.getCodigo() + "&idu=" + reserva.getLocatario().getCodigo() + "</a>");

			remetente = messageResources.getMessage("mail.from");

			destinatario = reserva.getLocatario().getEmail();

			SendMail sm = new SendMail();

			sm.sendMail(remetente, destinatario, assunto, mensagem);

			// ******************************

		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
			actionErrors.add(Constants.ERRO_PARAMETER, new ActionMessage(Constants.MENSAGEM_ERRO_INESPERADO, e
					.getMessage()));
			saveErrors(request, actionErrors);
			return mapping.findForward(Constants.RESERVA_APROVADA);
		}

		return mapping.findForward(Constants.RESERVA_APROVADA);
	}

	private BigDecimal Arredonda(double arr) {

		BigDecimal teste = new BigDecimal(arr);
		teste = teste.setScale(2, BigDecimal.ROUND_HALF_UP);

		return teste;
	}

	/*
	 * M�TODO DESATIVADO PELA DB4 CONFORME SOLICITA��O DE 23/03/2011
	 */

	/*
	 * public ActionForward formPagarReserva(ActionMapping mapping, ActionForm
	 * form, HttpServletRequest request,HttpServletResponse response) { try{
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * Reserva reserva = null;
	 * 
	 * reserva = (Reserva)session.getAttribute("reserva");
	 * 
	 * if(reserva == null){ Integer codigoReserva =
	 * Integer.parseInt(request.getParameter("cr"));
	 * 
	 * ReservaBeanLocal reservaEjb = (ReservaBeanLocal)
	 * ServiceLocator.getInstance().locateEJB(ReservaBeanLocal.LOCAL); reserva =
	 * reservaEjb.getReserva(codigoReserva); }else{
	 * session.setAttribute(Constants.OBJETO_PAGAR_RESERVA, reserva); } return
	 * mapping.findForward(Constants.FORM_PAGAR_RESERVA);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); final ActionMessages
	 * actionErrors = new ActionMessages(); actionErrors.add(
	 * Constants.ERRO_PARAMETER, new ActionMessage(
	 * Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) ); saveErrors(
	 * request, actionErrors );
	 * 
	 * return mapping.findForward(Constants.PAGAR_RESERVA_ERRO); } }
	 */
}
