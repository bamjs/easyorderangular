export interface ProductInterface {
    availableQuantity:number,
    productDescription:string,
    productImage:string,
    productName:string,
    productPrice:number,
    id?:number
}
export interface SavedlistInterface {
    userID:number;
    productID:number;
    iD?:number;
    quantity?:number;
}
export interface SavedListDetailsInterface extends SavedlistInterface,ProductInterface{};
export interface WishListDetailsInterface extends SavedListDetailsInterface{};
