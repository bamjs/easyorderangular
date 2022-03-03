import { ProductInterface } from "./product-interface";

export interface Orderinterface {
        status: string,
        userID: number,
        productsQuantity:string,
        amount: number,
        orderDate: Date,
        productIDs: string,
        quantity: number,
        orderID?: number,
        productdetails?:ProductInterface[]

}
export interface MailInterface{
        toAddress:string,
        subject:string,
        paymentStatus:string
}
