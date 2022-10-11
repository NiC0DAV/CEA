import { Component, OnInit } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service'; 
import { Router, ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-payments',
  templateUrl: './payments.component.html',
  styleUrls: ['./payments.component.css'],
  providers: [UserService]
})
export class PaymentsComponent implements OnInit {

  public token;
  public identity;
  public tokenExpDateFormat: any;
  public todayFormatDate: Date;
  public unixFormatDate: number;
  public timePassed: number;
  
  constructor(
    public _userService: UserService, private _router: Router, private _route: ActivatedRoute
  ){
    this.identity = _userService.getIdentity();
    if(!this.identity){
      this._router.navigate(['/']);
    }
  }

  ngOnInit(): void {
  }

}
