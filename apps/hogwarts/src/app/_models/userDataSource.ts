import { UserService } from '../_services';
import { LocalDataSource } from 'ng2-smart-table';
import { first } from 'rxjs/operators';

export class UserDataSource extends LocalDataSource {
  constructor(private userService: UserService) {
    super();
    this.userService = userService;
  }

  async update(element: any, values: any): Promise<any> {
    const { exam_id: examId, points } = Object.assign({}, element, values);
    await this.userService.putExamMark(examId, points).pipe(first()).subscribe(() => {});
    return super.update(element, values);
  }
}
