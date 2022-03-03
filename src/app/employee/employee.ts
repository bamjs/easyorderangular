import { EmployeeInterface } from "./employeeInterface";

export class Employee implements EmployeeInterface {

    constructor(
        public name:string,
        public title:string,
        public date_of_joining :Date,
        public date_of_birth:Date,
        public phoneNumber:number,
        public emailId :string,
        public address:string,
        public id?:number,

    ){

    }
}
