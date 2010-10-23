package br.com.db4.buskaza.controller.exception;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ExceptionHandler;
import org.apache.struts.config.ExceptionConfig;

import br.com.db4.buskaza.controller.util.Constants;

/**
 * Classe respons�vel por receber exce��es globais.
 */
public class GlobalExceptionHandler extends ExceptionHandler {

    /**
     * M�todo respons�vel por carregar a pagina inicial de Unidade de negocio.
     * 
     * @param mapping O ActionMapping usado para selecionar esta inst�ncia
     * @param arg3 O opcional ActionForm bean para este pedido (se houver)
     * @param arg1 Exce��o de configura��o
     * @param exc Exce��o
     * @param req Solicita��o HTTP
     * @param resp Resposta HTTP
     * @throws ServletException Exce��es relacionadas a servlets
     * @return ActionForward @ Se a camada de neg�cio lan�ar uma exce��o.
     */
    public ActionForward execute( final Exception exc, final ExceptionConfig arg1, final ActionMapping mapping, final ActionForm arg3,
            final HttpServletRequest req, final HttpServletResponse resp ) throws ServletException {
        req.setAttribute( Constants.ERRO_PARAMETER, exc.getMessage() );
        return mapping.findForward(Constants.ERRO_PARAMETER );
    }
}
