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
<title>Buzkaza</title>

	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>	
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.ui.draggable.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.alerts.js" ></script>


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
</head>

<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>



<div id="cont_reserva">
	<div id="meio_reserva">
		    <div class="top_reserva">
		      	<div class="txt_meus_anuncios"><span class="MyriadPro24">Meus Anúncios</span></div>
		      	<div class="combo_anuncios"> &nbsp;&nbsp;<img src="/buzkaza/_img/btn_criar_anuncio.jpg" width="151" height="31" style=" float:right;" /></div>
		    </div>
	</div>

	<div id="sep_top_reserva"></div>
	
	<div id="listagem_reservas">
		<div class="topo_edicao">
			<div class="mapa_planta"><img src="/buzkaza/imagens_usuarios/${imovel.primeirafoto}" width="140" height="104" /></div>

			<div class="endereco_bairro">
					<table width="100%" border="0">
					  <tr>
					    <td width="35%" valign="top"><span class="nome_rua">${imovel.bairro}</span></td>
					    <td width="65%" rowspan="3"><span class="nome_rua">Distância do centro ${imovel.distanciaCentro}<br />
					      Mapa Google Maps:${imovel.linkGoogleMaps}<br />
					      Vídeo You Tube:${imovel.linkYouTube}</span></td>
					  </tr>
					  <tr>
					    <td><span class="nome_rua">${imovel.logradouro}</span></td>
					  </tr>
					  <tr>
					    <td><span class="nome_rua">ID:${imovel.codigo}</span></td>
					  </tr>
					</table>
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



	<div class="menu_edicao">
        <div class="menu_01_cinza"></div>
        <div class="menu_02_cinza"></div>
        <div class="menu_03"></div>
      </div>




<div id="formulario_edicao">
	<div class="left_formulario_">
			<table width="100%" border="0">
              <tr>
                <td colspan="3"><span class="txt_caracteristicas"><img src="/buzkaza/_img/bullet.jpg" alt="" width="21" height="16" /></span><span class="tit_azul2">Disponibilidades</span></td>
              </tr>
              <tr>
                <td colspan="3">
                	
                	<html:form method="post" styleId="anuncioForm" action="/usuario/anuncio?act=formCadastroAnuncio">
				  	<input type="hidden" name="ci" value="${imovel.codigo}">
				  	
	                	<table border="0" cellspacing="3">
			              <tr>
			                <td>
			                		<select name="mes">                        
								        <option value="01">Janeiro</option>
								        <option value="02">Fevereiro</option>
								        <option value="03">Março</option>
								        <option value="04">Abril</option>
								        <option value="05">Maio</option>
								        <option value="06">Junho</option>
								        <option value="07">Julho</option>
								        <option value="08">Agosto</option>
								    	<option value="09">Setembro</option>
								        <option value="10">Outubro</option>
								        <option value="11">Novembro</option>
								        <option value="12">Dezembro</option>                  
									</select> 
			                </td>
			                <td>
			                
			                		<select name="ano">                        
								        <option value="2011">2011</option>
								        <option value="2012">2012</option>
								        <option value="2013">2013</option>
								        <option value="2014">2014</option>
								        <option value="2015">2015</option>
									</select>
			                
			                </td>
			                <td>	<input type="submit" value="Trocar Período"> </td>
			                </tr>
			            </table>
				  	
				  	</html:form>
				</td>
              </tr>
			</table>
	
	
			<table border="0" cellspacing="3">
		  	<tr>
		  		<td width='10%' class='txt_caracteristicas'>Dom</td>
		  		<td width='10%' class='txt_caracteristicas'>Seg</td>
		  		<td width='10%' class='txt_caracteristicas'>Ter</td>
		  		<td width='10%' class='txt_caracteristicas'>Qua</td>
		  		<td width='10%' class='txt_caracteristicas'>Qui</td>
		  		<td width='10%' class='txt_caracteristicas'>Sex</td>
		  		<td width='10%' class='txt_caracteristicas'>Sab</td>
		  	</tr>
		  		
		  	<%
		  	//ALGORITMO DE CONSTRUÇÃO DO CALENDÁRIO - CUIDADO AO MEXER!!!
		  	Map<String,Calendario> calendarioAnuncio = (Map) request.getAttribute("calendarioAnuncio");
			
		  	Iterator it = calendarioAnuncio.entrySet().iterator();  	
		  	boolean populado = false;
		  	
		  	int index = 0;
		  	
		  	while (it.hasNext()) {
		  		index = index+1;
		  		Map.Entry mapa = (Map.Entry)it.next();
		        Calendario anuncio = (Calendario) mapa.getValue();
		        
		        if(!populado){
			        for(int x=0; x<anuncio.getDiaSemana();x++){
			        	index = index+1;
			        	out.println("<td>&nbsp;</td>");
			        	populado = true;
			        }
		        }
		        
		        //COLORINDO O CALENDARIO
		        String color = "";
		        
		        switch (anuncio.getTipoAnuncio()) {
		        case 0: color="white";
		        	break;
		        case 1: color="#2980C5";
		        	break;
		        case 2: color="#FF6D00";
		        	break;
		        case 3: color="#8DBF22";
		        	break;
		        case 4: color="#FFC600";
		        	break;
		        case 5: color="#D300FF";
		        	break;
		        case 6: color="#00D8FF";
		        	break;
		        }
		        //**********************
		        
		        out.println("<td bgcolor='"+ color +"' class='txt_caracteristicas'>"+ mapa.getKey() +"</td>");
		        
		        if((index % 7) == 0) out.println("</tr>");
		        
		    }
		  	//******************************************
		  	%>
		  	</table>



	</div><!-- class="left_formulario_"  -->
