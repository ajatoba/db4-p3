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
      Mapa Google Maps:${imovel.mapaGooglemaps}<br />
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
  	<%
  	Map<String,Calendario> calendarioAnuncio = (Map) request.getAttribute("calendarioAnuncio");
	
  	Iterator it = calendarioAnuncio.entrySet().iterator();
    while (it.hasNext()) {
        Map.Entry mapa = (Map.Entry)it.next();
        Calendario anuncio = (Calendario) mapa.getValue();
        out.println("Dia:"+ mapa.getKey()+ " Tipo anuncio:"+ anuncio.getTipoAnuncio() + "<BR/>") ;
        
    }
  	
  	%>
  	
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
      	<br>
      	<input type="submit" name="gravar" id="button5" value="Gravar" />
      	
	    </html:form>
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
    <td>Política de Recebimento</td>
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
        <option>Dólar</option>
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
                        <td>Pagamento de sinal para confirmação de reserva, com saldo direto no check in.<br />
                          Sinal de 10% (Deduzida do total da estadia+taxas extras) + encargos do cartão ou boleto referente o sinal de 10%, retidos pelo Buzkaza como taxa de transação.</td>
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
                          Itaú&nbsp;&nbsp;
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
                        <td colspan="3">Pagamento integral da estadia (só para proprietários Brasileiros).</td>
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
                        <td>Agência</td>
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
