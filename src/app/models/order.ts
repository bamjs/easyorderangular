import { MailInterface, Orderinterface } from "../modelsInterface/orderinterface";
import { ProductInterface } from "../modelsInterface/product-interface";

export class Order implements Orderinterface {
   constructor(
   public status: string,
   public userID: number,
   public productsQuantity: string,
   public amount: number,
   public orderDate: Date,
   public productIDs: string,
   public quantity: number,
   public orderID?: number,
   public productdetails?:ProductInterface[]){}

}
export class Mail implements MailInterface {
   constructor(public toAddress: string,
     public subject: string,
     public paymentStatus: string){}

}