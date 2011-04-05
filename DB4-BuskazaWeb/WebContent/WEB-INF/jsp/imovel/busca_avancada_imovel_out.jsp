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
<link href="/buzkaza/_css/busca.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>

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






<!-- INCLUDE DO FORM DE BUSCA -->
	<%@include file="_form_busca_avancada_resultado.jsp" %>
	<!-- ************************ -->
	
	<div id="sep_top_busca_fina"></div>
	

<div id="left_busca_avancada">
	

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
		  <tr>
		    <td valign="center" align="center" width="150"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="key.primeirafoto"/>" width="140" height="104" /></td>
		    <td width="536">
		    	
		    	
		    	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="sep_table_busca">
                <tr>
                  <td width="40%" align="left" valign="top"><span class="tit_azul2">
	                  <!-- <bean:write name="ims" property="key.logradouro"/> -->
	                  <bean:write name="ims" property="key.bairro"/>,</span><br />
	                  
                    <span class="txt_form">
                    <bean:write name="ims" property="key.logradouro"/>, <bean:write name="ims" property="key.complemento"/>
                    <!-- 
                    <bean:write name="ims" property="key.numero"/> , 
		    				<bean:write name="ims" property="key.bairro"/>, <bean:write name="ims" property="key.complemento"/>, 
		    				<bean:write name="ims" property="key.municipio"/> - <bean:write name="ims" property="key.estado.codigo"/>
		    		 -->
		    	</span><br />
                    <br />
                    
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
					
					<div class="botao_reserva1">
						<a href="/DB4-BuskazaWeb/imovel.do?act=detalheImovel&ci=${ims.key.codigo}" class="link_ver_detalhe"><img src="/buzkaza/_img/btn_detalhes.png" width="64" height="24" border="0"/></a> 
					</div>
					<div class="botao_reserva2">
						<input type="image" src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" /><br/>
					</div>
					
					</html:form>
		    	
                    <br /></td>
                    
                  <td width="40%" align="left" valign="top">
                  <span class="txt_form">
                  
                  	<span class="txt_form_titulo">${ims.key.tipoImovel.nome}</span><br />
	                  <span class="txt_form_titulo">Quartos:</span> <bean:write name="ims" property="key.quartos"/><br />
	                  <span class="txt_form_titulo">Metragem:</span> <bean:write name="ims" property="key.metragem"/><br />
	                  <span class="txt_form_titulo">Capacidade:</span> <bean:write name="ims" property="key.capacidade"/><br />
	                  <span class="txt_form_titulo">Proprietário:</span> <bean:write name="ims" property="key.usuarioProprietario.nome"/><br />
	                    
	                    <logic:notEmpty name="ims" property="key.equipamentos">	
					       <logic:iterate name="ims" property="key.equipamentos" id="equipamento">
					       		<bean:write name="equipamento" property="nome"/>
					       </logic:iterate>
				    	</logic:notEmpty>  
                     
		            </span>        
                    </td>
                  <td width="20%"  valign="top" class="txt_form">
                  Total por <bean:write name="qtdDias"/> dia(s): R$ <bean:write name="ims" property="value"/><br>
                  Valor médio da diária: ${ims.value/qtdDias}<br>
		        
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
