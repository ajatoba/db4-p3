package br.com.db4.buskaza.controller.exception;

/**
 * Classe respons�vel por receber exce��es globais.
 */
public class ValidacaoFormException extends Exception {

	public ValidacaoFormException() {
		super();
	}

	public ValidacaoFormException(String message) {

		super(message);
	}
}
