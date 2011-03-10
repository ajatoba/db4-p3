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

<!-- topo com linha azul -->



<jsp:include page="../usuario/topo.jsp"/>
<!--BUSCA-->
<div id="cont_busca">
<div id="form_busca">
<div class="titulo_busca"><span class="MyriadPro24">Buscar Anúncio</span></div>

<div class="selecione_busca">Selecione abaixo as informações para efetuar sua busca</div>
<div class="sep_busca"></div>


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


<!-- INCLUDE DO FORM DE BUSCA -->
<%@include file="_form_busca_avancada.jsp" %>
<!-- ************************ -->

</div>
</div>
<!--FIM BUSCA-->


<jsp:include page="../usuario/rodape.jsp"/>

</body>
</html>
