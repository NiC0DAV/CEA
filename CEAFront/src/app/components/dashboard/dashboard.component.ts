import { Component, OnInit, DoCheck } from '@angular/core';
import { UserService } from '../../services/user.service';
import { Router, ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
  providers: [UserService]
})
export class DashboardComponent implements OnInit, DoCheck {

  public identity;
  public token;

  constructor(
    public _userService: UserService, private _router: Router, private _route: ActivatedRoute
  ){
    this.loadUser();
  }

  ngOnInit(): void {
    if(!this.identity){
      this._router.navigate(['/']);
    }
  }

  ngDoCheck(){
    this.loadUser();
  }

  loadUser(){
    this.identity = this._userService.getIdentity();
    this.token = this._userService.getToken();
  }

}
