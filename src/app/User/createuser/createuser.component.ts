import { Component, OnInit } from '@angular/core';
import { MatButton } from '@angular/material/button';
import { ActivatedRoute } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { User } from 'src/app/models/user';
import { ConfirmdailogService } from 'src/app/services/confirmdailog.service';
import { UserService } from 'src/app/services/user.service';


@Component({
  selector: 'app-createuser',
  templateUrl: './createuser.component.html',
  styleUrls: ['./createuser.component.css']
})
export class CreateuserComponent implements OnInit {

  constructor(
    private userservice: UserService,
    private confirmDailog:ConfirmdailogService,
    private activatedRouter:ActivatedRoute
  ) { }
  isvendor: boolean;
  isDailog:any;
  editableUserID:number;
  isUncheck:boolean=false;
  user: User = {
    password: '',
    termsAndConditions: '',
    phoneNumber: '',
    secondName: '',
    age: 0,
    userName: '',
    userType: '',
    dateOfBirth: undefined,
    emailID: '',
    gstnumber: '',
    address2: '',
    address1: '',
    gender: '',
    salary: undefined,
    firstName: ''
  }
  ngOnInit(): void {
    this.isDailog=sessionStorage.getItem("UserID");
    this.loadEditableUser();

  }
  async loadEditableUser(){
    this.editableUserID=this.activatedRouter.snapshot.params["UserID"];
    if(this.editableUserID!=null){
      this.user= await lastValueFrom(this.userservice.getUserByID(this.editableUserID));
      this.user.userID=this.editableUserID;
      this.user.termsAndConditions="";
    }
  }
  isVendor() {
    if (this.user.userType == "Vendor") {
      this.isvendor = true;
      this.userservice.opensnackbar("Enter Gst Details")
    } else {
      this.isvendor = false;
    }
  }
  onsubmit() {
    console.log(this.user, "before saving");
    this.userservice.saveUser(this.user).subscribe(data => {
      this.user=data;
      console.log(this.user, "after saving user details");
      this.userservice.opensnackbar("User Created Succesfull with id "+this.user.userID)
    });
  }
  reset(userform) {
this.confirmDailog.openConfirmDailog("All Filled Details Will Be Reseted").afterClosed().subscribe(
  data=>{
if(data){
userform.resetForm();
this.userservice.opensnackbar("Form Details Reseted")
}
  }
)
  }
  dailogClose(button){
    this.userservice.openconfirmdailog("do you want to close the window data will be erased").afterClosed().subscribe(data=>{
      if(data){
        button.click();
      }else{
        this.confirmDailog.opensnackbar("Entered Details Restored")
      }
    })
  }

}
