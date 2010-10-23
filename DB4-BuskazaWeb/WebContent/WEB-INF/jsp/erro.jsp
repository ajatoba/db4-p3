<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="${pageContext.request.contextPath}/_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="${pageContext.request.contextPath}/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/requiered/jquery.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'${pageContext.request.contextPath}/jqtransformplugin/img/'});
		});
	</script>
<link href="${pageContext.request.contextPath}/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="${pageContext.request.contextPath}/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="${pageContext.request.contextPath}/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="${pageContext.request.contextPath}/images/top_03.jpg" width="991" height="77" /></div>
<!--CADASTRO-->
<div id="cont_cadastro">
<div id="indice_cadastro"><img src="${pageContext.request.contextPath}/_img/indice_cadastro_02.jpg" width="971" height="55" /></div>
<div id="formulario_cadastro">
  <p><img src="${pageContext.request.contextPath}/_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt"><bean:message key="label.cadastro.titulo"/></span><br />
    <br />
  </p>
 
 
  <p align="center">
<font color="red">
  
		<logic:messagesPresent property="erro">
					<html:messages property="erro" id="erro">
						<bean:write name="erro"/>
					</html:messages>
				</logic:messagesPresent>
				
				<logic:messagesNotPresent property="erro">
					<logic:present name="erro">
							<bean:write name="erro"/>
					</logic:present>
				
				</logic:messagesNotPresent>
  </font></p>
</div>

</div>
<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="${pageContext.request.contextPath}/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="bottom"><img src="${pageContext.request.contextPath}/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
