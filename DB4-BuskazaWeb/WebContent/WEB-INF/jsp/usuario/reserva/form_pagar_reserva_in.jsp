<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Buzkaza - Pagar Reserva</title>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/cadastro.css"/>

	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css" />
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css" />
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/size_campos.css"/>
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/detalhe_imovel.css"/>
	
	<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>	
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	<script type="text/javascript" src="/buzkaza/_js/function_calcular_data.js"></script>

<script>
	$(function(){
	
	$('#sep_top_reserva').corner('rounded 7px');
	
	});			
</script>
</head>

<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>


<div id="cont_reserva2">

<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_meus_anuncios">Pagar Reserva</div>
</div>

</div>
<div id="sep_top_reserva_fina"></div>

<div id="listagem_reservas">


	<logic:present name="reservaPagar">

		
<div class="topo_edicao">
	<div class="mapa_planta_reserva"><img src="/buzkaza/imagens_usuarios/${reservaPagar.imovel.primeirafoto}" width="140" height="104" /></div>

	<div class="endereco_bairro">
			<table width="100%" border="0" > 
			  <tr valign="top">
			    <td width="35%" valign="top">
			    	<span class="tit_azul_detalhes">${reservaPagar.imovel.bairro}, ${reservaPagar.imovel.estado.codigo}</span><br />
	    			<span class="txt_cinza_detalhes">${reservaPagar.imovel.logradouro}<br />id: ${reservaPagar.imovel.codigo}</span>
			    </td>
			    <td width="65%" valign="top">
				    <span class="txt_cinza_detalhes">
				      	Distância do centro: ${reservaPagar.imovel.distanciaCentro}<br />
					    <a href='${reservaPagar.imovel.linkGoogleMaps}' class="link_reserva_detalhe">Mapa(Google Maps)</a><br />
					    <a href='${reservaPagar.imovel.linkYouTube}' class="link_reserva_detalhe">Vídeo(YouTube)</a><br />
				   </span>			      
			    </td>
			  </tr>
			</table>
	</div>
</div>
<div id="sep_top_reserva"></div>

		<fieldset>
		<legend><b>Dados da Reserva</b></legend>
		<table cellspacing="10" >
		<tr>
			<td>
			Valor:
			<logic:equal name="reservaPagar" property="imovel.permiteOpcaoPagamento" value="true"> 
			10%
			</logic:equal>
			<bean:write name="reservaPagar" property="valor" format="00.00"/><br>
			de <bean:write name="reservaPagar" property="periodoInicial" format="dd/MM/yyyy"/>
			a  <bean:write name="reservaPagar" property="periodoFinal" format="dd/MM/yyyy"/>
			<br>
			</td>
		</tr>
		</table>
		
		</fieldset>
		
		<fieldset>
		<legend><b>Forma de Pagamento</b></legend>
		<table cellpadding="10" cellspacing="10">
		<tr>
			<td>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_cart">
					<input type="hidden" name="business" value="silvio@buzkaza.com.br">
					<input type="hidden" name="currency_code" value="BRL">
					<input type="hidden" name="amount" value="<bean:write name="reservaPagar" property="valor" format="##.##"/>">
					<input type="hidden" name="item_name" value="Aluguel do Imóvel de Código:${reservaPagar.imovel.codigo}">
					<input type="hidden" name="item_number" value="${reservaPagar.codigo}">
					<input type="hidden" name="shopping_url" value="http://www.buzkaza.com.br">				
					<input type="hidden" name="add" value="1">				
					<input type="image" src="http://www.paypal.com/en_US/i/btn/sc-but-01.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
				</form>
			</td>
			<td>
				<form action="https://www.moip.com.br/PagamentoMoIP.do" method="post" name="moip" id="moip">
					<input type="hidden" name="id_carteira" value="buzkaza">			
					<input type="hidden" name="valor" value="<bean:write name="reservaPagar" property="valor" format="###"/>00">
					<input type="hidden" name="nome" value="${reservaPagar.locatario.nome}">
					<input type="hidden" name="pagador_nome" value="${reservaPagar.locatario.nome}">
					<input type="hidden" name="pagador_email" value="${reservaPagar.locatario.email}">
					<input type="hidden" name="id_transacao" value="${reservaPagar.codigo}">
					<input type="hidden" name="descricao" value="Aluguel do Imóvel de Código:${reservaPagar.imovel.codigo}">
					<input type="hidden" name="url_retorno" value="http://www.buzkaza.com.br">
					<a href="#" onclick="javascript:document.moip.submit();" border="0"><img src="http://www.moip.com.br/img/novas/moip.gif" border="0" width="70" height="35"/></a>
					
				</form>
			</td>
		</tr>
		</table>
		</fieldset>
	</div>
	</logic:present>
	
	<logic:notPresent name="reservaPagar">
		Não é possível pagar essa reserva.
	</logic:notPresent>


<br /><br /><br /><br />


<!--FIM CADASTRO-->
</div></div></div>

	<jsp:include page="../rodape.jsp"/>

</div>
</body>
</html>
