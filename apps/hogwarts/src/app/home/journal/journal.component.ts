import {Component} from "@angular/core";
import {User} from "../../_models";
import {UserService} from "../../_services";
import {first} from "rxjs/operators";
import {UserDataSource} from "../../_models/userDataSource";

const HEADMASTER_ROLE_ID = 4;
const PROFESSOR_ROLE_ID = 3;
const STUDENT_ROLE_ID = 2;

@Component({
    styleUrls: ['journal.component.css'],
    templateUrl: 'journal.component.html'
})
export class JournalComponent {
    loading = false;
    users: User[];
    currentUser: User;
    data: UserDataSource;
    settings: object;

    constructor(private userService: UserService) {
        this.userService = userService;
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
        this.data = new UserDataSource(this.userService);
        const {role_id} = JSON.parse(localStorage.currentUser);
        this.settings = {
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
            },
            actions: {
                add: false,
                edit: role_id === PROFESSOR_ROLE_ID || role_id === HEADMASTER_ROLE_ID,
                delete: false
            }
        };
        this.loading = true;

        this.userService.getAll().pipe(first()).subscribe(async users => {
            this.loading = false;
            await this.data.load(users);
        });
    }
}
