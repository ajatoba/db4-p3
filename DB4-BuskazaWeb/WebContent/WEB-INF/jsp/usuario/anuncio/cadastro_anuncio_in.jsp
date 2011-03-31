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
				    <td><span class="nome_rua">ID:${imovel.usuarioProprietario.codigo}-${imovel.codigo}</span></td>
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
                <td colspan="3"><span class="txt_caracteristicas"><img src="/buzkaza/_img/bullet.jpg" alt="" width="21" height="16" /></span><span class="tit_azul2">Datas e Tarifas cadastradas</span></td>
              </tr>
              <tr>
                <td colspan="3">
                	
                	<html:form method="post" styleId="anuncioForm" action="/usuario/anuncio?act=formCadastroAnuncio">
				  	<input type="hidden" name="ci" value="${imovel.codigo}">
				  	
	                	<table border="0" cellspacing="0" cellpadding="0">
			              <tr>
			                <td>
		                		<select name="mes" style="width:130px">
		                		    <option value="01" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("01")) out.println("selected");%>>Janeiro</option>
							        <option value="02" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("02")) out.println("selected");%>>Fevereiro</option>
							        <option value="03" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("03")) out.println("selected");%>>Março</option>
							        <option value="04" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("04")) out.println("selected");%>>Abril</option>
							        <option value="05" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("05")) out.println("selected");%>>Maio</option>
							        <option value="06" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("06")) out.println("selected");%>>Junho</option>
							        <option value="07" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("07")) out.println("selected");%>>Julho</option>
							        <option value="08" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("08")) out.println("selected");%>>Agosto</option>
							    	<option value="09" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("09")) out.println("selected");%>>Setembro</option>
							        <option value="10" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("10")) out.println("selected");%>>Outubro</option>
							        <option value="11" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("11")) out.println("selected");%>>Novembro</option>
							        <option value="12" <% if(request.getParameter("mes")!= null && request.getParameter("mes").equals("12")) out.println("selected");%>>Dezembro</option>                  
								</select> 
			                </td>
			                <td width="10">&nbsp;</td>
			                <td>
		                		<select name="ano">
		                			<%if(request.getParameter("ano")!= null) {
		                				%>
		                				<option value="<%=request.getParameter("ano") %>"><%=request.getParameter("ano") %></option>
		                			<%}%>	                        
							        <option value="2011">2011</option>
							        <option value="2012">2012</option>
							        <option value="2013">2013</option>
							        <option value="2014">2014</option>
							        <option value="2015">2015</option>
								</select>			                
			                </td>
			                <td width="10">&nbsp;</td>
			                <td><input type="submit" value="Trocar Período"></td>
			                </tr>
			            </table>
				  	
				  	</html:form>
				</td>
              </tr>
			</table>
  	

			<table width="342" border="0" cellspacing="1">
		  	<tr class="tabela_caracteristicas">
		  		<td width='10%'>Dom</td>
		  		<td width='10%'>Seg</td>
		  		<td width='10%'>Ter</td>
		  		<td width='10%'>Qua</td>
		  		<td width='10%'>Qui</td>
		  		<td width='10%'>Sex</td>
		  		<td width='10%'>Sáb</td>
		  	</tr>		  		
		  	<%
		  	//ALGORITMO DE CONSTRUÇÃO DO CALENDÁRIO - CUIDADO AO MEXER!!!
		  	Map<String,Calendario> calendarioAnuncio = (Map) request.getAttribute("calendarioAnuncio");
			
		  	Iterator it = null;
		  	if(calendarioAnuncio != null && calendarioAnuncio.size() > 0){
		  		it = calendarioAnuncio.entrySet().iterator();
		  	}
		  	
		  	boolean populado = false;
		  	
		  	int index = 0;
		  	if(it != null){
		  	while (it.hasNext()) {
		  		index = index+1;
		  		Map.Entry mapa = (Map.Entry)it.next();
		        Calendario anuncio = (Calendario) mapa.getValue();
		        
		        if(!populado){
			        for(int x=0; x<anuncio.getDiaSemana();x++){
			        	index = index+1;
			        	out.println("<td bgcolor='#d8d8d8'>&nbsp;</td>");
			        	populado = true;
			        }
		        }
		        
		        //COLORINDO O CALENDARIO
		        String color = "";
		        
		        switch (anuncio.getTipoAnuncio()) {
		        case 0: color="#d8d8d8";
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
		        
		        out.println("<td bgcolor='"+ color +"' class='td_caracteristicas'>"+ mapa.getKey() +"</td>");
		        
		        if((index % 7) == 0) out.println("</tr>");		        
		    }
		  	}
		  	//******************************************
		  	%>
		  	</table>
		  	
		  	
		  	            
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


<table border="0" cellspacing="1" cellpadding="0" width="545">
  <tr class="tabela_preco">
    <td class="preco_data">De</td>
    <td class="preco_data">Até</td>
    <td class="preco_valor">Diária</td>
    <td class="preco_valor">Semana</td>
    <td class="preco_valor">Quizenal</td>
    <td class="preco_valor">Mensal</td>
    <td class="preco_valor_pacote">Pacote Fechado</td>
    <td class="preco_valor_nada">&nbsp;</td> 
  </tr>

   <logic:notEmpty name="imovel" property="anuncios">
   
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
   	Ainda não há disponibilidade cadastrada para esse imóvel
   </logic:empty>

</table>

       </div>
</div>




<html:form method="post" action="/usuario/anuncio?act=incluirAnuncio">
<input type="hidden" name="ci" value="${imovel.codigo}">

<div id="formulario_edicao2">

    	
	    
		<table width="100%" border="0">	  
		<tr>
			<td><span class="txt_caracteristicas"><img src="/buzkaza/_img/bullet.jpg" alt="" width="21" height="16" /></span><span class="tit_azul2">Tarifas</span></td>
		</tr>	  
		
      </table> 



      	<table border="0">
	     <tr>
	       <td class="txt_caracteristicas">Diária</td>
	       <td class="txt_caracteristicas"><div class="sepd">&nbsp;Semanal</div></td>
	       <td class="txt_caracteristicas"><div class="sepd">&nbsp;Mensal</div></td>
	       <td class="txt_caracteristicas"><div class="sepd">&nbsp;Quinzenal</div></td>
	       <td class="txt_caracteristicas"><div class="sepd">&nbsp;Pacote</div></td>
	     </tr>
	     <tr>
	       <td class="txt_caracteristicas"><html:text property="tarifaDiaria" styleClass="number,MyriadProRegular" styleId="tarifaDiaria" maxlength="10" size="70"/></td>
	       <td class="txt_caracteristicas"><div class="sepd"><html:text property="tarifaSemanal" styleClass="number,MyriadProRegular" styleId="tarifaSemanal" maxlength="10" size="70"/></div></td>
	       <td class="txt_caracteristicas"><div class="sepd"><html:text property="tarifaMensal" styleClass="number,MyriadProRegular" styleId="tarifaMensal" maxlength="10" size="70"/></div></td>
	       <td class="txt_caracteristicas"><div class="sepd"><html:text property="tarifaQuinzenal" styleClass="number,MyriadProRegular" styleId="tarifaQuinzenal" maxlength="10" size="70"/></div></td>
	       <td class="txt_caracteristicas"><div class="sepd"><html:text property="tarifaPacoteFechado" styleClass="number,MyriadProRegular" styleId="tarifaPacote" maxlength="10" size="70"/></div></td>
	       <td class="txt_caracteristicas">
	       		<div class="sepd"><html:select property="tipoAnuncio" styleId="tipoAnuncio">
					<html:options collection="tiposAnuncio" property="codigo" labelProperty="nome"/>
				</html:select></div></td>
	     </tr>
       </table>
       
       
       
       <table width="100%" border="0">
                  <tr>
                    <td width="50%" class="txt_caracteristicas">De</td>
                    <td width="30%" class="txt_caracteristicas">Até</td>
                    <td width="26%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="50%"><span class="txt_caracteristicas">                        

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
				        
                        </span></td>
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
       
       
       
       
       
        
 </div>       
        

       
      	


<div id="formulario_edicao2">

	<span class="txt_caracteristicas"><img src="/buzkaza/_img/bullet.jpg" alt="" width="21" height="16" /></span><span class="tit_azul2">Opções de pagamento</span>
  	
							<table width="100%" border="0">
				                <tr>
				                  <td><span class="txt_caracteristicas"> <html:hidden property="permitirEntrada" value="true"/> Pagamento de sinal para confirmação de reserva, com saldo direto no check in.<br />
				                    Sinal de 10% (Deduzida do total da estadia+taxas extras) + encargos do cartão ou boleto referente o sinal de 10%, retidos pelo Buzkaza como taxa de transação.</span></td>
				                </tr>
				                <tr>
				                  <td><span class="txt_caracteristicas">Forma de Pagamento</span></td>
				                </tr>
				                <tr>
				                	<td><span class="txt_caracteristicas">
				                		<logic:present name="tiposPagamento">
				                		<logic:notEmpty name="tiposPagamento">	
				                		<table>
					                    
					                    <logic:iterate name="tiposPagamento" id="tipoPagamento">
							            	<tr>
							            		<td><input type="checkbox" name="tiposPagamento" value="<bean:write name="tipoPagamento" property="codigo"/>"><div class="sepd"><bean:write name="tipoPagamento" property="nome"/></div>
								            	</td>
											</tr>										
					            		</logic:iterate>
					            		</table>
					            		</logic:notEmpty>
					            		</logic:present>
				                	</td>
				                </tr>				                
				              </table>
      	<br /><br />
      	
      	<input type="submit" name="gravar" id="button5" value="Gravar" />
      	
	    
</div>	    
</html:form>	    





</div>
</div>
</div>

</div>



<div class="bottom_formulario"></div>
<div class="linha_cinza"></div>
</div></div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>
