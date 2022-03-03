import { Inject, Injectable } from '@angular/core';
import { MatDialog, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { CreateemployeeComponent } from '../employee/createemployee/createemployee.component';

@Injectable({
  providedIn: 'root'
})
export class EditEmployeeDailogService {

  constructor(
    private matdailog :MatDialog,
  ) { }


  openemployeedailog(id=undefined){
    return this.matdailog.open(CreateemployeeComponent,{
      disableClose:true,
      width:"60%",
      data:id
    })
  }


}
