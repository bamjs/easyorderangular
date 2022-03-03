import { AuthenticateUserInterface, UserInterface } from "../modelsInterface/user-interface";

export class User implements UserInterface {
    constructor(
    public password: string,
    public termsAndConditions: string,
    public phoneNumber: string,
    public secondName: string,
    public age: number,
    public userName: string,
    public userType: string,
    public dateOfBirth: Date,
    public emailID: string,
    public gstnumber: string,
    public address2: string,
    public address1: string,
    public gender: string,
    public salary: number,
    public firstName: string,
    public userID?: number,
    ){}
}


export class AuthenticateUser implements AuthenticateUserInterface{
    constructor(
        public username: string,
        public password: string

    ){}
}
export class Token{
    constructor(
        public token:string
    ){}
}
