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

	<link rel="stylesheet" href="/buzkaza/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
		});
	</script>
    <script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script>
$(function(){
$('#sep_top_reserva').corner('rounded 7px');

	$("#busca_home").corner("bottom 7px");
	$("#mapa_").corner("bottom 7px");
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
<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
<div class="txt_meus_anuncios"><span class="MyriadPro24">Meus Anúncios</span></div>
<div class="combo_anuncios"><span class="MyriadPro14" style="float:left; margin-top:10px; margin-right:3px;">Filtrar:</span>
	    <form id="form"><select name="select2" >
				<option value="opt1">Listar todas as reservas</option>
				<option value="opt2">Option 2</option>
				<option value="opt3">Option 3</option>
				<option value="opt4">Option 4</option>
				<option value="opt5">Option 5</option>
				<option value="opt6">Option 6</option>
				<option value="opt7">Option 7</option>
				<option value="opt8">Option 8</option>
			</select></form> &nbsp;&nbsp;<img src="/buskaza/_img/btn_criar_anuncio.jpg" width="151" height="31" /></div>
</div>
</div>
<div id="sep_top_reserva"></div>
<div id="listagem_reservas">
<div class="topo_edicao">
<div class="mapa_planta"><img src="/buzkaza/imagens_usuarios/<bean:write name="imovel" property="primeirafoto"/>" width="140" height="104" /></div>
<div class="endereco_bairro"><table width="100%" border="0">
  <tr>
    <td width="35%">><bean:write name="imovel" property="bairro"/></td>
    <td width="65%" rowspan="3">Distância do centro 10Km<br />
      Mapa Google Maps<br />
      Vídeo You Tube</td>
  </tr>
  <tr>
    <td><bean:write name="imovel" property="logradouro"/></td>
    </tr>
  <tr>
    <td>8,2 Nota  102 Comentários Id12345</td>
    </tr>
</table>
</div>
<div class="menu_edicao">
<div class="menu_01"></div>
<div class="menu_02"></div>
<div class="menu_03"></div>
</div>
<div id="formulario_edicao">
<div class="left_formulario">
<table width="100%" border="0">
  <tr>
    <td><img src="/buskaza/_img/bullet_laranja.jpg" width="19" height="15" /> Características do Imóvel</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>Perfil do Imóvel</td>
        <td>Quartos</td>
      </tr>
      <tr>
        <td><label for="select"></label>
          <select name="select" id="select">
          </select></td>
        <td><select name="select3" id="select2">
        </select></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>MEtragem</td>
        <td>Capacidade</td>
        <td>Distância do Centro</td>
      </tr>
      <tr>
        <td><select name="select4" id="select3">
        </select></td>
        <td><select name="select5" id="select4">
        </select></td>
        <td><label for="textfield"></label>
          <input type="text" name="textfield" id="textfield" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>Camas</td>
        <td>Qtd:</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><select name="select6" id="select5">
        </select></td>
        <td><input type="text" name="textfield2" id="textfield2" /></td>
        <td><input type="submit" name="button" id="button" value="Submit" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>Listagem dos itens adicionados acima</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>Transporte Público</td>
        <td>Nome/Número</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><select name="select7" id="select6">
        </select></td>
        <td><input type="text" name="textfield3" id="textfield3" /></td>
        <td><input type="submit" name="button2" id="button2" value="Submit" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>Listagem dos itens adicionados acima</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Idiomas Falados</td>
  </tr>
  <tr>
    <td><select name="select8" id="select7">
    </select>
      <input type="submit" name="button3" id="button3" value="Submit" /></td>
  </tr>
  <tr>
    <td>Listagem dos idiomas adicionados acima</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</div>
<div class="right_formulario">
<table width="100%" border="0">
  <tr>
    <td><img src="_img/bullet_laranja.jpg" alt="" width="19" height="15" />Equipamentos Permissões e Facilidades</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>Nome </td>
        <td>Qtd</td>
        <td>Valor</td>
      </tr>
      <tr>
        <td><select name="select9" id="select8">
        </select></td>
        <td><select name="select10" id="select9">
        </select></td>
        <td><input type="text" name="textfield4" id="textfield4" />
          <input type="submit" name="button4" id="button4" value="Submit" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>Listagem dos itens adicionados acima</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="/buzkaza/_img/bullet_laranja.jpg" alt="" width="19" height="15" />Equipamentos Permissões e Facilidades</td>
  </tr>
  <tr>
    <td>Arquivo (Qtd Min 5, máx 15 / Peso máx 200Kb)</td>
  </tr>
  <tr>
    <td><label for="fileField"></label>
      <input type="file" name="fileField" id="fileField" /></td>
  </tr>
  <tr>
    <td>Listagem dos itens adicionados acima</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</div>

<div class="bottom_formulario">
<table width="100%" border="0">
  <tr>
    <td>Dados de Check-In Check-Out</td>
  </tr>
  <tr>
    <td>*Todas as taxas extras, incluindo taxa de checkin e checkout fora de horário, deverão ser pagas em dinheiro ao próprio proprietário. Apenas iremos informar os valores.</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>Nome de quem fará o Check in</td>
        <td>Telefone</td>
        <td>Telefone Aleternativo</td>
        <td>Email</td>
        <td>Email Alternativo</td>
      </tr>
      <tr>
        <td><input type="text" name="textfield5" id="textfield5" /></td>
        <td><input name="textfield6" type="text" id="textfield6" size="5" />
          <input type="text" name="textfield7" id="textfield7" /></td>
        <td><input name="textfield8" type="text" id="textfield8" size="5" />
          <input type="text" name="textfield9" id="textfield9" /></td>
        <td><input type="text" name="textfield10" id="textfield10" /></td>
        <td><input type="text" name="textfield11" id="textfield11" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td width="50%">Horário Check in</td>
        <td width="50%">Horário Check out</td>
        </tr>
      <tr>
        <td>De 
          <select name="select11" id="select10">
          </select>
          :
          <select name="select12" id="select11">
          </select> 
          Até 
          <select name="select13" id="select12">
          </select>
          :
          <select name="select14" id="select13">
          </select></td>
        <td>De
          <select name="select15" id="select14">
          </select>
:
<select name="select15" id="select15">
</select>
Até
<select name="select15" id="select16">
</select>
:
<select name="select15" id="select17">
</select></td>
        </tr>
      <tr>
        <td>Taxa para check in antes do horário</td>
        <td>Taxa para check in antes do horário</td>
      </tr>
      <tr>
        <td><select name="select16" id="select18">
        </select> 
          Valor : 
          <input type="text" name="textfield12" id="textfield12" /></td>
        <td><select name="select17" id="select19">
        </select>
Valor :
<input type="text" name="textfield13" id="textfield13" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><p>Se vc selecionar sim e não descrever um valor, o sistema entende que será uma nova diária de baixa temporada.</p>
          <p>&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><input type="submit" name="button5" id="button5" value="Submit" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</div>
</div>
</div>

</div>



</div>
<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="linha_cinza"></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
