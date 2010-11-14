	/*Função Pai de Mascaras*/    
	function Mascara(o,f){
		
		var myevent=window.event? event:o; 
		
		v_obj=o
		v_fun=f
		
		//permitindo as teclas 'home', 'end' e as 4 setas
    	if( myevent.keyCode < 35 || myevent.keyCode > 40 ){
    		setTimeout("execmascara()",1)
    	}
    }

	/*Função que Executa os objetos*/
    function execmascara(){
		v_obj.value=v_fun(v_obj.value)
	}

	/*Função que Determina as expressões regulares dos objetos*/
    function leech(v){
		v=v.replace(/o/gi,"0")
        v=v.replace(/i/gi,"1")
        v=v.replace(/z/gi,"2")
        v=v.replace(/e/gi,"3")
        v=v.replace(/a/gi,"4")
        v=v.replace(/s/gi,"5")
        v=v.replace(/t/gi,"7")

        return v
	}

	/*Função que permite apenas numeros*/
    function Integer(v){
		return v.replace(/\D/g,"")
	}
	
	/*Função que padroniza telefone (11) 4184-1241*/
    function Telefone(v){
		v=v.replace(/\D/g,"")
		//v=v.replace(/^(\d\d)(\d)/g,"($1) $2")
		v=v.replace(/(\d{4})(\d)/,"$1-$2")

		return v
	}

	/*Função que padroniza telefone (11) 41841241*/
    function TelefoneCall(v){
		v=v.replace(/\D/g,"")
		v=v.replace(/^(\d\d)(\d)/g,"($1) $2")

		return v
	}

	/*Função que padroniza CPF*/
    function Cpf(v){
		v=v.replace(/\D/g,"")
		v=v.replace(/(\d{3})(\d)/,"$1.$2")
		v=v.replace(/(\d{3})(\d)/,"$1.$2")
		v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2")

		return v
	}

	/*Função que padroniza CEP*/
    function Cep(v){
		v=v.replace(/D/g,"")
		v=v.replace(/^(\d{5})(\d)/,"$1-$2")

		return v
	}

	/*Função que padroniza CNPJ*/
    function Cnpj(v){
		v=v.replace(/\D/g,"")
		v=v.replace(/^(\d{2})(\d)/,"$1.$2")
		v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3")
		v=v.replace(/\.(\d{3})(\d)/,".$1/$2")
		v=v.replace(/(\d{4})(\d)/,"$1-$2")

		return v
	}

	/*Função que permite apenas numeros Romanos*/
    function Romanos(v){
		v=v.toUpperCase()
		v=v.replace(/[^IVXLCDM]/g,"")
		while(v.replace(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/,"")!="")
		v=v.replace(/.$/,"")
        
		return v
	}

	/*Função que padroniza o Site*/
    function Site(v){
		v=v.replace(/^http:\/\/?/,"")
        dominio=v
        caminho=""
        if(v.indexOf("/")>-1)
		dominio=v.split("/")[0]
		caminho=v.replace(/[^\/]*/,"")
		dominio=dominio.replace(/[^\w\.\+-:@]/g,"")
		caminho=caminho.replace(/[^\w\d\+-@:\?&=%\(\)\.]/g,"")
		caminho=caminho.replace(/([\?&])=/,"$1")

        if(caminho!="")dominio=dominio.replace(/\.+$/,"")
		v="http://"+dominio+caminho

        return v
	}

    /*Função que padroniza DATA*/
    function Data(v){
    	if(v.length == 1 && v > 3)
			return "";
    	
    	v=v.replace(/\D/g,"")
    	
    	if( v.length == 2 && v > 31 )
			return v.substring(0,1);
    	
    	if( v.length == 3 && v.substring(2,3) > 1 )
			return v.substring(0,2);
    	
    	if( v.length == 4 && v.substring(2,4) > 12 )
			return v.substring(0,3);
    	
		v=v.replace(/(\d{2})(\d)/,"$1/$2")
		v=v.replace(/(\d{2})(\d)/,"$1/$2")

		return v
	}

	/*Função que padroniza DATA*/
    function Hora(v){
		if(v.length == 1 && v > 2)
			return "";
		
		v=v.replace(/\D/g,"")
		
		if( v.length == 2 && v > 23 )
			return v.substring(0,1);
		
		if( v.length == 3 && v.substring(2,3) > 5 )
			v = v.substring(0,2);
		
		v=v.replace(/(\d{2})(\d)/,"$1:$2")
		return v
	}

	/*Função que padroniza valor monétario*/
    function Valor(v){
		v=v.replace(/\D/g,"") //Remove tudo o que não é dígito
        v=v.replace(/^([0-9]{3}\.?){3}-[0-9]{2}$/,"$1.$2");
        //v=v.replace(/(\d{3})(\d)/g,"$1,$2")
        v=v.replace(/(\d)(\d{2})$/,"$1,$2") //Coloca ponto antes dos 2 últimos digitos

        return v
	}

	/*Função que padroniza Area*/
    function Area(v){
		v=v.replace(/\D/g,"")
		v=v.replace(/(\d)(\d{2})$/,"$1.$2")
		return v
	}
	
	/*Função que não permite caracteres especiais*/
    function CaracteresEspeciais(v){
   		v=v.replace(/[^a-zA-Z 0-9à-üÀ-Ü-]/g,"");
   		return v;
    }
	
	/*Função que converte tudo para maiúsculo*/
    function UpperCase(v){
    	v=CaracteresEspeciais(v);
		v=v.toUpperCase();
		return v
	}
    
    /* Função que remove máscara, retornando somente os digitos */
    function removeMascara( v ) {
    	return v.replace( /\D/g, "" );
    }

    function formataMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e){
    var sep = 0;
    var key = '';
    var i = j = 0;
    var len = len2 = 0;
    var tamanho = 12;
    var strCheck = '0123456789';
    var aux = aux2 = '';
    var whichCode = (event) ? e.which : e.keyCode;    
    // 13=enter, 8=backspace as demais retornam 0(zero)
    // whichCode==0 faz com que seja possivel usar todas as teclas como delete, setas, etc    
	if (objTextBox.value.length >= tamanho) whichCode = 1;
    
    if ((whichCode == 13) || (whichCode == 0) || (whichCode == 8))
    	return true;
    key = String.fromCharCode(whichCode); // Valor para o código da Chave
 
 
    if (strCheck.indexOf(key) == -1) 
    	return false; // Chave inválida
    len = objTextBox.value.length;
    for(i = 0; i < len; i++)
        if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal)) 
        	break;
    aux = '';
    for(; i < len; i++)
        if (strCheck.indexOf(objTextBox.value.charAt(i))!=-1) 
        	aux += objTextBox.value.charAt(i);
    aux += key;
    len = aux.length;
    if (len == 0) 
    	objTextBox.value = '';
    if (len == 1) 
    	objTextBox.value = '0'+ SeparadorDecimal + '0' + aux;
    if (len == 2) 
    	objTextBox.value = '0'+ SeparadorDecimal + aux;
    if (len > 2) {
        aux2 = '';
        for (j = 0, i = len - 3; i >= 0; i--) {
            if (j == 3) {
                aux2 += SeparadorMilesimo;
                j = 0;
            }
            aux2 += aux.charAt(i);
            j++;
        }
        objTextBox.value = '';
        len2 = aux2.length;
        for (i = len2 - 1; i >= 0; i--)
        	objTextBox.value += aux2.charAt(i);
        objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
    }
    return false;
}


