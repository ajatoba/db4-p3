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

<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_meus_anuncios">
		<span class="MyriadPro24">Solicita��o de Reserva</span>
	</div>
</div>

</div>
<div id="sep_top_reserva"></div>
<div id="listagem_reservas">
<div class="topo_edicao">
<div class="mapa_planta"><img src="/buzkaza/_img/adm_meusanuncios_editar_05.png" width="195" height="145" /></div>

<div class="MyriadProRegular">
<fieldset>
<legend>Dados do Im�vel</legend>
<table width="40%" border="0" > 
  <tr>
    <td width="20%">
    	${reserva.imovel.bairro}<br>
    	${reserva.imovel.logradouro}
    </td>
    <td width="20%">
      Dist�ncia do centro ${reserva.imovel.distanciaCentro}<br />
      Mapa Google Maps:${reserva.imovel.linkGoogleMaps}<br />
      V�deo You Tube:${reserva.imovel.linkYouTube}
    </td>
  </tr>
</table>
</fieldset>
</div>

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
        <option value="03">Mar�o</option>
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
  	<input type="submit" value="Trocar Per�odo">
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
  	
  	<logic:present name="calendarioAnuncio">	
  	<%
  	//ALGORITMO DE CONSTRU��O DO CALEND�RIO - CUIDADO AO MEXER!!!
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
  	</logic:present>
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
        <td>M�dia Temporada</td>
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
	    <table>
	    <tr>
		    <td>
		    <div class="MyriadPro24">Confirma sua reserva?</div>
		    <br>    
		    <div class="MyriadProRegular">
		    <b>
		    De <bean:write name="reserva" property="periodoInicial" format="dd/MM/yyyy"/>
		    a <bean:write name="reserva" property="periodoFinal" format="dd/MM/yyyy"/><br>
		    R$ <bean:write name="reserva" property="valor" format="00.00"/><br>
		    </b>
		    </div>
		    
		    <html:form action="/usuario/reserva.do?act=incluirReserva" method="POST" >
				<html:hidden property="codigoImovel" value="${reserva.imovel.codigo}"/> 
				<html:hidden property="valor" value="${reserva.valor}"/>
				<html:hidden property="diaPeriodoInicial" value="${reserva.periodoInicial.date}"/>	
				<html:hidden property="mesPeriodoInicial" value="${(reserva.periodoInicial.month)+1}"/>
				<html:hidden property="anoPeriodoInicial" value="${(reserva.periodoInicial.year)+1900}"/>
				<html:hidden property="diaPeriodoFinal" value="${reserva.periodoFinal.date}"/>	
				<html:hidden property="mesPeriodoFinal" value="${(reserva.periodoFinal.month)+1}"/>
				<html:hidden property="anoPeriodoFinal" value="${(reserva.periodoFinal.year)+1900}"/>
				<br>
				<html:submit>Confirmar</html:submit>
				<!-- img src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" border="0"/-->
			</html:form>
		    <br><br>
		    </td>
	    </tr>
	    <tr>
	    	<td valign="top" align="center">
	    	<span class="MyriadPro24">&nbsp</span>	    	
	    	</td>
	    </tr>
	    </table>
    </td>
  </tr>
  
</table>


</div>
</div>
</div>

</div>
<div class="bottom_formulario">


</div>
<div class="linha_cinza"></div>
<div class="opcoes_pg">
<div class="left_opcoes">
<table width="100%" border="0">
  <tr>
    <td>Pol�tica de Recebimento</td>
  </tr>
  <tr>
    <td>Lorem ipsum</td>
  </tr>
  <tr>
    <td>Moeda</td>
  </tr>
  <tr>
    <td><label for="select3"></label>
      <select name="select4" id="select3">
        <option>Real</option>
        <option>D�lar</option>
        <option>Euro</option>
      </select></td>
  </tr>
</table>

</div>
<div class="right_opcoes">
  <div id="tabs">                
                <div id="container_abas">
                        <ul id="nav">	
                            <li id="aba_1"><a href="#quemsomos" class="corrente" onclick="trocaImagem('opcao_01')"><img src="/buzkaza/_img/opcao_01_azul.png" id="opcao_01"width="157" height="49" alt="" border="0"/></a></li>  
                            <li><a href="#formacao" onclick="trocaImagem('opcao_02')"><img src="/buzkaza/_img/opcao_02.png" id="opcao_02"width="157" height="49" alt="" border="0"/></a></li> 
                                                    
                        </ul>
                    
                  <div id="aba1" class="aba">
                    <table width="100%" border="0">
                      <tr>
                        <td>Pagamento de sinal para confirma��o de reserva, com saldo direto no check in.<br />
                          Sinal de 10% (Deduzida do total da estadia+taxas extras) + encargos do cart�o ou boleto referente o sinal de 10%, retidos pelo Buzkaza como taxa de transa��o.</td>
                      </tr>
                      <tr>
                        <td>Forma de Pagamento</td>
                      </tr>
                      <tr>
                        <td><input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Dinheiro&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Visa&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Mastercard&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Dinners&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          Bradesco&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Ita�&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Unibanco
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Banco do Brasil </td>
                      </tr>
                      <tr>
                        <td><input type="radio" name="radio" id="radio2" value="radio" />
                          <label for="radio2"></label>
                          Aura
                          <input type="radio" name="radio" id="radio3" value="radio" />
                          Hipercard
                          <input type="radio" name="radio" id="radio4" value="radio" />
                          <label for="radio4"></label>
                          Amex </td>
                      </tr>
                    </table>
                    <br />

                    
                  </div>
                    
                  <div id="aba2" class="aba">
                    <table width="100%" border="0">
                      <tr>
                        <td colspan="3">Pagamento integral da estadia (s� para propriet�rios Brasileiros).</td>
                      </tr>
                      <tr>
                        <td>Titular</td>
                        <td>&nbsp;</td>
                        <td>CPF/CNPJ</td>
                      </tr>
                      <tr>
                        <td colspan="2"><label for="textfield"></label>
                          <input type="text" name="textfield" id="textfield" /></td>
                        <td><input type="text" name="textfield3" id="textfield3" /></td>
                      </tr>
                      <tr>
                        <td>Numero do Banco</td>
                        <td>Ag�ncia</td>
                        <td>Conta Corrente</td>
                      </tr>
                      <tr>
                        <td><input type="text" name="textfield2" id="textfield2" /></td>
                        <td><input type="text" name="textfield4" id="textfield4" /></td>
                        <td><input type="text" name="textfield5" id="textfield5" /></td>
                      </tr>
                    </table>
                    <br /><br />
                                    
                  
                  </div>
                            
                  
                                           
                </div>
        </div><!-- id="tabs" -->

</div>
<input type="submit" name="button3" id="button3" value="Submit" />
</div>

</div>
<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="linha_cinza"></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>