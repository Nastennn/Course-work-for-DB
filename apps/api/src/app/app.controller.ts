import { Controller, Get, Post, Put, Body, Query } from '@nestjs/common';

import { AppService } from './app.service';
import { User } from '../../../hogwarts/src/app/_models';
import { first } from 'rxjs/operators';

@Controller()
export class AppController {
    constructor(private readonly appService: AppService) {
    }

    @Get('users')
    getUsers(@Query() myDto) {
        const { sid } = myDto;
        return this.appService.getUsers(sid);
    }

    @Get('staff')
    getStaff(@Query() myDto) {
        const { sid } = myDto;
        return this.appService.getStaff(sid);
    }

    @Get('professors')
    getProfessors() {
        return this.appService.getProfessors();
    }

    @Get('students')
    getStudents(@Query() myDto) {
        const { sid } = myDto;
        return this.appService.getStudents(sid);
    }

    @Post('users/authenticate')
    async authenticateUser(@Body() myDto): Promise<User> {
        const { username, password } = myDto;
        return this.appService.authenticateUser(username, password);
    }

    @Put('users')
    async putExamMark(@Body() myDto): Promise<User> {
        const { examId, points } = myDto;
        return this.appService.putExamMark(examId, points);
    }

    @Put('staff')
    async putStaff(@Body() myDto): Promise<User> {
        const { name, dob, place, un, p } = myDto;
        return this.appService.putStaff(name, dob, place, un, p);
    }
}
