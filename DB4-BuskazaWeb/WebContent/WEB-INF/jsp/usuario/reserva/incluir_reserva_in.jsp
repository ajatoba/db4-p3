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
<title>Buzkaza - Incluir Reserva</title>

<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/size_campos.css"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/detalhe_imovel.css"/>



<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />

<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>

<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>


<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>

<script language="javascript">

$(document).ready(function()
{
/*
	$('iframe').load(function()
			{
				this.style.width = 341 + 'px';
				this.style.height = 271 + 'px';
			}
		);
	*/
	$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
}
);
</script>
</head>
<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>

<!--CADASTRO-->
<div id="cont_reserva2">

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

<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_meus_anuncios">Solicitação de Reserva</div>
</div>

</div>
<div id="sep_top_reserva_fina"></div>
<div id="listagem_reservas">

<div class="topo_edicao">
	<div class="mapa_planta_reserva"><img src="/buzkaza/imagens_usuarios/${reserva.imovel.primeirafoto}" width="140" height="104" /></div>


	<div class="endereco_bairro">
			<table width="100%" border="0" > 
			  <tr valign="top">
			    <td width="35%" valign="top">
			    	<span class="tit_azul_detalhes">${reserva.imovel.bairro}, ${reserva.imovel.estado.codigo} </span><br />
	    			<span class="txt_cinza_detalhes">${reserva.imovel.logradouro}<br />
	    			id: ${reserva.imovel.codigo}</span>
			    </td>
			    <td width="65%" valign="top">
				    <span class="txt_cinza_detalhes">
				      Distância do centro: ${reserva.imovel.distanciaCentro}<br />
				      <a href="${reserva.imovel.linkGoogleMaps}">Mapa(Google Maps)</a><br />
				      <a href="${reserva.imovel.linkYouTube}">Vídeo(YouTube)</a><br />
				      </span>			      
			    </td>
			  </tr>
			</table>
	</div>
</div>




<div id="sep_top_reserva"></div>

<div class="meio_calculo_reserva">

	<div class="calculo_reserva">
            <div class="calculo_cinza">
                    <div class="calculo_total_info">Total da Reserva:</div>
                    <div class="calculo_total_valor">R$ ${reserva.valor}</div>
            </div>
            <div class="calculo_amarelo">
                    <div class="calculo_total_info">Sinal 10%:</div>
                    <div class="calculo_total_valor">R$ ${(reserva.valor*10/100)}</div>
            </div>
            <div class="calculo_cinza">
                    <div class="calculo_total_info">Saldo no Check in:</div>
                    <div class="calculo_total_valor">R$ <bean:write name="reserva" property="valor" format="00.00"/></div>
            </div>
    </div>
    
    <div class="data_reserva_info">
    		<div class="box_data_reserva">
                    <ul class="data_reserva_ul">
                        <li class="data_texto1">Chegada</li>
                        <li class="data_texto2">20</li>
                        <li class="data_texto3">03/2011</li>
                    </ul>
            </div>
            <div class="box_data_reserva">
            		<ul class="data_reserva_ul">
                        <li class="data_texto1">Partida</li>
                        <li class="data_texto2"><bean:write name="reserva" property="periodoInicial" format="dd"/></li>
                        <li class="data_texto3"><bean:write name="reserva" property="periodoInicial" format="MM"/>/<bean:write name="reserva" property="periodoInicial" format="MM"/></li>
                    </ul>
            </div>
            <div class="box_data_reserva">
            		<ul class="data_reserva_ul">
                        <li class="data_texto1">Total</li>
                        <li class="data_texto2"><bean:write name="reserva" property="periodoFinal" format="dd"/></li>
                        <li class="data_texto3"><bean:write name="reserva" property="periodoFinal" format="MM"/>/<bean:write name="reserva" property="periodoFinal" format="yyyy"/></li>
                    </ul>
            </div>
    </div>
</div>

<div class="pagamento_info">

<span class="titulo_azul">Pagamento</span><br /><br />

<strong>Sinal(10%)</strong><br />
O pagamento pagamento pagamento pagamento pagamento pagamento<br /><br />



<strong>Saldo no check in</strong><br />

Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum is simply dummy text of the printing and typesetting industry.

<br /><br />



</div>


<div id="sep_top_reserva"></div>


<html:form action="/usuario/reserva.do?act=incluirReserva" method="POST" >
	    
<logic:equal name="reserva" property="imovel.permiteOpcaoPagamento" value="true">
	<!-- 
	  	<html:radio property="valor" value="${(reserva.valor*10/100)}">Opção 1: </html:radio><br>
	   	Valor: R$ ${(reserva.valor*10/100)}
	   	
	   	<html:radio property="valor" value="${reserva.valor}">Opção 2: </html:radio><br>
	   	<bean:write name="reserva" property="valor" format="00.00"/>
	-->	
	<html:hidden property="valor" value="${(reserva.valor*10/100)}" />
</logic:equal>
<logic:notEqual name="reserva" property="imovel.permiteOpcaoPagamento" value="true">
	<html:hidden property="valor" value="${reserva.valor}"/>
</logic:notEqual>
		    

		    
<html:hidden property="codigoImovel" value="${reserva.imovel.codigo}"/> 
<html:hidden property="diaPeriodoInicial" value="${reserva.periodoInicial.date}"/>	
<html:hidden property="mesPeriodoInicial" value="${(reserva.periodoInicial.month)+1}"/>
<html:hidden property="anoPeriodoInicial" value="${(reserva.periodoInicial.year)+1900}"/>
<html:hidden property="diaPeriodoFinal" value="${reserva.periodoFinal.date}"/>	
<html:hidden property="mesPeriodoFinal" value="${(reserva.periodoFinal.month)+1}"/>
<html:hidden property="anoPeriodoFinal" value="${(reserva.periodoFinal.year)+1900}"/>

	    
<div class="form_efeutar_pagamento">
	<input value="Confirmar" type="image" src="/buzkaza/_img/btn_efetuar_pagamento.jpg" class="btn_efetuar_pagamento" />
</div>

</html:form>


</div>

</div>




</div>

</div>


<br /><br />

<jsp:include page="../rodape.jsp"/>

</body>
</html>
