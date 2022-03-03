import { ChangeDetectorRef, Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
} from '@angular/common/http';
import { finalize, Observable } from 'rxjs';
import { HttpinterceptorService } from '../services/httpinterceptor.service';

@Injectable()
export class HttpInterceptor implements HttpInterceptor {

  constructor(
    private interceptorservice: HttpinterceptorService,
  ) { }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    if (sessionStorage.getItem("token") != null) {
      console.log(request);
      request = request.clone({
        setHeaders: {
          Authorization: sessionStorage.getItem("token")
        }
      })
      console.log(JSON.stringify(request));

    }
    this.interceptorservice.httpinterceptor.next(true);
    return next.handle(request).pipe(
      finalize(
        async () => {
           this.interceptorservice.httpinterceptor.next(false)
          this.interceptorservice.httpinterceptor.next(false)
        }
      )
    );

  }
}
