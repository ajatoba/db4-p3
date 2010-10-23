package br.com.db4.buskaza.controller.exception;

/**
 * Classe responsável por receber exceções globais.
 */
public class ValidacaoFormException extends Exception {

	public ValidacaoFormException() {
		super();
	}

	public ValidacaoFormException(String message) {

		super(message);
	}
}
