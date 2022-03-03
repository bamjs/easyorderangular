import { HttpClient } from '@angular/common/http';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { AuthenticateUser } from 'src/app/models/user';
import { UserInterface } from 'src/app/modelsInterface/user-interface';
import { ConfirmdailogService } from 'src/app/services/confirmdailog.service';
import { UserService } from 'src/app/services/user.service';
import { CreateuserComponent } from '../createuser/createuser.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  username: any;
  password: any;
  emailid:string;
  isForgotPassword:boolean=false;
  isLogin:boolean=true;
  isValidUser:boolean=false;
  phonenumber:string;
  user: UserInterface;
  users:any
  newPassword:string;
  verifypassword:string;
  token: any;
  @Output() public addusername = new EventEmitter;
  @Output() public registerUser = new EventEmitter;
  constructor(public userService: UserService,
    public router: Router,
    public snakbar: MatSnackBar,
    public confirmdailog: ConfirmdailogService) { }

  ngOnInit(): void {
  }
  async validateUser() {

    this.user = await lastValueFrom(this.userService.getuserDetails(this.username));
    if (this.user == null) {
      this.snakbar.open("Invalid User  details Please Re check", "Dismiss", { duration: 1000 })
    } else if (this.password == this.user.password) {
      sessionStorage.setItem("username", this.user.userName);
      sessionStorage.setItem("UserID", this.user.userID.toString());
      sessionStorage.setItem("firstname", this.user.firstName);
      sessionStorage.setItem("role", this.user.userType)
      this.token = await lastValueFrom(this.userService.generatetoken(new AuthenticateUser(this.username, this.password)));
      this.token ="Bearer "+this.token.token;
      console.log(this.token);
      sessionStorage.setItem("token", this.token);
      this.addusername.emit(this.user.userID);
      this.router.navigateByUrl("/home")
    } else {
      console.log("invalid user");
      this.snakbar.open("invalid credentials", 'dismiss', { duration: 1000 }).afterDismissed().subscribe((data) => {
        console.log(data);
      })
    }
  }
  registration() {
    this.confirmdailog.opencustomcomponent(CreateuserComponent)
  }
  forgotpassword(){
this.isForgotPassword=true;
this.isLogin=false;
  }
 async checkuserstatus(){
this.users=await lastValueFrom(this.userService.findUserByEmailidAndPhoneNumber(this.emailid,this.phonenumber)).catch(()=>{
  this.userService.opensnackbar("User Details Not Found")
});
this.isForgotPassword=false
if(this.users!=null){
  if(this.emailid===this.users.emailID){
    this.isValidUser=true;
    this.userService.opensnackbar("Enter New Password");
  }
}else{
  this.userService.opensnackbar("User Details Not Found");
  this.isLogin=true;
  this.username="";
  this.password="";
  this.emailid="";
  this.phonenumber="";
}
  }
 async  changepassword(){
   if(this.newPassword===this.verifypassword){
     this.users.password=this.newPassword;
  await lastValueFrom(this.userService.saveUser(this.users));
  this.userService.opensnackbar("Password Changed Sucessfully");
  this.username="";
  this.password="";
  this.isLogin=true;
  this.isValidUser=false;

   }else{
     this.userService.opensnackbar("Passwords Does'nt Match")
   }
  }

}
