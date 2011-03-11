<%@page import="java.util.*"%>
<%@page import="br.com.db4.buskaza.controller.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza - Detalhe do Imóvel</title>

	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	
	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.js"></script>
	<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.ui.draggable.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.alerts.js" ></script>
	
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/jquery.alerts.css"  />
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>
	<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />
	
	<link href="/buzkaza/_css/detalhe_imovel.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	
	<script language="javascript">

	$(document).ready(function()
	{
		$('iframe').load(function()
				{
					this.style.width = 341 + 'px';
					this.style.height = 271 + 'px';
				}
			);
		
		$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
	}
	);

	
	$(function(){
		
			$('#sep_top_reserva').corner('rounded 7px');
			
		});
		
</script>
</head>

<body>

<jsp:include page="../usuario/topo.jsp"/>


<!--CADASTRO-->

<div id="cont_reserva">

<!-- MENSAGEM DE ERRO -->
    <font color="red">  
		<logic:messagesPresent property="erro">
			<html:messages property="erro" id="erro">
				<bean:write name="erro"/>    			
			</html:messages>
		</logic:messagesPresent>
				
		<logic:messagesNotPresent property="erro">
			<logic:present name="erro">
				<bean:write name="erro"/>
			</logic:present>				
		</logic:messagesNotPresent>
  	</font>
    <!-- ****************** -->


	<div class="barra_top">
	<div class="aba_detalhes"><span class="txt_cinza_detalhes">Detalhes</span></div>
	<div class="aba_comments"></div>
	</div>
  	
  	<!--left-->
	<div class="left_detalhe">
			<div class="foto_big"><img src="/buzkaza/imagens_usuarios/<bean:write name="imovel" property="primeirafoto"/>" width="341" height="271" />
	</div>
	
	<div class="thumbs_fotos">
		<logic:notEmpty name="imovel" property="fotos">
  			<logic:iterate name="imovel" property="fotos" id="fotoImovel">
  				<img src="/buzkaza/imagens_usuarios/<bean:write name="fotoImovel" property="caminhoThumbnail"/>" />  		
  			</logic:iterate>
  		</logic:notEmpty>
  	</div>
	
	<div class="chamada_planta">Planta</div>
	
	<div class="planta_big"><img src="/buzkaza/imagens_usuarios/${imovel.planta.caminho}"  width="341" height="271" /></div>
	
	<div class="chamada_mapa">Mapa</div>
	
	<div class="mapa_big">${imovel.linkGoogleMaps }</div>
	
	</div>
	<!--left-->
  	
   	<!--right-->
	<div class="right_detalhe">
    	<span class="txt_cinza_detalhes">
    	
    	<span class="tit_azul_detalhes"><bean:write name="imovel" property="bairro"/>, <bean:write name="imovel" property="logradouro"/></span><br />
    	<span class="txt_cinza_detalhes"><bean:write name="imovel" property="logradouro"/></span><br /><br />
    	 
		<span class="txt_azul_peq_detalhes">Distancia do Centro</span>&nbsp; : <bean:write name="imovel" property="distanciaCentro"/><br />
		<span class="txt_azul_peq_detalhes">Tipo</span>&nbsp; : ${imovel.tipoImovel.nome}<br />
		<span class="txt_azul_peq_detalhes">Quartos</span>&nbsp;: ${imovel.quartos}<br />
		<span class="txt_azul_peq_detalhes">Metragem</span>&nbsp; : ${imovel.metragem}m<sup>2</sup><br />
		<span class="txt_azul_peq_detalhes">Capacidade</span>&nbsp; : ${imovel.capacidade} pessoas<br />
		<span class="txt_azul_peq_detalhes">Camas</span>&nbsp; : ${imovel.camas}<br />
		<span class="txt_azul_peq_detalhes">Video</span>&nbsp;: <bean:write name="imovel" property="linkYouTube"/>
		</span>
		
		
	  	<logic:notEmpty name="imovel" property="equipamentos">
	  		<span class="tit_azul_detalhes">Equipamentos</span><br/>
	  		<logic:iterate name="imovel" id="equipamentos" id="equipamento">
	  			<bean:write name="equipamento" property="descricao"/>" />  		
	  		</logic:iterate>
	  	</logic:notEmpty>
  	
	</div>

</div>

</div>
<div class="bottom_formulario"></div>
<div class="linha_cinza"></div>


<jsp:include page="../usuario/rodape.jsp"/>

</body>
</html>

