import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/usuario';
import { global } from './global';

@Injectable()
export class UserService {
    public url: string;

    constructor(
        public _http: HttpClient
    ){
        this.url = global.url;
    }

    login(user, getToken = null): Observable<any>{
        if(getToken != null){
            user.getToken = 'true';
        }   
        console.log(user.getToken);
        let json = JSON.stringify(user);
        let params = "json="+json;
        let headers = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');

        return this._http.post(this.url+'/login', params, {headers: headers});
    }

    register(user: any): Observable<any>{

        let params = user;
        let headers = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');

        return this._http.post(this.url+'/dashboard/users/register', params, { headers: headers });
    }

}