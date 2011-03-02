
<html:form method="post" styleId="imovelBuscaForm" action="/imovel.do?act=buscarImovel">

<div class="MyriadProRegular">

  <div class="form_01">
  <table width="490" border="0" align="center" cellpadding="0" cellspacing="2" class="txt_form">
    <tr>
      <td width="33%" height="30">Estado</td>
      <td width="33%" height="30">País</td>
      <td width="33%" height="30">Munícipio</td>
    </tr>
    <tr>
      <td width="33%" height="30">      
      		<html:select property="imovelEntity.estado.codigo" styleClass="MyriadProRegular">    			 
				<html:options collection="estados" property="codigo" labelProperty="nome" />
        	</html:select>
      </td>
      <td width="33%" height="30">      
      		<html:select property="pais" styleClass="MyriadProRegular">    		
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select>      
      </td>
      <td width="33%" height="30"><html:text property="municipio" styleClass="MyriadProRegular" size="180" /></td>
    </tr>
    <tr>
      <td width="33%" height="30">Capacidade</td>
      <td width="33%" height="30">Quartos</td>
      <td width="33%" height="30">Área(m2)</td>
    </tr>
    <tr>
      <td width="33%" height="30">
            <html:select property="capacidade" styleClass="MyriadProRegular">
                <html:option value=""></html:option> 
                <html:option value="1">1 Pessoa</html:option>
                <html:option value="2">2 Pessoas</html:option>
            </html:select>
      </td>
      <td width="33%" height="30">
            <html:select property="quartos" styleClass="MyriadProRegular">
                <html:option value=""></html:option> 
                <html:option value="1">1 Quarto</html:option>
                <html:option value="2">2 Quartos</html:option>
            </html:select>      
      </td>
      <td width="33%" height="30">
            <html:select property="metragem" styleClass="MyriadProRegular">    	
                <html:option value=""></html:option> 
                <html:option value="50.0">50m</html:option>
                <html:option value="60.0">60m</html:option>
            </html:select>      
      </td>
    </tr>
    <tr>
      <td width="33%" height="30">Disponibilidade</td>
      <td width="33%" height="30">&nbsp;</td>
      <td width="33%" height="30">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30">Chegada</td>
          <td height="30">Partida</td>
          </tr>
        <tr>
          <td><html:select property="diaDataInicialAnuncio" title="dia" styleId="diaDataInicialAnuncio" styleClass="MyriadProRegular">                        
			<html:option value="01">01</html:option>
            <html:option value="02">02</html:option>
            <html:option value="03">03</html:option>
            <html:option value="04">04</html:option>
            <html:option value="05">05</html:option>
            <html:option value="06">06</html:option>
            <html:option value="07">07</html:option>
            <html:option value="08">08</html:option>
            <html:option value="09">09</html:option>                            
            <html:option value="10">10</html:option>
            <html:option value="11">11</html:option>
            <html:option value="12">12</html:option>
            <html:option value="13">13</html:option>
			<html:option value="14">14</html:option>
            <html:option value="15">15</html:option>
            <html:option value="16">16</html:option>
            <html:option value="17">17</html:option>
            <html:option value="18">18</html:option>
            <html:option value="19">19</html:option>                            
            <html:option value="20">20</html:option>
            <html:option value="21">21</html:option>
            <html:option value="22">22</html:option>
            <html:option value="23">23</html:option>
            <html:option value="24">24</html:option>
            <html:option value="25">25</html:option>
            <html:option value="26">26</html:option>
            <html:option value="27">27</html:option>
            <html:option value="28">28</html:option>
            <html:option value="29">29</html:option>                            
            <html:option value="30">30</html:option>
            <html:option value="31">31</html:option>                            
		</html:select>
		<html:select property="mesDataInicialAnuncio" title="mesDataInicialAnuncio" styleId="mesDataInicial" styleClass="MyriadProRegular">                        
            <html:option value="1">Janeiro</html:option>
            <html:option value="2">Fevereiro</html:option>
            <html:option value="3">Março</html:option>
            <html:option value="4">Abril</html:option>
            <html:option value="5">Maio</html:option>
            <html:option value="6">Junho</html:option>
            <html:option value="7">Julho</html:option>
            <html:option value="8">Agosto</html:option>
            <html:option value="9">Setembro</html:option>
            <html:option value="10">Outubro</html:option>
			<html:option value="11">Novembro</html:option>
			<html:option value="12">Dezembro</html:option>                  
		</html:select>
      	
      	<html:select property="anoDataInicialAnuncio" title="Ano" styleId="anoDataInicialAnuncio" styleClass="MyriadProRegular">
        	<html:option value="2011">2011</html:option>
	        <html:option value="2012">2012</html:option>
	        <html:option value="2013">2013</html:option>
	        <html:option value="2014">2014</html:option>
	        <html:option value="2015">2015</html:option> 
        </html:select></td>
          <td><html:select property="diaDataFinalAnuncio" title="dia" styleId="diaDataFinalAnuncio" styleClass="MyriadProRegular">                        
			<html:option value="01">01</html:option>
            <html:option value="02">02</html:option>
            <html:option value="03">03</html:option>
            <html:option value="04">04</html:option>
            <html:option value="05">05</html:option>
            <html:option value="06">06</html:option>
            <html:option value="07">07</html:option>
            <html:option value="08">08</html:option>
            <html:option value="09">09</html:option>                            
            <html:option value="10">10</html:option>
            <html:option value="11">11</html:option>
            <html:option value="12">12</html:option>
            <html:option value="13">13</html:option>
			<html:option value="14">14</html:option>
            <html:option value="15">15</html:option>
            <html:option value="16">16</html:option>
            <html:option value="17">17</html:option>
            <html:option value="18">18</html:option>
            <html:option value="19">19</html:option>                            
            <html:option value="20">20</html:option>
            <html:option value="21">21</html:option>
            <html:option value="22">22</html:option>
            <html:option value="23">23</html:option>
            <html:option value="24">24</html:option>
            <html:option value="25">25</html:option>
            <html:option value="26">26</html:option>
            <html:option value="27">27</html:option>
            <html:option value="28">28</html:option>
            <html:option value="29">29</html:option>                            
            <html:option value="30">30</html:option>
            <html:option value="31">31</html:option>                            
		</html:select>
		<html:select property="mesDataFinalAnuncio" title="mesDataInicialAnuncio" styleId="mesDataInicial" styleClass="MyriadProRegular">                        
            <html:option value="1">Janeiro</html:option>
            <html:option value="2">Fevereiro</html:option>
            <html:option value="3">Março</html:option>
            <html:option value="4">Abril</html:option>
            <html:option value="5">Maio</html:option>
            <html:option value="6">Junho</html:option>
            <html:option value="7">Julho</html:option>
            <html:option value="8">Agosto</html:option>
            <html:option value="9">Setembro</html:option>
            <html:option value="10">Outubro</html:option>
			<html:option value="11">Novembro</html:option>
			<html:option value="12">Dezembro</html:option>                  
		</html:select>
      	
      	<html:select property="anoDataFinalAnuncio" title="Ano" styleId="anoDataInicialAnuncio" styleClass="MyriadProRegular">
        	<html:option value="2011">2011</html:option>
	        <html:option value="2012">2012</html:option>
	        <html:option value="2013">2013</html:option>
	        <html:option value="2014">2014</html:option>
	        <html:option value="2015">2015</html:option> 
        </html:select></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
  </table>

</div>
<div class="form_02">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="4">
  <tr>
    <td colspan="3" class="txt_caracteristica"><img src="/buzkaza/_img/bullet.jpg" width="21" height="16" />Características do Imóvel</td>
    </tr>
  
    
    <logic:notEmpty name="equipamentos">	
        <logic:iterate name="equipamentos" id="equipamento">
			<tr>
				<td colspan="3" class="MyriadProRegular">
						<span class="txt_form">
								<div class="equip_top1">
									
								    <html:multibox property="equipamentos" styleClass="MyriadProRegular"> 
									<bean:write name="equipamento" property="codigo"/>  
									</html:multibox>
								</div>
								<div class="equip_top2">
									<bean:write name="equipamento" property="nome"/>
								</div>
						</span>
			</td>
			</tr>       
	    </logic:iterate>
    </logic:notEmpty>    
</table>

</div>
  
  
<div class="btn_busca"><a href="#" onclick="submitForm();" border="0"><img src="/buzkaza/_img/btn_buscar.jpg" width="211" height="30" border="0"/></a></div>  

</div>
</html:form>
