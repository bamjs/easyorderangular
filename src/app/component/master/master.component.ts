import { ChangeDetectorRef, Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { SavedListDetails } from 'src/app/models/products';
import { User } from 'src/app/models/user';
import { SavedListDetailsInterface } from 'src/app/modelsInterface/product-interface';
import { HttpinterceptorService } from 'src/app/services/httpinterceptor.service';
import { ProductService } from 'src/app/services/product.service';


@Component({
  selector: 'app-master',
  templateUrl: './master.component.html',
  styleUrls: ['./master.component.css']
})
export class MasterComponent implements OnInit {
  UserID: any;
  firstname: string;
  slItemsCount: string;
  wlItemsCount: string;
  sidenavtoggle: boolean = true;
  userType: string;
  isUser: boolean = false;
  isVendor: boolean = false;
  savedlist: SavedListDetailsInterface[];
  @Input("activeuser") public user: User;
  @Input("updatedcount") public slcount: number;
  @Output() public clearsession = new EventEmitter;
  @Output() public isDarkmode = new EventEmitter;
  toogleSidenav() {
    this.sidenavtoggle = !this.sidenavtoggle;
  }
  constructor(private productservice: ProductService,
    public loader: HttpinterceptorService,
    public changedetector: ChangeDetectorRef,
    private router:Router
  ) { }

  ngOnInit(): void {
    this.userType = sessionStorage.getItem("role");
    console.log(this.userType, "user type");
    if (this.userType === "Vendor") {
      this.isVendor = true;
    } else if (this.userType === "Customer" || this.userType === "null") {
      this.isUser = true;
    }


    this.UserID = sessionStorage.getItem("UserID");
    sessionStorage.removeItem("savedlistcount");
    sessionStorage.removeItem("wishlistcount");
    this.firstname = sessionStorage.getItem("firstname");
    this.productservice.saveListdetails(this.UserID).subscribe(data => {
      this.savedlist = data;
      for (const prod of this.savedlist) {
        this.slItemsCount += prod.quantity;
      }
      if (this.slItemsCount == null) { this.slItemsCount = "0" }
      sessionStorage.setItem("savedlistcount", this.slItemsCount)
    });
    this.productservice.getwishlistdetails(this.UserID).subscribe(data => {
      this.wlItemsCount = data.length.toString();
      sessionStorage.setItem("wishlistcount", this.wlItemsCount)
    })
    this.updatesavedlistcount();
    this.changedetector.detectChanges();
    console.log(this.isUser, "user boolean");

  }
  updatesavedlistcount() {
    this.slItemsCount = sessionStorage.getItem("savedlistcount");
    this.wlItemsCount = sessionStorage.getItem("wishlistcount")
    setInterval(() => { this.updatesavedlistcount() }, 1500)
  }

  logout() {
    sessionStorage.clear();
    this.clearsession.emit();
  }
  changeDarkTheme(value) {

    this.isDarkmode.emit(value)
  }
  edituser(){
this.router.navigateByUrl("registration/"+sessionStorage.getItem("UserID"));
  }

}
