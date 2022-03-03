import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { lastValueFrom } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Mail, Order } from '../models/order';
import { SavedListDetails } from '../models/products';
import { Orderinterface } from '../modelsInterface/orderinterface';
import { ProductInterface, SavedListDetailsInterface } from '../modelsInterface/product-interface';
import { ProductService } from './product.service';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  private baseUrl = environment.baseUrl;
  public savedlistDetails: SavedListDetailsInterface[];
  public order: Order = {
    status: '',
    userID: undefined,
    productsQuantity: '',
    amount: 0,
    orderDate: new Date(),
    productIDs: '',
    quantity: 0
  }
  constructor(private productservice: ProductService,
    private http: HttpClient) { }
  async saveOrder() {
    this.order.status = "Payment Started";
    this.order.userID = this.productservice.userID;
    const order =await lastValueFrom(this.productservice.saveListdetails(this.productservice.userID));
      for (const items of order) {
        this.order.productIDs += items.productID + ",";
        this.order.productsQuantity += items.quantity + ",";
        this.order.quantity += items.quantity;
        this.order.amount += items.productPrice * items.quantity;
      }
    this.order.productIDs=  this.order.productIDs.substring(0, this.order.productIDs.length - 1);
    this.order.productsQuantity=  this.order.productsQuantity.substring(0, this.order.productsQuantity.length - 1);
    const outorder= lastValueFrom(this.http.post<Orderinterface>(this.baseUrl + "/order", this.order));
    console.log(outorder);
      return outorder;
  }
  updatePaymentStatus(orderID,mail:Mail){
    return  this.http.put(this.baseUrl+"/order/updatepayment/"+orderID,mail)
  }
  opensnackbar(message,action){
    this.productservice.opensnackbar(message,action);
  }
  getorderdetailsByUserId(){
return this.http.get<Orderinterface>(this.baseUrl+"/order/getorders/"+sessionStorage.getItem("UserID"));
  }
  getProductDetails(productids){
    return this.http.get<ProductInterface[]>(this.baseUrl+"/order/getproductdetails?productids="+productids);
  }

}
