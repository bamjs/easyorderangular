package com.example.demo.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadImp implements UploadInterface {

	@Override
	public ResponseEntity<String> uploadFile(MultipartFile file) {
		String filename = file.getOriginalFilename();
		try {
			FileOutputStream fos = new FileOutputStream(
					new File("C:\\practice\\test\\easyorder\\src\\assets\\UploadedFiles\\" + filename));
			FileOutputStream fosForNet = new FileOutputStream(
					new File("C:\\practice\\webapp\\UploadedFiles\\" + filename));
			fos.write(file.getBytes());
			fosForNet.write(file.getBytes());
			fos.flush();
			fos.close();
			fosForNet.flush();
			fosForNet.close();

		} catch (IllegalStateException e) {
			System.out.println(e.getMessage() + "   " + filename);
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().body("Error Uploading Image");
		}
		return ResponseEntity.ok("Image Uploaded Succesfilly!!");

	}

	@Override
	public ResponseEntity<String> deleteFile(String filePath) {
		Path path = Paths.get("C:/practice/test/easyorder/src/assets" + filePath);
		Path pathForNet = Paths.get("C:/practice/webapp" + filePath);

		try {
			Files.delete(path);
			Files.delete(pathForNet);
			return ResponseEntity.ok("File Deleted Successfull in .net");
		} catch (Exception e) {
			System.err.println("unable to detele");
			e.printStackTrace();
			return ResponseEntity.badRequest().body("Unable To Delete File" + e.getMessage());
		}
	}

}
