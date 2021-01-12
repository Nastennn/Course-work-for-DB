/**
 * A single tab page. It renders the passed template
 * via the @Input properties by using the ngTemplateOutlet
 * and ngTemplateOutletContext directives.
 */

import {Component, Input} from '@angular/core';

@Component({
    selector: 'hogwarts-tab',
    styleUrls: ['tab.component.css'],
    template: `
        <div [hidden]="!active">
            <ng-content></ng-content>
        </div>
    `
})
export class TabComponent {
    @Input('tabTitle') title: string;
    @Input('routing-url') route: string;
    @Input() active = false;
}
