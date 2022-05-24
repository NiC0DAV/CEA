import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserEditDashboardComponent } from './user-edit-dashboard.component';

describe('UserEditDashboardComponent', () => {
  let component: UserEditDashboardComponent;
  let fixture: ComponentFixture<UserEditDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserEditDashboardComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserEditDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
