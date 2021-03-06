import nats from 'node-nats-streaming';
import {TicketCreatedPublisher} from './events/ticket-created-publisher';

console.clear();

const stan = nats.connect('ticketing', 'ssssss', {
    url: 'http://localhost:4222'
});

stan.on('connect', async () => {
    console.log('publisher connected to nats');

    const publisher = new TicketCreatedPublisher(stan);
    try {
        await publisher.publish({
            userId: 'asdf',
            id: '123',
            price: 10,
            title: 'concert'
        });
    } catch (err) {
        console.error(err);
    }
});

