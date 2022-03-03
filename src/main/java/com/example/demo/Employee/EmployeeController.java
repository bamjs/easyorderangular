package com.example.demo.Employee;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/employee")
public class EmployeeController {

	private EmployeeService emplyoeeservice;

	public EmployeeController(EmployeeService emplyoeeservice) {
		super();
		this.emplyoeeservice = emplyoeeservice;
	}

	@PostMapping
	public ResponseEntity<Employee> saveEmployeee(@RequestBody Employee employee) {
		return new ResponseEntity<Employee>(emplyoeeservice.saveEmplyoee(employee), HttpStatus.CREATED);

	}
	@GetMapping
	public List<Employee> getAllEmployee(){
		return emplyoeeservice.getallEmployee();
	}
	@GetMapping("{id}")
	public Employee getEmployeeByid(@PathVariable("id") Long id) throws Exception {
		return emplyoeeservice.getEmployeeByID(id);
	}
}
