import { Component, OnInit, DoCheck } from '@angular/core';
import { UserService } from '../../services/user.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { User } from '../../models/usuario';


@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
  providers: [UserService]
})
export class DashboardComponent implements OnInit, DoCheck {

  public identity;
  public token;
  public tokenExpDateFormat: any;
  public todayFormatDate: Date;
  public unixFormatDate: number;
  public timePassed: number;
  public user: User;

  constructor(
    public _userService: UserService, private _router: Router, private _route: ActivatedRoute
  ){
    this.loadUser();
  }

  ngOnInit(): void {
    if(!this.identity){
      this._router.navigate(['/']);
    }
    this.getData();
  }

  ngDoCheck(){
    this.loadUser();
    this.tokenExp();
  }

  loadUser(){
    this.identity = this._userService.getIdentity();
    this.token = this._userService.getToken();
  }

  tokenExp(){
    this.timePassed = Date.now();
    this.todayFormatDate = new Date(this.timePassed);
    this.unixFormatDate = (Math.trunc(this.todayFormatDate.getTime() / 1000));

    if(this.unixFormatDate >= this.identity.exp){
      // console.log('Expirado');
      alert('Su sesion ha expirado, inicie sesion nuevamente');
      this._router.navigate(['/logout/1']);
    }
  }

  getData() {
    this._route.params.subscribe(
      params => {
        let id = this.identity.userId;
        this._userService.unicUser(id).subscribe(
          response => {
            if(response.status == 'success') {
              this.user = response.user;
              // console.log(this.user);
            }
          },
          error => {
            console.log(<any>error);
          }
        );
      }
    );
  }

}
