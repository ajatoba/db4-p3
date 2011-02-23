<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>
<link href="/buzkaza/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/buzkaza/teaser/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#usuarioForm').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});
	</script>
<link href="/buzkaza/teaser/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>


<div id="cadastro">
<div id="top_cad">
<a href="http://www.buzkaza.com.br/teaser/"><div id="link_back"></div></a>
</div>
<div id="meio_cad">
<!--FORM-->
<div id="msg_finaliza_cadastro">
  
<!-- MENSAGEM DE ERRO -->
<div>
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
</div>
  	<br />
    <!-- ****************** -->
    
<div class="MyriadProRegular">
<logic:present name="imoveis">

<pg:pager url="imovel.do" maxIndexPages="10" maxPageItems="5">


<logic:iterate id="imovel"  name="imoveis">
	<pg:item>
	<bean:write name="imovel" property="bairro"/><br>
	<bean:write name="imovel" property="municipio"/><br>
	<bean:write name="imovel" property="logradouro"/><br>
	<bean:write name="imovel" property="metragem"/> m<sup>2</sup><br>
	<bean:write name="imovel" property="quartos"/> quarto(s)<br>
	Proprietário: <b><bean:write name="imovel" property="usuarioProprietario.nome"/></b><br>
	<logic:equal name="imovel" property="status" value="0">
	<a href="imovel.do?act=formAprovarImovel&ci=<bean:write name='imovel' property='codigo'/>">Validar Imóvel</a><br>
	</logic:equal>
	<br>
	<hr/>
	</pg:item>
</logic:iterate>
<%
String parametros =	"act=listarImoveisPorStatus&statusImovel=" + request.getParameter("statusImovel");
%>

<center>
	<pg:index>
		<pg:prev>
		<a href="<%=pageUrl%>&<%=parametros%>">[Anterior]</a>  
		</pg:prev>
		
		<pg:pages>
			<a href="<%=pageUrl%>&<%=parametros%>"><%=pageNumber %></a>
		</pg:pages>
		
		<pg:next>
			<a href="<%=pageUrl %>&&<%=parametros%>">[Próxima]</a>
		</pg:next>
	</pg:index>
</center>
</pg:pager>

</logic:present>
</div> 

</div>
<!--FORM-->
</div>
<div id="bottom_cad"></div>
</div>
</body>
</html>
