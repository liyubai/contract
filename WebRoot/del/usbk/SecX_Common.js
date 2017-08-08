/////const //////////////////////////
//��������㷨��ʶ
var SGD_SM1_ECB   = 0x00000101;  // SM1�㷨ECB����ģʽ
var SGD_SM1_CBC   = 0x00000102;  // SM1�㷨CBC����ģʽ
var SGD_SSF33_ECB = 0x00000201;  // SSF33�㷨ECB����ģʽ
var SGD_SSF33_CBC = 0x00000202;  // SSF33�㷨CBC����ģʽ
var SGD_SMS4_ECB  = 0x00000401;  // SMS4�㷨ECB����ģʽ
var SGD_SMS4_CBC  = 0x00000402;  // SMS4�㷨CBC����ģʽ
var SGD_3DES_ECB  = 0x00002001;  // 3DES�㷨ECB����ģʽ  
var SGD_3DES_CBC  = 0x00002002;  // 3DES�㷨CBC����ģʽ

//ǩ���㷨��ʶ
var SGD_SM3_RSA    = 0x00010001;  // ����SM3�㷨��RSA�㷨��ǩ��
var SGD_SHA1_RSA   = 0x00010002;  // ����SHA_1�㷨��RSA�㷨��ǩ��
var SGD_SHA256_RSA = 0x00010004;  // ����SHA_256�㷨��RSA�㷨��ǩ��
var SGD_SM3_SM2    = 0x00020101;  // ����SM2�㷨��SM3�㷨��ǩ��

//�����Ӵ��㷨��ʶ
var SGD_SM3	   = 0x00000001;  // SM3�Ӵ��㷨
var SGD_SHA1   = 0x00000002;  // SHA_1�Ӵ��㷨
var SGD_SHA256 = 0x00000004;  // SHA_256�Ӵ��㷨

//������Կ��ʱ����Կ��ʶ
var KEY_TYPE_RSA1024 = 1;  // RSA1024λ
var KEY_TYPE_RSA2048 = 2;  // RSA2048λ
var KEY_TYPE_SM2_256 = 3;  // SM2 256λ

//��ȡ�豸��Ϣ
var DEVICE_TYPE_LABEL     = 1;    // �豸��ǩ
var DEVICE_TYPE_FREESPACE = 2;    // ʣ��ռ�
var DEVICE_TYPE_SERIALNUM = 3;    // Ӳ���豸���к�
var DEVICE_TYPE_TYPE      = 4;    //Ӳ������ ���� RSA �� SM2
var DEVICE_TYPE_KEY_TYPE  = 115;  //SM2�豸����20 RSA�豸����10
var DEVICE_TYPE_VID_PID   = 116;  //�豸��VID PID

