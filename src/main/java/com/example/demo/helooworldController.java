package com.example.demo;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class helooworldController {
	
@GetMapping("/heloo")
public String Helooworld(){
	return "heloo world";
}
}
