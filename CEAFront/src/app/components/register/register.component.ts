import { Component, OnInit } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
  providers: [UserService]
})
export class RegisterComponent implements OnInit {

  public user: User;
  public status: string;
  public token;

  constructor( private _userService: UserService ) {
    this.user = new User('', '', '', '', '', '', '', '', '', '', 'AX106154');
    this.status = '';
    this.token = this._userService.getToken();
  }

  ngOnInit(): void {

  }

  onSubmit(form: any) {
    this._userService.register(this.user, this.token).subscribe(
      response => {
        console.log(response);
        if (response.status == 'Success') {
          this.status = response.status;
          form.reset();
        } else {
          this.status = 'Error';
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