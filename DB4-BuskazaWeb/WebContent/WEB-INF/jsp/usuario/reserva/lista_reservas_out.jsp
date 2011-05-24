<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Buzkaza  - em casa, onde estiver</title>
	
	
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

<div id="listagem_reservas">

	<logic:iterate id="res" name="reservas">
	<!--BOX COM A RESERVA-->
	
	
	
	
		<div id="box_listagem">
					<div class="foto_reserva"><img src="/buzkaza/imagens_usuarios/${res.imovel.primeirafoto}" width="132" height="99" /></div>
					
			        <div class="detalhe_reserva3">
					  		<div class="bairro_reserva">		  
			                    <span class="tit_azul2">${res.imovel.bairro}, ${res.imovel.municipio} - ${res.imovel.estado.codigo}</span><br />
			                    <span class="txt_cinza_detalhes">${res.imovel.logradouro}, ${res.imovel.numero} - ${res.imovel.complemento} - Cep ${res.imovel.cep}
			                            <br /> ID: ${res.imovel.usuarioProprietario.codigo}-${res.imovel.codigo}
			                            <br />		                    
			                    		<%
											index = index+1;
										%>
										<span class="txt_cinza_detalhes">
											Valor de <span id="data_total_<% out.print( index ); %>_${res.imovel.codigo}"></span> dia(s)&nbsp;
											R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( res.valor + ( res.valor *15/100))}"/>
										</span>
										
										
										<script language="javascript">
										<!--
											calcularDataListaReserva( '<bean:write name="res" property="periodoInicial" format="dd/MM/yyyy"/>', '<bean:write name="res" property="periodoFinal" format="dd/MM/yyyy"/>', 'data_total_<% out.print( index ); %>_${res.imovel.codigo}');
										-->
										</script>
										                  
										                  
										<br />                  
										                    
			                    		<logic:equal name="res" property="statusMoip" value="0">Em análise<br/>
			                    		
			                    				<form target="_blank" action="https://www.moip.com.br/PagamentoMoIP.do" method="post" name="moip<% out.print( index ); %>" id="moip<% out.print( index ); %>">
													<input type="hidden" name="id_carteira" value="buzkaza">			
													<input type="hidden" name="valor" id="valor_reserva<% out.print( index ); %>" value="${(res.valor*15/100)}00">
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
									                	calcularValorMoipListaMinhaReserva( '<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${((res.valor*15/100))}"/>', '<% out.print( index ); %>');
									                -->
									            </script>
			                    		
			                    		
			                    		</logic:equal>
			                    		<logic:equal name="res" property="statusMoip" value="1">Autorizado</logic:equal>
										<logic:equal name="res" property="statusMoip" value="2">
										
												<form target="_blank" action="https://www.moip.com.br/PagamentoMoIP.do" method="post" name="moip<% out.print( index ); %>" id="moip<% out.print( index ); %>">
													<input type="hidden" name="id_carteira" value="buzkaza">			
													<input type="hidden" name="valor" id="valor_reserva<% out.print( index ); %>" value="${(res.valor*15/100)}00">
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
									                	calcularValorMoipListaMinhaReserva( '<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${((res.valor*15/100))}"/>', '<% out.print( index ); %>');
									                -->
									            </script>							                
												<!-- <a href="/DB4-BuskazaWeb/usuario/reserva.do?act=formPagarReserva&cr=${res.codigo}">Efetuar pagamento</a> -->
										</logic:equal>
										
										<logic:equal name="res" property="statusMoip" value="3">Boleto Impresso</logic:equal>
										<logic:equal name="res" property="statusMoip" value="4">Aguardando Confirmação</logic:equal>
										<logic:equal name="res" property="statusMoip" value="5">Cancelado</logic:equal>
										<logic:equal name="res" property="statusMoip" value="6">Em análise</logic:equal>
										<logic:equal name="res" property="statusMoip" value="7">Estornado</logic:equal>
										<logic:equal name="res" property="statusMoip" value="9">Concluído</logic:equal>
										
									</span>
			               </div>
					</div>
			        
			        <div class="box_minha_reservas">
			                <div class="box_data_minha_reserva">        
			                        <ul class="data_minha_reserva_ul">
			                            <li class="data_texto1">Chegada</li>
			                            <li class="data_texto2"><bean:write name="res" property="periodoInicial" format="dd"/></li>
			                            <li class="data_texto3"><bean:write name="res" property="periodoInicial" format="MM/yyyy"/></li>
			                        </ul>
			                </div>
			                <div class="box_data_minha_reserva">        
			                        <ul class="data_minha_reserva_ul">
			                            <li class="data_texto1">Partida</li>
			                            <li class="data_texto2"><bean:write name="res" property="periodoFinal" format="dd"/></li>
			                            <li class="data_texto3"><bean:write name="res" property="periodoFinal" format="MM/yyyy"/></li>
			                        </ul>
			                </div>
					</div>
			</div>
			
			<div id="sep_list_minha_reserva"></div>
	
	
	<!--BOX COM A RESERVA-->
	</logic:iterate>

</div>

</logic:present>

<logic:notPresent name="reservas">


<div class="nenhuma_reserva"> </div>

</logic:notPresent>

<!--FIM CADASTRO-->

</div></div></div>

<jsp:include page="../rodape.jsp"/>

</div>
</body>
</html>
