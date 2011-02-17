<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Imóvel - Buzkaza</title>
<link href="/buzkaza/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<link href="/buzkaza/teaser/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/teaser/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>

<script language="javascript">
	
function mostrarImagem(imagem){
	window.open(imagem,"mywindow","menubar=0,resizable=0,width=500,height=500");
}
</script>

</head>

<body>
<div id="cadastro">
<div id="top_cad">
<a href="http://www.buzkaza.com.br/teaser/"><div id="link_back"></div></a>
</div>
<div id="meio_cad">
<!--FORM-->
<div id="msg_finaliza_cadastro">
  
	<span class="MyriadPro24">
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
	</span>
  </div>

<!--FORM-->

<logic:present name="pessoas">
	<logic:iterate id="pessoa"  name="pessoas">
	<fieldset>
	<legend>Usuário</legend>
	Nome:<bean:write name="pessoa" property="nome"/><br>
	E-mail:<bean:write name="pessoa" property="email"/><br>
	<logic:notEmpty name="pessoa" property="telefones">
	Telefones:
		<logic:iterate id="tel" name="pessoa" property="telefones">
			(<bean:write name="tel" property="ddd"/>)-<bean:write name="tel" property="numero"/> <br/>
		</logic:iterate>
	</logic:notEmpty>
	Nacionalidade:<bean:write name="pessoa" property="nacionalidade"/><br>	
	
		<logic:notEmpty name="pessoa" property="imoveis">
		<fieldset>
			<legend>Imóveis</legend>
			<logic:iterate id="im" name="pessoa" property="imoveis">
				<bean:write name="im" property="quartos"/> quarto(s) em <bean:write name="im" property="bairro"/>, <bean:write name="im" property="estado.nome"/>, <bean:write name="im" property="pais.nome"/><br/>
				<logic:present name="im" property="planta" >
					<a href="#" onClick="javascript:mostrarImagem('/buzkaza/imagens_usuarios/<bean:write name="im" property="planta.caminho"/>');">Ver Planta</a><br/>
				</logic:present>
				<logic:notPresent name="im" property="planta" >
					Planta não cadastrada<br/>
				</logic:notPresent>												
				<logic:notEmpty name="im" property="fotos">
						Fotos<br/>
						<logic:iterate id="ft" name="im" property="fotos">							
							<img src="/buzkaza/imagens_usuarios/<bean:write name="ft" property="caminhoThumbnail"/>"/>
						</logic:iterate>												
				</logic:notEmpty>
				<hr>				
			</logic:iterate>
			</fieldset>
		</logic:notEmpty>
		<logic:empty name="pessoa" property="imoveis">
		<b>Não possui imóveis cadastrados</b>
		</logic:empty>
		</fieldset>
	<br>
	</logic:iterate>
</logic:present>

</div>
<div id="bottom_cad">
</div>
</div>
</body>
</html>