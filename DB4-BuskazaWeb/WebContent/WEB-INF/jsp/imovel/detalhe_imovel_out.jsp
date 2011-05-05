<%@page import="java.util.*"%>
<%@page import="br.com.db4.buskaza.controller.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="br.com.db4.buskaza.model.entity.Imovel"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza - em casa, onde estiver</title>

	<link href="/buzkaza/_css/detalhe_imovel.css" rel="stylesheet" type="text/css"/>
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.2.min.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>	
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	
	<!-- calendário -->
		<script type="text/javascript" charset="utf-8" src="/buzkaza/_js/date.js"></script>
		<script type="text/javascript" charset="utf-8" src="/buzkaza/_js/jquery.datePicker.js"></script>
		<script type="text/javascript" charset="utf-8" src="/buzkaza/_js/jquery.datePickerMultiMonth.js"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="/buzkaza/_css/datePicker.css">
	<!-- calendário -->
	
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/jquery.alerts.css"  />
	<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />
	

	<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
<script>
function abrirPop(url){
	window.open(url,"fotos","menubar=0,resizable=0,width=600,height=500, scrollbars=1");
}
</script>
	
	<script language="javascript">
	$(function(){
		$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
	});
	
	$(function(){
		
			$('#sep_top_reserva').corner('rounded 7px');
			
		});
		
</script>

<script type="text/javascript" charset="utf-8">
$(function()
{
	Date.format = 'yyyy-mm-dd';
	var $hiddenInput = '2011-04-01';
	
	fdata = new Date();
	dia = fdata.getDate();
	mes = fdata.getMonth()+1;
	ano = fdata.getFullYear();
	
	var datainicio = ano+"-"+mes+"-"+dia;
	
	$('#multimonth').datePickerMultiMonth(
		{
			startDate: datainicio,
			numMonths: 2,
			inline: true
		}
	).dpmmSetSelected(
		$hiddenInput
	).bind(
		'dateSelected',
		function(event, date, $td, status)
		{
			$hiddenInput.val(date.asString());
		}
	);			
	
	$('#showHiddenValue').bind(
		'click',
		function(e)
		{
			alert($hiddenInput.val());
			return false;
		}
	);
});


$(function()
{
	$('#button').click(
		function() {
			calcularData();
		}
	)
});

function calcularData( from, to, bg){
		
	data0	= from;
	data1	= from.split("/");
	data2	= to.split("/");
		
	if( ( from != "") && ( to != "") )
	{
			switch ( data1[1] ) {
				case "01": mes1="Jan"; break;
				case "02": mes1="Feb"; break;
				case "03": mes1="Mar";  break;
				case "04": mes1="Apr";  break;
				case "05": mes1="May";  break;
				case "06": mes1="Jun";  break;
				case "07": mes1="Jul";  break;
				case "08": mes1="Aug";  break;
				case "09": mes1="Sep";  break;
				case "10": mes1="Oct";  break;
				case "11": mes1="Nov";  break;
				case "12": mes1="Dec";  break;
				default: mes1:"Jan";  break;
			}
			
			switch ( data2[1] ) {
				case "01": mes2="Jan";  break;
				case "02": mes2="Feb";  break;
				case "03": mes2="Mar";  break;
				case "04": mes2="Apr";  break;
				case "05": mes2="May";  break;
				case "06": mes2="Jun";  break;
				case "07": mes2="Jul";  break;
				case "08": mes2="Aug";  break;
				case "09": mes2="Sep";  break;
				case "10": mes2="Oct";  break;
				case "11": mes2="Nov";  break;
				case "12": mes2="Dec";  break;
				default: mes2:"Jan";  break;
			}
			var firstDate = new Date(	data1[0]  + " " + mes1 + " " + data1[2] );
			var secondDate = new Date(	data2[0]  + " " + mes2 + " " + data2[2] );
			
			var daysDiff = (secondDate.valueOf() - firstDate.valueOf());
			daysDiff = Math.floor(Math.abs((((daysDiff  / 1000) / 60) / 60) / 24));
			
			
			for(i=0; i <= daysDiff; i++){
				
				dia = somaDias( data0 , i);
				
				d = dia.split("/");
				
				$('.1aaaa'+ d[2]+"-"+ d[1] +"-"+ d[0]).css({backgroundColor: bg});
			}
	}
	
}


function somaDias( txtData, DiasAdd )
{
	var DataFinal;
	//var txtData = "01/01/2011";
	//var DiasAdd = 366;
	var d = new Date();
			 
	d.setTime(Date.parse(txtData.split("/").reverse().join("/"))+(86400000*(DiasAdd)))
	
	if(d.getDate() < 10)
		DataFinal = "0"+d.getDate().toString();
	else
		DataFinal = d.getDate().toString();
	
	if((d.getMonth()+1) < 10)
		DataFinal += "/0"+(d.getMonth()+1).toString()+"/"+d.getFullYear().toString();
	else
		DataFinal += "/"+((d.getMonth()+1).toString())+"/"+d.getFullYear().toString();
	
	return DataFinal;
}

