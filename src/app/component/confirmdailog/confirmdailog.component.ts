import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
@Component({
  selector: 'app-confirmdailog',
  templateUrl: './confirmdailog.component.html',
  styleUrls: ['./confirmdailog.component.css']
})
export class ConfirmdailogComponent implements OnInit {

  constructor(
    @Inject(MAT_DIALOG_DATA) public data
  ) { }
message=this.data.messege;
  ngOnInit(): void {

  }

}
