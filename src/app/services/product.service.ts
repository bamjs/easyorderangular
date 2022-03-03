import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { lastValueFrom } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Savedlist, WishList } from '../models/products';
import { ProductInterface, SavedListDetailsInterface, WishListDetailsInterface } from '../modelsInterface/product-interface';


@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(
    private http: HttpClient,
    private snackbar: MatSnackBar
  ) {
    this.userID = (+sessionStorage.getItem("UserID"));
  }
  baseUrl: string = environment.baseUrl;
  userID: number=(+sessionStorage.getItem("UserID"));
  wishlist: WishList;
  savedlist: Savedlist

  checkIsVendor(userType) {
    if (userType === "Vendor") {
      return true;

    } else if (userType === "Customer" || userType === "null") {
      return false;
    } else {
      return false;
    }

  }
  opensnackbar(message, action) {
    return this.snackbar.open(message, action, { duration: 800 })
  }
  getallProducts() {

    return this.http.get<ProductInterface[]>(this.baseUrl + "/product")
  }
  getProductById(id: number) {
    return this.http.get<ProductInterface>(this.baseUrl + `/product/${id}`);
  }
  deleteProductById(id: number) {
    return this.http.delete(this.baseUrl + `/product/${id}`);
  }
  deleteImage(path:string){
return this.http.post("http://localhost:8080/upload/delete?filePath="+path,"");
  }
  updateProductById(product: ProductInterface, id: number) {
    product.id = id;
    return this.http.put(this.baseUrl + "/product", product);
  }
  saveProduct(product: ProductInterface) {
    return this.http.post(this.baseUrl + "/product", product);
  }
  saveListdetails(id) {
    return this.http.get<SavedListDetailsInterface[]>(this.baseUrl + "/savedlist/" + id)
  }
  addtoSavedList(savedlist: Savedlist) {
    return this.http.post(this.baseUrl + "/savedlist", savedlist);
  }
  getwishlistdetails(id) {
    return this.http.get<WishListDetailsInterface[]>(this.baseUrl + "/wishlist/" + id);
  }
  addWishList(wishlist: WishList) {
    return this.http.post(this.baseUrl + "/wishlist", wishlist);
  }
  saveimage(file) {
    return this.http.post<string>(this.baseUrl + "/upload", file);
  }
  deleteSavedList(savedlist: Savedlist) {
    return this.http.delete(this.baseUrl + "/savedlist/delete",{body:savedlist});
  }
  deleteWishList(wishlist: WishList) {
    return this.http.delete(this.baseUrl + "/wishlist/delete", {body:wishlist});
  }
  async deleteWishlistByProductID(productid) {
    this.wishlist = new WishList(this.userID, productid);
    await lastValueFrom(this.deleteWishList(this.wishlist))
  }
  async deleteSavedListByProductID(productID) {
    this.savedlist = new Savedlist(this.userID, productID);
    await lastValueFrom(this.deleteSavedList(this.savedlist))
  }
  async deleteAndAddToWishList(productID) {
    this.savedlist = new Savedlist(this.userID, productID)
    await lastValueFrom(this.http.delete(this.baseUrl + "/savedlist/deletewithproductid",{body:this.savedlist}));
    this.saveWishlistByProductID(productID);
  }
  getSavedListItemsCount(savedlistArray: SavedListDetailsInterface[]) {
    let saveditemscount: number
    for (const items of savedlistArray) {
      saveditemscount += items.quantity;
    }
    return saveditemscount;
  }
  async saveWishlistByProductID(productID) {
    this.wishlist = new WishList(this.userID, productID);
    await lastValueFrom(this.addWishList(this.wishlist))
  }
  async saveSavedListByProductID(productID) {
    this.savedlist = new Savedlist(this.userID, productID);
    console.log(JSON.stringify(this.savedlist));

    await lastValueFrom(this.addtoSavedList(this.savedlist))
  }
  clearSavedList(){
    return this.http.delete<string>(this.baseUrl+"/savedlist/userid/"+sessionStorage.getItem("UserID"));
  }



}