function mascaraTelefone(obj, event){
	return txtBoxFormat(obj, '9999-9999', event);
}

function mascaraMemoJuridico(obj, event){
	return txtBoxFormat(obj, '###/####', event);
}

function aplicarMascaraTelefone(valor){
	document.write(txtFormat(valor, '9999-9999', event));
}


function txtBoxFormat(objeto, sMask, evtKeyPress) {
    var i, nCount, sValue, fldLen, mskLen,bolMask, sCod, nTecla;


if(document.all) { // Internet Explorer
    nTecla = evtKeyPress.keyCode;
} else if(document.layers) { // Nestcape
    nTecla = evtKeyPress.which;
} else {
    nTecla = evtKeyPress.which;
    if (nTecla == 8) {
        return true;
    }
}

    sValue = objeto.value;

    // Limpa todos os caracteres de formatação que
    // já estiverem no campo.
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( " ", "" );
    sValue = sValue.toString().replace( " ", "" );
    fldLen = sValue.length;
    mskLen = sMask.length;

    i = 0;
    nCount = 0;
    sCod = "";
    mskLen = fldLen;

    while (i <= mskLen) {
      bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/") || (sMask.charAt(i) == ":"))
      bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))

      if (bolMask) {
        sCod += sMask.charAt(i);
        mskLen++; }
      else {
        sCod += sValue.charAt(nCount);
        nCount++;
      }

      i++;
    }

    objeto.value = sCod;

    if (nTecla != 8) { // backspace
      if (sMask.charAt(i-1) == "9") { // apenas números...
        return ((nTecla > 47) && (nTecla < 58)); } 
      else { // qualquer caracter...
        return true;
      } 
    }
    else {
      return true;
    }
  }
  
  
  
  function txtFormat(sValue, sMask, evtKeyPress) {
    var i, nCount, fldLen, mskLen,bolMask, sCod, nTecla;


    // Limpa todos os caracteres de formatação que
    // já estiverem no campo.
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( " ", "" );
    sValue = sValue.toString().replace( " ", "" );
    fldLen = sValue.length;
    mskLen = sMask.length;

    i = 0;
    nCount = 0;
    sCod = "";
    mskLen = fldLen;

    while (i <= mskLen) {
      bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/") || (sMask.charAt(i) == ":"))
      bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))

      if (bolMask) {
        sCod += sMask.charAt(i);
        mskLen++; }
      else {
        sCod += sValue.charAt(nCount);
        nCount++;
      }

      i++;
    } 
   	return sCod;
  }
