<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
FOTOS DO IMÓVEL
<br>
<logic:present name="fotos">
	<logic:iterate name="fotos" id="foto">
		<img src="/buzkaza/imagens_usuarios/<bean:write name="foto" property="caminhoThumbnail"/>"/>
		<html:form action="/usuario/foto.do?act=excluirFoto&ci=${foto.imovel.codigo}">			
			<html:hidden name="foto" property="codigo"/>
			<html:submit value="EXCLUIR"></html:submit>		
		</html:form>
		<br/><br/>
		<html:form styleId="fotoForm" method="post" action="/usuario/foto.do?act=alterarFoto&ci=${foto.imovel.codigo}" enctype="multipart/form-data">
			<html:hidden name="foto" property="codigo"/>
			<html:file property="arquivoFoto"/>
			<html:submit value="ALTERAR"></html:submit>
		</html:form>
		
		<hr/>
	</logic:iterate>
</logic:present>

</body>
</html>