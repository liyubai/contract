/*
 * @(#)ErsException.java
 * Description:	Ers
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2009 Newage Microsystems, Inc. All rights reserved.
 * Create by:	zhaochunhui  2009-12-30
 */
package com.cauc.contract.util;

import java.io.Serializable;

/**
 * 存放ID value 的对象
 * @author zhaochunhui 9/17/2009 20:53
 *
 */
public class LabelValueBean implements Comparable, Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2546514603484778695L;

	/**
     * The property which supplies the option label visible to the end user.
     */
    private String label = null;

    /**
     * The property which supplies the value returned to the server.
     */
    private String value = null;

    // ----------------------------------------------------------- Constructors

    /**
     * Default constructor.
     */
    public LabelValueBean() {
        super();
    }

    /**
     * Construct an instance with the supplied property values.
     *
     * @param label The label to be displayed to the user.
     * @param value The value to be returned to the server.
     */
    public LabelValueBean(String label, String value) {
        this.label = label;
        this.value = value;
    }

    public String getLabel() {
        return this.label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Compare LabelValueBeans based on the label, because that's the human
     * viewable part of the object.
     *
     * @see Comparable
     */
    public int compareTo(Object o) {
        // Implicitly tests for the correct type, throwing
        // ClassCastException as required by interface
        String otherLabel = ((LabelValueBean) o).getLabel();

        return this.getLabel().compareTo(otherLabel);
    }

    /**
     * Return a string representation of this object.
     */
    public String toString() {
        StringBuffer sb = new StringBuffer("LabelValueBean[");

        sb.append(this.label);
        sb.append(", ");
        sb.append(this.value);
        sb.append("]");

        return (sb.toString());
    }

    /**
     * LabelValueBeans are equal if their values are both null or equal.
     *
     * @see Object#equals(Object)
     */
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }

        if (!(obj instanceof LabelValueBean)) {
            return false;
        }

        LabelValueBean bean = (LabelValueBean) obj;
        int nil = (this.getValue() == null) ? 1 : 0;

        nil += ((bean.getValue() == null) ? 1 : 0);

        if (nil == 2) {
            return true;
        } else if (nil == 1) {
            return false;
        } else {
            return this.getValue().equals(bean.getValue());
        }
    }

    /**
     * The hash code is based on the object's value.
     *
     * @see Object#hashCode()
     */
    public int hashCode() {
        return (this.getValue() == null) ? 17 : this.getValue().hashCode();
    }

}
