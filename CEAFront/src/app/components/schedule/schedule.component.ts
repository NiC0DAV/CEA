import { Component, OnInit } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service'; 
import { Router, ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.css']
})
export class ScheduleComponent implements OnInit {

  public token;
  public identity;

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
