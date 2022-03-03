import { ChangeDetectorRef, Component, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { UsersComponent } from './User/users/users.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { CreateemployeeComponent } from './employee/createemployee/createemployee.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'
import { MaterialModule } from './material/material.module';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { matDialogAnimations, MatDialogConfig, MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { CreateProductComponent } from './products/create-product/create-product.component';
import { ReactiveFormsModule } from '@angular/forms';
import { ConfirmdailogComponent } from './component/confirmdailog/confirmdailog.component';
import { ProductlistComponent } from './products/productlist/productlist.component';
import { FileuploadComponent } from './component/fileupload/fileupload.component';
import { LoginComponent } from './User/login/login.component';
import { SavedlistComponent } from './products/savedlist/savedlist.component';
import { WishlistComponent } from './products/wishlist/wishlist.component';
import { MasterComponent } from './component/master/master.component';
import { MessageComponent } from './component/message/message.component';
import { MatTableDataSource } from '@angular/material/table';
import { CreateuserComponent } from './User/createuser/createuser.component';
import { CommonModule } from '@angular/common';
import { HttpInterceptor } from './component/http.interceptor';
import { PaymentComponent } from './orders/payment/payment.component';
import { ParentComponent } from './example/parent/parent.component';
import { ChildComponent } from './example/child/child.component';
import { OrderslistComponent } from './orders/orderslist/orderslist.component';
const routers =[

];
@NgModule({
  declarations: [
    AppComponent,
    UsersComponent,
    CreateemployeeComponent,
    CreateProductComponent,
    ConfirmdailogComponent,
    ProductlistComponent,
    FileuploadComponent,
    LoginComponent,
    SavedlistComponent,
    WishlistComponent,
    MasterComponent,
    MessageComponent,
    CreateuserComponent,
    PaymentComponent,
    ParentComponent,
    ChildComponent,
    OrderslistComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MaterialModule,
    FormsModule,
    RouterModule,
    ReactiveFormsModule,
    MatDialogModule,
    CommonModule

  ],
  providers: [
    MatDialogConfig,
    MatTableDataSource,
    {provide:HTTP_INTERCEPTORS,useClass:HttpInterceptor,multi:true}
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
