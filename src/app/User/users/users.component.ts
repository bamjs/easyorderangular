import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { UserInterface } from 'src/app/modelsInterface/user-interface';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {
  users: UserInterface[];
  constructor(private userservice: UserService,
    private router:Router
    ) { }
    @ViewChild(MatPaginator) paginator:MatPaginator;
    @ViewChild(MatSort) sort:MatSort;
  userheader: string[] = ["firstName","secondName","phoneNumber","emailId","dob","address1","address2","Actions"];
  datasource: MatTableDataSource<UserInterface>

  ngOnInit(): void {
    this.userservice.getallUsers().subscribe((data) => {
      this.users = data;
      this.datasource = new MatTableDataSource(data);
      this.datasource.paginator=this.paginator;
      this.datasource.sort=this.sort;
      console.log(data);
    })
  }
  filter(event){
    this.datasource.filter=event.target.value;

  }
  updateUser(userid){
this.router.navigateByUrl("registration/"+userid);
  }

}
