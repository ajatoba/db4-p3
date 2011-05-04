<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza - em casa, onde estiver</title>


<link rel="stylesheet" type="text/css" href="/buzkaza/_css/cadastro.css"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/busca.css"/>

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
$(function(){
	$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
});
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

<div id="cont_reserva">
	<div id="meio_reserva">
		    <div class="top_reserva">
		      	<div class="txt_meus_anuncios"><span class="MyriadPro24">Meus Anúncios</span><span class="MyriadPro18"> / Editar Anúncio</span></div>
		      	<div class="combo_anuncios"> &nbsp;&nbsp;<a href="/DB4-BuskazaWeb/usuario/imovel.do?act=listarImoveis"><img src="/buzkaza/_img/btn_voltar_listaranuncios.jpg" width="151" height="31" style=" float:right;" border="0"/></a></div>
		    </div>
	</div>
	
	<div id="sep_top_reserva"></div>
	
	<div id="listagem_reservas">
		<div class="topo_edicao">
			<div class="mapa_planta_reserva"><img src="/buzkaza/imagens_usuarios/<bean:write name="imovel" property="primeirafoto"/>" width="140" height="104" /></div>


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
				      	
				      	<a href="javascript:abrirPop('/DB4-BuskazaWeb/usuario/foto.do?act=listarFotosImovel&ci=${imovel.codigo}');"><div class="icon_fotos_admin">Fotos</div></a>
				      	
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

<div id="sep_top_reserva_fina"></div>


<html:form method="post" styleId="imovelForm" action="/usuario/imovel.do?act=alterarImovel" enctype="multipart/form-data">
<html:hidden property="imovelEntity.codigo" />

<br />

