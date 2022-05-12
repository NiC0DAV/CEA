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

  constructor( private _userService: UserService ) {
    this.user = new User('', '', '', '', '', '', '', '', '', '', 'AX106154');
    this.status = '';
  }

  ngOnInit(): void {

  }

  onSubmit(form: any) {
    this._userService.register(this.user).subscribe(

      response => {
        if (response.status == 'Success') {
          this.status = response.status;
          form.reset();
        } else {
          this.status = 'Error';
        }
      },
      error => {
        this.status = 'Error';
        console.log(<any>error);
      }

    );

    form.reset();
  }

}
