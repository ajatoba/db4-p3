/*----------------------------------------------------------------------
 Como existem vários tipos de controles, cada um com suas
 particularidades, dividimos o processamento por tipo e delegamos
 a tarefa da validação em si a outras funções.
 ----------------------------------------------------------------------*/
var globalForm;
var globalMsg = new Array();
var globalMsgRequired = new Array();

var hazardChars = /[\"\'<>\/]/;

function ltrim(stringToTrim) {
	return stringToTrim.replace(/^\s+/, "");
}
function rtrim(stringToTrim) {
	return stringToTrim.replace(/\s+$/, "");
}

function checkForm(form) {
	globalForm = form;
	var elNode, valid;
	var message = '';

	
	var frmFields = globalForm.getElementsByTagName('*');

	for ( var i = 0, frmField; frmField = frmFields[i]; i++) {
		var validateIt = true;
		
		var classes = frmField.className.split(' ');
		for ( var j = 0, theclass; theclass = classes[j]; j++) {
			if (theclass == 'null') {
				validateIt = false;
			}
		
			if (validateIt == true) {
	
				var elNode = frmField.disabled ? null : frmField.nodeName;
				switch (elNode) {
				case 'SELECT':
					valid = checkSelect(frmField);
	
					break;
				case 'TEXTAREA':
					valid = checkTextarea(frmField);
	
					break;
				case 'INPUT':
					valid = checkInput(frmField);
	
					break;
				case 'TABLE':
					valid = checkTable(frmField);
					
					break;
				default:
					valid = true;
				}
				if (valid == false) {
					var label = (frmField.title) ? frmField.title : frmField.name
							.toTitleCase();
					globalMsg.push(label);
				}
			}
			if( !valid ) {
				break;
			}
		}
	}

	if (globalMsg.length > 0) {
		globalMsg.formatAndShow();
		return false;
	} else if (globalMsgRequired.length > 0) {
		globalMsgRequired.formatAndShow2();
		return false;
	} else {
		
		if (document.all||document.getElementById){
			//screen thru every element in the form, and hunt down "submit" and "reset"
			for (i=0;i<form.length;i++){
				var tempobj=form.elements[i]
				if(tempobj.type.toLowerCase()=="submit"||tempobj.type.toLowerCase()=="reset")
				//disable em
				tempobj.disabled=true
			}
		}		
		return true;
	}
}

/*----------------------------------------------------------------------
 Cada tipo de input é validado de uma forma específica
 ----------------------------------------------------------------------*/
function checkInput(field) {
	var elType = field.type;
	var msg;
	switch (elType) {
	case 'radio':
		return checkRadio(field);
		break;
	case 'checkbox':
		return checkCheckbox(field);
		break;
	case 'text':
		return checkTextField(field);
		break;
	case 'file':
		// field.className += ' string';
		return checkTextField(field);
		break;
	case 'password':
		return checkTextField(field);
		break;
	case 'hidden':
		return checkTextField(field);
		break;
	default:
		return true;
		break;
	}
	return true;
}

/*----------------------------------------------------------------------
 Checa se algum item do SELECT foi selecionado
 ----------------------------------------------------------------------*/
function checkSelect(field) {
	if (field.name == 'MyriadProRegular' || field.className.indexOf('MyriadProRegular') >= 0) {
		return true;
	}
    return (field.value != null && field.value != '' && field.value != '-1');
}

/*----------------------------------------------------------------------
 TEXTAREAs  não podem ser vazias
 ----------------------------------------------------------------------*/
function checkTextarea(field) {
	var className = field.className;

	switch (className) {
	case 'alpha':
		return (field.value != null && field.value != '' && trim(field.value).length != 0);
	case 'string':
		//return (field.value != null && field.value != '' && !field.value.match(hazardChars));
		return (field.value != null && field.value != '' && trim(field.value).length != 0);
	default:
		return true;
	}
}

/*----------------------------------------------------------------------
 Radio buttons precisam ser verificados de uma maneira específica,
 pois não são um elemento apenas, e sim vários elementos com o mesmo
 'name'.
 ----------------------------------------------------------------------*/
var radios = [];
function checkRadio(field) {
	var inputs = globalForm.getElementsByTagName('input');
	for ( var i = 0, input; input = inputs[i]; i++) {
		if (input.name == field.name) {
			
			if ( input.className.match('MyriadProRegular') ) {
				return true;
			}
			
			if ( radios[input.name] ) {
				return true;
			}
			
			if ( radios[input.name] == undefined ) {
				radios[input.name] = false;
				return true;
			}
			
			if ( input.checked == true) {
				radios[input.name] = true;
				return true;
			}
			
			/*if (input != field) {
				input.className += ' null';
			}*/
		}
	}
	return false;
}

/*----------------------------------------------------------------------
 O comentário da funçãoo checkRadio() se aplica tambÃ©m aqui.
 ----------------------------------------------------------------------*/
function checkCheckbox(field) {
	var inputs = globalForm.getElementsByTagName('input');
	for ( var i = 0, input; input = inputs[i]; i++) {
		if (input.name == field.name) {

			if (input.checked == true || input.name == 'MyriadProRegular'
					|| input.className == 'MyriadProRegular') {
				return true;
			}
		}
	}
	return false;
}

/*----------------------------------------------------------------------
 Campos de texto serÃ£o validados com base em suas classes,
 que dizem que tipo de valor se espera encontrar.
 ----------------------------------------------------------------------*/
function checkTextField(field) {
	var valid;
	var elClasses = field.className.split(',');
	for ( var i = 0, elClass; elClass = elClasses[i]; i++) {

		switch (elClass) {
			case 'string':
				valid = isString(field.value.replace(/^\s*|\s*$/g, ''));
				break;
			case 'number':
				valid = isNumber(field.value);
				break;
			case 'money':
				valid = isMoney(field.value);
				break;
			case 'name':
				valid = isName(field.value);
				break;
			case 'email':
				valid = isEmail(field.value);
				break;
			case 'url':
				valid = isUrl(field.value);
				break;
			case 'date':
				valid = isValidDate(field.value, false);
				break;
			case 'dia-mes':
				valid = isValidDate(field.value + "/1970", false);
				break;
			case 'notRequiredDate':
				valid = isNonRequiredDate(field.value);
				break;
			case 'niver':
				valid = isValidDate(field.value, true);
				break;
			case 'dia':
				valid = isDia(field.value);
				break;
			case 'mes':
				valid = isMes(field.value);
				break;
			case 'ano':
				valid = isAno(field.value);
				break;
			case 'cpf':
				valid = isCpf(field.value);
				break;
			case 'cnpj':
				valid = isCnpj(field.value);
				break;
			case 'rg':
				valid = isRg(field.value);
				break;
			case 'cep':
				valid = isCep(field.value);
				break;
			case 'password':
				valid = isSenha(field.value, document.getElementById('conf_' + field.id).value);
				break;
			case 'tel':
				valid = isTel(field.value);
				break;
			case 'alpha':
				valid = field.value != '' && trim(field.value).length != 0;
				break;
		}
	}
	if (valid == false) {
		return false;
	}
	return true;
}

/*----------------------------------------------------------------------
 Valida se a tabela contém algum item.
 ----------------------------------------------------------------------*/
function checkTable( frmField ) {
	var elClasses = frmField.className.split(' ');
	
	for ( var i = 0 ; i < elClasses.length ; i++) {
		if( elClasses[i] == "required" ) {
			if( frmField.tBodies.length ) {
				if( !frmField.tBodies[0].rows.length )
					return false;
			}
			else if( !frmField.rows.length )
				return false;
		}
	}

	return true;
}

/*----------------------------------------------------------------------
 Funções de validação
 ----------------------------------------------------------------------*/

function isString(v) {
	return (typeof v == 'string' && v != '' /**&& !v.match(hazardChars)**/);
}

if (!MathKit) {
	var MathKit = {};
}

MathKit.parseDecimalInt = function (s, defaultVal) {
  var result = parseInt(typeof(s) == 'string' ? s.replace(/^\D*0*(.+?)\D*$/, '$1') : s);
  return isNaN(result) && arguments.length > 1 ? defaultVal : result;
};

MathKit.parseDecimalFloat = function (s, defaultVal) {
  var result = parseFloat(typeof(s) == 'string' ? s.replace(/^\D*0*(.+?)\D*$/, '$1') : s);
  return isNaN(result) && arguments.length > 1 ? defaultVal : result;
};

function isInteger(val) {
  return !isNaN(val) && MathKit.parseDecimalInt(val) == MathKit.parseDecimalFloat(val);
}

function isNumber(v) {
	//return (!isNaN(v) && v != '');
	return isInteger(v);
}


function isMoney(v) {
	return (v.match(/^([0-9]{1,3}\.?)+\,[0-9]{2}$/));
}

function isEmail(v) {
	var objRE = /^[\w-\.\']{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,}$/;
	return (v != '' && objRE.test(v));
}

function isUrl(v) {
	return (v
			.match(/^(ht|f)tp\:\/\/[a-zd][a-zd-]{1,64}(\.[a-zd][a-zd-]{2,64})*\.[a-z]{2,4}.+$/));
}

function isDate(date, b) {	
	if (date == null ) {
		return false;
	} else {
		return validaData(date, b);
	}
}

function isValidDate(date, b) {
	if ( date ) {
		return validaData(date, b);
	} else {
		return false;
	}
}

function isNonRequiredDate(date, b) {
	
	if(date == null || date.length== 0 )
	{
		return true;
	}
	else
	{
		return validaData(date, b);
	}

}

function validaData(date, b) {
	arrDdate = date.split('/');
	dia = arrDdate[0];
	mes = arrDdate[1];
	ano = arrDdate[2]
	if ((isNaN(dia) || isNaN(mes) || isNaN(ano))
			|| (ano < 1900 || ano > 2200) || (mes < 1 || mes > 12)
			|| (dia < 1 || dia > 31)
			|| (mes == 2 && dia > 28 && (ano % 4 != 0))
			|| (mes == 2 && dia > 29 && (ano % 4 == 0))
			|| (dia > 30 && (mes == 4 || mes == 6 || mes == 9 || mes == 11))) {
		
		return false;
	} else {
		if (b) {
			data = new Date(ano, mes, dia);
			dateInicio = new Date(1900, 01, 01);
			dateFim = new Date(2200, 01, 01);
			if (data < dateInicio || data > dateFim)
		
				return false;
		}
		
		return true;
	}

}

function isCpf(v) {
	
v = v.replace(".","");
v = v.replace(".","");
v = v.replace("-","");

if (v == "") {
	return false;
}



	var s = null;
	var r = null;
	// Não verifica caso o usuário não digite nenhum caracter.
	if (v.length == 0) {
		return true;
	}
	for ( var i = 0, digit; digit = v[i]; i++) {
		if (isNaN(digit)) {
			v = v.replace(digit, '');
		}
	}
	if (v.length != 11
			|| v
					.match(/1{11}|2{11}|3{11}|4{11}|5{11}|6{11}|7{11}|8{11}|9{11}|0{11}/))
		return false;
	s = 0;
	for ( var i = 0; i < 9; i++)
		s += parseInt(v.charAt(i)) * (10 - i);
	r = 11 - (s % 11);
	if (r == 10 || r == 11)
		r = 0;
	if (r != parseInt(v.charAt(9)))
		return false;
	s = 0;
	for ( var i = 0; i < 10; i++)
		s += parseInt(v.charAt(i)) * (11 - i);
	r = 11 - (s % 11);
	if (r == 10 || r == 11)
		r = 0;
	if (r != parseInt(v.charAt(10)))
		return false;
	return true;
}

function isCnpj(v) {

v = v.replace(".","");
v = v.replace(".","");
v = v.replace("-","");
v = v.replace("/","");


if (v == "") {
	return false;
}

	var dig1 = 0;
	var dig2 = 0;
	var x;
	var Mult1 = '543298765432';
	var Mult2 = '6543298765432';
	// Não verifica caso o usuário não digite nenhum caracter.
	if (v.length == 0) {
		return true;
	}
	for ( var i = 0, digit; digit = v[i]; i++) {
		if (isNaN(digit)) {
			v = v.replace(digit, '');
		}
	}
	for (x = 0; x <= 11; x++) {
		dig1 = dig1
				+ (parseInt(v.slice(x, x + 1)) * parseInt(Mult1.slice(x, x + 1)));
	}
	for (x = 0; x <= 12; x++) {
		dig2 = dig2
				+ (parseInt(v.slice(x, x + 1)) * parseInt(Mult2.slice(x, x + 1)));
	}
	dig1 = (dig1 * 10) % 11;
	dig2 = (dig2 * 10) % 11;
	if (dig1 == 10) {
		dig1 = 0;
	}
	if (dig2 == 10) {
		dig2 = 0;
	}
	if (dig1 != parseInt(v.slice(12, 13))) {
		return false;
	} else {
		if (dig2 != parseInt(v.slice(13, 14))) {
			return false;
		} else {
			return true;
		}
	}
}

function isRg(v) {
	for ( var i = 0, digit; digit = v[i]; i++) {
		if (isNaN(digit)) {
			v = v.replace(digit, '');
		}
	}
	return (v.match(/[0-9xX]{9}/));
}

function isCep(v) {
	for ( var i = 0, digit; digit = v[i]; i++) {
		if (isNaN(digit)) {
			v = v.replace(digit, '');
		}
	}
	if (v.length < 8)
		return false;
	return (v.match(/[0-9]{8}/));
}

function isSenha(v, c) {
	if (v != '') {
		if (v == c) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

function isTel(v) {

	if (v.length < 8) {
		return false;
	} else {
		return true;
	}
	/*for ( var i = 0, digit; digit = v[i]; i++) {
		if (isNaN(digit)) {
			v = v.replace(digit, '');
		}
	}
	if (v.length < 8) {
		return (v.match(/\d{7,11}/));
	} else {
		return false
	}*/
}

function isDDD(v) {

	if (v.length < 2) {
		return false;
	} else {
		return true;
	}
	
	/*for ( var i = 0, digit; digit = v[i]; i++) {
		if (isNaN(digit)) {
			v = v.replace(digit, '');
		}
	}
	if (v.length < 3) {
		return (v.match(/\d{7,11}/));
	} else {
		return false
	}*/
}

function isDia(v) {
	return isNumber(v) && v > 0 && v <= 31;
}
function isMes(v) {
	return isNumber(v) && v > 0 && v <= 12;
}

function isAno(v) {
	return isNumber(v) && v > 1900 && v <= 2100;
}

Array.prototype.formatAndShow = function() {
	var msg = "O(s) campo(s):\n\n";
	for ( var i = 0; i < this.length; i++) {
		msg += ' * ' + this[i] + "\n";
	}
	msg += "\nApresentaram problema de validação. Verifique a obrigatoriedade e fomatação dos mesmos.";
	alert(msg);
	globalMsg = Array();
}

String.prototype.toTitleCase = function() {
	// lowercase the whole string
	var ls = this.toLowerCase();
	// turn it into an array by splitting at spaces
	var la = ls.split(" ");
	var firstLetter;
	// loop through word array
	for ( var i = 0; i < la.length; i++) {
		// uppercase the first letter
		firstLetter = la[i].charAt(0).toUpperCase();
		// replace first letter with uppercase version
		la[i] = la[i].replace(la[i].charAt(0), firstLetter);
	}
	// rejoin words and return the new string
	return la.join(" ");
}

function isStatus(v) {

	if (v != '') {
		if (v.toLowerCase() != 'ativo' && v.toLowerCase() != 'inativo') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isStatusEmpresa(v) {
	if (v != '') {
		if (v.toLowerCase() != 'vigente' && v.toLowerCase() != 'suspensa') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isStatusContrato(v) {
	if (v != '') {
		if (v.toLowerCase() != 'vigente' && v.toLowerCase() != 'suspensa') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isStatusTermo(v) {
	if (v != '') {
		if (v.toLowerCase() != 'pendente' && v.toLowerCase() != 'cancelado' && v.toLowerCase() != 'concluído') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isStatusNotaFiscal(v) {
	if (v != '') {
		if (v.toLowerCase() != 'pendente' && v.toLowerCase() != 'cancelado' && v.toLowerCase() != 'concluído') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isStatusACE(v) {

	if (v != '') {
		if (v.toLowerCase() != 'ativo' && v.toLowerCase() != 'encerrado' && v.toLowerCase() != 'cancelado') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}


function isClassificacaoIndice( v ) {
	var valor = v.trim().toLowerCase();
	if ( valor ) {
		if ( valor != 'moeda estrangeira' && valor != 'moeda nacional' && !jscl.use('org.ecc.string.DiacriticKit').equalsIgnoreDiacritics( valor, 'indice' ) ) {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isTipoPessoa(v) {
	if (v != '') {
		if (v.toLowerCase() != 'fisica' && v.toLowerCase() != 'juridica'
				&& v.toLowerCase() != 'física' && v.toLowerCase() != 'jurídica') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isTipoDocumento(v) {
	if (v != '') {
		if (v.toLowerCase() != 'andamento' && v.toLowerCase() != 'imagem') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isTipoEmpresa(v) {
	if (v != '') {
		if (v.toLowerCase() != 'empresa estrangeira'
				&& v.toLowerCase() != 'não pertence ao grupo bradesco'
				&& v.toLowerCase() != 'do grupo bradesco'
				&& v.toLowerCase() != 'nao pertence ao grupo bradesco') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isTipoAndamento(v) {
	if (v != '') {
		if (v.toLowerCase() != 'processual'
				&& v.toLowerCase() != 'administrativo') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isTipoDejur(v) {
	if (v != '') {
		if (v.toLowerCase() != 'entrada' && v.toLowerCase() != 'saida'
				&& v.toLowerCase() != 'saída') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isTipoAdv(v) {
	if (v != '') {
		if (v.toLowerCase() != 'matriz' && v.toLowerCase() != 'sucursal'
				&& v.toLowerCase() != 'conveniado' && v.toLowerCase() != 'prestador de serviço') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isTipoSucursalSQL(v)
{
	if (v != '') {
		if (v.toLowerCase() != 'sucursal' && v.toLowerCase() != 'filial' && v.toLowerCase() != 'dependencia' && v.toLowerCase() != 'dependência'  && v.toLowerCase() != 'd'  && v.toLowerCase() != 's'  && v.toLowerCase() != 'f') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isSimNao(v) {
	if (v != '') {
		if (v.toLowerCase() != 'sim' && v.toLowerCase() != 'nao') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isRegraFF(v) {
	if (v != '') {
		if (v.toLowerCase() != 'avisar' && v.toLowerCase() != 'bloquear') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isCredDeb(v) {
	if (v != '') {
		if ((v.toLowerCase() != 'crédito' && v.toLowerCase() != 'credito')
				&& (v.toLowerCase() != 'débito' && v.toLowerCase() != 'debito')) {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function isOrigemContrato(v) {
	if (v != '') {
		if (v.toLowerCase() != 'externo' && v.toLowerCase() != 'interno') {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}
	
	function isDestino(v) {
		if (v != '') {
			if (v.toLowerCase() != 'externo' && v.toLowerCase() != 'interno') {
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}


//

function normalizeValidationAttributes(frm) {
  var el, className;
  for (var i = frm.elements.length - 1; i >= 0; i--) {
    el = frm.elemen[i];
    className = el.className.toLowerCase();
    if (className.indexOf('MyriadProRegular') == -1) el.setAttribute('required', true);
    // TODO
  }
}