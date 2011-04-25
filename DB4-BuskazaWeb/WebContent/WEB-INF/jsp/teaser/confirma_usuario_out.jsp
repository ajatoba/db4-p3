<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>

<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css"/>
<link href="/buzkaza/_css/busca.css" rel="stylesheet" type="text/css"/>	
<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css"/>
<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css"/>


<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all"/>
<script type="text/javascript" src="/buzkaza/teaser/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js"></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});
	</script>
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/busca.css" rel="stylesheet" type="text/css" />	
	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />
	
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>


</head>

<body>


<jsp:include page="../usuario/topo.jsp"/>



<div id="meio_cad">
<!--FORM-->

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


<div id="msg_finaliza_cadastro">
  <div class="confirmado"></div>
  <div class="msg_confirmado"><span class="MyriadPro18">Seu cadastro foi confirmado com sucesso!
  <br>Clique <a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovel" class="link_aqui">aqui</a> para cadastrar seu imóvel.
  
  
  </span></div>
</div>
<!--FORM-->
</div>
</div>
</div>


<jsp:include page="../usuario/rodape.jsp"/>


<!-- Google Code for Cadastro efetivado Conversion Page --> <script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1015288848;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "R9Z9CMCRlgIQkKiQ5AM"; var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript"  
src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt=""  
src="http://www.googleadservices.com/pagead/conversion/1015288848/?label=R9Z
9CMCRlgIQkKiQ5AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

</body>
</html>
