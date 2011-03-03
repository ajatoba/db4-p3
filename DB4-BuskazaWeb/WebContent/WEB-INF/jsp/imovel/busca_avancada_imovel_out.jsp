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




<div id="conteudo"> 
  <!--TOPO-->
  <div id="top">
    <div class="topo_menu">
      <div class="txt_01">Voc� est�: P�g. Inicial</div>
      <div class="txt_02">Quem Somos</div>
      <div class="txt_03">Mapa do Site</div>
      <div class="txt_04">Contato</div>
      <div class="txt_05">Ajuda</div>
      <div class="txt_06">Redes Sociais</div>
      <div class="twitter"></div>
      <div class="facebook"></div>
    </div>
    <div class="tracejado_top"></div>
    <div class="linha_logo">
      <div class="logo"></div>
      <div class="options"></div>
    </div>
    <div class="bottom_menu">
      <a href="/DB4-BuskazaWeb/imovel.do?act=formBuscarImovel"><div class="btn_alugar">alugar im�vel</div></a>
      <a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovel"><div class="btn_anunciar">anunciar im�vel</div></a>
      <a href="http://www.buzkaza.com.br/blog/" target="_black"><div class="btn_blog">blogs</div></a>
      <div class="btn_login">Efetuar login</div>
      <a href="/DB4-BuskazaWeb/usuario.do?act=formIncluirUsuario"><div class="btn_cadastre_se"></div></a>
    </div>
  </div>
</div>



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


<div id="left_busca_avancada">
		<!-- INCLUDE DO FORM DE BUSCA -->
		<%@include file="_form_busca_avancada_resultado.jsp" %>
		<!-- ************************ -->

	


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
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="MyriadProRegular">
		  <tr>
		    <td valign="center" align="center"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="key.primeirafoto"/>" width="140" height="104" />
		    </td>
		    <td>
		    	
		    	
		    	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="left" valign="top"><span class="tit_azul2">
	                  <!-- <bean:write name="ims" property="key.logradouro"/> -->
	                  <bean:write name="ims" property="key.bairro"/>,</span><br />
	                  
                    <span class="txt_form">
                    <bean:write name="ims" property="key.logradouro"/> 
                    <!-- 
                    <bean:write name="ims" property="key.numero"/> , 
		    				<bean:write name="ims" property="key.bairro"/>, <bean:write name="ims" property="key.complemento"/>, 
		    				<bean:write name="ims" property="key.municipio"/> - <bean:write name="ims" property="key.estado.codigo"/>
		    		 -->
		    	</span><br />
                    <br />
                    
					<html:form action="/usuario/reserva.do?act=formReservas" method="POST" >
					<html:hidden property="codigoImovel" value="${ims.key.codigo}"/> 
					<html:hidden property="valor" value="${ims.value}"/>
					<html:hidden property="diaPeriodoInicial" value="${periodoBuscado.periodoInicial.date}"/>	
					<html:hidden property="mesPeriodoInicial" value="${(periodoBuscado.periodoInicial.month)+1}"/>
					<html:hidden property="anoPeriodoInicial" value="${(periodoBuscado.periodoInicial.year)+1900}"/>
					<html:hidden property="diaPeriodoFinal" value="${periodoBuscado.periodoFinal.date}"/>	
					<html:hidden property="mesPeriodoFinal" value="${(periodoBuscado.periodoFinal.month)+1}"/>
					<html:hidden property="anoPeriodoFinal" value="${(periodoBuscado.periodoFinal.year)+1900}"/>
					
					<input type="image" src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" />
					
					
					<!-- <html:submit>Reservar</html:submit>
						  img src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" border="0"/-->
					</html:form>
		    	
                    <br /></td>
                    
                  <td align="left" valign="top">
                  <span class="txt_form">Capacidade : <bean:write name="ims" property="key.capacidade"/><br />
                    Quartos : <bean:write name="ims" property="key.quartos"/><br />
                    Metragem : <bean:write name="ims" property="key.metragem"/><br />
                    Propriet�rio: <bean:write name="ims" property="key.usuarioProprietario.nome"/></span><br /></td>
                  <td valign="top" class="txt_form">
                  Total por <bean:write name="qtdDias"/> dia(s): R$ <bean:write name="ims" property="value"/><br>
		        <a href="/DB4-BuskazaWeb/imovel.do?act=detalheImovel&ci=${ims.key.codigo}">[ Ver detalhes do Im�vel ]</a> 
		        </td>
                </tr>
              </table>
              
              
		    	<br>		    	
		    	
		    		
		    		
		    		
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
