package br.com.db4.buskaza.controller.action;

import java.util.ArrayList;
import java.util.Collection;
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

import br.com.db4.buskaza.controller.form.FotoForm;
import br.com.db4.buskaza.controller.form.ImovelForm;
import br.com.db4.buskaza.controller.helper.ImageHelper;
import br.com.db4.buskaza.controller.util.Constants;
import br.com.db4.buskaza.model.anuncio.ejb.AnuncioBeanLocal;
import br.com.db4.buskaza.model.entity.Anuncio;
import br.com.db4.buskaza.model.entity.Foto;
import br.com.db4.buskaza.model.entity.Imovel;
import br.com.db4.buskaza.model.entity.Usuario;
import br.com.db4.buskaza.model.foto.ejb.FotoBeanLocal;
import br.com.db4.buskaza.model.imovel.ejb.ImovelBeanLocal;
import br.com.db4.buskaza.model.util.ServiceLocator;

public class FotoAction extends DispatchAction {
	
public ActionForward listarFotosImovel(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
		
		Collection<Foto> fotos = null;
		int codigoImovel = (Integer.parseInt(request.getParameter("ci")));
		try {
			
			
			FotoBeanLocal fotoEjb = (FotoBeanLocal) ServiceLocator.getInstance().locateEJB(FotoBeanLocal.LOCAL);			
			
			fotos = fotoEjb.listFotosImovel(codigoImovel);
			
		} catch (Exception e) {
			e.printStackTrace();
			final ActionMessages actionErrors = new ActionMessages();
		    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
		    saveErrors( request, actionErrors );
		    return mapping.findForward(Constants.FORWARD_SAIDA_FOTOS_IMOVEL);
		    
		}
		
		request.setAttribute("fotos", fotos);		
		
		return mapping.findForward(Constants.FORWARD_SAIDA_FOTOS_IMOVEL);
	}

public ActionForward excluirFoto(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {
	
	String codigoImovel = request.getParameter("ci");
	
	int codigoFoto = Integer.parseInt(request.getParameter("codigo"));
			
	try {
		Foto foto = new Foto();
		
		foto.setCodigo(codigoFoto);
		
		FotoBeanLocal fotoEjb = (FotoBeanLocal) ServiceLocator.getInstance().locateEJB(FotoBeanLocal.LOCAL);
		
		fotoEjb.excluirFoto(foto);				
		
	} catch (Exception e ) {
		e.printStackTrace();
	    final ActionMessages actionErrors = new ActionMessages();
	    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
	    saveErrors( request, actionErrors );
	    
	    return new ActionForward("/usuario/foto.do?act=listarFotosImovel&ci="+codigoImovel);
	}
	
	
	return new ActionForward("/usuario/foto.do?act=listarFotosImovel&ci="+codigoImovel);
	
}

public ActionForward alterarFoto(ActionMapping mapping, ActionForm form, HttpServletRequest request,HttpServletResponse response) {

	String codigoImovel = request.getParameter("ci");
	
	Imovel imovel = new Imovel();
	imovel.setCodigo(Integer.parseInt(codigoImovel));
	int codigoFoto = Integer.parseInt(request.getParameter("codigo"));
	
	FotoForm formFoto = (FotoForm)form;
	
	Foto foto = null;
	
	FormFile formFile = formFoto.getArquivoFoto();
	
	try {
		if (formFile.getFileData()!= null && formFile.getFileData().length > 0){
			foto = ImageHelper.gerarArquivo(formFile);
			foto.setCodigo(codigoFoto);	
			foto.setImovel(imovel);
			
			FotoBeanLocal fotoEjb = (FotoBeanLocal) ServiceLocator.getInstance().locateEJB(FotoBeanLocal.LOCAL);
			
			fotoEjb.alterarFoto(foto);
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	    final ActionMessages actionErrors = new ActionMessages();
	    actionErrors.add( Constants.ERRO_PARAMETER, new ActionMessage( Constants.MENSAGEM_ERRO_INESPERADO,e.getMessage() ) );
	    saveErrors( request, actionErrors );
	    
	    return new ActionForward("/usuario/foto.do?act=listarFotosImovel&ci="+codigoImovel);
	}
	
	
	
	return new ActionForward("/usuario/foto.do?act=listarFotosImovel&ci="+codigoImovel);
}


}
