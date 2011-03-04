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
	
	
	<script language="javascript">
	$(function(){
			$('form').jqTransform({imgPath:'jqtransformplugin/img/'});
	});
	
	$(function(){
		/*
			$('#sep_top_reserva').corner('rounded 7px');
		
			$("#busca_home").corner("bottom 7px");
			$("#mapa_").corner("bottom 7px");
		*/
		});
		
</script>
</head>

<body>

<div id="conteudo"> 
  <!--TOPO-->
  <div id="top">
    <div class="topo_menu">
      <div class="txt_01">Você está: Pág. Inicial</div>
      <div class="txt_02">Quem Somos</div>
      <div class="txt_03">Mapa do Site</div>
      <div class="txt_04">Contato</div>
      <div class="txt_05">Ajuda</div>
      <div class="txt_06">Redes Sociais</div>
      <div class="twitter"></div>
      <div class="facebook"></div>
    </div>
    <div class="tracejado_top"></div>
    <div class="linha_logo">
      <div class="logo"></div>
      <div class="options"></div>
    </div>
    <div class="bottom_menu">
      <a href="/DB4-BuskazaWeb/imovel.do?act=formBuscarImovel"><div class="btn_alugar">alugar imóvel</div></a>
      <a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovel"><div class="btn_anunciar">anunciar imóvel</div></a>
      <a href="http://www.buzkaza.com.br/blog/" target="_black"><div class="btn_blog">blogs</div></a>
      <div class="btn_login">Efetuar login</div>
      <a href="/DB4-BuskazaWeb/usuario.do?act=formIncluirUsuario"><div class="btn_cadastre_se"></div></a>
    </div>
  </div>
</div>


<!--CADASTRO-->

<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_meus_anuncios">
		<span class="MyriadPro24">Detalhe do Imóvel</span>
	</div>
</div>

</div>
<div id="sep_top_reserva"></div>
<div id="listagem_reservas">
<div class="topo_edicao">
<div class="mapa_planta"><img src="/buzkaza/_img/adm_meusanuncios_editar_05.png" width="195" height="145" /></div>

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


<table width="70%" border="1"> 
  <tr>
  	<td width="35%">
  	<img src="/buzkaza/imagens_usuarios/<bean:write name="imovel" property="primeirafoto"/>" width="140" height="104" />
  	<br/>
  	<logic:notEmpty name="imovel" property="fotos">
  		<logic:iterate name="imovel" property="fotos" id="fotoImovel">
  			<img src="/buzkaza/imagens_usuarios/<bean:write name="fotoImovel" property="caminhoThumbnail"/>" />
  		
  		</logic:iterate>
  	</logic:notEmpty>
  	</td>
    <td width="35%">
    	Bairro:<bean:write name="imovel" property="bairro"/><br>
    	Logradouro:<bean:write name="imovel" property="logradouro"/><br/>  
		Distancia do Centro:<bean:write name="imovel" property="distanciaCentro"/><br />
		Tipo:${imovel.tipoImovel.nome}<br />
		Quartos:${imovel.quartos}<br />
		Metragem:${imovel.metragem}m<sup>2</sup><br />
		Capacidade:${imovel.capacidade} pessoas<br />
		Camas:${imovel.camas}<br />
		Video:<bean:write name="imovel" property="linkYouTube"/><br />
    </td>
  </tr>
  <tr>
  	<td>
  	<img src="/buzkaza/imagens_usuarios/${imovel.planta.caminho}" width="140" height="104" /><br/>
  	${imovel.linkGoogleMaps }  	
  	</td>
  	<td>
  	EQUIPAMENTOS<br/>
  	<logic:notEmpty name="imovel" property="equipamentos">
  		<logic:iterate name="imovel" id="equipamentos" id="equipamento">
  			<bean:write name="equipamento" property="descricao"/>" />  		
  		</logic:iterate>
  	</logic:notEmpty>
  	</td>
  </tr>
 
</table>




<div id="formulario_edicao">
<div class="left_formulario_">

</div>
<div class="right_formulario_">

</div>
</div>
</div>

</div>
<div class="bottom_formulario"></div>
<div class="linha_cinza"></div>


<jsp:include page="../usuario/rodape.jsp"/>

</body>
</html>