<div id="formulario_edicao">
	<div class="left_formulario">
	
	
				<table width="100%" border="0" cellspacing="3">
				  <tr>
				    <td><span class="txt_caracteristica">Características do Imóvel</span></td>
				  </tr>
				  
			      <tr>
				     <td>
									<table width="100%" border="0">
								      <tr class="txt_caracteristicas">
								        <td>Distância do centro</td>
								        <td>Metragem</td>
								        <td>Capacidade</td>
								      </tr>
								      <tr class="txt_caracteristicas">
								      	<td width="160"><input type="text" name="distanciaCentro"  property="distanciaCentro" size="100" style="width:90px;"> <div class="sept">&nbsp;&nbsp;km</div></td>
								      	<td width="146">
								        	<html:select name="imovel" property="metragem" styleId="metragem" style="width:103px;">
								      			<html:option value="20.0">20m</html:option>
								                <html:option value="25.0">25m</html:option>
								                <html:option value="30.0">30m</html:option>
								                <html:option value="35.0">35m</html:option>
								                <html:option value="40.0">40m</html:option>
								                <html:option value="45.0">45m</html:option>
								                <html:option value="50.0">50m</html:option>
								                <html:option value="55.0">55m</html:option>
								                
								                <html:option value="60.0">60m</html:option>
								                <html:option value="65.0">65m</html:option>
								                <html:option value="70.0">70m</html:option>
								                <html:option value="75.0">75m</html:option>
								                <html:option value="80.0">80m</html:option>
								                <html:option value="85.0">85m</html:option>
								                <html:option value="90.0">90m</html:option>
								                <html:option value="95.0">95m</html:option>
								                <html:option value="100.0">100m</html:option>
								                
								                <html:option value="105.0">105m</html:option>
								                <html:option value="110.0">110m</html:option>
								                <html:option value="115.0">115m</html:option>
								                <html:option value="120.0">120m</html:option>
								                <html:option value="125.0">125m</html:option>
								                <html:option value="130.0">130m</html:option>
								                <html:option value="135.0">135m</html:option>
								                <html:option value="140.0">140m</html:option>
								                <html:option value="145.0">145m</html:option>
								                
								                <html:option value="150.0">150m</html:option>
								                <html:option value="155.0">155m</html:option>
								                <html:option value="160.0">160m</html:option>
								                <html:option value="165.0">165m</html:option>
								                <html:option value="170.0">170m</html:option>
								                <html:option value="175.0">175m</html:option>
								                <html:option value="180.0">180m</html:option>
								                <html:option value="185.0">185m</html:option>
								                <html:option value="190.0">190m</html:option>
								                
								                <html:option value="195.0">195m</html:option>
								                <html:option value="200.0">200m</html:option>
								                <html:option value="205.0">205m</html:option>
								                <html:option value="210.0">210m</html:option>
								                <html:option value="215.0">215m</html:option>
								                <html:option value="220.0">220m</html:option>
								                <html:option value="225.0">225m</html:option>
								                <html:option value="230.0">230m</html:option>
								                <html:option value="235.0">235m</html:option>
								                
								                <html:option value="240.0">240m</html:option>
								                <html:option value="245.0">245m</html:option>
								                <html:option value="250.0">250m</html:option>
								                <html:option value="255.0">255m</html:option>
								                <html:option value="260.0">260m</html:option>
								                <html:option value="265.0">265m</html:option>
								                <html:option value="270.0">270m</html:option>
								                <html:option value="275.0">275m</html:option>
								                <html:option value="280.0">280m</html:option>
								                
								                <html:option value="285.0">285m</html:option>
								                <html:option value="290.0">290m</html:option>
								                <html:option value="295.0">295m</html:option>
								                <html:option value="300.0">300m</html:option>
								                <html:option value="305.0">305m</html:option>
								                <html:option value="310.0">310m</html:option>
								                <html:option value="315.0">315m</html:option>
								                <html:option value="320.0">320m</html:option>
								                <html:option value="325.0">325m</html:option>
								                
								                <html:option value="330.0">330m</html:option>
								                <html:option value="335.0">335m</html:option>
								                <html:option value="340.0">340m</html:option>
								                <html:option value="345.0">345m</html:option>
								                <html:option value="350.0">350m</html:option>
								                <html:option value="355.0">355m</html:option>
								                <html:option value="360.0">360m</html:option>
								                <html:option value="365.0">365m</html:option>
								                <html:option value="370.0">370m</html:option>
								                
								                <html:option value="375.0">375m</html:option>
								                <html:option value="380.0">380m</html:option>
								                <html:option value="385.0">385m</html:option>
								                <html:option value="390.0">390m</html:option>
								                <html:option value="395.0">395m</html:option>
								                <html:option value="400.0">400m</html:option>
								                <html:option value="405.0">405m</html:option>
								                <html:option value="410.0">410m</html:option>
								                <html:option value="415.0">415m</html:option>
								                
								                <html:option value="420.0">420m</html:option>
								                <html:option value="425.0">425m</html:option>
								                <html:option value="430.0">430m</html:option>
								                <html:option value="435.0">435m</html:option>
								                <html:option value="440.0">440m</html:option>
								                <html:option value="445.0">445m</html:option>
								                <html:option value="450.0">450m</html:option>
								                <html:option value="455.0">455m</html:option>
								                <html:option value="460.0">460m</html:option>
								                
								                <html:option value="465.0">465m</html:option>
								                <html:option value="470.0">470m</html:option>
								                <html:option value="475.0">475m</html:option>
								                <html:option value="480.0">480m</html:option>
								                <html:option value="485.0">485m</html:option>
								                <html:option value="490.0">490m</html:option>
								                <html:option value="495.0">495m</html:option>
								                <html:option value="500.0">500m</html:option>
								                <html:option value="505.0">505m</html:option>
								                
								                <html:option value="510.0">510m</html:option>
								                <html:option value="515.0">515m</html:option>
								                <html:option value="520.0">520m</html:option>
								                <html:option value="525.0">525m</html:option>
								                <html:option value="530.0">530m</html:option>
								                <html:option value="535.0">535m</html:option>
								                <html:option value="540.0">540m</html:option>
								                <html:option value="545.0">545m</html:option>
								                <html:option value="550.0">550m</html:option>
								                
								                <html:option value="555.0">555m</html:option>
								                <html:option value="560.0">560m</html:option>
								                <html:option value="565.0">565m</html:option>
								                <html:option value="570.0">570m</html:option>
								
								                <html:option value="575.0">575m</html:option>
								                <html:option value="580.0">580m</html:option>
								                <html:option value="585.0">585m</html:option>
								                <html:option value="590.0">590m</html:option>
								                <html:option value="595.0">595m</html:option>
								                
								                <html:option value="600.0">600m</html:option>
								
								      		</html:select>
								           
								         </td>
								        <td>
								        	<html:select name="imovel" property="capacidade" styleId="capacidade">
								      			<html:option value="1">1 Pessoa</html:option>
												<html:option value="2">2 Pessoas</html:option>
												<html:option value="3">3 Pessoas</html:option>
												<html:option value="4">4 Pessoas</html:option>
												<html:option value="5">5 Pessoas</html:option>
												<html:option value="6">6 Pessoas</html:option>
												<html:option value="7">7 Pessoas</html:option>
												<html:option value="8">8 Pessoas</html:option>	
												<html:option value="9">9 Pessoas</html:option>					
												<html:option value="10">10 Pessoas</html:option>
												<html:option value="11">11 Pessoas</html:option>
												<html:option value="12">12 Pessoas</html:option>
												<html:option value="13">13 Pessoas</html:option>
												<html:option value="14">14 Pessoas</html:option>
												<html:option value="15">15 Pessoas</html:option>
												<html:option value="16">16 Pessoas</html:option>
												<html:option value="17">17 Pessoas</html:option>
												<html:option value="18">18 Pessoas</html:option>
												<html:option value="19">19 Pessoas</html:option>								
												<html:option value="20">20 Pessoas</html:option>
												<html:option value="21">21 Pessoas</html:option>
												<html:option value="22">22 Pessoas</html:option>
								      		</html:select>
								        </td>
								      </tr>
								    </table>        
			        </td>
			      </tr>
			      
			      <tr>
				    <td>
				    
					    <table border="0" >
					      <tr>
					      	<td class="txt_caracteristicas">Quartos</td>
					        <td class="txt_caracteristicas">Qtd. Camas</td>
					        <td class="txt_caracteristicas">Idiomas Falados</td>
					        <td></td>
					      </tr>
					      <tr valign="top">
					      <td width="124">
					      	<div>
					      		<html:select name="imovel" property="quartos" styleId="quartos">
						      			<html:option value="1">1 Quarto</html:option>
										<html:option value="2">2 Quartos</html:option>
										<html:option value="3">3 Quartos</html:option>
										<html:option value="4">4 Quartos</html:option>
										<html:option value="5">5 Quartos</html:option>
										<html:option value="6">6 Quartos</html:option>
										<html:option value="7">7 Quartos</html:option>
										<html:option value="8">8 Quartos</html:option>				
										<html:option value="9">9 Quartos</html:option>				
										<html:option value="10">10 Quartos</html:option>
										<html:option value="11">11 Quartos</html:option>
										<html:option value="12">12 Quartos</html:option>
										<html:option value="13">13 Quartos</html:option>
										<html:option value="14">14 Quartos</html:option>
										<html:option value="15">15 Quartos</html:option>
										<html:option value="16">16 Quartos</html:option>
										<html:option value="17">17 Quartos</html:option>				
										<html:option value="18">18 Quartos</html:option>
										<html:option value="19">19 Quartos</html:option>				
										<html:option value="20">20 Quartos</html:option>
										<html:option value="21">21 Quartos</html:option>
										<html:option value="22">22 Quartos</html:option>
						      		</html:select>
						      	</div>
							</td>
					        <td width="123">
				        		<div>
						        <html:select name="imovel" property="camas" style="width:80px;">
						            <html:option value="1">1</html:option>
						            <html:option value="2">2</html:option>
						            <html:option value="3">3</html:option>
						            <html:option value="4">4</html:option>
						            <html:option value="5">5</html:option>
						            <html:option value="6">6</html:option>
						            <html:option value="7">7</html:option>
						            <html:option value="8">8</html:option>
						            <html:option value="9">9</html:option>
						        	<html:option value="10">10</html:option>            
						        </html:select>
					            </div> 
					        </td>
					        <td>
					        	<html:select property="idiomas" multiple="true">
							     	<html:options collection="idiomas" property="codigo" labelProperty="nome" />     
							     </html:select>
					        </td>
					      </tr>
					      

					      <tr>
					      	<td colspan="3"><span class="txt_caracteristica">Taxas Extras</span></td>
					      </tr>
					      <tr>
					      	<td colspan="3"><span class="arial13Cinza">As Taxas Extras serão pagas diretamente ao proprietário no Check-in em espécie ou outra forma de pagamento indicada em "Opções de Pagamento".</span></td>
					      </tr>					      
					      <tr class="txt_caracteristicas">
						      <td>Caução:</td>
						      <td>Eletricidade:</td>
						      <td>Água:</td>
					      </tr>
					      <tr>
						      <td><html:text name="imovel" property="calcao" size="90" style="width:100px;"/></td>
						      <td><html:text name="imovel" property="energia" size="90" style="width:100px;"/></td>
						      <td><html:text name="imovel" property="taxaAgua" size="90" style="width:100px;"/></td>
					      </tr>
					      <tr class="txt_caracteristicas">
						      <td>Gás:</td>
						      <td>Limpeza:</td>
						      <td></td>
					      </tr>
					      <tr>
						      <td><html:text name="imovel" property="taxaGas" size="90" style="width:100px;"/></td>
						      <td><html:text name="imovel" property="diarista" size="90" style="width:100px;"/></td>
						      <td></td>
					      </tr>
					      <tr><td height="40" colspan="5">&nbsp;</td></tr>
