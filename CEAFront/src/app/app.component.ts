import { Component } from '@angular/core';
import { UserService } from './services/user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [UserService]
})
export class AppComponent {
  public title = 'SGC CEA';
  public identity;
  public token;

  constructor(
    public _userService: UserService
  ){
    this.identity = _userService.getIdentity();
  }

}
