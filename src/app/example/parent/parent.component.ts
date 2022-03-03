import { Component, Input, OnInit, Output } from '@angular/core';
@Component({
  selector: 'app-parent',
  templateUrl: './parent.component.html',
  styleUrls: ['./parent.component.css']
})
export class ParentComponent implements OnInit {
parentvalue:any
@Output() public childvalue
  constructor() { }
  ngOnInit(): void {
    this.parentvalue="this is the parent value "
  }

}
