<%@page contentType="text/html; charset=utf-8"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<html>
<head>
<title>File Upload</title>
</head>
<body>
	<%
		String fileUploadPath = "C:\\upload";

		DiskFileUpload upload = new DiskFileUpload();

		List items = upload.parseRequest(request);

		Iterator params = items.iterator();

		while (params.hasNext()) {
			FileItem fileItem = (FileItem) params.next();
			if (!fileItem.isFormField()) {
				String fileName = fileItem.getName();
				out.println("filename 전 " + fileName);
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				out.println("filename 후 " + fileName);
				File file = new File(fileUploadPath + "/" + fileName);
				fileItem.write(file);
			}
		}
	%>
</body>
</html>