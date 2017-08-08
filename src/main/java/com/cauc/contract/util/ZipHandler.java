/*
 * @(#)ZipHandler.java
 */
package com.cauc.contract.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.zip.ZipEntry;

/**
 * 压缩、解压帮助类
 * 
 * @author fuchaohui
 *
 */
public class ZipHandler {

	/**
	 * 压缩目录
	 * 
	 * @param srcPathName 需要压缩的目录 如：d:\\docfiles\\today
	 * @param zipFileDirectory 压缩文件存放目录 如：d:\\docfiles\\allStub.zip
	 */
	public static void compress(String srcPathName, String zipFileDirectory) {
		File zipFile = new File(zipFileDirectory);
		File srcdir = new File(srcPathName);
		if (!srcdir.exists())
			throw new RuntimeException(srcPathName + "not exist！");

		Project prj = new Project();
		Zip zip = new Zip();
		zip.setProject(prj);
		zip.setDestFile(zipFile);
		FileSet fileSet = new FileSet();
		fileSet.setProject(prj);
		fileSet.setDir(srcdir);
		//fileSet.setIncludes("**/*.java"); 包括哪些文件或文件夹 eg:zip.setIncludes("*.java");   
		//fileSet.setExcludes(...); 排除哪些文件或文件夹   
		zip.addFileset(fileSet);
		zip.execute();
	}
	/**  
	 * 解压静态方法  
	 * 
	 * @param zipFileName  需要解压的Zip文件 如：d:\\docfiles\\allStub.zip
	 * @param outputDirectory  解压释放目录 如：d:\\allStub
	 * @throws Exception  
	 */
	public static void extract(String zipFileName, String outputDirectory)
			throws Exception {
		try {
			org.apache.tools.zip.ZipFile zipFile = new org.apache.tools.zip.ZipFile(
					zipFileName);
			java.util.Enumeration e = zipFile.getEntries();
			org.apache.tools.zip.ZipEntry zipEntry = null;
			while (e.hasMoreElements()) {
				zipEntry = (ZipEntry) e.nextElement();
				//System.out.println("unziping "+zipEntry.getName());   
				if (zipEntry.isDirectory()) {
					String name = zipEntry.getName();
					name = name.substring(0, name.length() - 1);
					mkDirs(outputDirectory + File.separator + name);
					//System.out.println("创建目录："+outputDirectory+File.separator+name);   
				} else {
					String name = zipEntry.getName();
					String dir = name.substring(0, name.lastIndexOf("/"));
					mkDirs(outputDirectory + File.separator + dir);
					//System.out.println("创建文件："+outputDirectory+File.separator+name);                     
					File f = new File(outputDirectory + File.separator
							+ zipEntry.getName());
					f.createNewFile();
					InputStream in = zipFile.getInputStream(zipEntry);
					FileOutputStream out = new FileOutputStream(f);
					int c;
					byte[] by = new byte[1024];
					while ((c = in.read(by)) != -1) {
						out.write(by, 0, c);
					}
					out.close();
					in.close();
				}
			}
		} catch (Exception ex) {
			System.out.println("解压文件异常" + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**  
	 * 创建目录，包括子目录  
	 * @param dir  
	 * @throws Exception  
	 */
	private static void mkDirs(String dir) throws Exception {
		if (dir == null || dir.equals(""))
			return;
		File f1 = new File(dir);
		if (!f1.exists())
			f1.mkdirs();
	}
}
