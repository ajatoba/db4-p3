<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>
<!-- 
<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
 -->
<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script>
$(function(){
	/*
	$('#sep_top_reserva').corner('rounded 7px');

	$("#busca_home").corner("bottom 7px");
	$("#mapa_").corner("bottom 7px");
	*/
	});

	function openWindow(url){
		window.open(url,"mywindow","menubar=0,resizable=0,width=600,height=600,scrollbars=1,location=0");
	}

	function excluirAnuncio()
	{
		if (confirm("Deseja excluir o anúncio?"))
		{
			
		}	
	}
		
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

<div id="site">
<!--CADASTRO-->


<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
<div class="txt_meus_anuncios"><span class="MyriadPro24">Meus Anúncios</span></div>

</div>
<div id="sep_top_reserva"></div>

<div id="listagem_reservas">

<logic:present name="imoveis">
<logic:iterate id="ims"  name="imoveis">
<!--BOX COM A RESERVA-->

<html:form method="post" styleId="imovelForm" action="/usuario/imovel.do?act=excluirImovel" enctype="multipart/form-data">
<html:hidden property="imovelEntity.codigo" value="${ims.codigo}"/>

<div id="box_listagem">
<div class="foto_reserva"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="primeirafoto"/>" width="132" height="99" /></div>
<div class="detalhe_reserva">
  <div class="bairro_reserva">${ims.bairro} -${ims.estado.codigo}<br>
    <span class="nome_rua">${ims.logradouro}</span></div>
  <div class="nota_reserva"><span class="id_imoves">id: <bean:write name="ims" property="codigo"/></span></div>
  <div class="visualizar_reserva">
    <logic:equal name="ims" property="status" value="0">Em análise &nbsp;&nbsp;</logic:equal>    
    <logic:equal name="ims" property="status" value="2"><a href="/DB4-BuskazaWeb/usuario/anuncio.do?act=formCadastroAnuncio&ci=${ims.codigo}" class="link_azul">Disponibilidade/Preços</a> &nbsp;&nbsp; </logic:equal>    
    <logic:notEmpty name="ims" property="anuncios"><!-- <a href="/DB4-BuskazaWeb/usuario/anuncio.do?act=listarAnunciosImovel&ci=${ims.codigo}" class="link_azul">Ver Disponibilidade</a> &nbsp;&nbsp; --> </logic:notEmpty>
    <logic:equal name="ims" property="status" value="1"><a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovelComp&ci=${ims.codigo}" class="link_azul">Editar Anúncio</a> &nbsp;&nbsp; </logic:equal>
  	<a href="javascript:excluirAnuncio()" class="link_azul">Excluir Anúncio</a>
  	 <!-- 
  <html:submit> Excluir Imóvel </html:submit>
  -->
  
  </div>
  
</div>
	<logic:notEmpty name="ims" property="reservas">
			<div class="status_anuncio">
					<div class="verde_anuncio"><a href="#" onclick="javascript:openWindow('/DB4-BuskazaWeb/usuario/reserva.do?act=listarReservasImovel&ci=${ims.codigo}&status=0');" style="color:#90b821;">Você tem 2 pedidos de reserva</a></div>
			</div>
	</logic:notEmpty>
</div>      
<div id="separator_listagem"></div>

<br>
  
 
  
</html:form>

	 </logic:iterate>  
</logic:present>
</div>

</div></div>

<!--fimconteudo-->

</div>

<jsp:include page="../rodape.jsp"/>


</body>
</html>
