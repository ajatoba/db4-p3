<%@page import="java.util.*"%>
<%@page import="br.com.db4.buskaza.controller.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/formatter.tld" prefix="ff" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza - em casa, onde estiver</title>

<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/size_campos.css"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/detalhe_imovel.css"/>
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>
<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />
<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
<script type="text/javascript" src="/buzkaza/_js/function_calcular_data.js"></script>
<script language="javascript">
$(document).ready(function()
{
	$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
}
);
</script>
<script>
$(function(){
$('#sep_top_reserva').corner('rounded 7px');

	$("#busca_home").corner("bottom 7px");
	$("#mapa_").corner("bottom 7px");
	});
</script>
<script>
function abrirPop(url){
	window.open(url,"fotos","menubar=0,resizable=0,width=600,height=500, scrollbars=1");
}
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
		<div class="txt_meus_anuncios"><span class="MyriadPro24">Solicita��o de Reserva</span></div>
	</div>
</div>

<div id="sep_top_reserva"></div>

<div id="listagem_reservas">
	<div class="topo_edicao">
	<div class="mapa_planta_reserva"><img src="/buzkaza/imagens_usuarios/${reserva.imovel.primeirafoto}" width="140" height="104" /></div>

	<div class="endereco_bairro">
			<table width="100%" border="0" > 
			  <tr valign="top">
			    <td width="58%" valign="top">
			    	<span class="tit_azul_detalhes">${reserva.imovel.bairro}, ${reserva.imovel.municipio} - ${reserva.imovel.estado.codigo}</span><br />
	    			<span class="txt_cinza_detalhes">${reserva.imovel.logradouro}, ${reserva.imovel.numero} - ${reserva.imovel.complemento} - Cep ${reserva.imovel.cep}<br />    					
    				<strong>ID do im�vel:</strong> ${reserva.imovel.usuarioProprietario.codigo}-${reserva.imovel.codigo}</span>
			    </td>
			    <td width="42%" valign="top">
				    <span class="txt_cinza_detalhes">
				    	<span class="arial12boldazul">Perfil do Im�vel:</span> ${reserva.imovel.tipoImovel.nome}<br />
				      	<span class="arial12boldazul">Dist�ncia do centro:</span> ${reserva.imovel.distanciaCentro}km<br />					    					    
					    
					    <div class="icons_admin">
					    <logic:notEmpty name="reserva" property="imovel.linkGoogleMaps">
								<a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_mapa' class="thickbox link_reserva_detalhe"><div class="icon_mapa_admin">Mapa</div></a>
						</logic:notEmpty>
						<logic:empty name="reserva" property="imovel.linkGoogleMaps">
								<div class="icon_nomapa_admin">Sem mapa</div>
						</logic:empty>		
										
						<logic:notEmpty name="reserva" property="imovel.linkYouTube">
								<a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_youtube' class="thickbox link_reserva_detalhe"><div class="icon_youtube_admin">V�deo</div></a>
						</logic:notEmpty>						
						<logic:empty name="reserva" property="imovel.linkYouTube">
								<div class="icon_noyoutube_admin">Sem v�deo</div>
						</logic:empty>
						
						<a href='#TB_inline?height=570&amp;width=610&inlineId=thickbox_foto' class="thickbox"><div class="icon_fotos_admin">Fotos</div></a>
						<div id="thickbox_foto" style="visibility:hidden; display:none;">			
							<iframe src="/DB4-BuskazaWeb/imovel/foto.do?act=listarFotosImovel&ci=${reserva.imovel.codigo}" id="id" name="id" allowtransparency="0" scrolling="no"  class="iframe_foto" noframeborder="0"  frameborder="0"></iframe>
						</div>
						
						</div>
					    
					    
					    <div id="thickbox_mapa" style="visibility:hidden; display:none;">            
			            	<div class="topo">
			                    <div id="titulo">Mapa</div>
			                </div>
							<div class="meio">            
			            		<div class="divmapa">
			            				${reserva.imovel.linkGoogleMaps}
			                    </div>
			                    <script language="javascript">
									$(document).ready(function(){
										$('.divmapa iframe').css({'width': '560px', 'height': '300px' });
									});
								</script>                
			                </div>    
			                <div class="baixo"></div>
						</div>
						
						<div id="thickbox_youtube" style="visibility:hidden; display:none;">            
			            	<div class="topo">
			                    <div id="titulo">V�deo</div>
			                </div>
							<div class="meio">            
			            		<div class="divmapa">
			            				${reserva.imovel.linkYouTube}
			                    </div>
			                                        
			                </div>    
			                <div class="baixo"></div>
						</div>
				   </span>			      
			    </td>
			  </tr>
			</table>
	</div>
