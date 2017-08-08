package com.cauc.contract.ui.core;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.util.Utilities;

import bjca.org.apache.log4j.Logger;

public class ProcessUpload extends BaseActionSupport {


    private List<File> file;

    List<String> fileFileName;

    private List<String> fileContentType;

    private List<String> dataUrl;
    
    private String serialHide;
    
    private String picId;
    
    public String getPicId() {
		return picId;
	}




	public void setPicId(String picId) {
		this.picId = picId;
	}




	public String getSerialHide() {
		return serialHide;
	}




	public void setSerialHide(String serialHide) {
		this.serialHide = serialHide;
	}




	public List<String> getDataUrl() {
        return dataUrl;
    }




    public void setDataUrl(List<String> dataUrl) {
        this.dataUrl = dataUrl;
    }




    public List<File> getFile() {
        return file;
    }

    public void setFile(List<File> file) {
        this.file = file;
    }

    public List<String> getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(List<String> fileFileName) {
        this.fileFileName = fileFileName;
    }

    public List<String> getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(List<String> fileContentType) {
        this.fileContentType = fileContentType;
    }
    
    
    
    public String ProcessUpload() throws Exception {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	HttpServletResponse response = ServletActionContext.getResponse();
    	
    	Log log= LogFactory.getLog(Utilities.class);    	
    	String path = ServletActionContext.getServletContext().getRealPath("\\contract\\themes\\cupertino\\images");
    	
    	//System.out.println(path);
    	response.setContentType("application/json;charset=UTF-8");
         PrintWriter out = response.getWriter();
        dataUrl = new ArrayList<String>();
        // ??????·??
        String imgpath = "upload/";
        for (int i = 0; i < file.size(); ++i) {
            InputStream is = new FileInputStream(file.get(i));                              
            dataUrl.add(imgpath+this.getFileFileName().get(i));
           // Date date = new Date(System.currentTimeMillis());
            //测试用address  发布用path
              String address="D:\\JProject\\contract\\WebRoot\\contract\\themes\\cupertino\\images";       
            File destFile = new File(address, picId);
            OutputStream os = new FileOutputStream(destFile);
            byte[] buffer = new byte[400];
            int length = 0;
            while ((length = is.read(buffer)) > 0) {
                os.write(buffer, 0, length);
            }
            os.close();
            os.flush();
            is.close();  
        }
        return imgpath;
    }

    
    
    
  
}