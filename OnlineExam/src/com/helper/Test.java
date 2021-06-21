package com.helper;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.util.MailBean;

import config.Database;
import mybeans.PdfResult;
import mybeans.ResultExam;

public class Test {


	public static void main(String[] args) {
		
//		String email = request.getParameter("email");
//		MailBean mailBean = new MailBean();
//		Random random = new Random();
//		int otp =random.nextInt(999999);
//		String res = mailBean.sendMail("belankars@gmail.com", "Forgot Password", "Your OTP for Forgot Password is: "+otp);
//		if(res.equals("Message Sent")){
//		System.out.print("OTP Generated"+otp);
//		}else{
//			System.out.print("OTP failed");
//		}
		ArrayList<PdfResult> list;
		PreparedStatement pStatement;
		Database db=new Database();
		Connection  con = db.getConnection();
		PdfResult pdfResult;
			try {
				
				String file_name ="E:\\Eclipse Workpsace\\OnlineExam\\WebContent\\downloaded-results\\result1.pdf";
				Document document=new Document();
				
				//simple paragraph
				 PdfWriter writer =PdfWriter.getInstance(document, new FileOutputStream(file_name));
				document.open();
				Paragraph paragraph=new Paragraph("Student Result");
				document.add(paragraph);
				
				///add table
				PdfPTable table=new PdfPTable(1);
				PdfPCell c1=new PdfPCell(new Phrase("Full Name"));
				table.addCell(c1);
			

				table.setHeaderRows(1);
				

				table.addCell("shan");
			
				document.add(table);
				writer.close();
			System.out.println("finished");
			}catch (Exception e) {
			e.toString();
			}
	}
}


