
<html:form method="post" styleId="imovelBuscaForm" action="/imovel.do?act=buscarImovel">

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="40" colspan="2" valign="bottom" class="tit_azul2">Redefinir Busca</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">Estado</span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">
              <html:select property="imovelEntity.estado.codigo" styleClass="MyriadProRegular">    			 
				<html:options collection="estados" property="codigo" labelProperty="nome" />
        	</html:select>
              </span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">País</span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">
              <html:select property="pais" styleClass="MyriadProRegular">    		
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select>
              </span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">Município</span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">
              <html:text property="municipio" styleClass="MyriadProRegular" size="160" />
              </span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">Capacidade</span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">
              <html:select property="capacidade" styleClass="MyriadProRegular">
                <html:option value="">-</html:option> 
                <html:option value="1">1 Pessoa</html:option>
                <html:option value="2">2 Pessoas</html:option>
                <html:option value="3">3 Pessoas</html:option>
                <html:option value="4">4 Pessoas</html:option>
                <html:option value="5">5 Pessoas</html:option>
            </html:select>
              </span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">Quartos</span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">
                      <html:select property="quartos" styleClass="MyriadProRegular">
                        <html:option value="">-</html:option> 
                        <html:option value="1">1 Quarto</html:option>
                        <html:option value="2">2 Quartos</html:option>
                        <html:option value="3">3 Quartos</html:option>
                        <html:option value="4">4 Quartos</html:option>
                    </html:select>
              </span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">Área</span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">
                      <html:select property="metragem" styleClass="MyriadProRegular">    	
                        <html:option value="">-</html:option> 
                        <html:option value="50.0">50m</html:option>
                        <html:option value="60.0">60m</html:option>
                        <html:option value="70.0">70m</html:option>
                        <html:option value="80.0">80m</html:option>
                        <html:option value="90.0">90m</html:option>
                    </html:select>
              </span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">Chegada</span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">
              <html:select property="diaDataInicialAnuncio" title="dia" styleId="diaDataInicialAnuncio" styleClass="MyriadProRegular">                        
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
        
        
        <div class="sepd">
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
      	</div>
              </span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">Partida</span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">
              <html:select property="diaDataFinalAnuncio" title="dia" styleId="diaDataFinalAnuncio" styleClass="MyriadProRegular">                        
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
		<div class="sepd">
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
      	</div>
        
        
              </span></td>
          </tr>
          <tr>
            <td width="50%" height="30"><span class="txt_form">Capacidade</span></td>
            <td width="50%" height="30"><span class="txt_form">Quartos</span></td>
          </tr>
          <tr>
            <td height="30"><span class="txt_form">
              <select name="select" class="MyriadProRegular">
                <option value="opt1">Diário</option>
                <option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
              </select>
              </span></td>
            <td height="30"><span class="txt_form">
              <select name="select" class="MyriadProRegular">
                <option value="opt1">Diário</option>
                <option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
              </select>
              </span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">Área (m2)</span></td>
          </tr>
          <tr>
            <td height="30" colspan="2"><span class="txt_form">
              <select name="select" class="MyriadProRegular">
                <option value="opt1">Diário</option>
                <option value="">Semanal</option>
                <option value="">Mensal</option>
                <option value="">Trimestral</option>
                <option value="">Semestral</option>
                <option value="">Anual</option>
              </select>
              </span></td>
          </tr>
          
          
          <logic:notEmpty name="equipamentos">	
          <tr>
            <td height="30" colspan="2"><span class="txt_form">Equipamentos no imóvel</span></td>
          </tr>
          
        <logic:iterate name="equipamentos" id="equipamento">
			<tr>
				<td colspan="2" class="MyriadProRegular">
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
    
          <tr>
            <td colspan="2" class="busca_avancada"></td>
          </tr>
          <tr>
            <td colspan="2"><a href="#" onclick="submitForm();" border="0"><img src="/buzkaza/_img/btn_buscar.jpg" width="211" height="30" border="0"/></a></td>
          </tr>
        </table>
</div>
</html:form>
