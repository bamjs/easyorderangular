import { Component, Inject, Injectable, OnInit, Optional } from '@angular/core';
import { inject } from '@angular/core/testing';
import { MatDialog, MatDialogRef,MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ActivatedRoute,Router } from '@angular/router';
import { Employee } from '../employee';
import { EmployeeService } from '../employee.service';
import { EmployeeInterface } from '../employeeInterface';

@Component({
  selector: 'app-createemployee',
  templateUrl: './createemployee.component.html',
  styleUrls: ['./createemployee.component.css']
})
export class CreateemployeeComponent implements OnInit {
  dateofjoning: Date ;
  dateofBirth: Date ;
  employeename: string ;
  employeeTitle: string;
  employeePhonenumber: number;
  empemailID: string ;
  empAddress: string ;
  empid: number;
  employeobj: any = [];
  objemployee: EmployeeInterface;
  employee: Employee;
  submitted:boolean=false;
  constructor(
   @Inject(MAT_DIALOG_DATA) public data:any,
    private empservice: EmployeeService,
    public matDailogRef:MatDialogRef<CreateemployeeComponent>,
  ) { }

  ngOnInit(): void {
        this.empid=this.data.id;
    if (this.empid >> 0) {
      this.empservice.getEmployeeByID(this.empid).subscribe((data) => {
        console.log("this is the data for id"+data);
        this.objemployee = data;
        this.employeename = this.objemployee.name;
        console.log(this.employeename);
        this.employeeTitle = this.objemployee.title;
        this.empemailID = this.objemployee.emailId;
        this.employeePhonenumber = this.objemployee.phoneNumber;
        this.empAddress = this.objemployee.address;
        this.dateofBirth=this.objemployee.date_of_birth;
        this.dateofjoning=this.objemployee.date_of_joining;

        console.log("employee name"+this.employeename);
        this.employee= new Employee(this.employeename, this.employeeTitle, this.dateofjoning, this.dateofBirth, this.employeePhonenumber, this.empemailID, this.empAddress);
      })

    }
      this.employee = new Employee(this.employeename, this.employeeTitle, this.dateofjoning, this.dateofBirth, this.employeePhonenumber, this.empemailID, this.empAddress);



}
  onsubmit() {
    console.log("this before saving the data", this.employee)
    this.submitted=true;
    if(this.empid==undefined){
    this.empservice.saveEmployee(this.employee).subscribe(data => {
      console.log("outputfrom saving", data);
    })}else{
      console.log(this.empid+"this is the id for saving ");

      this.empservice.updateEmployee(this.employee,this.empid).subscribe(data=>{
        console.log("update data"+data);
      })
    }
    this.matDailogRef.close();

  }
  cancelEvent(){
    this.matDailogRef.close();
  }
}
