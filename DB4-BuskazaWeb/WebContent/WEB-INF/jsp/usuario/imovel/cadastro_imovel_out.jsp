<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buzkaza - Cadastro de Imóvel</title>

	<link href="/buzkaza/_css/cadastro_imovel.css" rel="stylesheet" type="text/css" />
	
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />

	<!-- 
	<link href="/buzkaza/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />
	-->
	<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
	
	<script type="text/javascript" src="/buzkaza/topup/jquery-1.4.2.min.js" ></script>	
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>


	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});
	</script>

	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
</head>

<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>


<div id="cont_reserva">
<!--FORM-->

<div id="indice_cadastro"><img src="/buzkaza/_img/cadastro_imovel_aba_passo3.jpg" height="57" width="971" border="0"/></div>

<div id="msg_finaliza_cadastro">
  <div class="ok"></div>
  <div class="msg_confirmado">
  		<span class="MyriadPro24">Imóvel salvo com sucesso!!
  		</span>
  </div>

</div>
<!--FORM-->
</div>

</div>

<jsp:include page="../rodape.jsp"/>

</body>
</html>