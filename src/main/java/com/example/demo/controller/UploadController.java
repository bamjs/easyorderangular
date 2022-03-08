package com.example.demo.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.UploadInterface;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@RestController
@CrossOrigin
@RequestMapping("/upload")
public class UploadController {
	@Autowired
	UploadInterface upload;

	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PostMapping
	@Transactional
	public ResponseEntity<String> savefile(@RequestParam(name = "file") MultipartFile file) {
		return upload.uploadFile(file);
	}
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PostMapping("/delete")
	public ResponseEntity<String> deletefile(@RequestParam(name="filePath") String filePath){
		return upload.deleteFile(filePath);
	}
}
