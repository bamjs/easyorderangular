import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { SavedListDetails } from 'src/app/models/products';
import { WishListDetailsInterface } from 'src/app/modelsInterface/product-interface';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrls: ['./wishlist.component.css']
})
export class WishlistComponent implements OnInit {
  UserID: number;
  wishListProducts: WishListDetailsInterface[];
  wishlistitemscount: number;
  isItemsCountZero: boolean = false;
  constructor(private productservice: ProductService,
    private router:Router,
    private changedetector: ChangeDetectorRef) { }
  savedlistcolumns = ["productName", "productDescription", "productPrice"];
  ngOnInit(): void {
    this.UserID = (+sessionStorage.getItem("UserID"));
    this.loadwishlistdata();
    this.changedetector.detectChanges();
  }
  async loadwishlistdata() {
    this.wishListProducts = await lastValueFrom(this.productservice.getwishlistdetails(this.UserID));
    if (this.wishListProducts.length == 0) {
      this.isItemsCountZero = true;
    }
    this.changedetector.detectChanges();
  }
  async addtosavedlist(productid) {
   await this.productservice.deleteWishlistByProductID(productid);
   await this.productservice.saveSavedListByProductID(productid);
    this.wishlistitemscount = (+sessionStorage.getItem("wishlistcount"));
    if (this.wishlistitemscount != 0 || this.wishlistitemscount != undefined) {
      this.wishlistitemscount -= 1;
      sessionStorage.setItem("wishlistcount", this.wishlistitemscount.toString())
    } else {
      this.isItemsCountZero = true;
    }
    this.loadwishlistdata();
  }
  addmoreproducts(){
    this.router.navigateByUrl("home");
  }

}
