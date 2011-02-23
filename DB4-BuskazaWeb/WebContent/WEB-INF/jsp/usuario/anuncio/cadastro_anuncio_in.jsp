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
<title>Untitled Document</title>

<script language="javascript">
	$(function(){
			$('#form').jqTransform({imgPath:'jqtransformplugin/img/'});
	});
	
	$(function(){
	$('#sep_top_reserva').corner('rounded 7px');
	
		$("#busca_home").corner("bottom 7px");
		$("#mapa_").corner("bottom 7px");
		});
</script>

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.js"></script>
<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.ui.draggable.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.alerts.js" ></script>

<link rel="stylesheet" type="text/css" href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/jquery.alerts.css"  />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/cadastro.css"  />
<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />
	
</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/buzkaza/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/buzkaza/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/buzkaza/images/top_03.jpg" width="991" height="77" /></div>
<!--CADASTRO-->
<jsp:include page="../menu.jsp"/>

<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_meus_anuncios">
		<span class="MyriadPro24">Anunciar Imóvel</span>
	</div>
</div>

</div>
<div id="sep_top_reserva"></div>
<div id="listagem_reservas">
<div class="topo_edicao">
<div class="mapa_planta"><img src="/buzkaza/_img/adm_meusanuncios_editar_05.png" width="195" height="145" /></div>

<table width="40%" border="0"> 
  <tr>
    <td width="20%">
    	${imovel.bairro}<br>
    	${imovel.logradouro}
    </td>
    <td width="20%">
      Distância do centro ${imovel.distanciaCentro}<br />
      Mapa Google Maps:${imovel.linkGoogleMaps}<br />
      Vídeo You Tube:${imovel.linkYouTube}
    </td>
  </tr>
</table>

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



<div id="formulario_edicao">
<div class="left_formulario_">

</div>
<div class="right_formulario_">

