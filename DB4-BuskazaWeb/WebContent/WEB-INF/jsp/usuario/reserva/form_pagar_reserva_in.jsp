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
<script>
function abrirPop(url){
	window.open(url,"fotos","menubar=0,resizable=0,width=600,height=500, scrollbars=1");
}
</script>
</head>

<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>

<div id="cont_reserva2">

<div id="meio_reserva">
	<div class="top_reserva">
		<div class="txt_meus_anuncios"><span class="MyriadPro24">Efetuar Pagamento</span></div>
	</div>
</div>

<div id="sep_top_reserva"></div>

<div id="listagem_reservas">
	<logic:present name="reservaPagar">
		<div class="topo_edicao">
		<div class="mapa_planta_reserva"><img src="/buzkaza/imagens_usuarios/${reservaPagar.imovel.primeirafoto}" width="140" height="104" /></div>

		<div class="endereco_bairro">
			<table width="100%" border="0" > 
			  <tr valign="top">
			    <td width="58%" valign="top">
			    	<span class="tit_azul_detalhes">${reservaPagar.imovel.bairro}, ${reservaPagar.imovel.municipio} - ${reservaPagar.imovel.estado.codigo}</span><br />
	    			<span class="txt_cinza_detalhes">${reservaPagar.imovel.logradouro}, ${reservaPagar.imovel.numero} - ${reservaPagar.imovel.complemento} - Cep ${reservaPagar.imovel.cep}<br />
    				<strong>ID do im&oacute;vel:</strong> ${reservaPagar.imovel.usuarioProprietario.codigo}-${reservaPagar.imovel.codigo}</span>
			    </td>
			    <td width="42%" valign="top">
				    <span class="txt_cinza_detalhes">
				    	<span class="arial12boldazul">Perfil do im&oacute;vel:</span> ${reservaPagar.imovel.tipoImovel.nome}<br />
				      	<span class="arial12boldazul">Dist&acirc;ncia do centro:</span> ${reservaPagar.imovel.distanciaCentro}km<br />
				      	<!-- 
					    <a href='${reservaPagar.imovel.linkGoogleMaps}' class="link_reserva_detalhe">Mapa(Google Maps)</a><br />
					    <a href='${reservaPagar.imovel.linkYouTube}' class="link_reserva_detalhe">V&iacute;deo(YouTube)</a><br />
					     -->
					    <div class="icons_admin">
						<logic:notEmpty name="reservaPagar" property="imovel.linkGoogleMaps">
								<a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_mapa' class="thickbox link_reserva_detalhe"><div class="icon_mapa_admin">Mapa</div></a>
						</logic:notEmpty>
						<logic:empty name="reservaPagar" property="imovel.linkGoogleMaps">
								<div class="icon_nomapa_admin">Sem mapa</div>
						</logic:empty>
						
						<logic:notEmpty name="reservaPagar" property="imovel.linkYouTube">
								<a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_youtube' class="thickbox link_reserva_detalhe"><div class="icon_youtube_admin">V&iacute;deo</div></a>
						</logic:notEmpty>
						<logic:empty name="reservaPagar" property="imovel.linkYouTube">
								<div class="icon_noyoutube_admin">Sem V&iacute;deo</div>
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
			            				${reservaPagar.imovel.linkGoogleMaps}
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
			                    <div id="titulo">V&iacute;deo</div>
			                </div>
							<div class="meio">            
			            		<div class="divmapa">
			            				${reservaPagar.imovel.linkYouTube}
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
                    <div class="calculo_total_valor">R$ <ff:format value="${(( reservaPagar.valor + ( reservaPagar.valor *15/100)))}"/></div>
            </div>
            <div class="calculo_amarelo">
                    <div class="calculo_total_info">Sinal:</div>
                    <div class="calculo_total_valor">R$ <ff:format value="${((reservaPagar.valor*15/100))}"/></div>
            </div>
            <div class="calculo_cinza">
                    <div class="calculo_total_info">Saldo no Check in:</div>
                    <div class="calculo_total_valor">R$ <ff:format value="${(reservaPagar.valor)}"/></div>
            </div>
    </div>
    
    <div class="data_reserva_info">
    		<div class="box_data_reserva">
                    <ul class="data_reserva_ul">
                        <li class="data_texto1">Chegada</li>
                        <li class="data_texto2"><bean:write name="reservaPagar" property="periodoInicial" format="dd"/></li>
                        <li class="data_texto3"><bean:write name="reservaPagar" property="periodoInicial" format="MM"/>/<bean:write name="reservaPagar" property="periodoInicial" format="yyyy"/></li>
                    </ul>
            </div>
            <div class="box_data_reserva">
            		<ul class="data_reserva_ul">
                        <li class="data_texto1">Partida</li>
                        <li class="data_texto2"><bean:write name="reservaPagar" property="periodoFinal" format="dd"/></li>
                        <li class="data_texto3"><bean:write name="reservaPagar" property="periodoFinal" format="MM"/>/<bean:write name="reservaPagar" property="periodoFinal" format="yyyy"/></li>
                    </ul>
            </div>
            <div class="box_data_reserva">
            		<ul class="data_reserva_ul">
                        <li class="data_texto1">Total</li>
                        <li class="data_texto2" id="data_total">
                        <script language="javascript">
                        <!--
                        		calcularData( '<bean:write name="reservaPagar" property="periodoInicial" format="dd/MM/yyyy"/>', '<bean:write name="reservaPagar" property="periodoFinal" format="dd/MM/yyyy"/>');
                     	-->
                     	</script>
                     	</li>
                     	<li class="data_texto1">Dias</li>
                    </ul>
            </div>
    </div>
