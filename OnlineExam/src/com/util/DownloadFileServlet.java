package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helper.OrgTask;
import com.helper.PdfGenerator;

import mybeans.PdfResult;

public class DownloadFileServlet extends HttpServlet {
 
    /**
	 *  
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

		
		
		   SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH-mm-ss"); 
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		    Date date = new Date();  
		    String filename = "result"+formatter.format(date);
		    String dt= sdf.format(date);
		   	OrgTask oTask = new OrgTask();
		int oid = Integer.parseInt(request.getParameter("orgID"));
		String orgName = oTask.getOrgName(oid);
		int exid=Integer.parseInt(request.getParameter("ex_id"));
		ArrayList<PdfResult> list=oTask.getresultForPdf(oid, exid);
		PdfResult pdfResult;
		ArrayList<String> colname=new ArrayList<String>();
		colname.add("Sr.No.");
		colname.add("Full Name");
		colname.add("Year");
		colname.add("Semester");
		colname.add("Obtain Marks");
		colname.add("Percentage");
		colname.add("Result Status");
		ArrayList<String> coldata = new ArrayList<String>();
		String exName=null;
		String sem=null;
		int count=0;
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				pdfResult = (PdfResult)list.get(i);
				exName= pdfResult.getExamName();
				coldata.add(count++, String.valueOf(i+1));
				coldata.add(count++, pdfResult.getFullName().toUpperCase());
				coldata.add(count++, pdfResult.getYear());
				sem = pdfResult.getSem();
				coldata.add(count++, sem );
				coldata.add(count++, String.valueOf(pdfResult.getObtainMarks()));
				String p = String.valueOf(pdfResult.getPercentage());
				coldata.add(count++, p+" %");
				coldata.add(count++, pdfResult.getResultStatus());
			}
			PdfGenerator pd=new PdfGenerator();
			boolean op = pd.generateTextWithTable( exName+" "+filename, exName+" sem-"+sem+" result "+dt, orgName, 7, colname, coldata);
		
		
		
		if(op==true) {
    	// reads input file from an absolute path
        
        String filePath = "E:/"+exName+" "+filename+".pdf";
        File downloadFile = new File(filePath);
        FileInputStream inStream = new FileInputStream(downloadFile);
         
    	// obtains ServletContext
        ServletContext context = getServletContext();

        // gets MIME type of the file
        String mimeType = context.getMimeType(filePath);
        if (mimeType == null) {        
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        System.out.println("MIME type: " + mimeType);
         
        // modifies response
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());
         
        // forces download
        response.setHeader("Content-Disposition", "attachment; filename="+downloadFile.getName());
         
        // obtains response's output stream
        OutputStream outStream = response.getOutputStream();
         
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
         
        while ((bytesRead = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
         
        inStream.close();
        outStream.close();     
    }
}
}
}