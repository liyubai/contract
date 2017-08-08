package com.cauc.contract.ui.core;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;



import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IStudentManagementService;
import com.cauc.contract.pojos.Student;
import com.cauc.contract.ui.common.BaseActionSupport;


public class UploadExcelAction extends BaseActionSupport{
	
	private static final long serialVersionUID = 6188242964891024165L;
    private List<File> upload; //上传的文件
    private List<String> uploadFileName; //文件名称
    private List<String> uploadContentType; //文件类型
    private List<Student> stuList = new ArrayList<Student>();
    private IStudentManagementService service; 
    private HttpServletRequest request = ServletActionContext.getRequest();
    private boolean errorflag;
    private List<String> errorList = new ArrayList<String>();
    
	/**
	 * 上传Excel文件
	 *
	 * @return
	 * @throws
	 */
    public String readExcel() throws Exception {   
      System.out.println(this.getUploadFileName());
      if (upload != null) {
        for (int i = 0; i < upload.size(); i++) {   
          //循环上传每个文件   
          this.uploadExcel(i);  
        }   
        return "success";   
      } else {
    	errorList.add("上传文件失败，请重新上传");
    	request.setAttribute("errorList", errorList);
    	return "error";  
      }
    }
    
	/**
	 * 创建上传Excel路径
	 *
	 * @return
	 * @throws
	 */
    public void uploadExcel(int i) throws FinanceServiceException, Exception {
      String realpath = ServletActionContext.getServletContext().getRealPath("/del/"+this.uploadFileName);
      System.out.println("realpath: "+realpath);
      try {
	    FileInputStream fis = new FileInputStream(this.getUpload().get(i));
		File fileLocation = new File(realpath);  
        //此处也可以在应用根目录手动建立目标上传目录  
        if (!fileLocation.exists()){  
          boolean isCreated  = fileLocation.mkdir();  
          if (!isCreated) {  
            //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。
        	System.out.println("目标上传目录创建失败");
          }  
        }  
        String fileName = uploadFileName.get(i);  
        File uploadFile = new File(realpath, fileName);   
        FileOutputStream  out = new FileOutputStream(uploadFile);   
        byte[] buffer = new byte[1024 * 1024];   
        int length;   
        while ((length = fis.read(buffer)) > 0) {   
          out.write(buffer, 0, length);   
        }   
        fis.close();   
        out.close(); 
        
      } catch (FileNotFoundException ex) {   
        System.out.println("上传失败!");  
        ex.printStackTrace();   
      } catch (IOException ex) {   
        System.out.println("上传失败!");  
        ex.printStackTrace();   
      } 
    }
	
