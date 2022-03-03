import { ProductInterface, SavedListDetailsInterface, SavedlistInterface, WishListDetailsInterface } from "../modelsInterface/product-interface";

export class Products implements ProductInterface {
    constructor(
        public availableQuantity: number,
        public productDescription: string,
        public productImage: string,
        public productName: string,
        public productPrice: number,
        public id?: number
    ) { }

}
export class Savedlist implements SavedlistInterface {
    constructor(

        public userID: number,
        public productID: number,
        public quanity?:number,
        public iD?: number) { }
}
export class WishList extends Savedlist{}
export class SavedListDetails implements SavedListDetailsInterface{
    userID: number;
    quantity: number;
    productID: number;
    availableQuantity: number;
    productDescription: string;
    productImage: string;
    productName: string;
    productPrice: number;
    id?: number;
    iD?: number;

}
export class WishListDetails implements WishListDetailsInterface{
    userID: number;
    productID: number;
    iD?: number;
    quantity?: number;
    availableQuantity: number;
    productDescription: string;
    productImage: string;
    productName: string;
    productPrice: number;
    id?: number;
    
}