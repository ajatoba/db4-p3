<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza - em casa, onde estiver</title>
<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
		});
</script>
<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script>
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
			<div class="txt_meus_anuncios"><span class="MyriadPro24">Disponibilidade</span></div>		
		</div>
	<div id="sep_top_reserva"></div>
	
	<div id="listagem_reservas">
	
	<div id="separator_listagem"></div>
		<logic:present name="anuncios">
			<logic:iterate id="an"  name="anuncios">		
				<!--BOX COM A RESERVA-->
				<div id="listagem_reservas">
				<!--BOX COM A RESERVA-->
					<bean:write name="an" property="tipoAnuncio.nome" /> de <bean:write name="an" property="dataInicial" format="dd/MM/yyyy"/> a <bean:write name="an" property="dataFinal" format="dd/MM/yyyy"/>	
				<div id="separator_listagem"></div>
			</logic:iterate>
		</logic:present>
	</div>
<!--FIM CADASTRO-->

</div>



</div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>
