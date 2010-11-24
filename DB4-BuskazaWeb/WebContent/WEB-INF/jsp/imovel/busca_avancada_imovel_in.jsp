<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BUZKAZA</title>
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/buzkaza/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	
	<script language="javascript">
		$(function(){
			$('#usuarioForm').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
		});

		function submitForm(){
			var form = 	document.imovelBuscaForm;
			document.forms[0].submit();			
		}
	</script>

</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/buzkaza/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/buzkaza/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/buzkaza/images/top_03.jpg" width="991" height="77" /></div>
<!--BUSCA-->
<div id="cont_busca">
<div id="form_busca">
<div class="titulo_busca"><span class="MyriadPro24">Busca Avançada</span></div>
<div class="sep_busca">

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

</div>

<html:form method="post" styleId="imovelBuscaForm" action="/imovel.do?act=buscarImovel">

<div class="form_01">
<table width="90%" border="0" cellspacing="0" cellpadding="0">
  
  <tr class="MyriadProRegular">
    <td colspan="3">Estado</td>
    <td>País</td>
  </tr>
  <tr>
    <td height="50" colspan="3">
    		<html:select property="imovelEntity.estado.codigo" styleClass="MyriadProRegular">  
				<html:options collection="estados" property="codigo" labelProperty="nome" />
        	</html:select>
	</td>
    <td height="50">
    		<html:select property="pais" styleClass="MyriadProRegular">  
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select>
    </td>
  </tr>
  <tr>
    <td class="MyriadProRegular">Capacidade</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><select name="select7" class="MyriadProRegular">
      <option value="opt1" class="MyriadProRegular">01</option>
      <option value="" class="MyriadProRegular">02</option>
      <option value="" class="MyriadProRegular">03</option>
      <option value="" class="MyriadProRegular">04</option>
      <option value="" class="MyriadProRegular">05</option>
      <option value="" class="MyriadProRegular">06</option>
      <option value="" class="MyriadProRegular">07</option>
      <option value="" class="MyriadProRegular">08</option>
      <option value="" class="MyriadProRegular">09</option>
      <option value="" class="MyriadProRegular">10</option>
      <option value="" class="MyriadProRegular">11</option>
      <option value="" class="MyriadProRegular">12</option>
      <option value="" class="MyriadProRegular">13</option>
      <option value="" class="MyriadProRegular">14</option>
      <option value="" class="MyriadProRegular">15</option>
      <option value="" class="MyriadProRegular">16</option>
      <option value="" class="MyriadProRegular">17</option>
      <option value="" class="MyriadProRegular">18</option>
      <option value="" class="MyriadProRegular">19</option>
      <option value="" class="MyriadProRegular">20</option>
      <option value="" class="MyriadProRegular">21</option>
      <option value="" class="MyriadProRegular">22</option>
      <option value="" class="MyriadProRegular">23</option>
      <option value="" class="MyriadProRegular">24</option>
      <option value="" class="MyriadProRegular">25</option>
      <option value="" class="MyriadProRegular">26</option>
      <option value="" class="MyriadProRegular">27</option>
      <option value="" class="MyriadProRegular">28</option>
      <option value="" class="MyriadProRegular">29</option>
      <option value="" class="MyriadProRegular">30</option>
      <option value="" class="MyriadProRegular">31</option>
    </select></td>
    <td>&nbsp;</td>
  </tr>
</table>

</div>
<div class="form_02">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="4">
  <tr>
    <td colspan="3" class="MyriadProSemiboldIt"><img src="/buzkaza/_img/bullet_cadastro.jpg" width="22" height="13" />Equipamentos no ImÃ³vel</td>
    </tr>
  <tr>
    <td width="33%" class="MyriadProRegular">
    
	<logic:notEmpty name="equipamentos">
          	<logic:iterate name="equipamentos" id="equipamento">
				  <tr>
					  <td>
						  <html:multibox property="equipamentos" styleClass="MyriadProRegular">
						  	<bean:write name="equipamento" property="codigo"/>  
						  </html:multibox> 
						  <bean:write name="equipamento" property="nome"/>
					  </td>
				  </tr>         
	         </logic:iterate>
    </logic:notEmpty>
	
	</td>
  </tr>
</table>

</div>
<div class="btn_busca"><a href="#" onclick="submitForm();" border="0"><img src="/buzkaza/_img/btn_buscar.jpg" width="211" height="30" /></a></div>
</html:form>
</div>
</div>
<!--FIM BUSCA-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
