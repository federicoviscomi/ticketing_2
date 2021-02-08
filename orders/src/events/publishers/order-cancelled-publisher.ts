import {OrderCancelledEvent, Publisher, Subjects} from '@procigatto/common';

export class OrderCancelledPublisher extends Publisher<OrderCancelledEvent> {
  subject: Subjects.OrderCancelled = Subjects.OrderCancelled;
}