</div>

<div class="pagamento_info">
	<span class="arial12boldazul">Pagamento</span><br /><br />
	<strong>Sinal</strong><br />
	O Sinal ser&aacute; debitado do cart&atilde;o de cr&eacute;dito do hospede na confirma&ccedil;&atilde;o da reserva. Este valor &eacute; referente a taxa de transa&ccedil;&atilde;o do Buzkaza.
	<br /><br />
	<strong>Saldo no check in</strong><br />
	O Saldo ser&aacute; pago diretamente ao propriet&aacute;rio, conforme instru&ccedil;&otilde;es de pagamento.
	<br /><br />
</div>

<br />
<div id="sep_top_reserva_fina2"></div>
<br />

<div class="form_efeutar_pagamento">
		<table cellpadding="0" cellspacing="0" align="right">
		<tr>
			<!--
			<td>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_cart">
					<input type="hidden" name="business" value="silvio@buzkaza.com.br">
					<input type="hidden" name="currency_code" value="BRL">
					<input type="hidden" name="amount" value="<bean:write name="reservaPagar" property="valor" format="##.##"/>">
					<input type="hidden" name="item_name" value="Aluguel do im&oacute;vel de C�digo:${reservaPagar.imovel.codigo}">
					<input type="hidden" name="item_number" value="${reservaPagar.codigo}">
					<input type="hidden" name="shopping_url" value="http://www.buzkaza.com.br">				
					<input type="hidden" name="add" value="1">				
					<input type="image" src="http://www.paypal.com/en_US/i/btn/sc-but-01.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
				</form>
			</td>-->
			<td>
				<form action="https://www.moip.com.br/PagamentoMoIP.do" method="post" name="moip" id="moip" target="_blank">
					<input type="hidden" name="id_carteira" value="buzkaza">			
					<input type="hidden" name="valor" id="valor_reserva" value="${(reservaPagar.valor*10/100)}00">
					<input type="hidden" name="nome" value="${reservaPagar.locatario.nome}">
					<input type="hidden" name="pagador_nome" value="${reservaPagar.locatario.nome}">
					<input type="hidden" name="pagador_email" value="${reservaPagar.locatario.email}">
					<input type="hidden" name="id_transacao" value="${reservaPagar.codigo}">
					
					
					
					<input type="hidden" name="pagador_logradouro" value="${reservaPagar.locatario.endereco.logradouro}"/>
					<input type="hidden" name="pagador_numero" value="${reservaPagar.locatario.endereco.numero}"/>
					<input type="hidden" name="pagador_complemento"	value="${reservaPagar.locatario.endereco.complemento}"/>
					<input type="hidden" name="pagador_bairro" value=""/>
					
					<!-- 
						<input type="hidden" name="pagador_telefone" value="0000000000"/>
					-->
					 					
					<input type="hidden" name="pagador_cidade" value="${reservaPagar.locatario.endereco.municipio}"/>
					<input type="hidden" name="pagador_estado" value="${reservaPagar.locatario.endereco.estado.codigo}"/>
					<input type="hidden" name="pagador_cep" id="pagador_cep" value="${reservaPagar.locatario.endereco.cep}"/>
					
					<input type="hidden" name="descricao" value="Aluguel do im&oacute;vel de C&oacute;digo:${reservaPagar.imovel.codigo}">
					<input type="hidden" name="url_retorno" value="http://www.buzkaza.com.br">
					
					<div class="btnEfetuarPagamento">
					<a href="#" onclick="javascript:document.moip.submit();" border="0"><img src="/buzkaza/_img/btn_efetuar_pagamento.jpg" border="0" width="365" height="49"/></a>
					</div>
					
				</form>
				<script language="javascript">
                <!--
                	calcularvalorMoip( '<ff:format plain="true" value="${((reservaPagar.valor*15/100))}"/>', '<bean:write name="reservaPagar" property="valor" format="00.00"/>');
                	montarCepMoip('${reservaPagar.locatario.endereco.cep}' );
                -->
                </script>
			</td>
		</tr>
		</table>
</div>		
		
	</div>
	</logic:present>
	
	<logic:notPresent name="reservaPagar">
		N&atilde;o foi poss&iacute;vel pagar essa reserva.
	</logic:notPresent>

<!--FIM CADASTRO-->
</div></div></div>

	<jsp:include page="../rodape.jsp"/>

</div>
</body>
</html>
