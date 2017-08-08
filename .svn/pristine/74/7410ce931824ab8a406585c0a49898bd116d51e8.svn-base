/*
 * @(#)ErsException.java
 * Description:	Ers
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2012 Newage Microsystems, Inc. All rights reserved.
 * Create by:	fuchaohui  2012-6-26
 */
package com.cauc.contract;

import java.io.PrintStream;
import java.io.PrintWriter;

/**
 * <p>Base ERS exception class</p>
 * 
 * @author fuchaohui 6/26/2012 15
 */
public abstract class FinanceException extends Exception {

	private static final long serialVersionUID = -1494336109258947216L;

	private Throwable mRootCause = null;
	
    /**
     * Construct emtpy exception object.
     */	
	public FinanceException(){
		super();   
	}
	/**
	 * Construct BillException with message string.
	 * @param s Error message string. 
	 */
	public FinanceException(String s){
		super(s);
	}
	/**
	 * Construct BillException, wrapping existing throwable
	 * @param s Error message string.
	 * @param t Existing connection to wrap.
	 */
	public FinanceException(String s,Throwable t){
		super(s,t);
	}	
	/**
	 * Construct BillException, wrapping existing throwable.
	 * @param t Existing connection to wrap.
	 */
	public FinanceException(Throwable t){
		super(t);
	}	
    /**
     * Get root cause object, or null if none.
     * @return Root cause or null if none.
     */
    public Throwable getRootCause() {
        return mRootCause;
    }	
    /**
     * Get root cause message.
     * @return Root cause message.
     */
    public String getRootCauseMessage() {
        String rcmessage = null;
        if (getRootCause()!=null) {
            if (getRootCause().getCause()!=null) {
                rcmessage = getRootCause().getCause().getMessage();
            }
            rcmessage = (rcmessage == null) ? getRootCause().getMessage() : rcmessage;
            rcmessage = (rcmessage == null) ? super.getMessage() : rcmessage;
            rcmessage = (rcmessage == null) ? "NONE" : rcmessage;
        }
        return rcmessage;
    }    
    /**
     * Print stack trace for exception and for root cause exception if htere is one.
     * @see java.lang.Throwable#printStackTrace()
     */
    public void printStackTrace() {
        super.printStackTrace();
        if (mRootCause != null) {
            System.out.println("--- ROOT CAUSE ---");
            mRootCause.printStackTrace();
        }
    }  
    /**
     * Print stack trace for exception and for root cause exception if htere is one.
     * @param s Stream to print to.
     */
    public void printStackTrace(PrintStream s) {
        super.printStackTrace(s);
        if (mRootCause != null) {
            s.println("--- ROOT CAUSE ---");
            mRootCause.printStackTrace(s);
        }
    }
    
    
    /**
     * Print stack trace for exception and for root cause exception if htere is one.
     * @param s Writer to write to.
     */
    public void printStackTrace(PrintWriter s) {
        super.printStackTrace(s);
        if (null != mRootCause) {
            s.println("--- ROOT CAUSE ---");
            mRootCause.printStackTrace(s);
        }
    } 	
}
