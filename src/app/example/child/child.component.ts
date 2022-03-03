import { Component, Input, OnInit, Output } from '@angular/core';
import { EventEmitter } from '@angular/core';


@Component({
  selector: 'app-child',
  templateUrl: './child.component.html',
  styleUrls: ['./child.component.css']
})
export class ChildComponent implements OnInit {
childvalue:any
@Output() public childevent=new EventEmitter;
@Input() public parentvalue;
constructor(

  ) { }

  ngOnInit(): void {
    setInterval(()=>{
      this.childvalue="new child value";
      this.childevent.emit(this.childvalue)
    },5000)
  }

}
