import { ChangeDetectorRef, Injectable, OnInit } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HttpinterceptorService {

  constructor() { }

public httpinterceptor: BehaviorSubject<boolean>=new BehaviorSubject(false);



}
