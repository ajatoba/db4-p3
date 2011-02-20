<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Pagar Reserva</title>
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/buzkaza/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/buzkaza/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/buzkaza/images/top_03.jpg" width="991" height="77" /></div>
<!--CADASTRO-->

<jsp:include page="../menu.jsp"/>

<div id="cont_reserva">

	<div id="meio_reserva">
		<div class="top_reserva">
			<div class="txt_minha_reserva">
				<span class="MyriadPro24">Pagar Reserva</span>
			</div>
		</div>
	</div>

	<div id="sep_top_reserva"></div>

	<logic:present name="reservaPagar">
		<div class="MyriadProRegular">
		<fieldset>
		<legend><b>Dados do Imóvel</b></legend>
		<table cellspacing="10" align="left" >
			<tr>
				<td>
					<img src="/buzkaza/imagens_usuarios/<bean:write name="reservaPagar" property="imovel.primeirafoto"/>" width="140" height="104" />					
				</td>
				<td>
				<bean:write name="reservaPagar" property="imovel.logradouro"/>-
				<bean:write name="reservaPagar" property="imovel.bairro"/>, 
				<bean:write name="reservaPagar" property="imovel.municipio"/>
				<br>
				a <bean:write name="reservaPagar" property="imovel.distanciaCentro" format="00.00"/>km do Centro<br>
				<bean:write name="reservaPagar" property="imovel.metragem" format="00"/>m<sup>2</sup>, com capacidade para <bean:write name="reservaPagar" property="imovel.capacidade"/> pessoa(s)<br>
				Link no Google Maps:<bean:write name="reservaPagar" property="imovel.linkGoogleMaps"/><br>
				Link no YouTube:<bean:write name="reservaPagar" property="imovel.linkYouTube"/><br>
				<br>
				</td>
			</tr>
			
		</table>
		</fieldset>
		<fieldset>
		<legend><b>Dados da Reserva</b></legend>
		<table cellspacing="10" >
		<tr>
			<td>
			Valor:<bean:write name="reservaPagar" property="valor" format="00.00"/><br>
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
			<FORM action="https://www.paypal.com/cgi-bin/webscr" method="post">
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
				<input type="hidden" name="valor" value="<bean:write name="reservaPagar" property="valor" format="#"/>">
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

<!--FIM CADASTRO-->

	<div id="linha_meio"></div>
	<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
	<div id="linha_cinza"></div>
	<div id="bottom"></div>

</div>
</body>
</html>
