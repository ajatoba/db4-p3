<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/pager-taglib.tld" prefix="pg" %>

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
<table width="70%" align="center">
<tr><td>
<div class="MyriadProRegular">
<b><center>
Classificar: 
<a href="usuario.do?act=listarTodosUsuarios&ordenacao=asc">[Mais Recente >> Mais Antigo]</a>
<a href="usuario.do?act=listarTodosUsuarios&ordenacao=desc">[Mais Antigo >> Mais Recente]</a>
 <br>
 </b>
 </center>
<logic:present name="pessoas">

<!-- PAGINAÇÃO -->

<pg:pager url="usuario.do" maxIndexPages="5" maxPageItems="5">

<!-- ********* -->

	<logic:iterate id="pessoa"  name="pessoas">
	<pg:item>
	<fieldset>
	<legend>Usuário Cadastrado em <bean:write name="pessoa" property="dataCadastro" format="dd/MM/yyyy"/> </legend>
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
				Cadastrado em <bean:write name="im" property="dataCadastro" format="dd/MM/yyyy"/><br>
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
	
	</pg:item>
	</logic:iterate>

<%
String ordenacao = request.getParameter("ordenacao");
if(ordenacao==null || ordenacao.equals("")) ordenacao="desc";
String parametros =	"act=listarTodosUsuarios&ordenacao=" + ordenacao;
%>
	
<center>
	<pg:index>
		<pg:prev>
		<a href="<%=pageUrl%>&<%=parametros %>">[Anterior]</a>  
		</pg:prev>
		
		<pg:pages>
			<a href="<%=pageUrl %>&<%=parametros %>"><%= pageNumber %></a>
		</pg:pages>
		
		<pg:next>
			<a href="<%=pageUrl%>&<%=parametros %>">[Próxima]</a>
		</pg:next>
	</pg:index>
</center>
</pg:pager>

</logic:present>
	
</div>
</td>
</tr>
</table>
</div>
<div id="bottom_cad">
</div>
</div>
</body>
</html>