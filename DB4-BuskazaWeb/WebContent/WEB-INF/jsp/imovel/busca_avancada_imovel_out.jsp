<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BUZKAZA</title>

<link rel="stylesheet" href="/buzkaza/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<link rel="stylesheet" href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" type="text/css" />

<script type="text/javascript" src="requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script language="javascript">
function submitForm(){
	var form = 	document.imovelBuscaForm;
	document.forms[0].submit();			
}
</script>
	
</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/buzkaza/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/buzkaza/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/buzkaza/images/top_03.jpg" width="991" height="77" /></div>
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

<div id="right_busca_avancada">
<div id="conteudo_result_busca">

<div id="top_resultado">
	<br>
	<p align="center" class="MyriadProRegular">
	<b>Sua busca retornou: <bean:write name="resultado"/> resultado(s)</b>
	</p>
</div>

<table border="0" width="80%" >
<tr>
	<td width="20%" valign="top" >
	<!-- INCLUDE DO FORM DE BUSCA -->
	<%@include file="_form_busca_avancada.jsp" %>
	<!-- ************************ -->
	<td>


<logic:present name="imoveisValor">
	<td>
		<logic:iterate id="ims"  name="imoveisValor">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="MyriadProRegular">
		  <tr>
		    <td valign="center" align="center"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="key.primeirafoto"/>" width="140" height="104" />
		    </td>
		    <td>
		    	<fieldset>
		    	<legend>Dados do Anúncio</legend>    	
		    	<bean:write name="ims" property="key.logradouro"/>,<bean:write name="ims" property="key.numero"/> , 
		    	<bean:write name="ims" property="key.bairro"/>, <bean:write name="ims" property="key.complemento"/>, 
		    	<bean:write name="ims" property="key.municipio"/> - <bean:write name="ims" property="key.estado.codigo"/>
		    	<br>		
				Capacidade :  <bean:write name="ims" property="key.capacidade"/><br />
		        Quartos :  <bean:write name="ims" property="key.quartos"/><br />
		        Metragem :  <bean:write name="ims" property="key.metragem"/><br />
		        Proprietário: <bean:write name="ims" property="key.usuarioProprietario.nome"/><br />
		        </fieldset>
		        
		        <fieldset>
		        <legend>Preço pelo período selecionado</legend>
		        Total por <bean:write name="qtdDias"/> dia(s): R$ <bean:write name="ims" property="value"/><br>
		        Reserva : 
		        </fieldset>
		        
		    	<br>		    	
		    	<html:form action="/usuario/reserva.do?act=formReservas" method="POST" >
		    	<html:hidden property="codigoImovel" value="${ims.key.codigo}"/> 
		    	<html:hidden property="valor" value="${ims.value}"/>
		    	<html:hidden property="diaPeriodoInicial" value="${periodoBuscado.periodoInicial.date}"/>	
		    	<html:hidden property="mesPeriodoInicial" value="${(periodoBuscado.periodoInicial.month)+1}"/>
		    	<html:hidden property="anoPeriodoInicial" value="${(periodoBuscado.periodoInicial.year)+1900}"/>
		    	<html:hidden property="diaPeriodoFinal" value="${periodoBuscado.periodoFinal.date}"/>	
		    	<html:hidden property="mesPeriodoFinal" value="${(periodoBuscado.periodoFinal.month)+1}"/>
		    	<html:hidden property="anoPeriodoFinal" value="${(periodoBuscado.periodoFinal.year)+1900}"/>
		    		
		    		
		    		<html:submit>Reservar</html:submit>
		    		<!-- img src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" border="0"/-->
		    	</html:form>
		    </td>    
		  </tr>		
		
		</table>
		
		</logic:iterate>
	</td>
</logic:present>

</tr>
</table>

</div>

</div>

<!--FIM BUSCA-->
<div id="linha_meio"></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</body>
</html>
