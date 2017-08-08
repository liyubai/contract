package com.cauc.contract.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class OperateXmlDocument {
	public void createXml(String fileName, String iid, String vsortname,
			String iparentid,String isOpen) {
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		Document document = DocumentHelper.createDocument();
		Element sort = document.addElement("tree");
		sort.addAttribute("id","0");
		
//		Element id = sort.addElement("item");
//		id.addAttribute("id",iid);
//		id.addAttribute("text",vsortname);
//		id.addAttribute("open",isOpen);

		try {
			XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(fileName),
					format);
			xmlWriter.write(document);
			xmlWriter.close();
			System.out.println("创建成功");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void addXml(String fileName, String iid, String vsortname,
			String iparentid) {
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		File inputXml = new File(fileName);
		SAXReader saxReader = new SAXReader();
		Document document = null;
		try {
			document = saxReader.read(inputXml);
		} catch (DocumentException e1) {
			e1.printStackTrace();
		}
		
		Element tree = document.getRootElement();
		getElementList(tree,iid,vsortname,iparentid);
		try {
			XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(fileName),
					format);
			xmlWriter.write(document);
			xmlWriter.close();
			//System.out.println("增加成功");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}	
	
	public void editXml(String fileName, String iid, String vsortname)
	{
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		File inputXml = new File(fileName);
		SAXReader saxReader = new SAXReader();
		Document document = null;
		try {
			document = saxReader.read(inputXml);
		} catch (DocumentException e1) {
			e1.printStackTrace();
		}
		Element tree = document.getRootElement();
		updateElementList(tree,iid,vsortname);
		
		try
		{
			XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(fileName),
					format);
			xmlWriter.write(document);
			xmlWriter.close();
			//System.out.println("修改成功");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void delXml(String fileName, String iid) {
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		File inputXml = new File(fileName);
		SAXReader saxReader = new SAXReader();
		Document document = null;
		try {
			document = saxReader.read(inputXml);
		} catch (DocumentException e1) {
			e1.printStackTrace();
		}
		Element tree = document.getRootElement();
		
		delElementList(tree,iid);

		try
		{
			XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(fileName),
					format);
			xmlWriter.write(document);
			xmlWriter.close();
			//System.out.println("删除成功");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	private void delElementList(Element element,String iid){
		List elements = element.elements();
		if(elements.size()>0){
			for(Iterator it = elements.iterator(); it.hasNext();){
				
				Element elem = (Element) it.next();
				if (elem.attributeValue("id").equals(iid)) 
	            {
					it.remove();
					break;
	            }
				delElementList(elem,iid);
			}
		}
	}
	
	private void updateElementList(Element element,String iid,String vsortname){
		List elements = element.elements();
		if(elements.size()>0){
			for(Iterator it = elements.iterator(); it.hasNext();){
				
				Element elem = (Element) it.next();
				if (elem.attributeValue("id").equals(iid)) 
	            {
					Attribute attribute = elem.attribute("text");
					attribute.setValue(vsortname);

					break;
	            }
				updateElementList(elem,iid,vsortname);
			}
		}
	}
	
	private void getElementList(Element element,String iid,String vsortname,String iparentid){
		List elements = element.elements();
		if(elements.size()>0){
			for(Iterator it = elements.iterator(); it.hasNext();){
				Element elem = (Element) it.next();
				if (elem.attributeValue("id").equals(iparentid)) 
	            {
					Element id = elem.addElement("item");
					id.addAttribute("id",iid);
					id.addAttribute("text",vsortname);
					if(iparentid.equals("1")){
						id.addAttribute("open","1");
					}
					break;
	            }
				getElementList(elem,iid,vsortname,iparentid);
			}
		}
	}
	
	public  static void main(String[] args){
		OperateXmlDocument od = new OperateXmlDocument();
		String fileName = "D:/Workspaces/Finance/WebRoot/" + "xmlfile/project.xml";
		File file = new File(fileName);
		od.createXml(fileName, "1", "费用列表","0","1");
		if(!file.exists()){
			//od.createXml(fileName, "1", "费用列表","0","1");
			od.createXml(fileName, "1", "费用列表","0","1");
		}
		//od.addXml(fileName,"6", "设计费","3");
		//od.addXml(fileName,"8", "222设计费","3");
		//od.editXml(fileName, "8", "专家评审费");
		od.delXml(fileName, "8");
	}
	
	
	
}