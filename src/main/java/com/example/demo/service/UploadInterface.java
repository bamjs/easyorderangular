package com.example.demo.service;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface UploadInterface {
ResponseEntity<String> uploadFile(MultipartFile File);
ResponseEntity<String> deleteFile(String filePath);
}
