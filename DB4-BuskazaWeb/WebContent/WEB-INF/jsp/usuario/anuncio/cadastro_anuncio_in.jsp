<%@page import="java.util.*"%>
<%@page import="br.com.db4.buskaza.controller.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Buzkaza - em casa, onde estiver</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>

<div id="cont_reserva">
	<div id="meio_reserva">
		    <div class="top_reserva">
		      	<div class="txt_meus_anuncios"><span class="MyriadPro24">Meus Anúncios</span><span class="MyriadPro18"> / Disponibilidade e Preços</span></div>
		      	<div class="combo_anuncios"> &nbsp;&nbsp;<a href="/DB4-BuskazaWeb/usuario/imovel.do?act=listarImoveis"><img src="/buzkaza/_img/btn_voltar_listaranuncios.jpg" width="151" height="31" style=" float:right;" border="0"/></a></div>
		    </div>
	</div>

	<div id="sep_top_reserva"></div>
	
	<div id="listagem_reservas">
		<div class="topo_edicao">
			<div class="mapa_planta_reserva"><img src="/buzkaza/imagens_usuarios/${imovel.primeirafoto}" width="140" height="104" /></div>

			<div class="endereco_bairro">
					<table width="100%" border="0" > 
					  <tr valign="top">
					    <td width="58%" valign="top">
					    	<span class="tit_azul_detalhes">${imovel.bairro}, ${imovel.municipio} - ${imovel.estado.codigo}</span><br />
			    			<span class="txt_cinza_detalhes">${imovel.logradouro}, ${imovel.numero} - ${imovel.complemento} - Cep ${imovel.cep}<br />
			    			ID: ${imovel.usuarioProprietario.codigo}-${imovel.codigo}</span>
					    </td>
					    <td width="42%" valign="top">

						    <span class="txt_cinza_detalhes">
						    	<span class="arial12boldazul">Perfil do Imóvel:</span> ${imovel.tipoImovel.nome}<br />
						      	<span class="arial12boldazul">Distância do centro:</span> ${imovel.distanciaCentro}km<br />
						      
						      <div class="icons_admin">
						      <logic:notEmpty name="imovel" property="linkGoogleMaps">
						      	<a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_mapa' class="thickbox link_reserva_detalhe"><div class="icon_mapa_admin">Mapa</div></a>
						      </logic:notEmpty>
						      <logic:empty name="imovel" property="linkGoogleMaps">
							   	<div class="icon_nomapa_admin">Sem mapa</div>
							  </logic:empty>							  
						      <logic:notEmpty name="imovel" property="linkYouTube">
						      	<a href='#TB_inline?height=420&amp;width=600&inlineId=thickbox_youtube' class="thickbox link_reserva_detalhe"><div class="icon_youtube_admin">Vídeo</div></a>
						      </logic:notEmpty>
						      <logic:empty name="imovel" property="linkYouTube">
							   	<div class="icon_noyoutube_admin">Sem vídeo</div>
							  </logic:empty>
							  </div>						      
						    </span>		      
						      
						      <div id="thickbox_mapa" style="visibility:hidden; display:none;">            
					            	<div class="topo">
					                    <div id="titulo">Mapa</div>
					                </div>
									<div class="meio">            
					            		<div class="divmapa">
					            				${imovel.linkGoogleMaps}
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
					                    <div id="titulo">Vídeo</div>
					                </div>
									<div class="meio">            
					            		<div class="divmapa">
					            				${imovel.linkYouTube}
					                    </div>
					                                        
					                </div>    
					                <div class="baixo"></div>
								</div>
						      	      
					    </td>
					  </tr>
					</table>
			</div>
			
		</div>
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
			
<div id="sep_top_reserva_fina"></div>

