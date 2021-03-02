import {Listener, Subjects, TicketCreatedEvent} from '@procigatto/common';
import {Message} from 'node-nats-streaming';
import {queueGroupName} from './queue-group-name';
import {Ticket} from '../../models/ticket';

export class TicketCreatedListener extends Listener<TicketCreatedEvent> {
  subject: Subjects.TicketCreated = Subjects.TicketCreated;
  queueGroupName: string = queueGroupName;

  async onMessage(data: TicketCreatedEvent['data'], msg: Message): Promise<void> {
    const {title, price} = data;
    const ticket = Ticket.build({
      title, price
    });
    await ticket.save();
    msg.ack();
  }

}