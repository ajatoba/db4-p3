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
			$('#form').jqTransform({imgPath:'jqtransformplugin/img/'});
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

<link rel="stylesheet" type="text/css" media="screen" href="/buzkaza/_css/tabs.css"   />

<script type="text/javascript" src="/buzkaza/_js/jquery-1.4.js"></script>
<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
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
			</select></form> &nbsp;&nbsp;<img src="/buzkaza/_img/btn_criar_anuncio.jpg" width="151" height="31" /></div>
</div>
</div>
<div id="sep_top_reserva"></div>
<div id="listagem_reservas">
<div class="topo_edicao">
<div class="mapa_planta"><img src="/buzkaza/_img/adm_meusanuncios_editar_05.png" width="195" height="145" /></div>
<div class="endereco_bairro"><table width="100%" border="0">
  <tr>
    <td width="35%">Copacabana</td>
    <td width="65%" rowspan="3">Distância do centro 10Km<br />
      Mapa Google Maps<br />
      Vídeo You Tube</td>
  </tr>
  <tr>
    <td>Rua Siqueira Campos</td>
    </tr>
  <tr>
    <td>8,2 Nota  102 Comentários Id12345</td>
    </tr>
</table>
</div>
<div class="menu_edicao">
<div class="menu_01_cinza"></div>
<div class="menu_02_cinza"></div>
<div class="menu_03"></div>
</div>
<div id="formulario_edicao">
<div class="left_formulario_">
<table width="100%" border="0">
  <tr>
    <td colspan="3"><img src="/buzkaza/_img/bullet_laranja.jpg" width="19" height="15" />Disponibilidades</td>
    </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Janeiro</td>
        </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Fevereiro</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Março</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Abril</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Maio</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Junho</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Julho</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Agosto</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Setembro</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Outubro</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Novembro</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td colspan="7">Dezembro</td>
      </tr>
      <tr>
        <td>01</td>
        <td>02</td>
        <td>03</td>
        <td>04</td>
        <td>05</td>
        <td>06</td>
        <td>07</td>
      </tr>
      <tr>
        <td>08</td>
        <td>09</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
      </tr>
      <tr>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
      </tr>
      <tr>
        <td>22</td>
        <td>23</td>
        <td>24</td>
        <td>25</td>
        <td>26</td>
        <td>27</td>
        <td>28</td>
      </tr>
      <tr>
        <td>29</td>
        <td>30</td>
        <td>31</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

</div>
<div class="right_formulario_">
<table width="100%" border="0">
  <tr>
    <td><label for="select"></label>
      <select name="select" id="select">
      </select></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>De</td>
        <td>Até</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><label for="textfield"></label>
          <input type="text" name="textfield" id="textfield" /></td>
        <td><input type="text" name="textfield2" id="textfield2" /></td>
        <td><input type="submit" name="button" id="button" value="Submit" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>Datas Disponíveis</td>
  </tr>
  <tr>
    <td>Listagem das datas adicionadas assim</td>
  </tr>
  <tr>
    <td>Legenda</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td width="5%" bgcolor="#E3E3E3">&nbsp;</td>
        <td width="27%">Reservado</td>
        <td width="6%" bgcolor="#8DBF22">&nbsp;</td>
        <td width="28%">Baixa Temporada</td>
        <td width="6%" bgcolor="#D300FF">&nbsp;</td>
        <td width="28%">Data Especial</td>
      </tr>
      <tr>
        <td bgcolor="#2980C5">&nbsp;</td>
        <td>Bloqueado</td>
        <td bgcolor="#FFC600">&nbsp;</td>
        <td>Média Temporada</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#00D8FF">&nbsp;</td>
        <td>Pacote Fechado</td>
        <td bgcolor="#FF6D00">&nbsp;</td>
        <td>Alta Temporada</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

</div>
</div>
</div>

