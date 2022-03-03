import { ChangeDetectionStrategy, ChangeDetectorRef, Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { Order } from 'src/app/models/order';
import { SavedListDetails } from 'src/app/models/products';
import { User } from 'src/app/models/user';
import { Orderinterface } from 'src/app/modelsInterface/orderinterface';
import { SavedListDetailsInterface } from 'src/app/modelsInterface/product-interface';
import { OrderService } from 'src/app/services/order.service';
import { ProductService } from 'src/app/services/product.service';
import { lastValueFrom, take } from 'rxjs';


@Component({
  selector: 'app-savedlist',
  templateUrl: './savedlist.component.html',
  styleUrls: ['./savedlist.component.css'],
  changeDetection: ChangeDetectionStrategy.Default
})
export class SavedlistComponent implements OnInit {
  private UserID: any;
  public order: Order;
  private saveditemscount: number = 0;
  public isNoProducts = false;
  public totalPrice: number = 0;
  public savedlistcolumns = ["productName", "productDescription", "productPrice", "quantity",];
  public savedlistdeatils: SavedListDetailsInterface[]
  constructor(private productservice: ProductService,
    private changedetector: ChangeDetectorRef,
    private orderservice: OrderService,
    private router: Router,

  ) { }

  ngOnInit(): void {
    this.loadSavedListData();
  }
  async loadSavedListData() {
    this.UserID = sessionStorage.getItem("UserID");
    this.savedlistdeatils = await lastValueFrom(this.productservice.saveListdetails(this.UserID));
    this.saveditemscount = 0;
    this.totalPrice = 0;
    for (const items of this.savedlistdeatils) {
      this.saveditemscount += items.quantity;
      this.totalPrice += items.quantity * items.productPrice;
    }
    if (this.saveditemscount == 0) {
      this.isNoProducts = true;
    }
    this.changedetector.detectChanges();
    sessionStorage.setItem("savedlistcount", this.saveditemscount.toString());
  }
  async removesavedlist(productID) {
    await this.productservice.deleteSavedListByProductID(productID);
    this.loadSavedListData();
  }
  async addsavedlist(productID) {
    await this.productservice.saveSavedListByProductID(productID);
    this.loadSavedListData();
  }
  async addtowishlist(productID) {
    await this.productservice.deleteAndAddToWishList(productID)
    this.loadSavedListData();
  }
  async placeOrder() {
    this.order = await this.orderservice.saveOrder();
    this.router.navigateByUrl("payment/" + this.order.orderID);
  }
  addmoreproducts() {
    this.router.navigateByUrl("home");
  }
  async clearsavedlist() {
   let msg= await lastValueFrom(this.productservice.clearSavedList()).catch((error)=>{console.log(error)});
   if(msg==="Deleted"){
     console.log("deleted");
     
   }
    this.loadSavedListData();
  }

}
