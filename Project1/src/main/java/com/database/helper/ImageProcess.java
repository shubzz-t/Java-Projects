package com.database.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ImageProcess {

	public static void imageDelete(String path) {
		try {
			File file = new File(path);
			file.delete();

		} catch (

		Exception e) {
			e.printStackTrace();
		}

	}

	public static boolean saveimage(InputStream iS, String path) {
		boolean f = false;
		try {

			byte[] b = new byte[iS.available()];
			iS.read(b);

			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
