import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfirmdailogComponent } from './confirmdailog.component';

describe('ConfirmdailogComponent', () => {
  let component: ConfirmdailogComponent;
  let fixture: ComponentFixture<ConfirmdailogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConfirmdailogComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfirmdailogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
