<html>
<head>

	<title>UploadifyTest</title>

	  <script src="<%=request.getContextPath()%>/pages/payment/js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/pages/payment/js/jquery.uploadify.min.js" type="text/javascript"></script>

	<link rel="stylesheet" type="text/css" href="./js/uploadify.css">
	
	<script type="text/javascript">
		$(function() {
			$("#uploadify").uploadify({
				debug			: false, 

				swf 			: 'js/uploadify.swf',	//swf�ļ�·��
				method			: 'post',	// �ύ��ʽ
				uploader		: 'processUpload', // �������˴�����ϴ�����ĳ���(servlet, struts2-Action)

				preventCaching	: true,		// ���������URL��,��ֹ����

				buttonCursor	: 'hand',	// �ϴ���ťHoverʱ�������״
			//	buttonImage		: 'img/.....png',	// ��ť�ı���ͼƬ,�Ḳ������
				buttonText		: 'select file'	, //��ť����ʾ�����֣�Ĭ�ϡ�SELECTFILES��
				height			: 30	, // 30 px
				width			: 120	, // 120 px

				fileObjName		: 'filedata',	//�ļ���������, ��������
				fileSizeLimit	: 1000	,		// �ļ���С����, 100 KB
				fileTypeDesc	: 'any'	,	//�ļ�����˵�� any(*.*)
				fileTypeExts	: '*.*;*.txt',		// ������ļ�����,�ֺŷָ�
				formData		: {'id':'1', 'name':'myFile'} , //ָ���ϴ��ļ��������������ݡ�Ҳ��̬���á���ͨ��getParameter()��ȡ
				
				multi			: true ,	// ���ļ��ϴ�
				progressData	: 'speed',	// ������ʾ, speed-�ϴ��ٶ�,percentage-�ٷֱ�	
				queueID			: 'fileQueue',//�ϴ����е�DOMԪ�ص�ID��
				queueSizeLimit	: 99	,	// ���г���
				removeCompleted : false	,	// �ϴ���ɺ��Ƿ�ɾ�������еĶ�ӦԪ��
				removeTimeout	: 10	,	//�ϴ���ɺ�������ɾ�������еĽ�����, 
				requeueErrors	: true,	// �ϴ�ʧ�ܺ����¼������
				uploadLimit		: 20,	// ����ϴ��ļ�����

				successTimeout	: 30	,//��ʾ�ļ��ϴ���ɺ�ȴ���������Ӧ��ʱ�䡣������ʱ�䣬��ô����Ϊ�ϴ��ɹ���
				
				// ���ļ����Ƴ�������ʱ����	
				//onCancel : function(file) { alert( 'The file ' + file.name + ' was cancelled!' ); },
				
				// �ڵ���cancel�����Ҵ��������*��ʱ����
				//onClearQueue : function (queueItemCount) { alert( queueItemCount + ' files were removed from the queue!' ); },

				// ���ļ��Ի��� �ر�ʱ����
				onDialogClose : function (queueData) {
								/*	alert(
										"�ļ��Ի�������ѡ�˼����ļ�:" + queueData.filesSelected + "---" +
										"�����м��˼����ļ�:" + queueData.filesQueued + "---" +
										"�����б��滻�����ļ���:" + queueData.filesReplaced + "---" +
										"ȡ�������ļ���:" + queueData.filesCancelled + "---" + 
										"�ϴ�������ļ���:" + queueData.filesErrored
									); */
								},
				
				// ѡ���ļ��Ի����ʱ����
				onDialogOpen : function () { /*alert( 'please select files' ) */ },
			
				// û�м��ݵ�FLASHʱ����
				onFallback : function(){ alert( 'Flash was not detected!' ) },
				
				// ÿ�γ�ʼ��һ������ʱ����, ������ļ���, ����һ������
				//onInit : function (instance) { alert( 'The queue ID is ' + instance.settings.queueID ) },
			
				// �ϴ��ļ�������ɺ󴥷���ÿһ���ļ�������һ�Σ�, ���۳ɹ�ʧ��
				//onUploadComplete : function(file){ alert( 'The file ' + file.name + ' uploaded finished!' ) },

				// �ϴ��ļ�ʧ�ܴ���
				onUploadError : function(file, errorCode, errorMsg, errorString){ 
                                    /*
                                    alert(
                                        file.name + ' upload failed! ' + 
                                        'errorCode: ' + errorCode +
                                        'errorMsg:' + errorMsg +
                                        'errorString:' + errorString
                                    );*/
								},
                
                // ��ÿһ���ļ��ϴ��ɹ��󴥷�
                onUploadSuccess : function(file, data, response) {
                                    alert(
                                        file.name + ' is uploaded succeed!  ' +
                                        '  server-side returned data:' + data +
                                        '  response: ' + response
                                    );
                                  }

			});
		})
	</script>
</head>

<body>
	<h1>Uploadify Demo</h1>

	<p>
		<a href="javascript:$('#uploadify').uploadify('cancel','*')">clean queue</a>
	</p>
    <p>
		<a href="javascript:$('#uploadify').uploadify('cancel')">cancel first file</a>
	</p>
    <p>
		<a href="javascript:$('#uploadify').uploadify('stop', '*')">stop all files</a>
	</p>
    <p>
		<a href="javascript:$('#uploadify').uploadify('upload', '*')">start all files</a>
	</p>
	<div id="fileQueue"></div>

	<span id="uploadify"></span>

	


</body>
</html>