package com.example.demo.Employee;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeRepository employeeRepository;
	public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
		super();
		this.employeeRepository = employeeRepository;
	}
	@Override
	public Employee saveEmplyoee(Employee employee) {
	
		return employeeRepository.save(employee);
	}
	@Override
	public List<Employee> getallEmployee() {
		
		return employeeRepository.findAll();
	}
	@Override
	public Employee getEmployeeByID(Long id) throws Exception {
		Optional<Employee> employee= employeeRepository.findById(id);
		if(employee.isPresent()) {
			return employee.get();
		}else {
			throw new Exception();
		}
		
	}
}
