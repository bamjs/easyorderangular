import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { Mail } from 'src/app/models/order';
import { OrderService } from 'src/app/services/order.service';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})
export class PaymentComponent implements OnInit {
  public seletedvalue: string;
  public iscard: boolean = false;
  public iscash: boolean = false;
  public OrderID;
  public emailid: string;
  constructor(public activedroute: ActivatedRoute,
    private orderservice: OrderService,
    private router: Router) { }
  public paymentoptions = ["Credit-Card", "Debit-Card", "Cash"]
  ngOnInit(): void {
    this.OrderID = this.activedroute.snapshot.params["OrderID"];
    console.log(this.OrderID);

  }
  paymentmode(event) {
    let value = event.value;
    switch (value) {
      case "cash":
        console.log(this.iscard);

        this.iscash = true;
        this.iscard = false;
        break;
      case "card":
        this.iscard = true;
        this.iscash = false;
        break;
      default:
        break;
    }
  }
 async makepayment() {
    if (this.emailid == undefined || this.emailid == null) {
      this.orderservice.opensnackbar("Please enter Mail ID","Dismiss")
    } else {
      let mail = new Mail(this.emailid, "Order Payment Status", "Payment Succesful");
     await lastValueFrom( this.orderservice.updatePaymentStatus(this.OrderID, mail))
     this.router.navigateByUrl("/home")
    }
  }
 async cancelpayment() {
    if (this.emailid == undefined || this.emailid == null) {
      this.orderservice.opensnackbar("Please enter Mail ID","Dismiss")
    } else {
    let mail = new Mail(this.emailid, "Order Payment Status", "Payment Failed");
   await lastValueFrom(this.orderservice.updatePaymentStatus(this.OrderID, mail))
   this.router.navigateByUrl("/home")
  }
  }

}
