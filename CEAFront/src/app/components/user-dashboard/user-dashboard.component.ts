import { Component, OnInit } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service'; 
import { Router, ActivatedRoute, Params } from '@angular/router';
import { global } from '../../services/global';


@Component({
  selector: 'app-user-dashboard',
  templateUrl: './user-dashboard.component.html',
  styleUrls: ['./user-dashboard.component.css'],
  providers: [UserService]
})
export class UserDashboardComponent implements OnInit {

  public identity;
  public url;
  public users: Array<User>;
  public status;
  public token;

  constructor(
    public _userService: UserService, private _router: Router, private _route: ActivatedRoute
  ){
    this.identity = _userService.getIdentity();
    this.token = this._userService.getToken();
    this.url = global.url;
  } 

  ngOnInit(): void {
    if(!this.identity){
      this._router.navigate(['/']);
    }

    this.getUsers();
  }

  getUsers(){
    this._userService.getUsers().subscribe(
      response => {
        if(response.status == "success"){
          this.users = response.users;
        }
    },
    error => {
      this.status = 'Error';
      console.log(<any>error);
    });
  }

  deletePost(id){
    // console.log(this.user.userId);
    this._userService.delete(this.token, id).subscribe(
      response => {
        this.status = "Success";
        this.getUsers();
      },
      error => {
        console.log(<any>error);
      }
    )
  }

}
