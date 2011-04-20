<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Buzkaza - Minhas Reservas</title>
	
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/cadastro.css"/>
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css" />
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css" />
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/detalhe_imovel.css"/>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/webfontkit-20101006-104039/stylesheet.css"/>
	<link rel="stylesheet" type="text/css" href="/buzkaza/webfontkit-20110225-090425/stylesheet.css"/>
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	<script type="text/javascript" src="/buzkaza/_js/function_calcular_data.js"></script>
	
</head>

<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>
<%
	int index = 0;
%>

<!--CADASTRO-->


<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_meus_anuncios">Minhas Reservas</div>
</div>
<div id="sep_top_reserva"></div>

<logic:present name="reservas">


<logic:iterate id="res" name="reservas">
<!--BOX COM A RESERVA-->
<div id="box_listagem">
<div class="foto_reserva"><img src="/buzkaza/imagens_usuarios/<bean:write name="res" property="imovel.primeirafoto"/>" width="140" height="104" /></div>
<div class="detalhe_reserva">
<div class="bairro_reserva">


<span class="tit_azul2">${res.imovel.bairro}, ${res.imovel.municipio} - ${res.imovel.estado.codigo}</span><br />
<span class="txt_cinza_detalhes">${res.imovel.logradouro}, ${res.imovel.numero} - ${res.imovel.complemento} - Cep ${res.imovel.cep}</span>

	
</div>
<div class="data_reserva_de"><span class="tit_azul2">De</span><br /><bean:write name="res" property="periodoInicial" format="dd/MM/yyyy"/></div>
<div class="data_reserva_ate"><span class="tit_azul2">Até</span><br /><bean:write name="res" property="periodoFinal" format="dd/MM/yyyy"/></div>
<div class="nota_reserva">
<%
	index = index+1;
%>
<span class="txt_cinza_detalhes">
	Valor de <span id="data_total_<% out.print( index ); %>_${res.imovel.codigo}"></span> dia(s)&nbsp;
	R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( res.valor + ( res.valor *10/100))}"/>
</span>


<script language="javascript">
<!--
	calcularDataListaReserva( '<bean:write name="res" property="periodoInicial" format="dd/MM/yyyy"/>', '<bean:write name="res" property="periodoFinal" format="dd/MM/yyyy"/>', 'data_total_<% out.print( index ); %>_${res.imovel.codigo}');
-->
</script>
</div>
<div class="total_reserva">

</div>
<div class="visualizar_reserva"></div>
</div>
<div class="status_reserva">

			<logic:equal name="res" property="status" value="0">Em análise</logic:equal>
			<logic:equal name="res" property="status" value="1">Aprovada<br />
			
			<form action="https://www.moip.com.br/PagamentoMoIP.do" method="post" name="moip<% out.print( index ); %>" id="moip<% out.print( index ); %>">
				<input type="hidden" name="id_carteira" value="buzkaza">			
				<input type="hidden" name="valor" id="valor_reserva" value="${(res.valor*10/100)}00">
				<input type="hidden" name="nome" value="${res.locatario.nome}">
				<input type="hidden" name="pagador_nome" value="${res.locatario.nome}">
				<input type="hidden" name="pagador_email" value="${res.locatario.email}">
				<input type="hidden" name="id_transacao" value="${res.codigo}">
				
				
				<input type="hidden" name="pagador_cidade" value=""/>
				<input type="hidden" name="pagador_estado" value=""/>
				<input type="hidden" name="pagador_cep" value=""/>
										
										
				<input type="hidden" name="descricao" value="Aluguel do Imóvel de Código:${res.imovel.codigo}">
				<input type="hidden" name="url_retorno" value="http://www.buzkaza.com.br">
				<a href="#" onclick="javascript:document.moip<% out.print( index ); %>.submit();" border="0">Efetuar pagamento</a>		
			</form>
			<script language="javascript">
                <!--
                	calcularvalorMoip( '<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${((res.valor*10/100))}"/>', '<bean:write name="res" property="valor" format="00.00"/>');
                -->
            </script>
                
				<!-- 
				<a href="/DB4-BuskazaWeb/usuario/reserva.do?act=formPagarReserva&cr=${res.codigo}">Efetuar pagamento</a> -->
			</logic:equal>
			<logic:equal name="res" property="status" value="2">Negada</logic:equal>
			<logic:equal name="res" property="status" value="3">Paga</logic:equal>
				
</div>

</div>
<div id="separator_listagem"></div>


<!--BOX COM A RESERVA-->
</logic:iterate>
</logic:present>

<logic:notPresent name="reservas">
<div id="box_listagem"><span class="txt_caracteristicas_desc">Não há reservas</span></div>
</logic:notPresent>

<!--FIM CADASTRO-->

</div></div></div>

<jsp:include page="../rodape.jsp"/>

</div>
</body>
</html>
