import {Publisher, Subjects, TicketCreatedEvents} from '@procigatto/common';

export class TicketCreatedPublisher extends Publisher<TicketCreatedEvents> {
    subject: Subjects.TicketCreated = Subjects.TicketCreated;

}