//��ȡ��֤����Ϣ����
var CERT_VERSION     = 1;  // ֤��汾 ����V1 V2 V3
var CERT_SERIAL      = 2;  // ֤�����к�
var CERT_SIGN_METHOD = 3;  // ��ȡ֤������ ���� rsa��sm2
var CERT_ISSUER_C    = 4;  // ֤�鷢���߹����� ���֮����&&&����
var CERT_ISSUER_O    = 5;  // ֤�鷢������֯��
var CERT_ISSUER_OU   = 6;  // ֤�鷢���߲�����
var CERT_ISSUER_ST   = 7;  // ֤�鷢����ʡ����
var CERT_ISSUER_CN   = 8;  // ֤�鷢����ͨ����
var CERT_ISSUER_L    = 9;  // ֤�鷢���߳�����
var CERT_ISSUER_E    = 10; // ֤�鷢����EMAIL��ַ
var CERT_NOT_BEFORE  = 11; // ֤����Ч����ʼ ��ʽYYYYMMDDHHMMSS 
var CERT_NOT_AFTER   = 12; // ֤����Ч�ڽ�ֹ ��ʽYYYYMMDDHHMMSS
var CERT_SUBJECT_C   = 13; // �û�������
var CERT_SUBJECT_O   = 14; // �û���֯��
var CERT_SUBJECT_OU  = 15; // �û�������
var CERT_SUBJECT_ST  = 16; // �û�ʡ����
var CERT_SUBJECT_CN  = 17; // �û�ͨ����
var CERT_SUBJECT_L   = 18; // �û�������
var CERT_SUBJECT_E   = 19; // �û�EMAIL��ַ
var CERT_PUBKEY      = 20; // ֤�鹫Կ
var CERT_SUBJECT_DN  = 33; // �û�DN
var CERT_ISSUER_DN   = 34; // �䷢��DN
var CERT_UNIQUEID    = 35; // Ψһʵ��ID
/////define object  /////////////////////////////////
	
	try {
	if (window.ActiveXObject) {
		document.writeln("<OBJECT classid=\"CLSID:3F367B74-92D9-4C5E-AB93-234F8A91D5E6\" height=1 id=XTXAPP  style=\"HEIGHT: 1px; LEFT: 10px; TOP: 28px; WIDTH: 1px\" width=1 VIEWASTEXT>");
		document.writeln("</OBJECT>");
	
	} else {
		document.writeln("<embed id=XTXAPP0 type=application/x-xtx-axhost clsid={3F367B74-92D9-4C5E-AB93-234F8A91D5E6} event_OnUsbkeyChange=OnUsbKeyChange width=1 height=1 />");
		XTXAPP = document.getElementById("XTXAPP0");
	}
}
catch(e) {
	alert("ActiveXObject XTXAppCOM.dll����û��ע��ɹ���"+e.message);
}




/////����ӿ�ת��Ϊ�ű��ӿ�////////////////////////

//��ȡ�û��б� ����䵽֤���б�

 function GetList(strListID)
{
	var objListID = eval(strListID);
	var strUserList = XTXAPP.SOF_GetUserList();
	
	while (1) {
		var i = strUserList.indexOf("&&&");
		if (i <= 0 ) {
			break;
		}
		var strOneUser = strUserList.substring(0, i);
		var strName = strOneUser.substring(0, strOneUser.indexOf("||"));
		var strUniqueID = strOneUser.substring(strOneUser.indexOf("||") + 2, strOneUser.length);
		var objItem = new Option(strName, strUniqueID);
		objListID.options.add(objItem);
		var len = strUserList.length;
		strUserList = strUserList.substring(i + 3,len);
	}
	var objListID = null;
	return;
}
//���֤���б�
function RemoveUserList(strListID)
{
	var objListID = eval(strListID);
	var i;
	var n = objListID.length;
	for(i = 0; i < n; i++) {
		objListID.remove(0);
	}
}
//��������û��б�
function ChangeUserList(strListID)
{
	RemoveUserList(strListID);
	GetList(strListID);
}


function GetUserList()
{
	return XTXAPP.SOF_GetUserList();
}


//���ü����㷨
function SetEncryptMethod(encMethod)
{
	return XTXAPP.SOF_SetEncryptMethod(encMethod);
}

//����ǩ���㷨
function SetSignMethod(signMethod)
{
	return XTXAPP.SOF_SetSignMethod(signMethod);
}



//�õ��û���Ϣ
function GetCertBasicinfo(Cert, Type) 
{

	return XTXAPP.SOF_GetCertInfo(Cert,Type);
	
}
function GetExtCertInfoByOID(Cert, oid) 
{
    
    return XTXAPP.SOF_GetCertInfoByOid(Cert,oid);
}


//����֤��Ωһ��ʶ����ȡBase64�����֤���ַ�����ָ����ȡ���ܣ�������֤�顣
function GetExchCert(strContainerName)
{  
    var UserCert = XTXAPP.SOF_ExportExChangeUserCert(strContainerName);
   
    return UserCert;
}

//ǩ��֤��
function GetSignCert(strContainerName)
{  
    var UserCert = XTXAPP.SOF_ExportUserCert(strContainerName);
   
    return UserCert;
}


