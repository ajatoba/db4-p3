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
<title>Buzkaza - Detalhe do Imóvel</title>

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


	<div class="barra_top">
	<div class="aba_detalhes"><span class="txt_cinza_detalhes">Detalhes</span></div>
	<div class="aba_comments"></div>
	</div>
  	
  	<!--left-->
	<div class="left_detalhe">
			<div class="foto_big"><img src="/buzkaza/imagens_usuarios/<bean:write name="imovel" property="primeirafoto"/>" width="341" height="271" />
	</div>
	
	<a href='#TB_inline?height=570&amp;width=610&inlineId=thickbox_foto' class="thickbox">Ver todas as fotos</a><br>	


	<div id="thickbox_foto" style="visibility:hidden; display:none;">			
			<iframe src="/DB4-BuskazaWeb/imovel/foto.do?act=listarFotosImovel&ci=${imovel.codigo}" id="id" name="id" allowtransparency="0" scrolling="no"  class="iframe_foto" noframeborder="0"  frameborder="0"></iframe>
	</div>

	<div class="chamada_planta">Planta</div>
	
	<div class="planta_big"><img src="/buzkaza/imagens_usuarios/${imovel.planta.caminho}"  width="341" height="271" /></div>
	
	
	<div class="mapa_big">	
			<logic:notEmpty name="imovel" property="linkGoogleMaps">
			<div class="chamada_mapa">Mapa</div>
				<div class="divmapadetalhe">
					${imovel.linkGoogleMaps }
					<script language="javascript">
						$(document).ready(function(){
							$('.divmapadetalhe iframe').css({'width': '350px', 'height': '300px' });
						});
					</script>
					<br /><br /><br /><br /><br /><br />
				</div>  
			</logic:notEmpty>
			
			
	</div>
	
	</div>
	<!--left-->
  	
   	<!--right-->
	<div class="right_detalhe">
    	<span class="txt_cinza_detalhes">
    	
    	<span class="tit_azul_detalhes">${imovel.bairro}, ${imovel.municipio} - ${imovel.estado.codigo}</span><br />
    	<span class="txt_cinza_detalhes">${imovel.logradouro}, ${imovel.numero} - ${imovel.complemento} - Cep ${imovel.cep}</span><br /><br />
    	 
    	<span class="txt_azul_peq_detalhes">ID</span>&nbsp;: <bean:write name="imovel" property="usuarioProprietario.codigo"/>-<bean:write name="imovel" property="codigo"/><br />
		<span class="txt_azul_peq_detalhes">Distância do Centro</span>&nbsp;: <bean:write name="imovel" property="distanciaCentro"/><br />
		<span class="txt_azul_peq_detalhes">Tipo</span>&nbsp;: ${imovel.tipoImovel.nome}<br />
		<span class="txt_azul_peq_detalhes">Quartos</span>&nbsp;: ${imovel.quartos}<br />
		<span class="txt_azul_peq_detalhes">Metragem</span>&nbsp;: ${imovel.metragem}m<sup>2</sup><br />
		<span class="txt_azul_peq_detalhes">Capacidade</span>&nbsp;: ${imovel.capacidade} pessoas<br />
		<span class="txt_azul_peq_detalhes">Camas</span>&nbsp;: ${imovel.camas}<br />
		
		<logic:notEmpty name="imovel" property="linkYouTube">
			<span class="txt_azul_peq_detalhes">Vídeo</span>&nbsp;: <a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_youtube' class="thickbox link_reserva_detalhe">YouTube</a><br />
		</logic:notEmpty>
		
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
		<span class="txt_azul_peq_detalhes">Horário CheckIn Entrada</span>&nbsp;: <bean:write name="imovel" property="checkInEntrada" format="HH:mm"/><br />		
		<span class="txt_azul_peq_detalhes">Horário CheckIn Saída</span>&nbsp;: <bean:write name="imovel" property="checkInSaida" format="HH:mm"/><br />
		<span class="txt_azul_peq_detalhes">Horário CheckOut Entrada</span>&nbsp;: <bean:write name="imovel" property="checkOutEntrada" format="HH:mm"/><br />
		<span class="txt_azul_peq_detalhes">Horário CheckOut Saída</span>&nbsp;: <bean:write name="imovel" property="checkOutSaida" format="HH:mm"/><br />
		<br>
		<span class="txt_azul_peq_detalhes">Taxa Checkin Atrasado</span>&nbsp;: <bean:write name="imovel" property="taxaLateCheckin"/><br />		
		<span class="txt_azul_peq_detalhes">Taxa Checkout Atrasado</span>&nbsp;: <bean:write name="imovel" property="taxaLateCheckout"/><br />
		<span class="txt_azul_peq_detalhes">Taxa Água</span>&nbsp;: <bean:write name="imovel" property="taxaAgua"/><br />
		<span class="txt_azul_peq_detalhes">Taxa Gás</span>&nbsp;: <bean:write name="imovel" property="taxaGas"/><br />
		<span class="txt_azul_peq_detalhes">Taxa Eletricidade</span>&nbsp;: <bean:write name="imovel" property="energia"/><br />
		<span class="txt_azul_peq_detalhes">Taxa Limpeza</span>&nbsp;: <bean:write name="imovel" property="diarista"/><br />
		<span class="txt_azul_peq_detalhes">Caução</span>&nbsp;: <bean:write name="imovel" property="calcao"/><br />
		<br>
		
		<logic:notEmpty name="imovel" property="idiomas">
	  		<span class="tit_azul_detalhes">Idiomas Falados</span><br/>
	  		<logic:iterate name="imovel" property="idiomas" id="idioma">
	  			<bean:write name="idioma" property="nome"/><br>  		
	  		</logic:iterate>
	  	</logic:notEmpty>
	  	<logic:empty name="imovel" property="idiomas">
	  		Não foram cadastrados idiomas para esse imóvel
	  	</logic:empty>
	  	<br>
		<logic:notEmpty name="imovel" property="equipamentos">
	  		<span class="tit_azul_detalhes">Equipamentos</span><br/>
	  		<logic:iterate name="imovel" property="equipamentos" id="equipamento">
	  			<bean:write name="equipamento" property="nome"/><br>  		
	  		</logic:iterate>
	  	</logic:notEmpty>
	  	<logic:empty name="imovel" property="equipamentos">
	  		Não foram cadastrados equipamentos para esse imóvel
	  	</logic:empty>
	  	<br>
	  	<logic:notEmpty name="imovel" property="tiposPagamento">
	  		<span class="tit_azul_detalhes">Tipos de Pagamento:</span><br/>
	  		<logic:iterate name="imovel" id="tipoPagamento" property="tiposPagamento">
	  			<bean:write name="tipoPagamento" property="nome"/><br> 		
	  		</logic:iterate>
	  	</logic:notEmpty>
	  	<logic:empty name="imovel" property="tiposPagamento">
	  		Não foram cadastrados tipos de pagamento para esse imóvel
	  	</logic:empty>
		
	  	
	  	
	  	<br><br>
	  	
	  	<span class="txt_azul_peq_detalhes">Período Selecionado</span>&nbsp;: ${diaInicial}/${mesInicial}/${anoInicial} a ${diaFinal}/${mesFinal}/${anoFinal}<br />
	  	<span class="txt_azul_peq_detalhes">Valor</span>&nbsp;:  <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( valor + ( valor *15/100))}"/><br /><br />
	  	
	  	
	  	
	  	
	  	
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
				
				<div class="botao_reserva1">
					<input type="image" src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" /><br/>
				</div>
					
		</html:form>
	  	</span>
	  	<br><br>
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
	  	
	</div>

</div>

</div>



<div class="bottom_formulario"></div>
<div class="linha_cinza"></div>

<jsp:include page="../usuario/rodape.jsp"/>

</body>
</html>

