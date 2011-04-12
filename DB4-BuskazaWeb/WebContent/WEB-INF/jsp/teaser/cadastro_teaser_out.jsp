<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/cadastro.css"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/busca.css"/>	
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css"/>
		
<script type="text/javascript" src="/buzkaza/topup/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script language="javascript">
	$(function(){
		$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
	});
</script>
	
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>

</head>

<body>


<jsp:include page="../usuario/topo.jsp"/>


<div id="cont_reserva">

<div id="indice_cadastro"><img src="/buzkaza/_img/cadastro_usuario_aba_passo2.jpg" height="57" width="971" border="0"/></div>

<div id="meio_cad">
<!--FORM-->
<div id="msg_finaliza_cadastro">
  <div class="ok"></div>
  <div class="msg_confirmado">
  		<span class="MyriadPro18">Seus dados foram cadastrados com sucesso!
  		<br><br>
  		
  		Agora você precisa validar seu email.<br>
  		Enviamos um link de validação para o seu email cadastrado
  		</span>
  		
  		<br><br>
  		<br><br>
  </div>

</div>
<!--FORM-->
</div>

</div>
</div>


<jsp:include page="../usuario/rodape.jsp"/>
</body>
</html>
