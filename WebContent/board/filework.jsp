<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
	MultipartParser parser = new MultipartParser(request, 1024*1024*100, true, true, "UTF-8");
	
while(true) {
	Part part = parser.readNextPart();
	out.println(part+"<br/>");
	if(part == null) {
		break;
	}else {
		String name = part.getName();
		boolean b1 = part.isFile();
		boolean b2 = part.isParam();
		out.println(name+".."+b1+"/"+b2+"<br/>");
		if(part.isFile()) {
			FilePart fp = (FilePart)part;
			String fn = fp.getFileName();
			String fpt = fp.getFilePath();	// 기본 temp저장경로를 설정안하면, 파일명 똑같이 나옴.
			File ori = new File(fpt);
			
			out.println(ori.length());
			String fct = fp.getContentType();
			out.println("<h3>"+fn+".."+fpt+".."+fct+"</h3>");
			// 업로드를 진행해야된다면..
			// 직접 IO 작업을 하거나 writeTo,
			// fp.getInputStream();
			String sav = application.getRealPath("/storage");
			File saveDir = new File(sav);
			
			fp.writeTo(saveDir);
			out.println("sav > "+sav);
		
			%>
			실제업로드한 경로 : <%=sav %> <br/>				
			당신이 접근할수 있게 설정된 uri : <%=application.getContextPath() %>/storage/<%=fn %><br/>
			
			<a download href="<%=application.getContextPath()%>/storage/<%=fn%>">다운</a>
			
			
			<%
		}else if(part.isParam()) {
			ParamPart pp = (ParamPart)part;
			String na = pp.getName();
			String val = pp.getStringValue();
			out.println("<h3>"+ na+"= " + val +"</h3>");
		}else {
			
		}
	}
}
	
	

%>