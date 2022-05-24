import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewUserDashboardComponent } from './new-user-dashboard.component';

describe('NewUserDashboardComponent', () => {
  let component: NewUserDashboardComponent;
  let fixture: ComponentFixture<NewUserDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewUserDashboardComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewUserDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
