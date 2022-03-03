import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Employee } from './employee';
import { EmployeeInterface } from './employeeInterface';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {
  constructor(
    private http: HttpClient,


  ) { }
  baseUrl: string =environment.baseUrl+"/Emp";
  date: Date = new Date(2012, 12)


  getEmployee() {
    return this.http.get<EmployeeInterface[]>(this.baseUrl)
  }
  saveEmployee(employee: Employee) {
    return this.http.post(this.baseUrl, employee);
  }
  getEmployeeByID(id) {
    return this.http.get<EmployeeInterface>(this.baseUrl + "/" + id)
  }
  updateEmployee(employee:Employee,id){
    employee.id=id;
    return this.http.put(this.baseUrl+"/"+id,employee)
  }
deleteEmployee(id){
  return this.http.delete(this.baseUrl+"/"+id);
}

}
