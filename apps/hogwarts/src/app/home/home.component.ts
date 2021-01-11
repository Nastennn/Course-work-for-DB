import { Component } from '@angular/core';
import { first } from 'rxjs/operators';

import { User } from '../_models';
import { UserService } from '../_services';
import { UserDataSource } from '../_models/userDataSource';

@Component({ templateUrl: 'home.component.html' })
export class HomeComponent {
  loading = false;
  currentUser: User;
  data: UserDataSource;

  constructor(private userService: UserService) {
    this.userService = userService;
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.data = new UserDataSource(this.userService);
  }

  settings = {
    columns: {
      name: {
        title: 'Student',
        editable: false
      },
      year: {
        title: 'Year',
        editable: false
      },
      subject_name: {
        title: 'Subject',
        editable: false
      },
      points: {
        title: 'Points'
      },
      student_id: {
        hide: true
      },
      subject_id: {
        hide: true
      }
    }
  };

  ngOnInit() {
    this.loading = true;
    this.userService.getAll().pipe(first()).subscribe(async users => {
      this.loading = false;
      await this.data.load(users);
    });
  }
}
