import {Publisher, Subjects, TicketCreatedEvent} from '@procigatto/common';

export class TicketCreatedPublisher extends Publisher<TicketCreatedEvent> {
    subject: Subjects.TicketCreated = Subjects.TicketCreated;

}