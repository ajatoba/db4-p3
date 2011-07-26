package br.com.db4.buskaza.controller.plugin;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class NumberFormatterEditTag implements Tag, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PageContext pc = null;
	private Tag parent = null;
	private Double value = null;
	private String name = null;
	private String size = null;
	private String style = null;

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
			pc.getOut().write("<input type=\"text\" name=\"" + name + "\" ");

			if (size != null) {
				pc.getOut().write("size=\"" + size + "\" ");
			}

			if (style != null) {
				pc.getOut().write("style=\"" + style + "\" ");
			}

			pc.getOut().write("value=\"" + DoubleConverterBR.getInstance().format(value) + "\" >");

		} catch (IOException e) {
			throw new JspTagException("Erro na Tag Edit NumberFormatter ");
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
		name = null;
		size = null;
		style = null;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

}