export interface UserInterface {
    password:string;
    termsAndConditions:string;
    phoneNumber:string;
    secondName:string;
    age:number;
    userName:string;
    userType:string;
    dateOfBirth:Date;
    emailID:string;
    gstnumber:string;
    address2:string;
    address1:string;
    gender:string;
    salary:number;
    firstName:string
    userID?:number;
}



export interface AuthenticateUserInterface{
    username:string,
    password:string
}