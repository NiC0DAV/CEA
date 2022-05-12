import { Component, OnInit } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service';


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

  constructor(private _userService: UserService) {

    this.user = new User('', '', '', '', '', '', '', '', '', '', '');

  }

  ngOnInit(): void {
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
              console.log('Token '+this.token);
              console.log('Identity '+this.identity);

            },
            error => {
              this.status = 'error';
              console.log(<any>error);
            }
          )

        } else {
          this.status = 'Error';
        }
      },
      error => {
        this.status = 'error';
        console.log(<any>error);
      }
    )
  }

}
