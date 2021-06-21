package com.helper;

import java.io.FileOutputStream;
import java.util.ArrayList;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
public class PdfGenerator {
	
	private Document document = new Document();
	
	//add some text and table in pdf document
	public boolean generateTextWithTable(String filenm, String text,String text2,int numOfColumn, ArrayList<String> columnNames, ArrayList<String> columnData) {
			
		try {
			//-----write content to the file
			String path = "E:\\"+filenm+".pdf";
			PdfWriter.getInstance(document, new FileOutputStream(path));
			//open document
			document.open();
			
			//set margin to page
			document.setMargins(60, 30, 30, 30);
			
			//	write content to the file
			Paragraph paragraph = new Paragraph(text);
			Paragraph paragraph2 = new Paragraph(text2);
			
			//align text to center
			paragraph.setAlignment(Paragraph.ALIGN_CENTER);	
			paragraph2.setAlignment(Paragraph.ALIGN_CENTER);
			document.add(new Paragraph(" "));
			//if data is successfully added to the file then create the table
			if(document.add(paragraph2) && document.add(paragraph) && document.add(new Paragraph(" "))
					&& document.add(new Paragraph(" ")) && document.add(new Paragraph(" "))) {
					
				//-------add table to pdf file-------------
				//set coloumn width
				float [] pointColumnWidths = {20F,80F,25F,35F,40F,50F,65F}; 
				PdfPTable table = new PdfPTable(pointColumnWidths);
				PdfPCell cell;
				//generate columns heading
				for(String cols : columnNames) {
					cell = new PdfPCell(new Phrase(cols));
					//add column heading to table
					cell.setBackgroundColor(BaseColor.ORANGE);
					table.addCell(cell);
				}
					
				table.setHeaderRows(1);
					
				for(String coldata : columnData) {
					//writing data to column
					table.addCell(coldata);
				}
					
				//add table in document
				if(document.add(table)) {
					document.close();
					//return "s";
					return true;
				}
				else {
					//return "f";
					return false;
				}
			}
			else {
				//return "ff";
				return false;
			}
			
		} 
		catch (Exception e) {
			//return e.getMessage(); 
			e.printStackTrace();
		}
		
		return false;
	}
}