//xmlǩ��
function SignedDataXML(signdata,ContainerName)
{
	return XTXAPP.SOF_SignDataXML(ContainerName,signdata);
}

function SignedData(sContainerName,sInData) 
{
	if (sContainerName != null)
		return XTXAPP.SOF_SignData(sContainerName,sInData);
	else
		return "";
}


function VerifySignedData(cert,indata,signvalue)
{
    return XTXAPP.SOF_VerifySignedData(cert,indata,signvalue);

}


function EncryptData(sKey,inData)
{
	
	var ret = XTXAPP.SOF_SymEncryptData(sKey,inData);
	return ret;
	
}


function DecryptData(sKey,inData)
{
	
	var ret = XTXAPP.SOF_SymDecryptData(sKey,inData);
	return ret;

}

function GenerateRandom(RandomLen) 
{

	return XTXAPP.SOF_GenRandom(RandomLen);
}


//�ļ�ǩ�� ����ǩ������
function SignFile(sFileName,sContainerName)
{
	 return XTXAPP.SOF_SignFile(sContainerName,sFileName)
}

function VerifySignFile(sFileName,sCert,SignData)
{
	 return XTXAPP.SOF_VerifySignedFile(sCert,sFileName,SignData);
}

//�޸�����
function ChangeUserPassword(strContainerName,oldPwd,newPwd)
{	
	return XTXAPP.SOF_ChangePassWd(strContainerName,oldPwd,newPwd);
}

//xmlǩ��
function SignedDataXML(signdata,ContainerName)
{
	return XTXAPP.SOF_SignDataXML(ContainerName,signdata);
}

//xml��֤ǩ��
function VerifySignXML(signxml)
{
	return XTXAPP.SOF_VerifySignedDataXML(signxml);
}

//p7ǩ��
function SignByP7(CertID,InData)
{
    return XTXAPP.SOF_SignMessage(0,CertID,InData)
}

//��֤p7ǩ��
function VerifyDatabyP7(P7Data)
{
    return XTXAPP.SOF_VerifySignedMessage(P7Data,"");
}

//p7�����ŷ����
function EncodeP7Enveloped(Cert,InData)
{
 
    return XTXAPP.SOF_EncryptDataEx(Cert,InData);  //P7�����ŷ���� ��SVS BCA_ALL��ͨ
}

//p7�����ŷ����
function DecodeP7Enveloped(CertID,InData)
{ 
    return XTXAPP.SOF_DecryptData(CertID,InData);
}

//base64����
function Base64Encode(InData)
{ 
    return XTXAPP.SOF_Base64Encode(InData);
}

//base64����
function Base64Decode(InData)
{ 
    return XTXAPP.SOF_Base64Decode(InData);
}

//�ļ��ԳƼ���
function SymEncryptFile(sKey, InFile, OutFile)
{
	 return XTXAPP.SOF_SymEncryptFile(sKey, InFile, OutFile);
	
}

//�ļ��Գƽ���
function SymDecryptFile(sKey, InFile, OutFile)
{
	return XTXAPP.SOF_SymDecryptFile(sKey, InFile, OutFile);
	
}

//��Կ����
function PubKeyEncrypt(Cert, InData)
{
	return XTXAPP.SOF_PubKeyEncrypt(Cert, InData);
}

//˽Կ����
function PriKeyDecrypt(CertID, InData)
{
	return XTXAPP.SOF_PriKeyDecrypt(CertID, InData);
}

//�ļ�ժҪ
function HashFile(hashAlg, InFile)
{
	return XTXAPP.SOF_HashFile(hashAlg, InFile);
}

function GetLastError()
{
	return XTXAPP.SOF_GetLastError();
}

function GetLastErrorMsg()
{
	var code = XTXAPP.SOF_GetLastError();
	var msg = XTXAPP.SOF_GetLastErrMsg();
	
	return "������[" + code + "] ��������[" + msg + "]";
}

