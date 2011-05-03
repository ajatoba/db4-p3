<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>


<!-- auto completar -->
<link href="/buzkaza/_css/jquery-ui.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" />

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/cadastro.css"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/busca.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css"/>

<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />


<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>



<!-- auto completar -->
<script type="text/javascript" src="/buzkaza/_js/jquery.ui.core.js"></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/buzkaza/_js/position.js"></script>
<script type="text/javascript" src="/buzkaza/_js/autocomplete.js"></script>

<script language="javascript">
	$(function() {		
		$.ajax({
			url: "/busca_autocompletar.xml",
			dataType: "xml",
			success: function( xmlResponse ) {
				var data = $( "geoname", xmlResponse ).map(function() {
					return {
						value: $( "name", this ).text()
					};
				}).get();
				$( "#municipio" ).autocomplete({
					source: data,
					minLength: 0					
				});
			}
		});
	});
</script>


<script language="javascript">
	$(function(){
		$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
	});
	
	function submitForm(){
		var form = 	document.imovelBuscaForm;
		document.forms[0].submit();			
	}
</script>
</head>
<body>


<div id="site">

<!-- topo com linha azul -->
<jsp:include page="../usuario/topo.jsp"/>

<!--BUSCA-->

<!-- MENSAGEM DE ERRO -->
    <font color="red">  
		<logic:messagesPresent property="erro">
			<html:messages property="erro" id="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>						
			</html:messages>
		</logic:messagesPresent>
				
		<logic:messagesNotPresent property="erro">
			<logic:present name="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>	
			</logic:present>
				
		</logic:messagesNotPresent>
  	</font>
    <!-- ****************** -->
 </div>


<div id="cont_result_busca">


<div class="top_busca_disp">	
    <div class="top_busca_disponibilidades_redefinir">
        <a href="javascript:linkPacoteRedefinir()"><div class="link_img_pacote"></div></a>
    </div>
</div>


<div class="form_busca_meio">
<!-- INCLUDE DO FORM DE BUSCA -->
	<%@include file="_form_busca_avancada_resultado.jsp" %>
	<!-- ************************ -->
	
	<div id="sep_top_busca_fina"></div>
</div>


	

<div id="right_busca_avancada">
<div id="conteudo_result_busca">

<div id="top_resultado">
	<div class="retorno_busca"><span class="MyriadPro14"> Sua busca retornou: <bean:write name="resultado"/> resultado(s)</span></div>	
	<div class="ordenacao_busca"><br /></div>
</div>

<div id="sep_top_ba"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>

