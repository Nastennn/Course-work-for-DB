import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {HttpClientModule, HTTP_INTERCEPTORS} from '@angular/common/http';

import {AppComponent} from './app.component';
import {appRoutingModule} from './app.routing';

import {BasicAuthInterceptor, ErrorInterceptor} from './_helpers';
import {HomeComponent} from './home';
import {LoginComponent} from './login';
import {Ng2SmartTableModule} from 'ng2-smart-table';
import {JournalComponent} from "./home/journal/journal.component";
import {ProfListComponent} from "./home/prof-list/prof-list.component";
import {StudListComponent} from "./home/stud-list/stud-list.component";
import {ProfileComponent} from "./home/profile/profile.component";
import {TabsComponent} from "./home/tabs/tabs.component";
import {TabComponent} from "./home/tabs/tab.component";
import {StaffListComponent} from "./home/staff-list/staff-list.component";

@NgModule({
    imports: [
        BrowserModule,
        ReactiveFormsModule,
        HttpClientModule,
        appRoutingModule,
        Ng2SmartTableModule,
        FormsModule
    ],
    declarations: [
        AppComponent,
        HomeComponent,
        LoginComponent,
        JournalComponent,
        ProfListComponent,
        StudListComponent,
        ProfileComponent,
        StaffListComponent,
        TabsComponent, TabComponent,
    ],
    providers: [
        {provide: HTTP_INTERCEPTORS, useClass: BasicAuthInterceptor, multi: true},
        {provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true}
    ],
    bootstrap: [AppComponent]
})
export class AppModule {
}