//�ж�֤����Ч������
function CheckValid(userCert){	
	var strNotBefore = XTXAPP.SOF_GetCertInfo(userCert,CERT_NOT_BEFORE);
	var notBeforeDate = strNotBefore.substring(0,4)+"/"+strNotBefore.substring(4,6)+"/"+strNotBefore.substring(6,8);
	var nowDate = new Date().Format("yyyy/MM/dd");
	var days = (Date.parse(notBeforeDate) - Date.parse(nowDate)) / (1000*60*60*24);
	if (days > 0) {
		alert("����֤����δ��Ч!������Ч���ڻ�ʣ" + days + "��!");
		return false;
	}
	var strNotAfter = XTXAPP.SOF_GetCertInfo(userCert, CERT_NOT_AFTER);
  var notAfterDate = strNotAfter.substring(0,4)+"/"+strNotAfter.substring(4,6)+"/"+strNotAfter.substring(6,8);
	var nowDate = new Date().Format("yyyy/MM/dd");
	days = (Date.parse(notAfterDate) - Date.parse(nowDate)) / (1000*60*60*24);
	
	if (days <= -45) {
		alert("����֤���ѹ��� "+ -days +" �죬���������ʹ������,�뾡�����!");
	    return false;
	}
	
	if (days >= 0 && days <= 60) {
		alert("����֤�黹��" + days + "����ڣ��뾡�����!");
		return true;
	}
	
	if (days < 0) {
		alert("����֤���ѹ��� "+ -days +" �죬�뾡�����!");
	}
	
	return true;
}

function Login(strFormName,strContainerName,strPin) {
	var ret;
	var objForm = eval(strFormName);

	if (objForm == null) {
		alert("Form Error");
		return false;
	}
	if (strPin == null || strPin == "") {
		alert("������Key�ı�������");
		return false;
	}
	if (strPin.length < 6 || strPin.length > 16) {
		alert("���볤��Ӧ����6-16λ֮��");
		return false;
	}

  //У������
    if(!XTXAPP.SOF_Login(strContainerName,strPin))
    {	
		var retryCount = XTXAPP.SOF_GetPinRetryCount(strContainerName);
		if (retryCount > 0) {
			alert("У��֤������ʧ��!������" + retryCount + "�λ�������!");
			return false;
		} else if (retryCount == 0) {
			alert("����֤�������ѱ�����,����ϵBJCA���н���!");
			return false;
		} else {
			alert("��¼ʧ��!");
			return false;
		}	
    }
    //�����ͻ���֤��
	var userCert = GetSignCert(strContainerName);
	if (userCert == null || userCert == "") {
		alert("�����û�֤��ʧ��!");
		return false;
	}
	
	//���֤����Ч��
	if (!CheckValid(userCert)) {
		return false;
	}
	
	//��֤�����ǩ��
	if(!VerifySignedData(strServerCert,strServerRan,strServerSignedData))
    {   
        alert("��֤����������Ϣʧ��!");
        return false;
    }
	
	//���������ǩ��
	var strClientSignedData = SignedData(strContainerName,strServerRan);
	if (strClientSignedData == null || strClientSignedData == "") {
		alert("�ͻ���ǩ��ʧ��!");
		return false;
	}
	
  //Add a hidden item ...
	var strSignItem = "<input type=\"hidden\" name=\"UserSignedData\" value=\"\">";
	if (objForm.UserSignedData == null) {
		objForm.insertAdjacentHTML("BeforeEnd",strSignItem);
	}
	var strCertItem = "<input type=\"hidden\" name=\"UserCert\" value=\"\">";
	if (objForm.UserCert == null) {
		objForm.insertAdjacentHTML("BeforeEnd",strCertItem);
	}
	var strContainerItem = "<input type=\"hidden\" name=\"ContainerName\" value=\"\">";
	if (objForm.ContainerName == null) {
		objForm.insertAdjacentHTML("BeforeEnd",strContainerItem);
	}
    
  objForm.UserSignedData.value = strClientSignedData;
	objForm.UserCert.value =  userCert;
	objForm.ContainerName.value = strContainerName;
    
  return true;
    
}


