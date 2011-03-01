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
<title>Detalhe do Imóvel</title>

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.js"></script>
<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.ui.draggable.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.alerts.js" ></script>

<link rel="stylesheet" type="text/css" href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/jquery.alerts.css"  />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/cadastro.css"  />
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
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/buzkaza/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/buzkaza/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/buzkaza/images/top_03.jpg" width="991" height="77" /></div>
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

</body>
</html>
