import {Message} from 'node-nats-streaming';
import {Listener, Subjects, TicketCreatedEvents} from "@procigatto/common";

export class TicketCreatedListener extends Listener<TicketCreatedEvents> {
    readonly subject: Subjects.TicketCreated = Subjects.TicketCreated;
    queueGroupName = 'payments-service';

    onMessage(data: TicketCreatedEvents['data'], msg: Message) {
        console.log('Event data!', data);

        msg.ack();
    }
}