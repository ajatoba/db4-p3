<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>

	<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />	
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />
	
	<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});

		$(function(){			
			$('#sep_top_reserva').corner('rounded 7px');			
		});
		
	</script>
	
</head>

<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>

	<div id="cont_reserva">
	<!--FORM-->
		<div id="msg_finaliza_cadastro">
			  <div class="ok"></div>
			  <div class="msg_confirmado">
			  		Sua solicitação de reserva foi feita com sucesso! <br /><br />
			  		
			  		Aguarde o aceite do proprietário para efetuar o pagamento.<br />
			  		Enviamos um e-mail com os dados da sua solicitação.
			  		
			  </div>
		
		</div>
	<!--FORM-->
	</div>

<!--FIM CADASTRO-->

<jsp:include page="../rodape.jsp"/>

</body>
</html>
