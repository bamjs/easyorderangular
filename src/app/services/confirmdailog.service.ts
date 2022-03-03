import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ConfirmdailogComponent } from '../component/confirmdailog/confirmdailog.component';

@Injectable({
  providedIn: 'root'
})
export class ConfirmdailogService {

  constructor(private matdailog:MatDialog,private snackbar:MatSnackBar) { }

  openConfirmDailog(msg){
   return this.matdailog.open(ConfirmdailogComponent,{
      disableClose:true,
      width:"400px",
      data:{messege:msg}
    })
  }
  opencustomcomponent(componentname){
    return this.matdailog.open(componentname,{
      disableClose:true,
      width:"80%"
    })
  }
  opensnackbar(message){
this.snackbar.open(message,"Dismiss",{duration:2000})
  }
}
