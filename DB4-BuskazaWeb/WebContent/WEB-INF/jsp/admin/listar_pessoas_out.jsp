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

<table border="1">

<logic:present name="pessoas">

	<tr>
		<td>
		Nome
		</td>
		<td>
		E-mail
		</td>
		<td>
		Telefones
		</td>
		<td>
		Nacionalidade
		</td>
	</tr>
	<logic:iterate id="pessoa"  name="pessoas">
	<tr>
		<td>
		<bean:write name="pessoa" property="nome"/>
		</td>
		<td>
		<bean:write name="pessoa" property="email"/>
		</td>
		<td>
			<logic:notEmpty name="pessoa" property="telefones">
				<logic:iterate id="tel" name="pessoa" property="telefones">
					(<bean:write name="tel" property="ddd"/>)-<bean:write name="tel" property="numero"/> <br/>
				</logic:iterate>
			</logic:notEmpty>		
		</td>
		<td>
		<bean:write name="pessoa" property="nacionalidade"/>
		</td>
	</tr>
		<logic:notEmpty name="pessoa" property="imoveis">
			<logic:iterate id="im" name="pessoa" property="imoveis">
				<tr>
					<td></td>
					<td colspan="3">
						<bean:write name="im" property="quartos"/> quarto(s) em <bean:write name="im" property="bairro"/>, <bean:write name="im" property="estado.nome"/>, <bean:write name="im" property="pais.nome"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">
						<logic:present name="im" property="planta" >
							Planta:<br/>
							<img src="/buzkaza/imagens_usuarios/<bean:write name="im" property="planta.caminho"/>"/>
						</logic:present>
						<logic:notPresent name="im" property="planta" >
							Planta não cadastrada
						</logic:notPresent>												
					</td>
				</tr>
				<logic:notEmpty name="im" property="fotos">
				<tr>
					<td></td>
					<td colspan="3">
						Fotos<br/>
						<logic:iterate id="ft" name="im" property="fotos">							
							<img src="/buzkaza/imagens_usuarios/<bean:write name="ft" property="caminhoThumbnail"/>"/>
						</logic:iterate>						
					</td>
				</tr>
				</logic:notEmpty>				
			</logic:iterate>
		</logic:notEmpty>
	</logic:iterate>
</logic:present>

</table>

</body>
</html>