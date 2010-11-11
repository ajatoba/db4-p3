<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
		});
	</script>
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/buzkaza/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/buzkaza/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/buzkaza/images/top_03.jpg" width="991" height="77" /></div>
<!--CADASTRO-->

<html:form method="post" styleId="imovelForm" action="/imovel?act=incluirImovel" enctype="multipart/form-data">


<div id="cont_cadastro">
  <div id="formulario_cadastro_imovel">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">      
      <tr>
        <td>Upload de Fotos</td>
        <td><label for="fileField"></label>
        <html:file property="arquivoFoto[1]" /><br/>
        <html:file property="arquivoFoto[2]" /><br/>
        <html:file property="arquivoFoto[3]" /><br/>
        <html:file property="arquivoFoto[4]" /><br/>
        <html:file property="arquivoFoto[5]" /><br/>
          </td>
      </tr>
      <tr>
        <td>Upload  da Planta </td>
        <td><html:file property="planta" /></td>
      </tr>
      <tr>
        <td>Capacidade</td>
        <td>
        <html:select property="capacidade">
      			<html:option value="1">1 Pessoa</html:option>
       			<html:option value="2">2 Pessoas</html:option>
      	</html:select>
        </td>
      </tr>
      <tr>
        <td>Quartos</td>
        <td>
        <html:select property="quartos">
      			<html:option value="1">1 Quarto</html:option>
       			<html:option value="2">2 Quartos</html:option>
      	</html:select>
      	</td>
      </tr>
      <tr>
        <td>Números  de Camas</td>
        <td>
        <html:select property="camas">
      			<html:option value="1">1 Cama</html:option>
       			<html:option value="2">2 Camas</html:option>
      	</html:select>
      	</td>
      </tr>
      <tr>
        <td>Idiomas  Falados</td>
        <td>
		<html:select property="idiomas">
      			<html:option value="1">Inglês</html:option>
       			<html:option value="2">Português</html:option>
      	</html:select>
		</td>
      </tr>
      <tr>
        <td>Transporte  Público</td>
        <td>
		<html:select property="transportePublico">
      			<html:option value="true">Sim</html:option>
       			<html:option value="false">Não</html:option>
      	</html:select>
		</td>
      </tr>
      <tr>
        <td>Metragem  do Imóvel</td>
        <td>
		<html:select property="metragem">
      			<html:option value="50.0">50m</html:option>
       			<html:option value="60.0">60m</html:option>
      	</html:select>
		</td>
      </tr>
      <tr>
        <td>Distância  do Centro:</td>
        <td><html:text property="distanciaCentro"/></td>
      </tr>
      <tr>
        <td>Link  Google Maps</td>
        <td><html:text property="linkGoogleMaps"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Localização</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Endereço</td>
        <td><html:text property="logradouro"/></td>
      </tr>
      <tr>
        <td>Bairro</td>
        <td><html:text property="complemento"/></td>
      </tr>
      <tr>
        <td>Estado</td>
        <td>
        	<html:select property="imovelEntity.estado.codigo">  
				<html:options collection="estados" property="codigo" labelProperty="nome" />
        	</html:select></td>
      </tr>
      <tr>
        <td>Cidade</td>
        <td><html:text property="municipio"/></td>
      </tr>
      <tr>
        <td>País </td>
        <td>
        	<html:select property="pais">  
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select>
		</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Equipamentos</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="2">
          <tr>
            <td colspan="3" class="MyriadProSemiboldIt"><img src="_img/bullet_cadastro.jpg" alt="" width="22" height="13" />Equipamentos no Imóvel</td>
          </tr>
          <logic:notEmpty name="equipamentos">
          	<logic:iterate name="equipamentos" id="equipamento">
				  <tr>
					  <td>
						  <html:multibox property="equipamentos">
						  	<bean:write name="equipamento" property="codigo"/>  
						  </html:multibox> 
						  <bean:write name="equipamento" property="nome"/>
					  </td>
				  </tr>         
	         </logic:iterate>
          </logic:notEmpty>

        </table></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Taxas Extras</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Energia</td>
        <td><select name="select8" id="select8">
        </select>           Se selecionar o Sim aparece um TextField para adicionar o Valor</td>
      </tr>
      <tr>
        <td>Internet </td>
        <td><select name="select9" id="select9">
        </select>
          Se selecionar o Sim aparece um TextField para adicionar o Valor</td>
      </tr>
      <tr>
        <td>Diarista </td>
        <td><select name="select10" id="select10">
        </select>
          Se selecionar o Sim aparece um TextField para adicionar o Valor</td>
      </tr>
      <tr>
        <td>Outro</td>
        <td><input type="text" name="textfield9" id="textfield9" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Condições</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Calção</td>
        <td><select name="select11" id="select11">
        </select>
Se selecionar o Sim aparece um TextField para adicionar o Valor</td>
      </tr>
      <tr>
        <td>Horário Check In</td>
        <td><input type="text" name="textfield10" id="textfield10" /> 
          até
          <input type="text" name="textfield12" id="textfield12" /></td>
      </tr>
      <tr>
        <td>Horário Check Out</td>
        <td><input type="text" name="textfield11" id="textfield11" />
até
  <input type="text" name="textfield11" id="textfield13" /></td>
      </tr>
      <tr>
        <td>Late Checkout</td>
        <td>Até 
          <input type="text" name="textfield13" id="textfield14" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Check In</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Nome</td>
        <td><input type="text" name="textfield16" id="textfield17" /></td>
      </tr>
      <tr>
        <td>Telefone</td>
        <td><input type="text" name="textfield15" id="textfield16" /></td>
      </tr>
      <tr>
        <td>Quem receberá o hóspede</td>
        <td><input type="text" name="textfield14" id="textfield15" /></td>
      </tr>
      <tr>
        <td>Moeda</td>
        <td><select name="select12" id="select12">
        </select>
          **Ao lado de cada sigla vai uma bandeirinha, rouba essa aqui depois a  gente muda <a href="http://www.only-apartments.com/imgs/curr/ue.png">http://www.only-apartments.com/imgs/curr/ue.png</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Tarifas</td>
        <td><input type="text" name="textfield17" id="textfield18" /></td>
      </tr>
      <tr>
        <td>Diária: </td>
        <td><input type="text" name="textfield18" id="textfield19" /></td>
      </tr>
      <tr>
        <td>Semanal:</td>
        <td><input type="text" name="textfield19" id="textfield20" /></td>
      </tr>
      <tr>
        <td>Quinzenal</td>
        <td><input type="text" name="textfield20" id="textfield21" /></td>
      </tr>
      <tr>
        <td>Mensal:</td>
        <td><input type="text" name="textfield21" id="textfield22" /></td>
      </tr>
      <tr>
        <td>Tarifas especiais:</td>
        <td><select name="select13" id="select13">
        </select>
          Se selecionar  o Sim aparecem dois TextFields para adicionar a Descrição e o Valor.</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><strong>ID  Anúncio</strong></td>
        <td>Ferramenta cria automaticamente</td>
      </tr>
    </table>
    <html:submit value="ok"/>
    </html:form>
    <p><br />
  </p>
  <p>&nbsp; </p>
  <p>&nbsp;</p>
  </div>

</div>
<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
