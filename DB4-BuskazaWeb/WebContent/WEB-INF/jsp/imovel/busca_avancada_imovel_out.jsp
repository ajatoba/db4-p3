<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BUZKAZA</title>
<link href="_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="/buzkaza/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="requiered/jquery.js" ></script>
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
<!--BUSCA-->
<div id="cont_result_busca">
<div id="left_busca_avancada">
<div id="top_busca_avancada"></div>
<div id="busca_refinada">
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="MyriadPro20Azul">Redefinir Busca</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">Tipo</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select" class="MyriadProRegular">
				<option value="">Veraneio</option>
				<option value="">Serra</option>
                <option value="">Apartamento/Flats</option>
                <option value="">Sitíos/Fazenda</option>
                <option value="">Eventos</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">País</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">Estado</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">Cidade</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">Bairro</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">Chegada</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select3" class="MyriadProRegular">
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
    </select>&nbsp;<select name="select4" class="MyriadProRegular">
        <option value="opt1" class="MyriadProRegular">Janeiro</option>
        <option value="" class="MyriadProRegular">Fevereiro</option>
        <option value="" class="MyriadProRegular">Março</option>
        <option value="" class="MyriadProRegular">Abril</option>
        <option value="" class="MyriadProRegular">Maio</option>
        <option value="" class="MyriadProRegular">Junho</option>
         <option value="" class="MyriadProRegular">Julho</option>
        <option value="" class="MyriadProRegular">Agosto</option>
        <option value="" class="MyriadProRegular">Setembro</option>
        <option value="" class="MyriadProRegular">Outubro</option>
        <option value="" class="MyriadProRegular">Novembro</option>
        <option value="" class="MyriadProRegular">Dezembro</option>
      </select></td>
  </tr>
  <tr>
    <td colspan="2">Partida</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select3" class="MyriadProRegular">
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
    </select>&nbsp;<select name="select4" class="MyriadProRegular">
        <option value="opt1" class="MyriadProRegular">Janeiro</option>
        <option value="" class="MyriadProRegular">Fevereiro</option>
        <option value="" class="MyriadProRegular">Março</option>
        <option value="" class="MyriadProRegular">Abril</option>
        <option value="" class="MyriadProRegular">Maio</option>
        <option value="" class="MyriadProRegular">Junho</option>
         <option value="" class="MyriadProRegular">Julho</option>
        <option value="" class="MyriadProRegular">Agosto</option>
        <option value="" class="MyriadProRegular">Setembro</option>
        <option value="" class="MyriadProRegular">Outubro</option>
        <option value="" class="MyriadProRegular">Novembro</option>
        <option value="" class="MyriadProRegular">Dezembro</option>
      </select></td>
    </tr>
  <tr>
    <td width="50%">Capacidade</td>
    <td width="50%">Quartos</td>
  </tr>
  <tr>
    <td><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
    <td><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">Área (m2)</td>
    </tr>
  <tr>
    <td colspan="2"><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">Preço</td>
  </tr>
  <tr>
    <td colspan="2"><select name="select" class="MyriadProRegular">
				<option value="opt1">Diário</option>
				<option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
			</select></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">Busca Avançada</td>
  </tr>
  <tr>
    <td colspan="2"><img src="/buzkaza/_img/btn_buscar_avancada.jpg" width="205" height="30" /></td>
  </tr>
</table>

 </div>
<div id="bottom_busca_avancada"></div>
</div>
<div id="right_busca_avancada">
<div id="conteudo_result_busca">
<div id="top_resultado">
<div class="retorno_busca"><span class="MyriadPro14">Sua busca retornou: <bean:write name="resultado"/> resultados</span></div>
<div class="ordenacao_busca">
<span class="MyriadPro14">Ordenar :</span><br />

<select name="select2" class="MyriadProRegular">
  <option value="opt1" class="MyriadProRegular">Janeiro</option>
  <option value="" class="MyriadProRegular">Fevereiro</option>
  <option value="" class="MyriadProRegular">Março</option>
  <option value="" class="MyriadProRegular">Abril</option>
  <option value="" class="MyriadProRegular">Maio</option>
  <option value="" class="MyriadProRegular">Junho</option>
  <option value="" class="MyriadProRegular">Julho</option>
  <option value="" class="MyriadProRegular">Agosto</option>
  <option value="" class="MyriadProRegular">Setembro</option>
  <option value="" class="MyriadProRegular">Outubro</option>
  <option value="" class="MyriadProRegular">Novembro</option>
  <option value="" class="MyriadProRegular">Dezembro</option>
</select>
</div>
</div>
<div id="sep_top_ba"></div>
<logic:iterate id="ims"  name="imoveis">
<div id="cont_ba">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="21%" rowspan="2" valign="top"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="primeirafoto"/>" width="140" height="104" /></td>
    <td width="70%"><span class="MyriadPro20Azul"><bean:write name="ims" property="usuarioProprietario.nome"/> </span><br />
      <span class="MyriadPro14">Rua Figueiredo Magalhães, Copacabana</span></td>
    <td width="10%"><img src="/buzkaza/_img/btn_detalhes.jpg" width="64" height="24" /></td>
    <td width="10%"><img src="/buzkaza/_img/btn_lista.jpg" width="85" height="24" /></td>
    <td width="10%"><img src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" /></td>
  </tr>
  <tr>
    <td colspan="4" align="left">Diária : R$ 50,00<br />
      Total (10 dias) : R$ 500,00 *Retorna a soma dos dias que ele selecionou<br />
      Reserva : R$ 250 *Retorna um valormediante a porcentagem do sinal escolhido pelo proprietário no cadastro do anúncio</p>
      <p>Nota : 8,2<br />
        Comentários : 216<br />
        <br />
        Capacidade : 3<br />
        Quartos : 2<br />
        Metragem : 40m2<br />
        <br />
      
      <table width="100%" border="0" cellspacing="5" cellpadding="0">
        <tr>
          <td align="center"><img src="/buzkaza/_img/icones_verde_01.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_02.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_03.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_04.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_05.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_06.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_07.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_08.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_09.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_verde_10.jpg" width="39" height="39" /></td>
        </tr>
        <tr>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_01.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_02.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_03.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_04.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_05.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_06.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_07.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_08.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_09.jpg" width="39" height="39" /></td>
          <td align="center"><img src="/buzkaza/_img/icones_cinza_10.jpg" width="39" height="39" /></td>
        </tr>
      </table>
      <p>  <br />
      </p></td>
  </tr>
</table>
</div>
</logic:iterate>
</div>

</div>

</div>
<!--FIM BUSCA-->
<div id="linha_meio"></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