<table width="100%" border="0">
  
  <tr>
  	<td width="50%">
  	<html:form method="post" action="/usuario/anuncio?act=formCadastroAnuncio">
  	<input type="hidden" name="ci" value="${imovel.codigo}">
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
  	<select name="ano">                        
        <option value="2011">2011</option>
        <option value="2012">2012</option>
        <option value="2013">2013</option>
        <option value="2014">2014</option>
        <option value="2015">2015</option>
	</select>
  	<input type="submit" value="Trocar Período">
  	</html:form>
  	<br>
  	<table border="1">
  	<tr>
  		<td>Dom</td>
  		<td>Seg</td>
  		<td>Ter</td>
  		<td>Qua</td>
  		<td>Qui</td>
  		<td>Sex</td>
  		<td>Sab</td>
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
        
        out.println("<td bgcolor='"+ color +"'>"+ mapa.getKey() +"</td>");
        
        if((index % 7) == 0) out.println("</tr>");
        
    }
  	//******************************************
  	%>
  	</table>
  	<br>
  	<!-- LEGENDA -->
  	<table border="0">
      <tr>
        <td width="5%" bgcolor="#E3E3E3">&nbsp;</td>
        <td width="27%">Reservado</td>
        <td width="6%" bgcolor="#8DBF22">&nbsp;</td>
        <td width="28%">Baixa Temporada</td>
        <td width="6%" bgcolor="#D300FF">&nbsp;</td>
        <td width="28%">Data Especial</td>
      </tr>
      <tr>
        <td bgcolor="#2980C5">&nbsp;</td>
        <td>Bloqueado</td>
        <td bgcolor="#FFC600">&nbsp;</td>
        <td>Média Temporada</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#00D8FF">&nbsp;</td>
        <td>Pacote Fechado</td>
        <td bgcolor="#FF6D00">&nbsp;</td>
        <td>Alta Temporada</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  	<!-- ******* -->
  	
  	</td>
    <td valign="top">
    	<html:form method="post" action="/usuario/anuncio?act=incluirAnuncio">
    	<input type="hidden" name="ci" value="${imovel.codigo}">
	    <label for="select">Status</label>
		<html:select property="tipoAnuncio" styleId="tipoAnuncio">
			<html:options collection="tiposAnuncio" property="codigo" labelProperty="nome"/>
		</html:select>
		<BR>					
		De:<BR>
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
      	
      	<html:select property="anoDataInicial" title="Ano" styleId="anoDataInicial" styleClass="MyriadProRegular,string">
        	<html:option value="2011">2011</html:option>
	        <html:option value="2012">2012</html:option>
	        <html:option value="2013">2013</html:option>
	        <html:option value="2014">2014</html:option>
	        <html:option value="2015">2015</html:option> 
        </html:select>
		<BR>
		Até:<BR>
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
      	
      	<html:select property="anoDataFinal" title="Ano" styleId="anoDataFinal" styleClass="MyriadProRegular,string">
        	<html:option value="2011">2011</html:option>
	        <html:option value="2012">2012</html:option>
	        <html:option value="2013">2013</html:option>
	        <html:option value="2014">2014</html:option>
	        <html:option value="2015">2015</html:option>
        </html:select><br><br>
      	Tarifa Diária: <html:text property="tarifaDiaria" styleClass="number,MyriadProRegular" maxlength="10" size="10"/><br/>
      	Tarifa Semanal: <html:text property="tarifaSemanal" styleClass="number,MyriadProRegular" maxlength="10" size="10"/><br/>
      	Tarifa Mensal: <html:text property="tarifaMensal" styleClass="number,MyriadProRegular" maxlength="10" size="10"/><br/>
      	Tarifa Quinzenal: <html:text property="tarifaQuinzenal" styleClass="number,MyriadProRegular" maxlength="10" size="10"/><br/>
		Pacote Fechado: <html:text property="tarifaPacoteFechado" styleClass="number,MyriadProRegular" maxlength="10" size="10"/><br/>      	
      	<br>
      	
      	<table cellspacing="10">
      		<tr>
      			<td colspan="2">
      			Tipos de Pagamento
      			</td>
      		</tr>
      		<tr>
	      		<td valign="top">
	      			Opção 1:<br>
	      			Pagamento de Sinal para confirmação de reserva<br>
	      			<html:radio property="permitirEntrada" value="true"/> 
	      		</td>
	      		<td valign="top">
	      			Opção 2:<br>
	      			<html:radio property="permitirEntrada" value="false"/> 
	      			Pagamento Integral da Estadia. Só para proprietários brasileiros<br>
	      			<table>
	      			<tr>
	      				<td>Titular:</td>
	      				<td><input type="text" name="nomeTitularConta" value="${usuario.nomeTitularConta}"></td>
	      			</tr>
	      			<tr>
	      				<td>CPF:</td>
	      				<td><input type="text" name="cpfTitularConta" value="${usuario.cpfTitularConta}"></td>
	      			</tr>
	      			<tr>
	      				<td>Banco:</td>
	      				<td><input type="text" name="codigoBanco" value="${usuario.codigoBanco}"></td>
	      			</tr>
	      			<tr>
	      				<td>Agência:</td>
	      				<td><input type="text" name="agencia" value="${usuario.agencia}"></td>
	      			</tr>
	      			<tr>
	      				<td>Conta:</td>
	      				<td><input type="text" name="conta" value="${usuario.contaCorrente}"></td>
	      			</tr>
	      			</table>
	      			
	      		</td>
      		</tr>
      	</table>
      	
      	
      	<br><br>
      	
      	<input type="submit" name="gravar" id="button5" value="Gravar" />
      	
	    </html:form>
	    
	    <BR><BR>
	    
	    <logic:notEmpty name="imovel" property="anuncios">
	    <TABLE>
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
			  			<html:submit>Exlcuir</html:submit>
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
</div>

</div>
<div class="bottom_formulario"></div>
<div class="linha_cinza"></div>

</body>
</html>
