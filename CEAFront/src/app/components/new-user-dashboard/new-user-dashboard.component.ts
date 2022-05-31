import { Component, OnInit, DoCheck } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service'; 
import { Router, ActivatedRoute, Params } from '@angular/router';


@Component({
  selector: 'app-new-user-dashboard',
  templateUrl: './new-user-dashboard.component.html',
  styleUrls: ['./new-user-dashboard.component.css'],
  providers: [UserService]
})
export class NewUserDashboardComponent implements OnInit, DoCheck {

  public user: User;
  public status: string;
  public token;
  public identity;
  // public message;

  constructor(private _userService: UserService, private _router: Router, private _route: ActivatedRoute) { 
    this.loadUser();
    this.user = new User('', '', '', '', '', '', '', '', '', '', this.identity.userId);
    if(!this.identity){
      this._router.navigate(['/']);
    }
  }

  ngOnInit(): void {
    this.loadUser();
  }

  ngDoCheck(){
    this.loadUser();
  }
  
  loadUser(){
    this.identity = this._userService.getIdentity();
    this.token = this._userService.getToken();
  }

  onSubmit(form: any) {
    console.log(this.token);
    this._userService.register(this.user, this.token).subscribe(
      response => {
        console.log(response);
        if (response.status == 'success') {
          this.status = response.status;
          form.reset();
        } else {
          this.status = 'Error';
          // this.message = "L"
        }
      },
      error => {
        console.log(this.token)
        this.status = 'Error';
        console.log(<any>error);
      }

    );

    // form.reset();
  }

}