</script>
</head>

<body>

<jsp:include page="../usuario/topo.jsp"/>

<!--CADASTRO-->

<div id="cont_reserva">

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
<div id="cont_reserva">
    <div class="content_detalhes">
    	<div class="tit_detalheimovel">Detalhes do Imóvel</div>
        <div id="sep_top_reserva2"></div>
        <div class="top_detalhes"><!--top_detalhes-->
        	<div class="div_fotoprincipal"><img src="/buzkaza/imagens_usuarios/<bean:write name="imovel" property="primeirafoto"/>" width="326" height="259" /></div> 	
            <div class="div_pagamento"><!--div_pagamento-->
            	<div class="check_inout"><!--check_inout-->
                	<span class="arial12boldazul2">Período Selecionado:</span><br />
                    <div style="display:table; float:left; margin-right:20px;">
                    	<span class="check_in_detalhe">Check In</span><br />
                    	<span class="data_check">${diaInicial}/${mesInicial}/${anoInicial}</span>
                    </div>
                    <div style="display:table; float:left;">
                    	<span class="check_in_detalhe">Check Out</span><br />
                    	<span class="data_check">${diaFinal}/${mesFinal}/${anoFinal}</span>
                    </div>                    
                </div><!--fim check_inout-->
                <div class="div_valor_amarela">Reserva (<span id="data_total"></span> dias): <strong>R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( valor )}"/></strong></div>
        		<div class="div_valor_amarela">Sinal: <strong>R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( valor *15/100 )}"/></strong></div>
                <div class="btn_reservar_detalhes">
                	<html:form action="/usuario/reserva.do?act=formReservas" method="POST" >
						<html:hidden property="ORIGEM_REQUEST" value="_RESERVA"/>
						<html:hidden property="codigoImovel" value="${imovel.codigo}"/> 
						<html:hidden property="valor" value="${valor}"/>
						<html:hidden property="diaPeriodoInicial" value="${diaInicial}"/>	
						<html:hidden property="mesPeriodoInicial" value="${mesInicial}"/>
						<html:hidden property="anoPeriodoInicial" value="${anoInicial}"/>
						<html:hidden property="diaPeriodoFinal" value="${diaFinal}"/>	
						<html:hidden property="mesPeriodoFinal" value="${mesFinal}"/>
						<html:hidden property="anoPeriodoFinal" value="${anoFinal}"/>                
                		<input type="image" src="/buzkaza/_img/btn_reservar_detalhes.jpg" width="73" height="36" /></div>
                	</html:form>
                
            </div><!--fim div_pagamento-->
            
            <script type="text/javascript">
        	<!-- 
        		trocarImageDetalhe('<bean:write name="imovel" property="primeirafoto"/>');
        	
             	calcularData( '${diaInicial}/${mesInicial}/${anoInicial}', '${diaFinal}/${mesFinal}/${anoFinal}');
          	-->
          	</script>
            
            
            <div class="linha_sep_detalhes"></div>   
            <div class="div_enderecos_detalhes">
            	<span class="tit_azul_detalhes">${imovel.bairro}, ${imovel.municipio} - ${imovel.estado.codigo}</span><br />
                <span class="arial13Cinza">
                	${imovel.logradouro}, ${imovel.numero} - ${imovel.complemento} - Cep ${imovel.cep}<br />
					id: <bean:write name="imovel" property="usuarioProprietario.codigo"/>-<bean:write name="imovel" property="codigo"/><br /><br /></span>
					
				<logic:notEmpty name="imovel" property="linkYouTube">
				<a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_youtube' class="thickbox link_reserva_detalhe">
				<div class="icon_youtube_admin">Vídeo</div></a>
				</logic:notEmpty>
				
				<a href='#TB_inline?height=570&amp;width=610&inlineId=thickbox_foto' class="thickbox"><div class="icon_fotos_admin">Fotos</div></a>
					<div id="thickbox_foto" style="visibility:hidden; display:none;">			
					<iframe src="/DB4-BuskazaWeb/imovel/foto.do?act=listarFotosImovel&ci=${imovel.codigo}" id="id" name="id" allowtransparency="0" scrolling="no"  class="iframe_foto" noframeborder="0"  frameborder="0"></iframe>
					</div>
                <br /><br />
                
                <div class="div_sep_enderecos_detalhes">
                <span class="arial12boldazul">Tipo de Imovel:</span><span class="txt_cinza_detalhes"> ${imovel.tipoImovel.nome}</span><br />
                <span class="arial12boldazul">Quarto(s):</span><span class="txt_cinza_detalhes"> ${imovel.quartos}</span><br />
                <span class="arial12boldazul">Metragem:</span><span class="txt_cinza_detalhes"> ${imovel.metragem}m<sup>2</sup></span><br />
                </div>
                
                <div class="div_sep_enderecos_detalhes">
                <span class="arial12boldazul">Capacidade:</span><span class="txt_cinza_detalhes"> ${imovel.capacidade} pessoa(s)</span><br />
                <span class="arial12boldazul">Distância do Centro:</span><span class="txt_cinza_detalhes"> <bean:write name="imovel" property="distanciaCentro"/>km</span><br />
                <span class="arial12boldazul">Cama(s):</span><span class="txt_cinza_detalhes"> ${imovel.camas}</span><br />
                </div>
                
                <div class="div_sep_enderecos_detalhes_ult">
                	<logic:notEmpty name="imovel" property="idiomas">
	  					<span class="arial12boldazul">Idioma(s):&nbsp;</span>
	  					<span class="txt_cinza_detalhes">
	  					<logic:iterate name="imovel" property="idiomas" id="idioma">
	  						<bean:write name="idioma" property="nome"/>,  		
	  					</logic:iterate>
	  					</span>
	  				</logic:notEmpty>
	  				<!-- Caso não tenha nenhuma idioma cadastrado. -->
	  				<logic:empty name="imovel" property="idiomas">
	  					<span class="arial12boldazul">Idioma(s):&nbsp;</span><span class="txt_cinza_detalhes">Português</span>
	  				</logic:empty>
                </div>
                
            </div>     
        </div><!--fim top_detalhes-->
        <div style="display:table;">
        	<div class="linha_sep_detalhes2"></div>
        	
        	<div style="display:table; float:left; margin-right:25px; width:326px;"><!-- Inicio Planta e Disponibilidades -->
        	<div class="div_planta_calendario"><img src="/buzkaza/imagens_usuarios/${imovel.planta.caminho}"  width="326" height="259" /></div>  
        	      	
        	<div class="div_planta_calendario"><!-- Inicio Calendário Disponibilidades -->
        		<span class="arial12boldazul">Disponibilidades</span>
        		
        		<div id="container">
				  <div id="multimonth"></div>
				  <div id="data_duracao"></div>
				</div>
        		<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
  listaDadas();
});

