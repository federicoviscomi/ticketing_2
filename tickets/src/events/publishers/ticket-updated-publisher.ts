import {Publisher, Subjects, TicketUpdatedEvent} from '@procigatto/common';

export class TicketUpdatedPublisher extends Publisher<TicketUpdatedEvent> {
    subject: Subjects.TicketUpdated = Subjects.TicketUpdated;

}