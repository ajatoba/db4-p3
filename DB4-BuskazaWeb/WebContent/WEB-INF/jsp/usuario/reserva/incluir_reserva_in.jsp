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
<title>Buzkaza - Incluir Reserva</title>

<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/size_campos.css"/>




<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />

<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>

<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
<!-- 

<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.js"></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.ui.draggable.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.alerts.js" ></script>

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/jquery.alerts.css"  />

 -->
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" type="text/css" href="/buzkaza/_css/tabs.css" media="screen"/>

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>

<script language="javascript">

$(document).ready(function()
{

	$('iframe').load(function()
			{
				this.style.width = 350 + 'px';
				this.style.height = 350 + 'px';
			}
		);
	
	$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
}
);
</script>
</head>
<body>


<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>

<!--CADASTRO-->
<div id="cont_reserva2">

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
		<span class="MyriadPro24">Solicitação de Reserva</span>
	</div>
</div>

</div>
<div id="sep_top_reserva"></div>
<div id="listagem_reservas">
<div class="topo_edicao">
	<div class="mapa_planta"><img src="/buzkaza/imagens_usuarios/${imovel.primeirafoto}" width="140" height="104" /></div>



<div class="endereco_bairro">
		<table width="100%" border="0" > 
		  <tr valign="top">
		    <td width="35%" valign="top">
		    	<span class="nome_rua">${reserva.imovel.bairro}<br>
		    	${reserva.imovel.logradouro}</span>
		    </td>
		    <td width="65%" valign="top">
			    <span class="nome_rua">
			      Distância do centro ${reserva.imovel.distanciaCentro}<br />
			      Mapa Google Maps:${reserva.imovel.linkGoogleMaps}<br />
			      Vídeo You Tube:${reserva.imovel.linkYouTube}</span>
		    </td>
		  </tr>
		</table>
</div>

<div class="menu_edicao">
	<div class="menu_01_cinza"></div>
	<div class="menu_02_cinza"></div>
	<div class="menu_03"></div>
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
  	
  	<logic:present name="calendarioAnuncio">	
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
  	</logic:present>
  	</table>
  	<br>
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
    <td valign="top">
     <html:form action="/usuario/reserva.do?act=incluirReserva" method="POST" >
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
		    <br><br>
		   
		    
		    <logic:equal name="reserva" property="imovel.permiteOpcaoPagamento" value="true">
		    
		    <fieldset>
		    <legend>Opções de Pagamento</legend>
		    <table cellspacing="10">
		    <tr>
		    	<td>
		    	<html:radio property="valor" value="${(reserva.valor*10/100)}">Opção 1: </html:radio><br>
		    	Valor: R$ ${(reserva.valor*10/100)}
		    	</td>
		    	<td>
		    	<html:radio property="valor" value="${reserva.valor}">Opção 2: </html:radio><br>
		    	<bean:write name="reserva" property="valor" format="00.00"/>
		    	</td>
		    </tr>
		    </table>		    
		    
		    </fieldset>
		    </logic:equal>
		    <logic:notEqual name="reserva" property="imovel.permiteOpcaoPagamento" value="true">
		    <html:hidden property="valor" value="${reserva.valor}"/>
		    <br>
		    </logic:notEqual>
		    </b>
		    </div>
				<html:hidden property="codigoImovel" value="${reserva.imovel.codigo}"/> 
				<html:hidden property="diaPeriodoInicial" value="${reserva.periodoInicial.date}"/>	
				<html:hidden property="mesPeriodoInicial" value="${(reserva.periodoInicial.month)+1}"/>
				<html:hidden property="anoPeriodoInicial" value="${(reserva.periodoInicial.year)+1900}"/>
				<html:hidden property="diaPeriodoFinal" value="${reserva.periodoFinal.date}"/>	
				<html:hidden property="mesPeriodoFinal" value="${(reserva.periodoFinal.month)+1}"/>
				<html:hidden property="anoPeriodoFinal" value="${(reserva.periodoFinal.year)+1900}"/>
				<br>
				<html:submit>Confirmar</html:submit>
				<!-- img src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" border="0"/-->
			
		    <br><br>
		    </td>
	    </tr>
	    <tr>
	    	<td valign="top" align="center">
	    	<span class="MyriadPro24">&nbsp</span>	    	
	    	</td>
	    </tr>
	    </table>
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
    <td class="txt_caracteristicas">Política de Recebimento</td>
  </tr>
  <tr>
    <td class="txt_caracteristicas">Lorem ipsum</td>
  </tr>
  <tr>
    <td class="txt_caracteristicas">Moeda</td>
  </tr>
  <tr>
    <td class="txt_caracteristicas">
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
                            <li id="aba_1"><a href="#quemsomos" class="corrente" onclick="trocaImagem('opcao_01')"><img src="/buzkaza/_img/opcao_01_azul.jpg" id="opcao_01"width="157" height="49" alt="" border="0"/></a></li>  
                            <li><a href="#formacao" onclick="trocaImagem('opcao_02')"><img src="/buzkaza/_img/opcao_02.jpg" id="opcao_02"width="157" height="49" alt="" border="0"/></a></li> 
                                                    
                        </ul>
                    
                  <div id="aba1" class="aba">
                    <table width="100%" border="0">
                      <tr>
                        <td><span class="txt_caracteristicas">Pagamento de sinal para confirmação de reserva, com saldo direto no check in.<br />
                    Sinal de 10% (Deduzida do total da estadia+taxas extras) + encargos do cartão ou boleto referente o sinal de 10%, retidos pelo Buzkaza como taxa de transação.</span></td>
                      </tr>
                      <tr>
                        <td><span class="txt_caracteristicas">Forma de Pagamento</span></td>
                      </tr>
                      <tr>
                        <td class="txt_caracteristicas">
					                    <input type="radio" name="radio" id="radio" value="radio" /> Dinheiro&nbsp;&nbsp;
					                    <div class="sepd"> <input type="radio" name="radio" id="radio" value="radio" /> Visa&nbsp;&nbsp;</div>
					                    <div class="sepd"> <input type="radio" name="radio" id="radio" value="radio" /> Mastercard&nbsp;</div>
					                    <div class="sepd"> <input type="radio" name="radio" id="radio" value="radio" /> Dinners&nbsp;&nbsp;</div>
					                    <div class="sepd"> <input type="radio" name="radio" id="radio" value="radio" /> Bradesco&nbsp;&nbsp;</div>
					                    <div class="sepd"> <input type="radio" name="radio" id="radio" value="radio" /> Itaú&nbsp;&nbsp;</div>
					                    <div class="sepd"> <input type="radio" name="radio" id="radio" value="radio" /> Unibanco</div>
					                    <div class="sepd"> <input type="radio" name="radio" id="radio" value="radio" /> Banco do Brasil</div>
					    </td>
                      </tr>
                      <tr>
                        <td class="txt_caracteristicas"><input type="radio" name="radio" id="radio2" value="radio" />
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
		                  <td colspan="3"><html:radio property="permitirEntrada" value="false"/> <span class="txt_tit_box_facil_alugar2">Pagamento integral da estadia (só para proprietários Brasileiros).</span></td>
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
                  </div>
                            
                  
                                           
                </div>
        </div><!-- id="tabs" -->

</div>
<input type="submit" name="button3" id="button3" value="Submit" />
</div>


</div>
<!--FIM CADASTRO-->
</div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>