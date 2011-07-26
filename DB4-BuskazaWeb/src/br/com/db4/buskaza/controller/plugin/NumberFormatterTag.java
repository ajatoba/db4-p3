package br.com.db4.buskaza.controller.plugin;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class NumberFormatterTag implements Tag, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private PageContext pc = null;
	private Tag parent = null;
	private Double value = null;

	public void setPageContext(PageContext p) {
		pc = p;
	}

	public void setParent(Tag t) {
		parent = t;
	}

	public Tag getParent() {
		return parent;
	}


	public int doStartTag() throws JspException {
		try {
			pc.getOut().write(DoubleConverterBR.getInstance().format(value));
		} catch(IOException e) {
			throw new JspTagException("Erro na Tag NumberFormatter ");
		}
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	public void release() {
		pc = null;
		parent = null;
		value = null;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	
}