	/**
	 * 读取Excel数据
	 *
	 * @return
	 * @throws
	 */
    public String readAllExcel() throws Exception,FinanceServiceException {

  	  String studentName = null;
  	  String idCard = null; 
  	  String no = null;
  	  Integer grade = 0;
  	  String company = null;
      Workbook workbook =null;
      int k = 0;
      int flag = 0;
      
      if (upload !=null) {
    	errorflag = true;
        String path =upload.get(0).getAbsolutePath();
        InputStream is = new FileInputStream(path);
      	try {
          workbook = new XSSFWorkbook(is);//获取文件路径
      	  for (int numSheets = 0;numSheets < workbook.getNumberOfSheets();numSheets++) {//读取每一个sheet
      		System.out.println("进入读取sheet的循环");
      		if (workbook.getSheetAt(numSheets) != null) {
      		  XSSFSheet aSheet = (XSSFSheet)workbook.getSheetAt(numSheets);
      		  for (int rowNumOfSheet = 0;rowNumOfSheet <= aSheet.getLastRowNum();rowNumOfSheet++) {//获得一行
      			if (aSheet.getRow(rowNumOfSheet) != null) {
      			  XSSFRow aRow = aSheet.getRow(rowNumOfSheet);
      			  for (int cellNumOfRow = 0;cellNumOfRow <= aRow.getLastCellNum()-1;cellNumOfRow++) {//读取rowNumOfSheet值所对应行的数据
      				XSSFCell aCell = aRow.getCell(cellNumOfRow);//获取列值
      				if (aCell == null || aCell.equals("") || aCell.getCellType() == XSSFCell.CELL_TYPE_BLANK) {
      				  if (cellNumOfRow == 0) {
          				errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的姓名为空，不符合约定格式".toString()); 					  
      					errorflag = false;  
      				  } else if (cellNumOfRow == 1) {
            			errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的身份证为空，不符合约定格式".toString()); 					  
          				errorflag = false;    
      				  } else if (cellNumOfRow == 2) {
              			errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的学号为空，不符合约定格式".toString()); 					  
            			errorflag = false;   
      				  } else if (cellNumOfRow == 3) {
                		errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的公司为空，不符合约定格式".toString()); 					  
                		errorflag = false;  
      				  } else if (cellNumOfRow == 4) {
                  		errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的年级为空，不符合约定格式".toString()); 					  
                  		errorflag = false;        					  
      				  } else {
      					errorList.add("提示：表格式不正确，请查看核对是否符合约定要求".toString()); 					  
                  		errorflag = false;  
      				  }
      				}
      				if (aCell != null) {
      				  if (rowNumOfSheet == 0) {//如果rowNumOfSheet的值为0，则读取表头，判断excel的格式和预定格式是否相符
      					if (aCell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
      					  System.out.println("单元格是数字，值是：" + aCell.getNumericCellValue());	
      					} else if (aCell.getCellType() == XSSFCell.CELL_TYPE_STRING) {
      					  System.out.println("单元格是字符串，值是：" + aCell.getStringCellValue());
      					  if (cellNumOfRow == 0) {
      						if (aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim().equals("姓名")) {
      						  flag++;
      						  System.out.println("==========flag:" + flag);
      						} else {
      						  errorList.add("提示：第一行的姓名不符合约定格式");
      						  errorflag = false;
      						}
      					  } else if (cellNumOfRow == 1) {
      						if (aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim().equals("身份证")) {
      						  flag++;
      						  System.out.println("=========flag:" + flag); 
      						} else {
      						  errorList.add("提示：第一行的身份证不符合约定格式");
      						  errorflag = false;
      						}
      					  } else if (cellNumOfRow == 2) {
      						if (aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim().equals("学号")) {
      						  flag++;
      						  System.out.println("=========flag:" + flag);
      						} else {
      						  errorList.add("提示：第一行的学号不符合约定格式"); 
      					      errorflag = false;
      						}
      					  } else if (cellNumOfRow == 3) {
      	   					if (aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim().equals("公司")) {
      	    				  flag++;
      	    				  System.out.println("=========flag:" + flag);
      	    			    } else {
      	    			      errorList.add("提示：第一行的公司不符合约定格式"); 
      	    			      errorflag = false;
      	    				}  
      					  } else if (cellNumOfRow == 4) {
      						if (aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim().equals("年级")) {
      	    	    		  flag++;
      	    	    		  System.out.println("=========flag:" + flag);
      	    	    	    } else {
      	    	    	      errorList.add("提示：第一行的年级不符合约定格式");
      	    	    	      errorflag = false;
      	    	    		}   
      					  } else {
      						errorList.add("提示：第一行的格式不正确，请查看核对是否符合约定要求"); 
      						errorflag = false;
      					  }
      					}
      				  } else {
      					if (aCell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
      					  System.out.println("单元格是数字，值是：" + aCell.getNumericCellValue());
      					  if (cellNumOfRow == 0) {
      					    studentName = String.valueOf(aCell.getNumericCellValue()).substring(0,String.valueOf(aCell.getNumericCellValue()).length()-2);
                          }	else if (cellNumOfRow == 1) {			
      						if (String.valueOf(aCell.getNumericCellValue()).length() == 15 || String.valueOf(aCell.getNumericCellValue()).length() == 18) {
      						  idCard = String.valueOf(aCell.getNumericCellValue()).substring(0,String.valueOf(aCell.getNumericCellValue()).length()-2);
      						} else {
      						  errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的第"+(cellNumOfRow+1)+"列的身份证格式不合法，不符合约定格式".toString());
      						  errorflag = false;
      						}
      					  } else if (cellNumOfRow == 2) {
      					    if (String.valueOf(aCell.getNumericCellValue()).length() == 9) {
      						  no = String.valueOf(aCell.getNumericCellValue()).substring(0,String.valueOf(aCell.getNumericCellValue()).length()-2);
      						} else {
      						  errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的第"+(cellNumOfRow+1)+"列的学号格式不合法，不符合约定格式".toString());	
      						  errorflag = false;
      						}
      					  } else if (cellNumOfRow == 3) {
        				    company = String.valueOf(aCell.getNumericCellValue()).substring(0,String.valueOf(aCell.getNumericCellValue()).length()-2);
      					  } else if (cellNumOfRow == 4) {
        				    grade = Integer.valueOf(String.valueOf(aCell.getNumericCellValue()).substring(0, String.valueOf(aCell.getNumericCellValue()).length()-2));
      					  }   
      					} else if (aCell.getCellType() == XSSFCell.CELL_TYPE_STRING) {
      				      System.out.println("单元格是字符串，值是" + aCell.getStringCellValue());
      				      if (cellNumOfRow == 0) {
    						studentName = String.valueOf(aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim());
    					  } else if (cellNumOfRow == 1) {
    						if (aCell.getStringCellValue().length() == 15 || aCell.getStringCellValue().length() == 18) {
    						  idCard = String.valueOf(aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim());	
    						} else {
    						  errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的身份证格式不合法，不符合约定格式".toString());
    						  errorflag = false;
    						}   						
    					  } else if (cellNumOfRow == 2) {
      						if (aCell.getStringCellValue().length() == 9) {
      						  no = String.valueOf(aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim());	
      						} else {
      						  errorList.add("提示：在Sheet"+(numSheets+1)+"中的第"+(rowNumOfSheet+1)+"行的学号格式不合法，不符合约定格式".toString());
      						  errorflag = false;
      						} 
    					  } else if (cellNumOfRow == 3) {
    						company = String.valueOf(aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim());
    					  } else if (cellNumOfRow == 4) {
      					    grade = Integer.valueOf(aCell.getStringCellValue().replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim());
    					  }                        
      					} else {
      					  studentName = null;
      					}
      				  }
      				}
      			  }
      			  if (flag != 7) {
      			    System.out.println("请核对后重试");	
      			  }
      			}
      			if (studentName != null && idCard != null && no != null 
      				  && grade != 0 && company != null) {
      			  service = getFactory().getFinanceProviderInstance().getStudentManagementService();
      			  Student stu = new Student();	
      			  stu.setStudentName(studentName);
          		  stu.setIdCard(idCard); 
      		      stu.setNo(no);
      			  stu.setCompany(company);
      			  stu.setGrade(grade); 
         		  stuList.add(stu);
         		  service.saveExcelStudent(stuList);
         		  k++;
      			}
      		  }
      		  if (k != 0) {
      			System.out.println("提示：您导入的数据已存在于数据库，请核对！条数 为：" + k);  
      		  } else {
      			System.out.println("提示：成功导入了"+k+"条数据");   
      		  }
      		} 
      	  }  
  		} catch (FinanceServiceException e) {
  		  throw new FinanceServiceException("新增合同失败。"); 
  		} finally {
		  try { 
		    if (is!=null) {
			  is.close(); 
		    }
		  } catch (Exception e1) { 
		    e1.printStackTrace(); 
	      } 
        }	
	  }
      request.setAttribute("errorList", errorList);
      if (errorflag) {
    	return "success";  
      } else {
        return "error"; 
      } 
    }
    
	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public List<Student> getStuList() {
		return stuList;
	}

	public void setStuList(List<Student> stuList) {
		this.stuList = stuList;
	}
	
}