<logic:present name="imoveisValor">
	<td>
		<logic:iterate id="ims"  name="imoveisValor">
		
		<div id="cont_ba">
		
		<table border="0" cellspacing="0" cellpadding="0" class="MyriadProRegular">
		  <tr valign="top">
		    <td align="center" width="150"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="key.primeirafoto"/>" width="140" height="104" /></td>
		    <td width="536">
		    	
		    	
		    	<table border="0" align="center" cellpadding="0" cellspacing="0" class="sep_table_busca">
                <tr>
                  <td align="left" valign="top">
                   <div id="busca_endereco">
		                  <span class="tit_azul2">${ims.key.bairro}, ${ims.key.municipio} - ${ims.key.estado.codigo}</span><br />			                  
		                  <span class="txt_form">${ims.key.logradouro}, ${ims.key.numero} - ${ims.key.complemento} - Cep ${ims.key.cep}</span><br />
                    <br />
                    
                    <logic:equal name="tipoBusca" property="codigo" value="6">
                    	<html:form action="/usuario/reserva.do?act=formReservasPacoteFechado" method="POST" >
						<html:hidden property="ORIGEM_REQUEST" value="_RESERVA"/>
						<html:hidden property="codigoImovel" value="${ims.key.codigo}"/> 
						<html:hidden property="valor" value="${ims.value}"/>
						<html:hidden property="diaPeriodoInicial" value="${periodoBuscado.periodoInicial.date}"/>	
						<html:hidden property="mesPeriodoInicial" value="${(periodoBuscado.periodoInicial.month)+1}"/>
						<html:hidden property="anoPeriodoInicial" value="${(periodoBuscado.periodoInicial.year)+1900}"/>
						<html:hidden property="diaPeriodoFinal" value="${periodoBuscado.periodoFinal.date}"/>	
						<html:hidden property="mesPeriodoFinal" value="${(periodoBuscado.periodoFinal.month)+1}"/>
						<html:hidden property="anoPeriodoFinal" value="${(periodoBuscado.periodoFinal.year)+1900}"/>
						
						<div class="botao_reserva2">
							<input type="image" src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" /><br/>
						</div>
						
						</html:form>
                    </logic:equal>
                    
                    <logic:notEqual name="tipoBusca" property="codigo" value="6">
                    <html:form action="/imovel.do?act=detalheImovel" method="POST" >
						<html:hidden property="ORIGEM_REQUEST" value="_RESERVA"/>
						<html:hidden property="ci" value="${ims.key.codigo}"/> 
						<html:hidden property="valor" value="${ims.value}"/>
						<html:hidden property="diaPeriodoInicial" value="${periodoBuscado.periodoInicial.date}"/>	
						<html:hidden property="mesPeriodoInicial" value="${(periodoBuscado.periodoInicial.month)+1}"/>
						<html:hidden property="anoPeriodoInicial" value="${(periodoBuscado.periodoInicial.year)+1900}"/>
						<html:hidden property="diaPeriodoFinal" value="${periodoBuscado.periodoFinal.date}"/>	
						<html:hidden property="mesPeriodoFinal" value="${(periodoBuscado.periodoFinal.month)+1}"/>
						<html:hidden property="anoPeriodoFinal" value="${(periodoBuscado.periodoFinal.year)+1900}"/>
						
						<div class="botao_reserva1">
							<input type="image" src="/buzkaza/_img/btn_detalhes.png" width="64" height="24" border="0"/> 
						</div>
						</html:form>
						
						<html:form action="/usuario/reserva.do?act=formReservas" method="POST" >
						<html:hidden property="ORIGEM_REQUEST" value="_RESERVA"/>
						<html:hidden property="codigoImovel" value="${ims.key.codigo}"/> 
						<html:hidden property="valor" value="${ims.value}"/>
						<html:hidden property="diaPeriodoInicial" value="${periodoBuscado.periodoInicial.date}"/>	
						<html:hidden property="mesPeriodoInicial" value="${(periodoBuscado.periodoInicial.month)+1}"/>
						<html:hidden property="anoPeriodoInicial" value="${(periodoBuscado.periodoInicial.year)+1900}"/>
						<html:hidden property="diaPeriodoFinal" value="${periodoBuscado.periodoFinal.date}"/>	
						<html:hidden property="mesPeriodoFinal" value="${(periodoBuscado.periodoFinal.month)+1}"/>
						<html:hidden property="anoPeriodoFinal" value="${(periodoBuscado.periodoFinal.year)+1900}"/>
						
						<div class="botao_reserva2">
							<input type="image" src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" /><br/>
						</div>
						
						</html:form>
		    		</logic:notEqual>
                   </div>
                   </td>                    
                 <td align="left" valign="top">
                 
                 	<div class="txt_form" id="busca_info">
                  
							<span class="txt_form_titulo">${ims.key.tipoImovel.nome}</span><br />
							<span class="txt_form_titulo">Quartos:</span> <bean:write name="ims" property="key.quartos"/><br />
							<span class="txt_form_titulo">Metragem:</span> <bean:write name="ims" property="key.metragem"/><br />
							<span class="txt_form_titulo">Capacidade:</span> <bean:write name="ims" property="key.capacidade"/><br />
							<span class="txt_form_titulo">Proprietário:</span> <bean:write name="ims" property="key.usuarioProprietario.nome"/><br />
	                    
	                    <logic:notEmpty name="ims" property="key.equipamentos">	
					       <logic:iterate name="ims" property="key.equipamentos" id="equipamento">
					       		<bean:write name="equipamento" property="nome"/>, 
					       </logic:iterate>
				    	</logic:notEmpty>  
                     
		            </div>        
                   </td>
                  <td  valign="top" class="txt_form">
                  
                  <div class="box_busca_valor">
                  		<div class="box_busca_valor_total">
	                          <div class="bustotal">
	                              Valor total<br />
	                                <span class="valor_cinza"><bean:write name="qtdDias"/> Dia(s):<br /></span>
	                                <span class="valor_azul">R$  <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( ims.value + ( ims.value  *10/100))}"/> </span>                        
	                          </div>
	                       </div>
	                       <div class="box_busca_valor_media">
	                            <div class="busmedia">               
	                                Média da Diária:<br />
	                                <span class="valor_cinza">R$
	                                
	                                <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( ims.value + ( ims.value  *10/100)) /qtdDias}"/>
	                                
	                                 </span>
	                       		</div>
	                      	</div>
	                  </div>
		        
		        </td>
                </tr>
              </table>
              
              
		    	<br />		    	
		    	
		    		
		    </td>    
		  </tr>		
		
		</table>
		
		</div>
		
		</logic:iterate>
	</td>
</logic:present>

</tr>
</table>

</div>
</div>
</div>

<!--FIM BUSCA-->

<jsp:include page="../usuario/rodape.jsp"/>

</body>
</html>
