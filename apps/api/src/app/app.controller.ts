import { Controller, Get, Post, Put, Body } from '@nestjs/common';

import { AppService } from './app.service';
import { User } from '../../../hogwarts/src/app/_models';
import { first } from 'rxjs/operators';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('users')
  getUsers() {
    return this.appService.getUsers();
  }

  @Post('users/authenticate')
  async authenticateUser(@Body() myDto): Promise<User> {
    const {username, password} = myDto;
    return this.appService.authenticateUser(username, password);
  }

  @Put('users')
  async putExamMark(@Body() myDto): Promise<User> {
    const {studentId, subjectId, points} = myDto;
    return this.appService.putExamMark(studentId, subjectId, points);
  }
}
