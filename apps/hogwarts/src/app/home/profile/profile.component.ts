import {Component} from "@angular/core";
import {User} from "../../_models";
import {UserService} from "../../_services";
import {first} from "rxjs/operators";
import {formatDate} from "@angular/common";

const PROFESSOR_ROLE_ID = 3;
const STUDENT_ROLE_ID = 2;

@Component({
    styleUrls: ['../home.component.css'],
    templateUrl: 'profile.component.html'
})
export class ProfileComponent {
    loading = false;
    professors: string[];
    users: User[];
    currentUser: User;
    date: string;
    role: number
    greeting: string

    constructor(private userService: UserService) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
        this.role = this.currentUser.role_id;
        if (this.role === PROFESSOR_ROLE_ID){
            this.greeting = 'Professor';
        } else if (this.role === STUDENT_ROLE_ID){
            this.greeting = 'Student';
        }
    }

    ngOnInit() {
        this.loading = true;
        this.professors = ['d', 'd3', 'g'];
        this.userService.getAll().pipe(first()).subscribe(users => {
            this.loading = false;
            this.users = users;
        });
    }
}
