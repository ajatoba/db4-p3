package br.com.db4.buskaza.controller.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Reserva;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

/**
 * Servlet Filter implementation class UsuarioFilter
 */
public class UsuarioFilter implements Filter {

    /**
     * Default constructor. 
     */
    public UsuarioFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		Usuario usuario = req.getSession().getAttribute(Constants.USUARIO_SESSAO)!=null?(Usuario)req.getSession().getAttribute(Constants.USUARIO_SESSAO):null;
		
		
		if (request.getParameter("ORIGEM_REQUEST") != null && request.getParameter("ORIGEM_REQUEST").equals("_RESERVA")) {
			
			Reserva reserva = popularReservaRequest(req);
			System.out.println("POPULANDO RESERVA" + reserva.getValor());
			req.getSession().setAttribute("reserva", reserva);
		}
		if (usuario == null){
			
			if (!response.isCommitted()){   
				//redireciona para tela de login	
				request.getRequestDispatcher( "/WEB-INF/jsp/login_usuario.jsp" ).forward( request, resp ); 
			}
			                      
		}else{			
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	private Reserva popularReservaRequest(HttpServletRequest req) {
		
		Reserva reserva = new Reserva();//form.getReservaEntity();	
		
		reserva.setValor(Double.parseDouble(req.getParameter("valor")));
		
		reserva.setDataReserva(new Date());
		
		int diaInicial=0, mesInicial=0, anoInicial=0;
		int diaFinal=0, mesFinal=0, anoFinal=0;
		
		diaInicial = Integer.parseInt(req.getParameter("diaPeriodoInicial"));
		mesInicial = Integer.parseInt(req.getParameter("mesPeriodoInicial"));
		anoInicial = Integer.parseInt(req.getParameter("anoPeriodoInicial"));		
		
		reserva.setPeriodoInicial(new Date(anoInicial-1900, mesInicial-1,diaInicial));
		
		diaFinal = Integer.parseInt(req.getParameter("diaPeriodoFinal"));
		mesFinal = Integer.parseInt(req.getParameter("mesPeriodoFinal"));
		anoFinal = Integer.parseInt(req.getParameter("anoPeriodoFinal"));		
		
		reserva.setPeriodoFinal(new Date(anoFinal-1900, mesFinal-1,diaFinal));
		
		
		//Setando IMÓVEL
		Imovel imovel = null;
		try {
			ImovelBeanLocal imovelEjb = (ImovelBeanLocal) ServiceLocator.getInstance().locateEJB(ImovelBeanLocal.LOCAL);
			imovel = imovelEjb.getImovel(Integer.parseInt(req.getParameter("codigoImovel")));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		reserva.setImovel(imovel);
		//**************
		
		return reserva;
	}


}
