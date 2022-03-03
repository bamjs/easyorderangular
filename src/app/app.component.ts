import { ChangeDetectorRef, Component, HostListener, OnInit, Output } from '@angular/core';
import { HttpinterceptorService } from './services/httpinterceptor.service';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
username:any;
isRegistration:boolean;
isDarkTheme:boolean=false;
isLoading:boolean;
constructor(
  public loader:HttpinterceptorService,
  private changedetection:ChangeDetectorRef
){}
ngOnInit(): void {
this.username=sessionStorage.getItem("username");
console.log(this.username);
this.changedetection.detectChanges();
}
}
