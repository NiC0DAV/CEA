import { Component, OnInit } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service';
import { Router, ActivatedRoute, Params } from '@angular/router';



@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  providers: [UserService]
})
export class LoginComponent implements OnInit {

  public user: User;
  public status: string;
  public token;
  public identity;
  public errorMessage: string;
  public validate;

  constructor(private _userService: UserService, private _router: Router, private _route: ActivatedRoute) {

    this.user = new User('', '', '', '', '', '', '', '', '', '', '');
    this.validate = _userService.getIdentity();
  }

  ngOnInit(): void {
    this.logout();

    if(this.validate != null){
      this._router.navigate(['/dashboard']);
    }
  }

  onSubmit(form: any) {
    this._userService.login(this.user).subscribe(
      response => {
        if (response.status != 'Error') {
          this.status = "Success";
          this.token = response;

          this._userService.login(this.user, true).subscribe(
            response => {
              this.identity = response;
              localStorage.setItem('Token', this.token);
              localStorage.setItem('Identity', JSON.stringify(this.identity));

              this._router.navigate(['/dashboard']);
            },
            error => {
              this.status = 'error';
              console.log(<any>error);
            }
          )

        } else {
          this.status = 'Error';
          this.errorMessage = 'Intento de inicio de sesion incorrecto';
        }
      },
      error => {
        this.status = 'error';
        console.log(<any>error);
      }
    )
  }

  logout(){
    this._route.params.subscribe(params => {
      let logout = +params['sure'];

      if(logout == 1){
        localStorage.clear();
        this.identity = null;
        this.token = null;
        this.validate = null;

        this._router.navigate(['']);
      }else{
        console.log("Error")
      }
    });
  }

}
