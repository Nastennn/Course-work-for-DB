import {Component} from "@angular/core";
import {User} from "../../_models";
import {UserService} from "../../_services";
import {first} from "rxjs/operators";
import {UserDataSource} from "../../_models/userDataSource";
import {DatePipe} from "@angular/common";

const HEADMASTER_ROLE_ID = 4;

@Component({
    styleUrls: ['../home.component.css'],
    templateUrl: 'staff-list.component.html'
})
export class StaffListComponent {
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
                    title: 'Name',
                },
                date_of_birth: {
                    title: 'Birthday',
                    valuePrepareFunction: (date) => {
                        if (date) {
                            return new DatePipe('en-GB').transform(date, 'MMMM d, y');
                        }
                        return null;
                    },
                },
                place: {
                    title: 'Place',
                },
                location: {
                    title: 'Location',
                    editable: false
                }
            },
            actions: {
                add: role_id === HEADMASTER_ROLE_ID,
                edit: role_id === HEADMASTER_ROLE_ID,
                delete: role_id === HEADMASTER_ROLE_ID
            }
        };
        this.loading = true;

        this.userService.getStaff().pipe(first()).subscribe(async users => {
            this.loading = false;
            await this.data.load(users);
        });
    }
}
