import { Component, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { User } from '../../models/usuario';


@Component({
  selector: 'app-user-dashboard',
  templateUrl: './user-dashboard.component.html',
  styleUrls: ['./user-dashboard.component.css']
})
export class UserDashboardComponent implements OnInit {

  dtOptions: DataTables.Settings = {};
  public user: User;
  
  constructor() { }

  ngOnInit(): void {
  }

}