</div>
<div class="bottom_formulario">
<table width="100%" border="0">
  <tr>
    <td><img src="/buzkaza/_img/bullet_laranja.jpg" alt="" width="19" height="15" />Tarifas</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4">Os preços semanais e mensais devem ser introduzidos com os preços unitários pelo dia.</td>
    </tr>
  <tr>
    <td>Baixa Temporada</td>
    <td>Média Temporada</td>
    <td>Alta Temporada</td>
    <td>Datas Especiais</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>Diária</td>
        <td>Quinzenal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield3" type="text" id="textfield3" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield4" type="text" id="textfield4" size="10" /></td>
      </tr>
      <tr>
        <td>Semanal </td>
        <td>Mensal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield5" type="text" id="textfield5" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield6" type="text" id="textfield6" size="10" /></td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td>Diária</td>
        <td>Quinzenal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield12" type="text" id="textfield9" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield7" type="text" id="textfield10" size="10" /></td>
      </tr>
      <tr>
        <td>Semanal </td>
        <td>Mensal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield10" type="text" id="textfield7" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield11" type="text" id="textfield8" size="10" /></td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td>Diária</td>
        <td>Quinzenal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield13" type="text" id="textfield11" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield14" type="text" id="textfield12" size="10" /></td>
      </tr>
      <tr>
        <td>Semanal </td>
        <td>Mensal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield15" type="text" id="textfield13" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield8" type="text" id="textfield14" size="10" /></td>
      </tr>
    </table></td>
    <td><table width="100%" border="0">
      <tr>
        <td>Diária</td>
        <td>Quinzenal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield16" type="text" id="textfield15" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield17" type="text" id="textfield16" size="10" /></td>
      </tr>
      <tr>
        <td>Semanal </td>
        <td>Mensal</td>
      </tr>
      <tr>
        <td><label for="textfield3"></label>
          <input name="textfield18" type="text" id="textfield17" size="10" /></td>
        <td><label for="textfield3"></label>
          <input name="textfield9" type="text" id="textfield18" size="10" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><img src="/buzkaza/_img/bullet_laranja.jpg" alt="" width="19" height="15" />Pacotes Fechados</td>
  </tr>
  <tr>
    <td colspan="4"><table width="100%" border="0">
      <tr>
        <td>De</td>
        <td>até</td>
        <td>&nbsp;</td>
        <td>Valor</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><input name="textfield19" type="text" id="textfield19" size="10" /></td>
        <td><input name="textfield20" type="text" id="textfield20" size="10" /></td>
        <td><select name="select3" id="select2">
        </select></td>
        <td><input name="textfield22" type="text" id="textfield22" size="10" /></td>
        <td><input type="submit" name="button2" id="button2" value="Submit" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="4">Pacotes<br />
      Listagem dos Pacotes</td>
  </tr>
  </table>


</div>
<div class="linha_cinza"></div>
<div class="opcoes_pg">
<div class="left_opcoes">
<table width="100%" border="0">
  <tr>
    <td>Política de Recebimento</td>
  </tr>
  <tr>
    <td>Lorem ipsum</td>
  </tr>
  <tr>
    <td>Moeda</td>
  </tr>
  <tr>
    <td><label for="select3"></label>
      <select name="select4" id="select3">
        <option>Real</option>
        <option>Dólar</option>
        <option>Euro</option>
      </select></td>
  </tr>
</table>

</div>
<div class="right_opcoes">
  <div id="tabs">                
                <div id="container_abas">
                        <ul id="nav">	
                            <li id="aba_1"><a href="#quemsomos" class="corrente" onclick="trocaImagem('opcao_01')"><img src="/buzkaza/_img/opcao_01_azul.png" id="opcao_01"width="157" height="49" alt="" border="0"/></a></li>  
                            <li><a href="#formacao" onclick="trocaImagem('opcao_02')"><img src="/buzkaza/_img/opcao_02.png" id="opcao_02"width="157" height="49" alt="" border="0"/></a></li> 
                                                    
                        </ul>
                    
                  <div id="aba1" class="aba">
                    <table width="100%" border="0">
                      <tr>
                        <td>Pagamento de sinal para confirmação de reserva, com saldo direto no check in.<br />
                          Sinal de 10% (Deduzida do total da estadia+taxas extras) + encargos do cartão ou boleto referente o sinal de 10%, retidos pelo Buzkaza como taxa de transação.</td>
                      </tr>
                      <tr>
                        <td>Forma de Pagamento</td>
                      </tr>
                      <tr>
                        <td><input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Dinheiro&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Visa&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Mastercard&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Dinners&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          Bradesco&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Itaú&nbsp;&nbsp;
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Unibanco
                          <input type="radio" name="radio" id="radio" value="radio" />
                          <label for="radio"></label>
                          Banco do Brasil </td>
                      </tr>
                      <tr>
                        <td><input type="radio" name="radio" id="radio2" value="radio" />
                          <label for="radio2"></label>
                          Aura
                          <input type="radio" name="radio" id="radio3" value="radio" />
                          Hipercard
                          <input type="radio" name="radio" id="radio4" value="radio" />
                          <label for="radio4"></label>
                          Amex </td>
                      </tr>
                    </table>
                    <br />

                    
                  </div>
                    
                  <div id="aba2" class="aba">
                    <table width="100%" border="0">
                      <tr>
                        <td colspan="3">Pagamento integral da estadia (só para proprietários Brasileiros).</td>
                      </tr>
                      <tr>
                        <td>Titular</td>
                        <td>&nbsp;</td>
                        <td>CPF/CNPJ</td>
                      </tr>
                      <tr>
                        <td colspan="2"><label for="textfield"></label>
                          <input type="text" name="textfield" id="textfield" /></td>
                        <td><input type="text" name="textfield3" id="textfield3" /></td>
                      </tr>
                      <tr>
                        <td>Numero do Banco</td>
                        <td>Agência</td>
                        <td>Conta Corrente</td>
                      </tr>
                      <tr>
                        <td><input type="text" name="textfield2" id="textfield2" /></td>
                        <td><input type="text" name="textfield4" id="textfield4" /></td>
                        <td><input type="text" name="textfield5" id="textfield5" /></td>
                      </tr>
                    </table>
                    <br /><br />
                                    
                  
                  </div>
                            
                  
                                           
                </div>
        </div><!-- id="tabs" -->

</div>
<input type="submit" name="button3" id="button3" value="Submit" />
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
