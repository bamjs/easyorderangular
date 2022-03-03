package com.example.demo.Employee;

import java.util.*;

public interface EmployeeService {
	Employee saveEmplyoee(Employee employee) ;
	List<Employee> getallEmployee();
	Employee getEmployeeByID(Long id) throws Exception;
}