<div id="formulario_edicao3">
	<div class="formulario_edicao3">
		<div class="txt_caracteristica">Datas e Tarifas cadastradas</div>
		<div class="arial13Cinza">Veja abaixo as datas e tarifas cadastradas.</div>
	</div>
	<div class="left_formulario_">
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
		  	            
		<table width="100%" border="0" cellspacing="0" class="box_legenda_info">
		 <tr>
		   <td class="txt_legenda" height="25" valign="top">Legenda:</td>
		 </tr>
		 <tr>
		   <td>
		            <!-- LEGENDA -->
		                <table width="100%" border="0" cellspacing="1" cellpadding="0">
		                <tr>
		                  <td width="5%"><div class="box_legenda_cor cor_reservado"></div></td>
		                  <td width="28%" class="txt_legenda">Reservado</td>
		                  <td width="5%"><div class="box_legenda_cor cor_baixa_temporada"></div></td>
		                  <td width="29%" class="txt_legenda">Baixa Temporada</td>
		                  <td width="5%"><div class="box_legenda_cor cor_data_especial"></div></td>
		                  <td width="28%" class="txt_legenda">Data Especial</td>
		                </tr>
		                <tr>
		                  <td><div class="box_legenda_cor cor_bloqueado"></div></td>
		                  <td class="txt_legenda">Bloqueado</td>
		                  <td><div class="box_legenda_cor cor_media_temporada"></div></td>
		                  <td class="txt_legenda">Média Temporada</td>
		                  <td>&nbsp;</td>
		                  <td>&nbsp;</td>
		                </tr>
		                <tr>
		                  <td><div class="box_legenda_cor cor_pacote_fechado"></div></td>
		                  <td class="txt_legenda">Pacote Fechado</td>
		                  <td><div class="box_legenda_cor cor_alta_temporada"></div></td>
		                  <td class="txt_legenda">Alta Temporada</td>
		                  <td>&nbsp;</td>
		                  <td>&nbsp;</td>
		                </tr>
		                </table>
		            <!-- ******* -->
		    </td>
		 </tr>
		</table>        
		  	
</div>
<div class="right_formulario_">
	<logic:notEmpty name="imovel" property="anuncios">
	   <table border="0" cellspacing="1" cellpadding="0" width="545">
		  <tr class="tabela_preco">
		    <td class="preco_data">De</td>
		    <td class="preco_data">Até</td>
		    <td class="preco_valor">Diária</td>
		    <td class="preco_valor">Semanal</td>
		    <td class="preco_valor">Quizenal</td>
		    <td class="preco_valor">Mensal</td>
		    <td class="preco_valor_pacote">Pacote Fechado</td>
		    <td class="preco_valor_nada">&nbsp;</td> 
		  </tr>
	 <logic:iterate id="an" name="imovel" property="anuncios">
	   	<tr>
		    <td colspan="7" class="tabela_preco_data_info">
		  		<!-- SETANDO A COR -->
		  		<logic:equal name="an" property="tipoAnuncio.codigo" value="0"><font color="WHITE"></logic:equal>
		  		<logic:equal name="an" property="tipoAnuncio.codigo" value="1"><font color="#2980C5"></logic:equal>			  		
		  		<logic:equal name="an" property="tipoAnuncio.codigo" value="2"><font color="#FF6D00"></logic:equal>
		  		<logic:equal name="an" property="tipoAnuncio.codigo" value="3"><font color="#8DBF22"></logic:equal>
		  		<logic:equal name="an" property="tipoAnuncio.codigo" value="4"><font color="#FFC600"></logic:equal>
		  		<logic:equal name="an" property="tipoAnuncio.codigo" value="5"><font color="#D300FF"></logic:equal>
		  		<logic:equal name="an" property="tipoAnuncio.codigo" value="6"><font color="#00D8FF"></logic:equal>
	
		    			<div class="preco_data2"><bean:write name="an" property="dataInicial" format="dd/MM/yyyy"/></div>
		                <div class="preco_data2"><bean:write name="an" property="dataFinal" format="dd/MM/yyyy"/></div>
		                <div class="preco_valor2"><bean:write name="an" property="tarifaDiaria"/></div>
		                <div class="preco_valor3"><bean:write name="an" property="tarifaSemanal"/></div>
		                <div class="preco_valor3"><bean:write name="an" property="tarifaQuinzenal"/></div>
		                <div class="preco_valor3"><bean:write name="an" property="tarifaMensal"/></div>
		                <div class="preco_valor_pacote2"><bean:write name="an" property="tarifaPacoteFechado"/></div>	    
	
		  		</font>	  		
		  	</td>
		  	<td width="22" align="right">
		  			<html:form method="post" action="/usuario/anuncio?act=excluirAnuncio">
		  			<input type="hidden" name="idAnuncio" value="${an.codigo}"/>
		  			<input type="hidden" name="ci" value="${imovel.codigo}"/>
		  	
				  	<input type="image" src="/buzkaza/_img/botao_excluir_disp.jpg" width="15" height="24" />
				  	</html:form>
		  	</td>
		  	    
		  </tr>
	  	</logic:iterate>
	   </table>
	   </logic:notEmpty>
	   <logic:empty name="imovel" property="anuncios">
	   <span class="txt_caracteristicas_desc">Ainda não há disponibilidade cadastrada para esse imóvel</span>
	   </logic:empty>
		</table>
	</div>
