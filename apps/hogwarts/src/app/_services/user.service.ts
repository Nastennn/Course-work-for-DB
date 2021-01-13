import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {catchError, map, tap} from 'rxjs/operators';

import {environment} from '../../environments/environment';
import {User} from '../_models';
import {Exam} from "../_models/exam";

@Injectable({providedIn: 'root'})
export class UserService {
    constructor(private http: HttpClient) {
    }

    getAll() {
        const {sid} = JSON.parse(localStorage.currentUser);
        console.log(sid);
        return this.http.get<User[]>(`${environment.apiUrl}/api/users?sid=${sid}`);
    }

    getExamMarks() {
        const {sid} = JSON.parse(localStorage.currentUser);
        console.log(sid);
        return this.http.get<Exam[]>(`${environment.apiUrl}/api/examMarks?sid=${sid}`);
    }

    getStudents(year: number, faculty: string) {
        const {sid} = JSON.parse(localStorage.currentUser);
        console.log(sid);
        return this.http.get<User[]>(`${environment.apiUrl}/api/students?sid=${sid}&year=${year}&faculty=${faculty}`);
    }

    putExamMark(examId: number, points: number) {
        return this.http.put<User[]>(`${environment.apiUrl}/api/users`, {examId, points});
    }
}
