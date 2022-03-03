import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { Products } from 'src/app/models/products';
import { ProductInterface } from 'src/app/modelsInterface/product-interface';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-create-product',
  templateUrl: './create-product.component.html',
  styleUrls: ['./create-product.component.css']
})
export class CreateProductComponent implements OnInit {

  constructor(
    private productservice: ProductService,
    private activatedRoute: ActivatedRoute,
    private router:Router,
    private detector:ChangeDetectorRef
  ) { }
  productID: number;
  product: ProductInterface = {
    availableQuantity: undefined,
    productDescription: '',
    productImage: '',
    productName: '',
    productPrice: undefined,
  };
  uploadedimage: any;
  isuploaded: boolean = false;
  message:string;
  isError:boolean;
  ngOnInit(): void {
    this.loadeditableproduct();
  }
  async loadeditableproduct() {
    this.productID = this.activatedRoute.snapshot.params["productID"];
    if (this.productID != null) {
      this.product= await lastValueFrom(this.productservice.getProductById(this.productID));
      this.product.id=this.productID;
    }
  }
  productsubmit(form) {
    this.productservice.saveProduct(this.product).subscribe(data => {
      console.log(data);
    })
    form.resetForm();
this.router.navigateByUrl("home")
  }
 async uploadImage(event) {
    console.log("image", event);
    console.log(event.target.files[0]);
    this.uploadedimage = event.target.files[0];
    let form = new FormData();
    form.append("file", this.uploadedimage, this.uploadedimage.name);
    this.productservice.saveimage(form).subscribe(data => {
      if (data==="Image Uploaded Succesfilly!!") {
        this.message=data
        console.log(data);
        this.isuploaded = true;
      }; (error: any) => {
        this.message=data;
        this.isError=true;
        console.log(error);
      }
    })
    this.product.productImage = "/UploadedFiles/" + this.uploadedimage.name;
this.detector.checkNoChanges();
  }
}
