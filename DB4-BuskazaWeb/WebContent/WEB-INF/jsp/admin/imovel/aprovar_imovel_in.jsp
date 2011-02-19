<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>

<link rel="stylesheet" href="/buzkaza/teaser/_css/estilo.css" type="text/css" />
<link rel="stylesheet" href="/buzkaza/teaser/_css/fontes.css" type="text/css" />
<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<link rel="stylesheet" href="/buzkaza/teaser/webfontkit-20101006-104039/stylesheet.css" type="text/css" />

<script type="text/javascript" src="/buzkaza/teaser/requiered/jquery.js"></script>
<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js"></script>
	
<script language="javascript">
	
function mostrarImagem(imagem){
	window.open(imagem,"mywindow","menubar=0,resizable=0,width=500,height=500");
}
		
</script>

</head>

<body>


<div id="cadastro">
<div id="top_cad">
<a href="http://www.buzkaza.com.br/teaser/"><div id="link_back"></div></a>
</div>
<div id="meio_cad">
<!--FORM-->
<div id="msg_finaliza_cadastro">
  
<!-- MENSAGEM DE ERRO -->
<div>
    <font color="red">
  
		<logic:messagesPresent property="erro">
			<html:messages property="erro" id="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>						
			</html:messages>
		</logic:messagesPresent>
				
		<logic:messagesNotPresent property="erro">
			<logic:present name="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>	
			</logic:present>
				
		</logic:messagesNotPresent>
  	</font>
</div>
  	<br />
    <!-- ****************** -->
    
<div class="MyriadProRegular">
<logic:present name="imovel">
	
	<html:form method="post" styleId="imovelForm" action="/admin/imovel.do?act=aprovarImovel" enctype="multipart/form-data">
	
	<fieldset>
	<legend>Dados do Imóvel</legend>
	<html:hidden property="imovelEntity.codigo" />
	<bean:write name="imovel" property="bairro"/><br>
	<bean:write name="imovel" property="municipio"/><br>
	<bean:write name="imovel" property="logradouro"/><br>
	<bean:write name="imovel" property="metragem"/> m<sup>2</sup><br>
	<bean:write name="imovel" property="quartos"/> quarto(s)<br>
	Proprietário: <b><bean:write name="imovel" property="usuarioProprietario.nome"/></b><br>	
	</fieldset>
	
	<br>
	
	<fieldset>
	<legend>Dados para Aprovação</legend>	
	Planta:<br/>
	&nbsp;&nbsp;&nbsp;Ver Planta: <a href="#" onClick="javascript:mostrarImagem('/buzkaza/imagens_usuarios/${imovel.planta.caminho }');">Ver Planta</a><br/>
	&nbsp;&nbsp;&nbsp;Alterar:<html:file property="planta" styleId="planta" size="20" /><br/>
	Mapa Google Maps:<html:text property="linkGoogleMaps" size="50" value="${imovel.linkGoogleMaps}"/><br/>
	Link YouTube: <html:text property="linkYouTube" size="50" value="${imovel.linkYouTube}"/><br/>	
	</fieldset>

	<br>
	
	<html:submit value="Aprovar"/>
	</html:form>
	
</logic:present>
</div> 

</div>
<!--FORM-->
</div>
<div id="bottom_cad"></div>
</div>
</body>
</html>