<div class="right_formulario_">


	<html:form method="post" action="/usuario/anuncio?act=incluirAnuncio">
	<input type="hidden" name="ci" value="${imovel.codigo}">
	
	<table width="100%" border="0">	  
		<tr>
			<td><span class="txt_caracteristicas"><img src="/buzkaza/_img/bullet.jpg" alt="" width="21" height="16" /></span><span class="tit_azul2">Tarifas</span></td>
		</tr>	  
		<tr>  	
			<td valign="top" class="txt_caracteristicas">
				<label for="select">Status</label>
				<html:select property="tipoAnuncio" styleId="tipoAnuncio">
				<html:options collection="tiposAnuncio" property="codigo" labelProperty="nome"/>
				</html:select>
			</td>
		</tr>
        <tr>
        	<td>	
		
				<table width="100%" border="0">
                  <tr>
                    <td width="50%" class="txt_caracteristicas">De</td>
                    <td width="30%" class="txt_caracteristicas">Até</td>
                    <td width="26%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="50%"><label for="textfield"><span class="txt_caracteristicas">                        

						<html:select property="diaDataInicial" title="dia" styleId="diaDataInicial" styleClass="MyriadProRegular,string">                        
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
						
						<div class="sepd">

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
				      	
				      	<html:select property="anoDataInicial" title="Ano" styleId="anoDataInicial" styleClass="MyriadProRegular,string">
				        	<html:option value="2011">2011</html:option>
					        <html:option value="2012">2012</html:option>
					        <html:option value="2013">2013</html:option>
					        <html:option value="2014">2014</html:option>
					        <html:option value="2015">2015</html:option> 
				        </html:select>
				        </div>
				        
                        </span></label></td>
                    <td colspan="2"><span class="txt_caracteristicas">
                      
						<html:select property="diaDataFinal" title="dia" styleId="diaDataFinal" styleClass="MyriadProRegular,string">                        
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
						
						<div class="sepd">
						
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
				      	<div class="sepd">				      	
				      	
					      	<html:select property="anoDataFinal" title="Ano" styleId="anoDataFinal" styleClass="MyriadProRegular,string">
					        	<html:option value="2011">2011</html:option>
						        <html:option value="2012">2012</html:option>
						        <html:option value="2013">2013</html:option>
						        <html:option value="2014">2014</html:option>
						        <html:option value="2015">2015</html:option>
					        </html:select>
						</div>
                      </span></td>
                  </tr>
                </table>


        </td>
      </tr>
      </table>
      
      
      <table width="100%" border="0">
	     <tr>
	       <td class="txt_caracteristicas">Tarifa Diária</td>
	       <td class="txt_caracteristicas">Tarifa Semanal</td>
	       <td class="txt_caracteristicas">Tarifa Mensal</td>
	       <td class="txt_caracteristicas">Tarifa Quinzenal</td>
	       <td class="txt_caracteristicas">Pacote Fechado</td>
	     </tr>
	     <tr>
	       <td class="txt_caracteristicas"><html:text property="tarifaDiaria" styleClass="number,MyriadProRegular" styleId="tarifaDiaria" maxlength="10" size="70"/></td>
	       <td class="txt_caracteristicas"><html:text property="tarifaSemanal" styleClass="number,MyriadProRegular" styleId="tarifaSemanal" maxlength="10" size="70"/></td>
	       <td class="txt_caracteristicas"><html:text property="tarifaMensal" styleClass="number,MyriadProRegular" styleId="tarifaMensal" maxlength="10" size="70"/></td>
	       <td class="txt_caracteristicas"><html:text property="tarifaQuinzenal" styleClass="number,MyriadProRegular" styleId="tarifaQuinzenal" maxlength="10" size="70"/></td>
	       <td class="txt_caracteristicas"><html:text property="tarifaPacoteFechado" styleClass="number,MyriadProRegular" styleId="tarifaPacote" maxlength="10" size="70"/></td>
	     </tr>
       </table> 
        
      	
      	<table width="100%" border="0">
         <tr>
           <td class="tit_box_facil_alugar">Legenda</td>
         </tr>
         <tr>
           <td>
				      	<!-- LEGENDA -->
					  	<table width="100%" border="0">
                    <tr>
                      <td width="5%" bgcolor="#E3E3E3">&nbsp;</td>
                      <td width="27%" class="txt_caracteristicas">Reservado</td>
                      <td width="6%" bgcolor="#8DBF22">&nbsp;</td>
                      <td width="28%" class="txt_caracteristicas">Baixa Temporada</td>
                      <td width="6%" bgcolor="#D300FF">&nbsp;</td>
                      <td width="28%" class="txt_caracteristicas">Data Especial</td>
                    </tr>
                    <tr>
                      <td bgcolor="#2980C5">&nbsp;</td>
                      <td class="txt_caracteristicas">Bloqueado</td>
                      <td bgcolor="#FFC600">&nbsp;</td>
                      <td class="txt_caracteristicas">Média Temporada</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td bgcolor="#00D8FF">&nbsp;</td>
                      <td class="txt_caracteristicas">Pacote Fechado</td>
                      <td bgcolor="#FF6D00">&nbsp;</td>
                      <td class="txt_caracteristicas">Alta Temporada</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
					  	<!-- ******* -->
					  	
      		</td>
         </tr>
       </table>
       
       
 	
      	
      	<!-- 
      	<input type="submit" name="gravar" id="button5" value="Gravar" />
      	-->
      	<a href="#" onclick="validaForm()" />Gravar</a>
      	</div>
      	
      	</div>
      	
      	
      
      	

		<div class="linha_cinza"></div>
  		<div class="opcoes_pg">
      	
		      	<div id="tabs">                
		            <div id="container_abas">
		               <ul id="nav">	
		                   <li id="aba_1"><a href="#quemsomos" class="corrente" onclick="trocaImagem('opcao_01')"><img src="/buzkaza/_img/opcao_01_azul.jpg" id="opcao_01"width="157" height="49" alt="" border="0"/></a></li>  
		                   <li><a href="#formacao" onclick="trocaImagem('opcao_02')"><img src="/buzkaza/_img/opcao_02.jpg" id="opcao_02"width="157" height="49" alt="" border="0"/></a></li> 
		                                           
		               </ul>
		               
		               <div id="aba1" class="aba">		      			
			      			
					      		<table width="100%" border="0">
				                <tr>
				                  <td><span class="txt_caracteristicas"> <html:radio property="permitirEntrada" value="true"/> Pagamento de sinal para confirmação de reserva, com saldo direto no check in.<br />
				                    Sinal de 10% (Deduzida do total da estadia+taxas extras) + encargos do cartão ou boleto referente o sinal de 10%, retidos pelo Buzkaza como taxa de transação.</span></td>
				                </tr>
				                <tr>
				                  <td><span class="txt_caracteristicas">Forma de Pagamento</span></td>
				                </tr>
				                <tr>
				                <td><span class="txt_caracteristicas">
					                    <input type="radio" name="radio" id="radio" value="radio" /> Dinheiro&nbsp;&nbsp;
					                    <input type="radio" name="radio" id="radio" value="radio" /> Visa&nbsp;&nbsp;
					                    <input type="radio" name="radio" id="radio" value="radio" /> Mastercard&nbsp;
					                    <input type="radio" name="radio" id="radio" value="radio" /> Dinners&nbsp;&nbsp;
					                    <input type="radio" name="radio" id="radio" value="radio" /> Bradesco&nbsp;&nbsp;
					                    <input type="radio" name="radio" id="radio" value="radio" /> Itaú&nbsp;&nbsp;
					                    <input type="radio" name="radio" id="radio" value="radio" /> Unibanco
					                    <input type="radio" name="radio" id="radio" value="radio" /> Banco do Brasil </span>
				                	</td>
				                </tr>
				                <tr>
				                	<td><span class="txt_caracteristicas">
					                    <input type="radio" name="radio" id="radio2" value="radio" /> Aura
					                    <input type="radio" name="radio" id="radio3" value="radio" /> Hipercard
					                    <input type="radio" name="radio" id="radio4" value="radio" /> Amex </span>
				                	</td>
				                </tr>
				              </table>
				              <br />
		               
		               </div>
		               
		               <div id="aba2" class="aba">
					      	<table cellspacing="10" border="0">
					      		<tr>
						      		<td valign="top">
						      								      			
						      			
						      			<table width="100%" border="0">
						                <tr>
						                  <td colspan="3"><html:radio property="permitirEntrada" value="false"/> <span style="font-family:Arial, Helvetica, sans-serif; font-size:15px; color:#505050; font-weight:bold;">Pagamento integral da estadia (só para proprietários Brasileiros).</span></td>
						                </tr>
						                <tr>
						                  <td width="160"><span class="txt_caracteristicas">Titular</span></td>
						                  <td width="234">&nbsp;</td>
						                  <td width="342"><span class="txt_caracteristicas">CPF/CNPJ</span></td>
						                </tr>
						                <tr>
						                  <td colspan="2"><span class="txt_caracteristicas"><input type="text" name="nomeTitularConta" value="${usuario.nomeTitularConta}" size="300" style="width:300px;" /></span></td>
						                  <td><span class="txt_caracteristicas"><input type="text" name="cpfTitularConta" value="${usuario.cpfTitularConta}" size="150" style="width:150px;" /></span></td>
						                </tr>
						                <tr>
						                  <td><span class="txt_caracteristicas">Número do Banco</span></td>
						                  <td><span class="txt_caracteristicas">Agência</span></td>
						                  <td><span class="txt_caracteristicas">Conta Corrente</span></td>
						                </tr>
						                <tr>
						                  <td><span class="txt_caracteristicas"><input type="text" name="codigoBanco" value="${usuario.codigoBanco}" size="70" style="width:70px;"/></span></td>
						                  <td><span class="txt_caracteristicas"><input type="text" name="agencia" value="${usuario.agencia}" size="70" style="width:70px;"/></td>
						                  <td><span class="txt_caracteristicas"><input type="text" name="conta" value="${usuario.contaCorrente}" size="70" style="width:70px;"/></span></td>
						                </tr>
						              </table>
						      		</td>
					      		</tr>
					      	</table>
		      		</div>
      		
        </div>
      	
      	
	    </html:form>
	    
	    <BR><BR>
	
	
	
	    
	    <logic:notEmpty name="imovel" property="anuncios">
	    <table>
	    	<logic:iterate id="an" name="imovel" property="anuncios">
	    	<tr>
			  	<td>
			  		<!-- SETANDO A COR -->
			  		<logic:equal name="an" property="tipoAnuncio.codigo" value="0">
			  			<font color="WHITE">
			  		</logic:equal>
			  		<logic:equal name="an" property="tipoAnuncio.codigo" value="1">
			  			<font color="#2980C5">
			  		</logic:equal>			  		
			  		<logic:equal name="an" property="tipoAnuncio.codigo" value="2">
			  			<font color="#FF6D00">
			  		</logic:equal>
			  		<logic:equal name="an" property="tipoAnuncio.codigo" value="3">
			  			<font color="#8DBF22">
			  		</logic:equal>
			  		<logic:equal name="an" property="tipoAnuncio.codigo" value="4">
			  			<font color="#FFC600">
			  		</logic:equal>
			  		<logic:equal name="an" property="tipoAnuncio.codigo" value="5">
			  			<font color="#D300FF">
			  		</logic:equal>
			  		<logic:equal name="an" property="tipoAnuncio.codigo" value="6">
			  			<font color="#00D8FF">
			  		</logic:equal>
		
			  		<!-- ************* -->
			  		<bean:write name="an" property="dataInicial" format="dd/MM/yyyy"/> a <bean:write name="an" property="dataFinal" format="dd/MM/yyyy"/>
			  		</font>
			  	</td>
			  	<td>
			  		<html:form method="post" action="/usuario/anuncio?act=excluirAnuncio">
			  			<input type="hidden" name="idAnuncio" value="${an.codigo}"/>
			  			<input type="hidden" name="ci" value="${imovel.codigo}"/>
			  			<html:submit>Excluir</html:submit>
			  		</html:form>	  	
			  		
			  	</td>
			  	</tr>
		  	</logic:iterate>
	    </TABLE>
	    </logic:notEmpty>
	    <logic:empty name="imovel" property="anuncios">
	    	Ainda não há disponibilidade cadastrada para esse imóvel
	    </logic:empty>
    </td>
  </tr>  
</table>




</div>

</div>


<div class="bottom_formulario"></div>
<div class="linha_cinza"></div>
</div></div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>
