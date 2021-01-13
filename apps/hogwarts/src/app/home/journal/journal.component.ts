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
    years: number[] = [null, 1, 2, 3, 4, 5, 6, 7];
    faculties: string[] = [null, 'Gryffindor', 'Hufflepuff', 'Ravenclaw', 'Slytherin']
    selectedYear: number;
    selectedFaculty: string;
    isProfessor: boolean;

    constructor(private userService: UserService) {
        this.userService = userService;
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
        this.isProfessor = this.currentUser.role_id === PROFESSOR_ROLE_ID;
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

    onChange(newValue) {
        this.loading = true;
        console.log(this.selectedYear);
        console.log(this.selectedFaculty);
        if (this.selectedYear === null && this.selectedFaculty === null) {
            console.log("sdsds");
            this.userService.getAll().pipe(first()).subscribe(async users => {
                this.loading = false;
                await this.data.load(users);
            });
            return;
        }
        const {role_id} = JSON.parse(localStorage.currentUser);
        if (role_id === HEADMASTER_ROLE_ID) {
            this.loading = false;
            return;
        }

        if (this.selectedYear == null) {
            this.loading = false;
            return;
        }

        if (role_id === STUDENT_ROLE_ID) {
            this.userService.getExamMarks().pipe(first()).subscribe(async users => {
                this.loading = false;
                await this.data.load(users);
            });
        }

        if (this.selectedFaculty == null) {
            this.loading = false;
            return;
        }

        if (role_id === PROFESSOR_ROLE_ID) {
            this.userService.getStudents(this.selectedYear, this.selectedFaculty).pipe(first()).subscribe(async users => {
                this.loading = false;
                await this.data.load(users);
            });
        }
    }

    selectYear(year: any) {
        this.selectedYear = year;
        console.log(this.selectedYear);
    }
}
