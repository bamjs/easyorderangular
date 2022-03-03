import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { FileuploadComponent } from './component/fileupload/fileupload.component';
import { LoginguardGuard } from './loginguard.guard';
import { OrderslistComponent } from './orders/orderslist/orderslist.component';
import { PaymentComponent } from './orders/payment/payment.component';
import { CreateProductComponent } from './products/create-product/create-product.component';
import { ProductlistComponent } from './products/productlist/productlist.component';
import { SavedlistComponent } from './products/savedlist/savedlist.component';
import { WishlistComponent } from './products/wishlist/wishlist.component';
import { CreateuserComponent } from './User/createuser/createuser.component';
import { LoginComponent } from './User/login/login.component';
import { UsersComponent } from './User/users/users.component';

const routes: Routes = [{
  path: "createproduct",
  component: CreateProductComponent
},
{
  path: "createproduct/:productID",
  component: CreateProductComponent
}, {
  path: "users",
  component: UsersComponent
}, {
  path: "home",
  component: ProductlistComponent
}, {
  path: "savedlist",
  component: SavedlistComponent
}, {
  path: "wishlist",
  component: WishlistComponent
}, {
  path: "upload",
  component: FileuploadComponent
},{
  path:"registration/:UserID",
  component:CreateuserComponent
}, {
  path: "registration",
  component: CreateuserComponent,
  canActivate: [LoginguardGuard]
},
{
  path: "login",
  component: LoginComponent
}, {
  path: "payment/:OrderID",
  component: PaymentComponent
}, {
  path: "orderlist",
  component: OrderslistComponent
}
  , {
  path: "",
  component: ProductlistComponent
}, {
  path: "main",
  component: AppComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
