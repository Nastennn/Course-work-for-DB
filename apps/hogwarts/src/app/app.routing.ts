import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home';
import { LoginComponent } from './login';
import { AuthGuard } from './_helpers';
import {ProfListComponent} from "./home/prof-list/prof-list.component";
import {GradebookComponent} from "./home/gradebook/gradebook.component";
import {StudListComponent} from "./home/stud-list/stud-list.component";
import {ProfileComponent} from "./home/profile/profile.component";
import {StaffListComponent} from "./home/staff-list/staff-list.component";

const routes: Routes = [
    { path: '', component: HomeComponent, canActivate: [AuthGuard],
        children: [
            {
                path: 'gradebook', // child route path
                component: GradebookComponent, // child route component that the router renders
            },
            {
                path: 'professors', // child route path
                component: ProfListComponent, // child route component that the router renders
            },
            {
                path: 'students', // child route path
                component: StudListComponent, // child route component that the router renders
            },
            {
                path: 'staff', // child route path
                component: StaffListComponent, // child route component that the router renders
            },
            {
                path: 'profile', // child route path
                component: ProfileComponent, // child route component that the router renders
            }
        ],},
    { path: 'login', component: LoginComponent },

    // otherwise redirect to home
    { path: '**', redirectTo: '' }
];

export const appRoutingModule = RouterModule.forRoot(routes);
