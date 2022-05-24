import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/usuario';
import { global } from './global';

@Injectable({
    providedIn: 'root'
})
export class UserService {
    public user: User;
    public url: string;
    public token: any;
    public identity: any;

    constructor(
        public _http: HttpClient
    ){
        this.url = global.url;
    }

    login(user, getToken = null): Observable<any>{
        if(getToken != null){
            user.getToken = 'true';
        }

        let json = JSON.stringify(user);
        let params = "json="+json;
        let headers = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');

        return this._http.post(this.url+'/login', params, {headers: headers});
    }

    register(user: any, token): Observable<any>{

        let params = user;
        let headers = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded').set('Authorization', token);
        console.log(params);

        return this._http.post(this.url+'/dashboard/users/register', params, { headers: headers });
    }

    getIdentity(){
        let identity = JSON.parse(localStorage.getItem('identity'));
        
        if (identity && identity != 'undefined'){
            this.identity = identity;
        }else{
            this.identity = null;
        }

        return this.identity;
    }

    getToken(){
        let token = localStorage.getItem('Token');

        if(token && token != 'undefined'){
            this.token = token;
            console.log('BIEN');
        }else{
            this.token = null;
            console.log('ERRROOOOOOOR');
        }

        return this.token;
    }

}