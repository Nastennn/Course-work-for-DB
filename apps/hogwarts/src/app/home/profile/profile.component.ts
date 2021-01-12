import {Component} from "@angular/core";
import {User} from "../../_models";
import {UserService} from "../../_services";
import {first} from "rxjs/operators";

@Component({
    styleUrls: ['../home.component.css'],
    templateUrl: 'profile.component.html'
})
export class ProfileComponent {
    loading = false;
    professors: string[];
    users: User[];
    currentUser: User;

    constructor(private userService: UserService) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
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