</div>
	
	
<html:form method="post" action="/usuario/anuncio?act=incluirAnuncio">
	<input type="hidden" name="ci" value="${imovel.codigo}">
	<br />
	<div id="formulario_edicao2">
		<div class="txt_caracteristica">Cadastrar Períodos</div>
			<div class="arial13Cinza">No campo Pacote Fechado digite o valor total do pacote. Nos demais o valor da diária.</div>
			<br />
    		<table border="0" cellpadding="0" cellspacing="0">
	     		<tr class="txt_caracteristicas">
	       			<td ><div class="sep10">&nbsp;Diária</div></td>
	       			<td ><div class="sep10">&nbsp;Diária Semanal</div></td>
	       			<td ><div class="sep10">&nbsp;Diária Quinzenal</div></td>
	       			<td ><div class="sep10">&nbsp;Diária Mensal</div></td>	       
	       			<td ><div class="sep10">&nbsp;Pacote Fechado</div></td>
	       			<td><div class="sep10">&nbsp;Período</div></td>
	     		</tr>
	     		<tr>
	       			<td ><div class="sep10"><html:text property="tarifaDiaria" styleClass="number,MyriadProRegular" styleId="tarifaDiaria" maxlength="10" size="70" style="width:100px;" /></div></td>
	       			<td ><div class="sep10"><html:text property="tarifaSemanal" styleClass="number,MyriadProRegular" styleId="tarifaSemanal" maxlength="10" size="70" style="width:100px;" /></div></td>
	       			<td ><div class="sep10"><html:text property="tarifaQuinzenal" styleClass="number,MyriadProRegular" styleId="tarifaQuinzenal" maxlength="10" size="70" style="width:100px;" /></div></td>
	       			<td ><div class="sep10"><html:text property="tarifaMensal" styleClass="number,MyriadProRegular" styleId="tarifaMensal" maxlength="10" size="70" style="width:100px;" /></div></td>
	       			<td ><div class="sep10"><html:text property="tarifaPacoteFechado" styleClass="number,MyriadProRegular" styleId="tarifaPacote" maxlength="10" size="70" style="width:100px;" /></div></td>
	       		<td >
	       		
	       		<div class="sepd"><html:select property="tipoAnuncio" styleId="tipoAnuncio">
					<html:options collection="tiposAnuncio" property="codigo" labelProperty="nome"/>
				</html:select></div></td>
	     </tr>
    </table>
       
       <table  border="0" cellpadding="0" cellspacing="0">
                  <tr class="txt_caracteristicas">
                    <td >&nbsp;De</td>
                    <td >&nbsp;Até</td>
                  </tr>
                  <tr>
                    <td><span class="txt_caracteristicas">
						<div class="sep10">
							<html:select property="diaDataInicial" title="dia" styleId="diaDataInicial" styleClass="MyriadProRegular,string" style="width:55px">
								<html:option value="01">01</html:option>
					            <html:option value="02">02</html:option>
					            <html:option value="03">03</html:option>
					            <html:option value="04">04</html:option>
					            <html:option value="05">05</html:option>
					            <html:option value="06">06</html:option>
					            <html:option value="07">07</html:option>
					            <html:option value="08">08</html:option>
					            <html:option value="09">09</html:option>                            
					            <html:option value="10">10</html:option>
					            <html:option value="11">11</html:option>
					            <html:option value="12">12</html:option>
					            <html:option value="13">13</html:option>
								<html:option value="14">14</html:option>
					            <html:option value="15">15</html:option>
					            <html:option value="16">16</html:option>
					            <html:option value="17">17</html:option>
					            <html:option value="18">18</html:option>
					            <html:option value="19">19</html:option>                            
					            <html:option value="20">20</html:option>
					            <html:option value="21">21</html:option>
					            <html:option value="22">22</html:option>
					            <html:option value="23">23</html:option>
					            <html:option value="24">24</html:option>
					            <html:option value="25">25</html:option>
					            <html:option value="26">26</html:option>
					            <html:option value="27">27</html:option>
					            <html:option value="28">28</html:option>
					            <html:option value="29">29</html:option>                            
					            <html:option value="30">30</html:option>
					            <html:option value="31">31</html:option>                            
							</html:select>
						</div>
						<div class="sep10">
					        <html:select property="mesDataInicial" title="mesDataInicial" styleId="mesDataInicial" styleClass="MyriadProRegular,string">                        
					            <html:option value="1">Janeiro</html:option>
					            <html:option value="2">Fevereiro</html:option>
					            <html:option value="3">Março</html:option>
					            <html:option value="4">Abril</html:option>
					            <html:option value="5">Maio</html:option>
					            <html:option value="6">Junho</html:option>
					            <html:option value="7">Julho</html:option>
					            <html:option value="8">Agosto</html:option>
					            <html:option value="9">Setembro</html:option>
					            <html:option value="10">Outubro</html:option>
								<html:option value="11">Novembro</html:option>
								<html:option value="12">Dezembro</html:option>                  
							</html:select>						
				      	</div>
				      	<div class="sepd">				      	
					      	<html:select property="anoDataInicial" title="Ano" styleId="anoDataInicial" styleClass="MyriadProRegular,string" style="width:60px;">
					        	<html:option value="2011">2011</html:option>
						        <html:option value="2012">2012</html:option>
						        <html:option value="2013">2013</html:option>
						        <html:option value="2014">2014</html:option>
						        <html:option value="2015">2015</html:option> 
					        </html:select>
				        </div>
				        
                   		</span>
                    </td>
                    <td><span class="txt_caracteristicas">
                      <div class="sep10">
						<html:select property="diaDataFinal" title="dia" styleId="diaDataFinal" styleClass="MyriadProRegular,string" style="width:55px">                        
							<html:option value="01">01</html:option>
				            <html:option value="02">02</html:option>
				            <html:option value="03">03</html:option>
				            <html:option value="04">04</html:option>
				            <html:option value="05">05</html:option>
				            <html:option value="06">06</html:option>
				            <html:option value="07">07</html:option>
				            <html:option value="08">08</html:option>
				            <html:option value="09">09</html:option>                            
				            <html:option value="10">10</html:option>
				            <html:option value="11">11</html:option>
				            <html:option value="12">12</html:option>
				            <html:option value="13">13</html:option>
							<html:option value="14">14</html:option>
				            <html:option value="15">15</html:option>
				            <html:option value="16">16</html:option>
				            <html:option value="17">17</html:option>
				            <html:option value="18">18</html:option>
				            <html:option value="19">19</html:option>                            
				            <html:option value="20">20</html:option>
				            <html:option value="21">21</html:option>
				            <html:option value="22">22</html:option>
				            <html:option value="23">23</html:option>
				            <html:option value="24">24</html:option>
				            <html:option value="25">25</html:option>
				            <html:option value="26">26</html:option>
				            <html:option value="27">27</html:option>
				            <html:option value="28">28</html:option>
				            <html:option value="29">29</html:option>                            
				            <html:option value="30">30</html:option>
				            <html:option value="31">31</html:option>                            
						</html:select>
						</div>
						<div class="sep10">						
					        <html:select property="mesDataFinal" title="mesDataInicial" styleId="mesDataFinal" styleClass="MyriadProRegular,string">                        
					            <html:option value="1">Janeiro</html:option>
					            <html:option value="2">Fevereiro</html:option>
					            <html:option value="3">Março</html:option>
					            <html:option value="4">Abril</html:option>
					            <html:option value="5">Maio</html:option>
					            <html:option value="6">Junho</html:option>
					            <html:option value="7">Julho</html:option>
					            <html:option value="8">Agosto</html:option>
					            <html:option value="9">Setembro</html:option>
					            <html:option value="10">Outubro</html:option>
								<html:option value="11">Novembro</html:option>
								<html:option value="12">Dezembro</html:option>                  
							</html:select>
				      	</div>				      	
				      	<div class="sep10">				      	
					      	<html:select property="anoDataFinal" title="Ano" styleId="anoDataFinal" styleClass="MyriadProRegular,string" style="width:60px;">
					        	<html:option value="2011">2011</html:option>
						        <html:option value="2012">2012</html:option>
						        <html:option value="2013">2013</html:option>
						        <html:option value="2014">2014</html:option>
						        <html:option value="2015">2015</html:option>
					        </html:select>
						</div>
                      </span>
                  	</td>
                  </tr>
                </table>
</div>
<div class="divSep"></div>

<div id="formulario_edicao2">
	<div class="txt_caracteristica">Opções de pagamento</div>
	<div class="arial13Cinza">Opções aceitas pelo proprietário no Check in para o pagamento da tarifa e taxas extras.</div>
	<table border="0" class="box_opcao_pag_info">
		<tr>
			<td>
			<span class="txt_caracteristicas">
				<logic:present name="tiposPagamento">
				<logic:notEmpty name="tiposPagamento">	
					<table>
						<logic:iterate name="tiposPagamento" id="tipoPagamento">
							<div class="boxe_opcao_pagamento">
							<input type="checkbox" name="tiposPagamento" value="<bean:write name="tipoPagamento" property="codigo"/>"><div class="sepf2"><bean:write name="tipoPagamento" property="nome"/></div>
							</div>										
						</logic:iterate>
					</table>
				</logic:notEmpty>
				</logic:present>
			</span>	
			</td>
		</tr>				                
	</table>	    
</div> <!-- Fim formulario_edicao2 -->
<br><br>
<div class="btnSalvarEdicao"><input type="image" src="/buzkaza/_img/btnSalvar.jpg" width="265" height="50" border="0"/></div>

</html:form>

</div>
</div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>
