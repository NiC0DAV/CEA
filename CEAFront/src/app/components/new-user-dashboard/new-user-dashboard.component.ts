import { Component, OnInit } from '@angular/core';
import { User } from '../../models/usuario';
import { UserService } from '../../services/user.service'; 

@Component({
  selector: 'app-new-user-dashboard',
  templateUrl: './new-user-dashboard.component.html',
  styleUrls: ['./new-user-dashboard.component.css']
})
export class NewUserDashboardComponent implements OnInit {

  public user: User;
  public status: string;
  public token;

  constructor(private _userService: UserService) { 
    this.user = new User('', '', '', '', '', '', '', '', '', '', 'AX106154');
    this.token = this._userService.getToken();
  }

  ngOnInit(): void {
  }

  onSubmit(form: any) {
    // console.log(this.user);
    this._userService.register(this.user, this.token).subscribe(
      response => {
        console.log(response);
        if (response.status == 'Success') {
          this.status = response.status;
          // form.reset();
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
