import {Message} from 'node-nats-streaming';
import {Publisher, Subjects, TicketCreatedEvents} from "@procigatto/common";

export class TicketCreatedPublisher extends Publisher<TicketCreatedEvents> {
    readonly subject: Subjects.TicketCreated = Subjects.TicketCreated;
    queueGroupName = 'payments-service';

    onMessage(data: TicketCreatedEvents['data'], msg: Message) {
        console.log('Event data!', data);

        msg.ack();
    }
}