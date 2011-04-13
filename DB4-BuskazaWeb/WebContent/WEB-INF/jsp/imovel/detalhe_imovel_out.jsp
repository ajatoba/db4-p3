<%@page import="java.util.*"%>
<%@page import="br.com.db4.buskaza.controller.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="br.com.db4.buskaza.model.entity.Imovel"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza - Detalhe do Im�vel</title>

	<link href="/buzkaza/_css/detalhe_imovel.css" rel="stylesheet" type="text/css"/>
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.2.min.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>	
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.ui.draggable.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.alerts.js" ></script>
	
	<!-- calend�rio -->
		<script type="text/javascript" charset="utf-8" src="/buzkaza/_js/date.js"></script>
		<script type="text/javascript" charset="utf-8" src="/buzkaza/_js/jquery.datePicker.js"></script>
		<script type="text/javascript" charset="utf-8" src="/buzkaza/_js/jquery.datePickerMultiMonth.js"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="/buzkaza/_css/datePicker.css">
	<!-- calend�rio -->
	
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/jquery.alerts.css"  />
	<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />
	

	<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>

	
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
			numMonths: 9,
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
	
	<div class="thumbs_fotos">
		<logic:notEmpty name="imovel" property="fotos">
						Fotos<br/>
						<logic:iterate id="ft" name="imovel" property="fotos">							
							<img src="/buzkaza/imagens_usuarios/<bean:write name="ft" property="caminhoThumbnail"/>"/>
						</logic:iterate>												
				</logic:notEmpty>
								
  	</div>
	
	<div class="chamada_planta">Planta</div>
	
	<div class="planta_big"><img src="/buzkaza/imagens_usuarios/${imovel.planta.caminho}"  width="341" height="271" /></div>
	
	
	
	<div class="mapa_big">	
			<logic:notEmpty name="imovel" property="linkGoogleMaps">
			<div class="chamada_mapa">Mapa</div>
				${imovel.linkGoogleMaps }
			</logic:notEmpty>
	</div>
	
	</div>
	<!--left-->
  	
   	<!--right-->
	<div class="right_detalhe">
    	<span class="txt_cinza_detalhes">
    	
    	<span class="tit_azul_detalhes"><bean:write name="imovel" property="bairro"/>, ${imovel.estado.codigo}</span><br />
    	<span class="txt_cinza_detalhes"><bean:write name="imovel" property="logradouro"/>, <bean:write name="imovel" property="complemento"/></span><br /><br />
    	 
    	<span class="txt_azul_peq_detalhes">ID</span>&nbsp;: <bean:write name="imovel" property="usuarioProprietario.codigo"/>-<bean:write name="imovel" property="codigo"/><br />
		<span class="txt_azul_peq_detalhes">Dist�ncia do Centro</span>&nbsp;: <bean:write name="imovel" property="distanciaCentro"/><br />
		<span class="txt_azul_peq_detalhes">Tipo</span>&nbsp;: ${imovel.tipoImovel.nome}<br />
		<span class="txt_azul_peq_detalhes">Quartos</span>&nbsp;: ${imovel.quartos}<br />
		<span class="txt_azul_peq_detalhes">Metragem</span>&nbsp;: ${imovel.metragem}m<sup>2</sup><br />
		<span class="txt_azul_peq_detalhes">Capacidade</span>&nbsp;: ${imovel.capacidade} pessoas<br />
		<span class="txt_azul_peq_detalhes">Camas</span>&nbsp;: ${imovel.camas}<br />
		<span class="txt_azul_peq_detalhes">V�deo</span>&nbsp;: <bean:write name="imovel" property="linkYouTube"/><br />
		<span class="txt_azul_peq_detalhes">Hor�rio CheckIn Entrada</span>&nbsp;: <bean:write name="imovel" property="checkInEntrada" format="HH:mm"/><br />		
		<span class="txt_azul_peq_detalhes">Hor�rio CheckIn Sa�da</span>&nbsp;: <bean:write name="imovel" property="checkInSaida" format="HH:mm"/><br />
		<span class="txt_azul_peq_detalhes">Hor�rio CheckOut Entrada</span>&nbsp;: <bean:write name="imovel" property="checkOutEntrada" format="HH:mm"/><br />
		<span class="txt_azul_peq_detalhes">Hor�rio CheckOut Sa�da</span>&nbsp;: <bean:write name="imovel" property="checkOutSaida" format="HH:mm"/><br />
		
		</span>
		
	  	<logic:notEmpty name="imovel" property="equipamentos">
	  		<span class="tit_azul_detalhes">Equipamentos</span><br/>
	  		<logic:iterate name="imovel" id="equipamentos" id="equipamento">
	  			<bean:write name="equipamento" property="descricao"/>" />  		
	  		</logic:iterate>
	  	</logic:notEmpty>
	  	
	  	<logic:notEmpty name="imovel" property="tiposPagamento">
	  		<span class="tit_azul_detalhes">Tipos de Pagamento:</span><br/>
	  		<logic:iterate name="imovel" id="tiposPagamento" id="tipoPagamento">
	  			<bean:write name="tipoPagamento" property="nome"/>" />  		
	  		</logic:iterate>
	  	</logic:notEmpty>
	  	
	  	<br><br>
	  	
	  	Per�odo Selecionado: ${diaInicial}/${mesInicial}/${anoInicial} a ${diaFinal}/${mesFinal}/${anoFinal}<br>
	  	Valor: ${valor}
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
				
				<div class="botao_reserva2">
					<input type="image" src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" /><br/>
				</div>
					
		</html:form>
	  	
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

