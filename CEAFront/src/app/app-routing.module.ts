import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AssistanceComponent } from './components/assistance/assistance.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { LoginComponent } from './components/login/login.component';
import { NewUserDashboardComponent } from './components/new-user-dashboard/new-user-dashboard.component';
import { PaymentsComponent } from './components/payments/payments.component';
import { RegisterComponent } from './components/register/register.component';
import { ScheduleComponent } from './components/schedule/schedule.component';
import { UserDashboardComponent } from './components/user-dashboard/user-dashboard.component';

const routes: Routes = [
  {path: 'dashboard', component: DashboardComponent},
  {path: '', component: LoginComponent },
  {path: 'register', component: RegisterComponent},
  {path: 'dashboard/users', component: UserDashboardComponent},
  {path: 'dashboard/newuser', component: NewUserDashboardComponent},
  {path: 'dashboard/payments', component: PaymentsComponent},
  {path: 'dashboard/schedule', component: ScheduleComponent},
  {path: 'dashboard/assistance', component: AssistanceComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
