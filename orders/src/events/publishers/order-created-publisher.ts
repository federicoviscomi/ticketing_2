import {OrderCreatedEvent, Publisher, Subjects} from '@procigatto/common';

export class OrderCreatedPublisher extends Publisher<OrderCreatedEvent> {
  subject: Subjects.OrderCreated = Subjects.OrderCreated;
}
