import {Publisher, Subjects, TicketUpdatedEvents} from '@procigatto/common';

export class TicketUpdatedPublisher extends Publisher<TicketUpdatedEvents> {
    subject: Subjects.TicketUpdated = Subjects.TicketUpdated;

}