</table>
				   
				   </td>
				  </tr>
			    </table>
	
	</div>
	
	<div class="right_formulario">
					<table width="100%" border="0">
					  <tr>
					    <td><span class="txt_caracteristica">Equipamentos Permissões e Facilidades</span></td>
					  </tr>
					  <tr>
					    <td>
					    	<table width="100%" border="0">
					      		<tr>
					        		<td colspan="3" class="MyriadProRegular">
					       				<logic:iterate name="equipamentos" id="equipamento">
							    			<div id="sep_form_busca" class="txt_form">
							           			<div class="equip_top1">									
										    		<html:multibox property="equipamentos"> 
												<bean:write name="equipamento" property="codigo"/>
													</html:multibox>
												</div>
												<div class="equip_top2">
													<bean:write name="equipamento" property="nome"/>
												</div>
							        		</div>
					            		</logic:iterate>
					        		</td>
					      		</tr>
					    	</table>
					    </td>
					  </tr>					 
					</table><!-- Final Tabela Equipamentos -->
	</div>
</div>
<div class="bottom_formulario">
	<table width="100%" border="0">
		<tr>
			<td width="100%" class="txt_caracteristica">Dados de Check-in e Check-out</td>
		</tr>
		<tr>
	  		<td class="arial13Cinza">Todas as taxas extras, incluindo taxa de Check-in e Check-out fora de horário, deverão ser pagas em dinheiro ao proprietário. Apenas iremos informar os valores.</td>
  		</tr>
  		<tr><td height="25" colspan="5">&nbsp;</td></tr><!--TR separadora-->
  		<tr>
        	<td class="txt_caracteristicas" colspan="2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr class="txt_caracteristicas">
						<td><span class="txt_caracteristicas">Nome de quem fará o Check in</span></td>
						<td><span class="txt_caracteristicas">Telefone</span></td>
						<td><span class="txt_caracteristicas">Telefone Alternativo</span></td>
						<td><span class="txt_caracteristicas">Email</span></td>
						<td><span class="txt_caracteristicas">Email Alternativo</span></td>
					</tr>
					<tr>    
						<td><div class="sepd"><html:text name="imovel"  property="nomeCheckIn"  size="180" style="width:190px;" /></div></td>
						<td><div class="sepd2"><html:text name="imovel"  property="ddd" maxlength="3"  size="30" style="width:40px;"/></div>
						<div class="sepd"><html:text name="imovel"  name="imovel"  property="telefone"  maxlength="8" size="90" style="width:100px;"/></div></td> 
						<td><div class="sepd2"><html:text name="imovel"  property="ddd2" maxlength="3" size="30" style="width:40px;"/></div>                        
						<div class="sepd"><html:text name="imovel"  property="telefone2" maxlength="8" size="90" style="width:100px;"/></div></td>                        					
						<td><div class="sepd"><html:text name="imovel"  property="emailCheckin"  size="150" style="width:160px;"/></div></td>
						<td><div class="seps"><html:text name="imovel"  property="emailCheckin2"  size="150" style="width:160px;"/></div></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr><td height="20" colspan="5">&nbsp;</td></tr><!--TR separadora-->
		
		<tr><!--tr Check-in/out-->
			<td colspan="5"><!--td Check-in/out-->
            	<table border="0" cellpadding="0" cellspacing="0"><!--table Check-in/out-->
                	<tr class="txt_caracteristicas">
                    	<td><span class="txt_caracteristicas">Horário Check-in</span></td>
                    	<td><span class="txt_caracteristicas">Horário Check-out</span></td>
                	</tr>
                	<tr class="txt_caracteristicas">
						<td>
                        	<div class="divhorario3">
	        				<div class="sept">De&nbsp;&nbsp;</div>
	        				<div class="seps"><html:text property="checkInEntradaHora" maxlength="2" size="30" style="width:40px;" /></div>
	          				<div class="sept">&nbsp;:&nbsp;</div>
	         				<div class="sepd"><html:text property="checkInEntradaMinuto" maxlength="2" size="30" style="width:40px;" /></div>
	          				<div class="sept">Até&nbsp;&nbsp;</div>
	         				<div class="seps"><html:text property="checkInSaidaHora" maxlength="2" size="30" style="width:40px;" /></div>
	          				<div class="sept">&nbsp;:&nbsp;</div>
	          				<div class="sepd"><html:text property="checkInSaidaMinuto" maxlength="2" size="30" style="width:40px;" /></div>
	         				</div>
             			</td>
						<td>
                            <div class="divhorario4">
	        				<div class="sept">De&nbsp;&nbsp;</div>
	        				<div class="seps"><html:text property="checkOutEntradaHora" maxlength="2" size="30" style="width:40px;" /></div>
	          				<div class="sept">&nbsp;:&nbsp;</div>
	         				<div class="sepd"><html:text property="checkOutEntradaMinuto" maxlength="2" size="30" style="width:40px;" /></div>
	          				<div class="sept">Até&nbsp;&nbsp;</div>
	         				<div class="seps"><html:text property="checkOutSaidaHora" maxlength="2" size="30" style="width:40px;" /></div>
	          				<div class="sept">&nbsp;:&nbsp;</div>
	          				<div class="sepd"><html:text property="checkOutSaidaMinuto" maxlength="2" size="30" style="width:40px;" /></div>
	         				</div>
             			</td>
                	</tr> 
                    <tr class="txt_caracteristicas">
                    	<td>Taxa para Check-in fora do horário:</td>
                    	<td>Taxa para Check-out fora do horário:</td>
                    </tr>							                      	  
                    <tr>
                    	<td><html:text name="imovel" property="taxaLateCheckin" size="90" style="width:100px;"/></td>
                    	<td><html:text name="imovel" property="taxaLateCheckout" size="90" style="width:100px;"/></td>
                    </tr>
                </table><!--Final table Check-in/out-->
             </td><!--Final td Check-in/out-->
         </tr><!--Final tr Check-in/out-->
		</table>  
</div>

<br><br>

<div class="btnSalvarEdicao"><input type="image" src="/buzkaza/_img/btnSalvar.jpg" width="265" height="50" border="0"/></div>

</html:form>

</div>
</div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>
