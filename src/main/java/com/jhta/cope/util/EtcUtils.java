package com.jhta.cope.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

public class EtcUtils {

	public static void saveFile(HttpServletRequest request, String saveDirectory,String path,String fileName) {
		FileInputStream input = null;
		FileOutputStream output = null;
		try {
			File file = new File(saveDirectory + "/" + fileName);

			input = new FileInputStream(file);
			output = new FileOutputStream(new File(request.getSession().getServletContext().getRealPath("/")
					+ File.separator + path + fileName));

			int readBuffer = 0;
			byte[] buffer = new byte[1024];
			while ((readBuffer = input.read(buffer)) != -1) {
				output.write(buffer, 0, readBuffer);
			}
		} catch (IOException e) {
			System.err.println(e);
		} finally {
			try {
				input.close();
				output.close();
			} catch (IOException io) {
			}
		}
	}
	
}
