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
    return this.http.get<User[]>(`${environment.apiUrl}/api/users`);
  }

  putExamMark(studentId: number, subjectId: number, points: number) {
    return this.http.put<User[]>(`${environment.apiUrl}/api/users`, { studentId, subjectId, points });
  }
}
