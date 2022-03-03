import { Component, OnInit } from '@angular/core';
import { lastValueFrom } from 'rxjs';
import { Orderinterface } from 'src/app/modelsInterface/orderinterface';
import { ProductInterface } from 'src/app/modelsInterface/product-interface';
import { OrderService } from 'src/app/services/order.service';

@Component({
  selector: 'app-orderslist',
  templateUrl: './orderslist.component.html',
  styleUrls: ['./orderslist.component.css']
})
export class OrderslistComponent implements OnInit {
  public orders: Orderinterface[];
  constructor(private _orderService: OrderService) { }
  panelOpenState = false;
  products: ProductInterface[];
  quantitys:string[]
  updatedOrders: Orderinterface[]=[];
  ngOnInit(): void {

    this.loadingdata();
  }
  async loadingdata() {
    this.orders = await lastValueFrom(this._orderService.getorderdetailsByUserId()).then();
    for (const order of this.orders) {
      
      console.log(order.productIDs);
      this.quantitys=order.productsQuantity.split(",");
      this.products = await lastValueFrom(this._orderService.getProductDetails(order.productIDs));
      console.log(JSON.stringify(this.products));

      order.productdetails = this.products;
      console.log(JSON.stringify(order.productdetails));

      console.log(this.products);
      this.updatedOrders.push(order);
    }
    console.log(this.updatedOrders);
  }
}
