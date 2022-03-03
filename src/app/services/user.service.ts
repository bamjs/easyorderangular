import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {UserInterface} from '../modelsInterface/user-interface';
import { environment } from 'src/environments/environment';
import { AuthenticateUser, Token, User } from '../models/user';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ConfirmdailogService } from './confirmdailog.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(
    private http:HttpClient,
   private noitify:ConfirmdailogService,
    ) { }
baseUrl:string=environment.baseUrl;
public  getallUsers(){
  return this.http.get<UserInterface[]>(this.baseUrl+"/user")
}
public getuserDetails(username){

  return this.http.get<UserInterface>(this.baseUrl+"/user/getByusername/"+username);
}
public saveUser(user:User){
  return this.http.post<User>(this.baseUrl+"/user/registration",user);
}
public opensnackbar(message){
 return this.noitify.opensnackbar(message);
}
public openconfirmdailog(message){
return this.noitify.openConfirmDailog(message)
}
getUserByID(userID){
  return this.http.get<UserInterface>(this.baseUrl+"/user/userid/"+userID);
}

generatetoken( authenticateUser :AuthenticateUser){
  return this.http.post<Token>(this.baseUrl+"/authenticate",authenticateUser);
}
findUserByEmailidAndPhoneNumber(emailID,phoneNumber){
 let url= this.baseUrl+`/user/getuserByEmailId?emailID=${emailID}&PhoneNumber=${phoneNumber}`;
return this.http.get<UserInterface>(this.baseUrl+`/user/getuserByEmailId?emailID=${emailID}&PhoneNumber=${phoneNumber}`)
}



}
