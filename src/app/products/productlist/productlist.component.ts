import { HttpClient } from '@angular/common/http';
import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { MatButton } from '@angular/material/button';
import { Router } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { Savedlist, WishList } from 'src/app/models/products';
import { ProductInterface, WishListDetailsInterface } from 'src/app/modelsInterface/product-interface';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-productlist',
  templateUrl: './productlist.component.html',
  styleUrls: ['./productlist.component.css']
})
export class ProductlistComponent implements OnInit {
  products: ProductInterface[]
  wishlistcount: number;
  constructor(private productService: ProductService,
    private router: Router,
    private detector: ChangeDetectorRef) { }
  userid: any;
  savedlist: Savedlist;
  wishlist: WishList
  savedliscount: number;
  message: any;
  wListprdtexists: boolean = false;
  isVendor: boolean = false;
  public wishlistproducts: WishListDetailsInterface[];
  ngOnInit(): void {
    this.isVendor = this.productService.checkIsVendor(sessionStorage.getItem("role"));
    this.loadingdata();
  }
  async loadingdata() {
    this.userid = (+sessionStorage.getItem("UserID"));
    this.products = await lastValueFrom(this.productService.getallProducts());
    this.detector.detectChanges();
  }
  async addtocart(product) {
    this.savedlist = new Savedlist(this.userid, product.id);
    console.log(this.savedlist);

    await lastValueFrom(this.productService.addtoSavedList(this.savedlist));
    this.productService.opensnackbar(`${product.productName} Added to your Saved List`, 'dismiss');
    this.savedliscount = (+sessionStorage.getItem("savedlistcount") + 1);
    sessionStorage.setItem("savedlistcount", this.savedliscount.toString());
  }
  async addtowishlist(product) {
    console.log(product);
    this.wishlistproducts = await lastValueFrom(this.productService.getwishlistdetails(this.userid));
    for (const prd of this.wishlistproducts) {
      if (product.id == prd.productID) {
        this.wListprdtexists = true;
        this.productService.opensnackbar(`${product.productName} already added to wishlist`, "dismiss");
        break;
      }
    }
    if (!this.wListprdtexists) {
      this.wishlist = new WishList(this.userid, product.id);
      this.productService.addWishList(this.wishlist).subscribe();
      this.productService.opensnackbar(` ${product.productName} Added to your wishlist `, "dismiss");
      this.wishlistcount = (+sessionStorage.getItem("wishlistcount") + 1);
      sessionStorage.setItem("wishlistcount", this.wishlistcount.toString())
    }
  }
  editproduct(productID) {
    console.log("entered");
    this.router.navigateByUrl("createproduct/" + productID);

  }
  async deleteproduct(product: ProductInterface) {
    await lastValueFrom(this.productService.deleteProductById(product.id));
    this.message = await lastValueFrom(this.productService.deleteImage(product.productImage));
    this.loadingdata();
    this.detector.detach()
    this.detector.reattach();
    this.detector.detectChanges();
  }

}
