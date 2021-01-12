import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { catchError, map, tap } from 'rxjs/operators';

import { environment } from '../../environments/environment';
import { User } from '../_models';

@Injectable({ providedIn: 'root' })
export class UserService {
  constructor(private http: HttpClient) {
  }

  getAll() {
    const {sid} = JSON.parse(localStorage.currentUser);
    console.log(sid);
    return this.http.get<User[]>(`${environment.apiUrl}/api/users?sid=${sid}`);
  }

  putExamMark(examId: number, points: number) {
    return this.http.put<User[]>(`${environment.apiUrl}/api/users`, { examId, points });
  }
}