function listaDadas(){
	<logic:iterate id="an" name="imovel" property="anuncios">

		<logic:equal name="an" property="tipoAnuncio.codigo" value="0">var color="#FFF"; </logic:equal>
		<logic:equal name="an" property="tipoAnuncio.codigo" value="1">var color="#2980C5"; </logic:equal>			  		
		<logic:equal name="an" property="tipoAnuncio.codigo" value="2">var color="#FF6D00"; </logic:equal>
		<logic:equal name="an" property="tipoAnuncio.codigo" value="3">var color="#8DBF22"; </logic:equal>
		<logic:equal name="an" property="tipoAnuncio.codigo" value="4">var color="#FFC600"; </logic:equal>
		<logic:equal name="an" property="tipoAnuncio.codigo" value="5">var color="#D300FF"; </logic:equal>
		<logic:equal name="an" property="tipoAnuncio.codigo" value="6">var color="#00D8FF"; </logic:equal>
		
		calcularData( '<bean:write name="an" property="dataInicial" format="dd/MM/yyyy"/>', '<bean:write name="an" property="dataFinal" format="dd/MM/yyyy"/>', color);	
	</logic:iterate>

	<logic:iterate id="bl" name="imovel" property="bloqueios">
			var color="#2980C5";		
			calcularData( '<bean:write name="bl" property="dataInicial" format="dd/MM/yyyy"/>', '<bean:write name="bl" property="dataFinal" format="dd/MM/yyyy"/>', color);	
	</logic:iterate>

	<logic:iterate id="rs" name="imovel" property="reservas">
		<logic:equal name="rs" property="status" value="1">
			var color="#d62222";		
			calcularData( '<bean:write name="rs" property="periodoInicial" format="dd/MM/yyyy"/>', '<bean:write name="rs" property="periodoFinal" format="dd/MM/yyyy"/>', color);
		</logic:equal>
	</logic:iterate>
 }
				</script>
        	</div><!-- Fim Calendário Disponibilidades -->
        </div> <!-- FIM Planta e Disponibilidades -->

        	<div style="display:table;">
            <div class="tit_arialbullet">Equipamentos e Facilidades</div>
            	<div style="width:100%; display:table; width:590px; margin-bottom:35px;">
            	<logic:iterate name="imovel" property="equipamentos" id="equipamento">
	  				<div class="box_equipamentos"><bean:write name="equipamento" property="nome"/></div>
	  			</logic:iterate>	  							
				<logic:empty name="imovel" property="equipamentos">
	  				<span class="txt_cinza_detalhes">Não foram cadastrados equipamentos para esse imóvel. Após efetuar a reserva consulte o proprietário.</span>
	  			</logic:empty>				
            </div>
            
            <div class="tit_arialbullet2">Condições de Pagamento no Check In</div>
            <div style="width:100%; display:table; width:590px; margin-bottom:10px;">
            	<div class="txt_cinza_detalhes">Opções aceitas pelo proprietário no Check in para o pagamento da tarifa e taxas extras.</div>
            </div>
            <div style="width:100%; display:table; width:590px; margin-bottom:10px;">            	
					<logic:notEmpty name="imovel" property="tiposPagamento">
					<div class="box_equipamentos">
	  					<logic:iterate name="imovel" id="tipoPagamento" property="tiposPagamento">
	  						<bean:write name="tipoPagamento" property="nome"/>	
	  					</logic:iterate>
	  				</div>
	  				</logic:notEmpty> 				
				<logic:empty name="imovel" property="tiposPagamento">
	  				<span class="txt_cinza_detalhes">Não foram cadastrados tipos de pagamento para esse imóvel. Após efetuar a reserva, consulte o proprietário.</span>
	  			</logic:empty>
            			             
            </div>
            <div style="width:100%; display:table; width:590px; margin-bottom:35px;">
            	<span class="arial12boldazul">Horário de Check In:</span><span class="txt_cinza_detalhes"> de <bean:write name="imovel" property="checkInEntrada" format="HH:mm"/> até <bean:write name="imovel" property="checkInSaida" format="HH:mm"/> - R$ <bean:write name="imovel" property="taxaLateCheckin"/> para check in fora do horário</span><br />
                <span class="arial12boldazul">Horário de Check Out:</span><span class="txt_cinza_detalhes"> de <bean:write name="imovel" property="checkOutEntrada" format="HH:mm"/> até <bean:write name="imovel" property="checkOutSaida" format="HH:mm"/> - R$ <bean:write name="imovel" property="taxaLateCheckout"/> para check out fora do horário</span><br />
            </div>
            
            <div class="tit_arialbullet">Taxas Extras</div>
            	<div class="div_sep_enderecos_detalhes">
                	<span class="arial12boldazul">Caução:</span><span class="txt_cinza_detalhes"> R$ <bean:write name="imovel" property="calcao"/></span><br />
                	<span class="arial12boldazul">Eletricidade:</span><span class="txt_cinza_detalhes"> R$ <bean:write name="imovel" property="energia"/></span><br />
                	<span class="arial12boldazul">Água:</span><span class="txt_cinza_detalhes"> R$ <bean:write name="imovel" property="taxaAgua"/></span><br />
                </div>
                <div class="div_sep_enderecos_detalhes">
                	<span class="arial12boldazul">Gás:</span><span class="txt_cinza_detalhes"> R$ <bean:write name="imovel" property="taxaGas"/></span><br />
                	<span class="arial12boldazul">Limpeza:</span><span class="txt_cinza_detalhes"> R$ <bean:write name="imovel" property="diarista"/></span><br />
                </div>
            </div>
        
        </div>
        
        <div class="mapa_big">	
			<logic:notEmpty name="imovel" property="linkGoogleMaps">
				<span class="arial12boldazul">Mapa</span>
					<div class="divmapadetalhe">
						${imovel.linkGoogleMaps }
						<script language="javascript">
							$(document).ready(function(){
								$('.divmapadetalhe iframe').css({'width': '941px', 'height': '350px' });
							});
						</script>
					</div>  
			</logic:notEmpty>			
		</div><!-- Fim mapa_big -->
        
    </div>
</div> 

<!-- LightBox Vídeo -->
<div id="thickbox_youtube" style="visibility:hidden; display:none;">            
           	<div class="topo">
                   <div id="titulo">Vídeo</div>
               </div>
			<div class="meio">            
           		<div class="divmapa">
           				${imovel.linkYouTube}
                </div>
                <script language="javascript">
					$(document).ready(function(){
						$('.divmapa iframe').css({'width': '560px', 'height': '310px' });
					});
				</script>                                       
               </div>    
               <div class="baixo"></div>
</div>
<!-- Fim LightBox Vídeo -->

</div><!-- FIM cont_reserva -->

<div class="bottom_formulario"></div>
<div class="linha_cinza"></div>

<jsp:include page="../usuario/rodape.jsp"/>

</body>
</html>