</div>

<div id="sep_top_reserva_fina"></div>

<div class="meio_calculo_reserva">

	<div class="calculo_reserva">
            <div class="calculo_cinza">
                    <div class="calculo_total_info">Total da Reserva:</div>
                    <div class="calculo_total_valor">R$ <ff:format value="${( reserva.valor + ( reserva.valor *15/100))}"/></div>
            </div>
            <div class="calculo_amarelo">
                    <div class="calculo_total_info">Sinal:</div>
                    <div class="calculo_total_valor">R$ <ff:format value="${(reserva.valor*15/100)}"/>
                    </div>
            </div>
            <div class="calculo_cinza">
                    <div class="calculo_total_info">Saldo no Check in:</div>
                    <div class="calculo_total_valor">R$ <ff:format value="${reserva.valor}"/></div>
            </div>
    </div>
    
    <div class="data_reserva_info">
    		<div class="box_data_reserva">
                    <ul class="data_reserva_ul">
                        <li class="data_texto1">Chegada</li>
                        <li class="data_texto2"><bean:write name="reserva" property="periodoInicial" format="dd"/></li>
                        <li class="data_texto3"><bean:write name="reserva" property="periodoInicial" format="MM"/>/<bean:write name="reserva" property="periodoInicial" format="yyyy"/></li>
                    </ul>
            </div>
            <div class="box_data_reserva">
            		<ul class="data_reserva_ul">
                        <li class="data_texto1">Partida</li>
                        <li class="data_texto2"><bean:write name="reserva" property="periodoFinal" format="dd"/></li>
                        <li class="data_texto3"><bean:write name="reserva" property="periodoFinal" format="MM"/>/<bean:write name="reserva" property="periodoFinal" format="yyyy"/></li>
                    </ul>
            </div>
            <div class="box_data_reserva">
            		<ul class="data_reserva_ul">
                        <li class="data_texto1">Total</li>
                        <li class="data_texto2" id="data_total">                       
                        <script language="javascript">
                        <!--
                        		calcularData( '<bean:write name="reserva" property="periodoInicial" format="dd/MM/yyyy"/>', '<bean:write name="reserva" property="periodoFinal" format="dd/MM/yyyy"/>');
                     	-->
                     	</script>
                     	<li class="data_texto1">Dias</li>
                     	</li>
                    </ul>
            </div>
    </div>
</div>

<div class="pagamento_info">
	<span class="arial12boldazul">Pagamento</span><br /><br />
	<strong>Sinal</strong><br />
	O Sinal ser� debitado do cart�o de cr�dito do hospede na confirma��o da reserva. Este valor � referente a taxa de transa��o do Buzkaza.
	<br /><br />
	<strong>Saldo no check in</strong><br />
	O Saldo ser� pago diretamente ao propriet�rio, conforme instru��es de pagamento.
	<br /><br />
</div>

<br />
<div id="sep_top_reserva_fina2"></div>
<br />

<html:form action="/usuario/reserva.do?act=incluirReserva" method="POST" >
	    
<logic:equal name="reserva" property="imovel.permiteOpcaoPagamento" value="true">
	<!-- 
	  	<html:radio property="valor" value="${(reserva.valor*10/100)}">Op��o 1: </html:radio><br>
	   	Valor: R$ ${(reserva.valor*10/100)}
	   	
	   	<html:radio property="valor" value="${reserva.valor}">Op��o 2: </html:radio><br>
	   	<bean:write name="reserva" property="valor" format="00.00"/>
	-->	
	<html:hidden property="valor" value="${reserva.valor}" />
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

	    
<div class="btnConfirmarReserva">
	<input value="Confirmar" type="image" src="/buzkaza/_img/btn_confirmar_reserva.jpg" class="btn_efetuar_pagamento" />
</div>

</html:form>

			</div>
		</div>
	</div>
</div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>
