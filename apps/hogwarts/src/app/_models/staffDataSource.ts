import {UserService} from '../_services';
import {LocalDataSource} from 'ng2-smart-table';
import {first} from 'rxjs/operators';

export class StaffDataSource extends LocalDataSource {
    count = 1;

    constructor(private userService: UserService) {
        super();
        this.userService = userService;
    }

    async update(element: any, values: any): Promise<any> {
        const {exam_id: examId, points} = Object.assign({}, element, values);
        await this.userService.putExamMark(examId, points).pipe(first()).subscribe(() => {
        });
        return super.update(element, values);
    }

    async add(element: any): Promise<any> {
        let {name, date_of_birth: dob, place, un, p} = Object.assign({}, element);
        un = 'staff' + this.count;
        this.count++;
        await this.userService.putStaff(name, dob, place, un, p)
            .pipe(first()).subscribe(() => {
            });
        return super.add(element);
    }
}
